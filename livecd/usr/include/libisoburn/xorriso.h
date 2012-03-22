
/* xorriso - libisoburn higher level API which creates, loads, manipulates
             and burns ISO 9660 filesystem images.

   Copyright 2007-2012 Thomas Schmitt, <scdbackup@gmx.net>

   Provided under GPL version 2 or later.

   This file contains the public API of xorriso which covers all of its
   operations.

   An example of its usage is xorriso_main.c which checks version compatibility,
   creates a xorriso object, initializes the libraries, and runs the command
   interpreters of the API to constitute the command line oriented batch and
   dialog tool xorriso.

   Alternatively to command interpreters it is possible to run all options of
   xorriso directly via the calls of the "Options API". 
   The "Problem Status and Message API" shall then be used to obtain the
   text output of the options.

   Mandatory calls are:
     Xorriso_new(), Xorriso_startup_libraries(), Xorriso_destroy()

   This architecture is fully public since version 0.5.8. From then on, new
   features get marked by
     @since major.minor.micro
   If this mark is missing, then the feature was present before release 0.5.8.


   There is a lower level of API which consists of libisofs.h, libburn.h and
   libisoburn.h. One should not mix those calls with the ones of xorriso.h .
*/

/* Important: If you add a public API function then add its name to file
                  libisoburn/libisoburn.ver
*/


#ifndef Xorriso_includeD
#define Xorriso_includeD yes

/** Opaque handle of the xorriso runtime context */
struct XorrisO; 



/* This may be changed to Xorriso_GNU_xorrisO in order to create GNU xorriso
   under GPLv3+ derived from above GPLv2+.
*/
#define Xorriso_libburnia_xorrisO yes


/* --------------------- Fundamental Management ------------------- */


/** These three release version numbers tell the revision of this header file
    and of the API which it describes. They shall be memorized by applications
    at build time.
    @since 0.5.8
*/
#define Xorriso_header_version_majoR  1
#define Xorriso_header_version_minoR  2
#define Xorriso_header_version_micrO  0


/** If needed: Something like ".pl01" to indicate a bug fix. Normally empty.
    @since 0.5.8
*/
#define Xorriso_program_patch_leveL ""


/** Obtain the three release version numbers of the library. These are the
    numbers encountered by the application when linking with libisoburn,
    i.e. possibly not before run time.
    Better do not base the fundamental compatibility decision of an application
    on these numbers. For a reliable check use Xorriso__is_compatible().
    @since 0.5.8
    @param major The maturity version (0 for now, as we are still learning)
    @param minor The development goal version.
    @param micro The development step version. This has an additional meaning:

                 Pare numbers indicate a version with frozen API. I.e. you can
                 rely on the same set of features to be present in all
                 published releases with that major.minor.micro combination.
                 Features of a pare release will stay available and ABI
                 compatible as long as the SONAME of libisoburn stays "1".
                 Currently there are no plans to ever change the SONAME.
                  
                 Odd numbers indicate that API upgrades are in progress.
                 I.e. new features might be already present or they might
                 be still missing. Newly introduced features may be changed
                 incompatibly or even be revoked before release of a pare
                 version.
                 So micro revisions {1,3,5,7,9} should never be used for
                 dynamic linking unless the proper library match can be
                 guaranteed by external circumstances.

    @return 1 success, <=0 might in future become an error indication
*/
void Xorriso__version(int *major, int *minor, int *micro);


/** Check whether all features of header file xorriso.h from the given
    major.minor.micro revision triple can be delivered by the library version
    which is performing this call.
        if (! Xorriso__is_compatible(Xorriso_header_version_majoR,
                                     Xorriso_header_version_minoR,
                                     Xorriso_header_version_micrO, 0))
           ...refuse to start the program with this dynamic library version...
    @since 0.5.8
    @param major obtained at build time
    @param minor obtained at build time
    @param micro obtained at build time
    @param flag Bitfield for control purposes. Unused yet. Submit 0.
    @return 1= library can work for caller
            0= library is not usable in some aspects. Caller must restrict
               itself to an earlier API version or must not use this library
               at all.
*/
int Xorriso__is_compatible(int major, int minor, int micro, int flag);


/* Get the patch level text (e.g. "" or ".pl01") of the program code.
   @param flag     unused yet, submit 0
   @return         readonly character string
*/
char *Xorriso__get_patch_level_text(int flag);


/* Choose how Xorriso_startup_libraries() and the XorrisO object shall
   prepare for eventual signals.
   @param behavior Default is behavior 1.
                   0= no own signal handling. The main application has to do
                      that. Do not start burn runs without any handling !
                   1= use libburn signal handler. Most time with action
                      0. During writing, formatting, blanking: 0x30.
                      Only usable with a single xorriso object.
                   2= Enable system default reaction on all signals
                      @since 1.0.9
                   3= Try to ignore nearly all signals
                      @since 1.0.9
   @param flag     unused yet, submit 0
   @return         <= 0 is error, >0 is success
*/
int Xorriso__preset_signal_behavior(int behavior, int flag);


/* Mandatory call:
   Create a new xorriso object and tell it the program name to be used
   with messages and for decision of special behavior.
   @param xorriso  returns the newly created XorrisO object 
   @param progname typically argv[0] of main(). Some leafnames of the progname
                   path have special meaning and trigger special behavior:
                    "osirrox"    allows image-to-disk copying: -osirrox "on" 
                    "xorrisofs"  activates -as "mkisofs" emulation from start
                    "genisofs"   alias of "xorrisofs"
                    "mkisofs"    alias of "xorrisofs"
                    "genisoimage"  alias of "xorrisofs"
                    "xorrecord"  activates -as "cdrecord" emulation from start
                    "cdrecord"   alias of "xorrecord"
                    "wodim"      alias of "xorrecord"
                    "cdrskin"    alias of "xorrecord"
   @param flag     unused yet, submit 0
   @return         >0 success , <=0 failure, no object created
*/
int Xorriso_new(struct XorrisO ** xorriso, char *progname, int flag);


/* Note: Between Xorriso_new() and the next call Xorriso_startup_libraries()
         there may be called the special command interpreter
         Xorriso_prescan_args().
         The other command interpreters may be used only after
         Xorriso_startup_libraries(). The same restriction applies to the
         calls of the Options API further below.
*/


/* Mandatory call:
   It has to be made before calling any function listed below this point.
   Only exception is the special command interpreter Xorriso_prescan_args().

   Make global library initializations.
   This must be done with the first xorriso object that gets created and
   with the first xorriso object that gets created after Xorriso_destroy(,1).
   @param xorriso The context object.
   @param flag    unused yet, submit 0
   @return        <=0 error , >0 success
*/ 
int Xorriso_startup_libraries(struct XorrisO *xorriso, int flag);


/* Note: After library startup, you may run Command Interpreters or call
         functions from the Options API.

         Wenn all desired activities are done, you may check whether there are
         uncommited changes pending, compute an exit value, destroy the XorrisO
         object, and exit your program.
*/


/* Inquire whether option -commit would make sense.
   @param xorriso The context object to inquire.
   @param flag    @since 0.6.6
                  bit0= do not return 1 if -as mkisofs -print-size was
                        performed on the current image.
   @return        0= -commit would have nothing to do
                  1= a new image session would emerge at -commit
*/
int Xorriso_change_is_pending(struct XorrisO *xorriso, int flag);


/* Compute the exit value from the recorded maximum event severity.
   @param xorriso The context object to inquire.
   @param flag    unused yet, submit 0
   @return        The computed exit value
*/
int Xorriso_make_return_value(struct XorrisO *xorriso, int flag);


/* Mandatory call:
   Destroy xorriso object when it is no longer needed.
   @param xorriso  The context object to destroy. *xorriso will become NULL.
   @param flag     bit0= Perform global library shutdown.
                         Use only with last xorriso object to be destroyed.
   @return         <=0 error, >0 success
*/
int Xorriso_destroy(struct XorrisO **xorriso, int flag);


/* --------------------- Command Interpreters ------------------- */


/* This special interpreter may be called between Xorriso_new() and
   Xorriso_startup_libraries(). It interprets certain commands which shall
   get into effect before the libraries get initialized:
     -abort_on , -report_about , -return_with , -list_delimiter ,
     -scsi_log , -signal_handling
   Some commands get executed only if they are the only command in argv:
     -prog_help , -help
   The following is recognized only if it is the first of all arguments:
     -no_rc
   Some get examined for the need to redirect stdout messages:
     -dev , -outdev , -indev , -as 
   Commands -list_delimiter and -add_plainly get into effect during this
   call. But their setting at begin of the call gets restored before the
   call returns.
   @param xorriso The context object in which to perform the commands.
   @param argc    Number of arguments.
   @param argv    The arguments. argv[0] contains the program name.
                  argv[1] to argv[argc-1] contain commands and parameters.
   @param idx     Argument cursor. When this function is called, *idx must
                  be at least 1, argv[*idx] must be a command.
                  *idx will iterate over commands and parameters until this
                  function aborts or until argc is reached.
   @param flag    bit0= do not interpret argv[1]
                  bit1= produce FAILURE events on unknown commands
                        @since 1.1.0
   @return        <0 error
                   0 end program
                   1 ok, go on 
*/
int Xorriso_prescan_args(struct XorrisO *xorriso, int argc, char **argv,
                         int flag);


/* Read and interpret commands from eventual startup files as listed in
   man xorriso.
   @param xorriso The context object in which to perform the commands.
   @param flag    unused yet, submit 0
   @return <=0 = error
             1 = success
             3 = end program run (e.g. because command -end was encountered)
*/
int Xorriso_read_rc(struct XorrisO *xorriso, int flag);


/* Check whether program arguments shall be backslash decoded. If so, then
   replace *argv by a new argument vector. The old one will not be freed
   by this call. If it is dynamic memory then you need to keep a copy of
   the pointer and free it yourself after this call.
   @param xorriso The context object
   @param argc    Number of arguments.
   @param argv    The arguments. (*argv)[0] contains the program name.
                  (*argv)[1] to (*argv)[argc-1] contain commands and parameters
                  If argv after the call differs from argv before the call,
                  then one should dispose it later by:
                    for(i= 0; i < argc; i++)
                      if(argv[i] != NULL)
                        free(argv[i]);
                    free(argv);
   @param flag    unused yet, submit 0
   @return        <= 0 error , > 0 success
*/
int Xorriso_program_arg_bsl(struct XorrisO *xorriso, int argc, char ***argv,
                            int flag);


/* Interpret argv as xorriso command options and their parameters.
   (An alternative is to call functions of the options API directly and to
    perform own error status evaluation. See below: Options API.) 
   After the first command and its parameters there may be more commands and
   parameters. All parameters must be given in the same call as their command.
   @param xorriso The context object in which to perform the commands.
   @param argc    Number of arguments.
   @param argv    The arguments. argv[0] contains the program name.
                  argv[1] to argv[argc-1] contain commands and parameters.
   @param idx     Argument cursor. When this function is called, *idx must
                  be at least 1, argv[*idx] must be a command.
                  *idx will iterate over commands and parameters until this
                  function aborts or until argc is reached.
   @param flag    bit0= reserved. Indicates recursion. Submit 0. 
                  bit1= Indicates that these are the main() program start
                        arguments
   @return <=0 = error
             1 = success
             2 = problem event ignored
             3 = end program run (e.g. because command -end was encountered)
*/
int Xorriso_interpreter(struct XorrisO *xorriso,
                        int argc, char **argv, int *idx, int flag);


/* Parse a command line into words and use them as argv for a call of
   Xorriso_interpreter(). Put out some info lines about the outcome.
   @param xorriso The context object in which to perform the commands.
   @param line    A text of one or more words according to man xorriso
                  paragraph "Command processing" up to and including
                  "Backslash Interpretation".
   @param flag    bit0 to bit15 are forwarded to Xorriso_interpreter()
                  bit16= no pageing of info lines
                  bit17= print === bar even if xorriso->found<0
   @return        see return of Xorriso_interpreter()
*/
int Xorriso_execute_option(struct XorrisO *xorriso, char *line, int flag);


/* Enter xorriso command line dialog mode, using libreadline if configured
   at build time and not disabled at run time.
   This call returns immediately if not option -dialog "on" was performed
   before.
   @param xorriso The context object in which to perform the commands.
   @param flag    unused yet, submit 0
   @return        <=0 error, 1= dialog mode ended normally ,
                  3= dialog mode ended normally,interpreter asks to end program
*/
int Xorriso_dialog(struct XorrisO *xorriso, int flag);


/* --------------------- Problem Status and Message API ------------------- */


/** Submit a problem message to the xorriso problem reporting and handling
    system. This will eventually increase problem status rank, which may
    at certain stages in the program be pardoned and reset to 0.
    The pardon is governed by Xorriso_option_abort_on() and by the anger
    of the affected program part. If no pardon has been given, then the problem
    status reaches the caller of option functions.
    Problem status should be inquired by Xorriso_eval_problem_status() and be
    reset before next option execution by Xorriso_set_problem_status().
    The problem status itself does not cause the failure of option functions.
    But in case of failures for other reasons, a remnant overly severe problem
    status can cause overly harsh program reactions.
    @param xorriso    The environment handle
    @param error_code The unique error code of your message.
                      Submit 0 if you do not have reserved error codes within
                      the libburnia project.
    @param msg_text   Not more than 8196 characters of message text.
                      A final newline character gets appended automatically.
    @param os_errno   Eventual errno related to the message. Submit 0 if
                      the message is not related to a operating system error.
    @param severity   One of "ABORT", "FATAL", "FAILURE", "MISHAP", "SORRY",
                      "WARNING", "HINT", "NOTE", "UPDATE", "DEBUG".
                      Defaults to "FATAL".
    @param flag       Bitfield for control purposes
                        bit0= use pager (as with result)
                        bit1= permission to suppress output
    @return           1 if message was delivered, <=0 if failure
*/
int Xorriso_msgs_submit(struct XorrisO *xorriso,
                        int error_code, char msg_text[], int os_errno,
                        char severity[], int flag);

/** Alternative call interface of Xorriso_msgs_submit with void* instead
    of struct XorrisO*
*/
int Xorriso_msgs_submit_void(void *xorriso,
                        int error_code, char msg_text[], int os_errno,
                        char severity[], int flag);


/** Evaluate an advise whether to abort or whether to go on with option
    processing. This should be called after any option function was processed.
    It updates the problem status by processing the library message queues
    and then it uses this status and the submitted return value of the
    option function to evaluate the situation.
    @param xorriso    The environment handle
    @param ret        The return value of the previously called option function
    @param flag       bit0= do not issue own event messages
                      bit1= take xorriso->request_to_abort as reason for abort
    @return           Gives the advice:
                        2= pardon was given, go on
                        1= no problem, go on
                        0= function failed but xorriso would not abort, go on
                       <0= do abort
                           -1 = due to xorriso->problem_status
                                or due to ret<0
                           -2 = due to xorriso->request_to_abort
*/
int Xorriso_eval_problem_status(struct XorrisO *xorriso, int ret, int flag);


/** Set the current problem status of the xorriso handle.
    @param xorriso    The environment handle
    @param severity   A severity text. Empty text resets to "No Problem". 
    @param flag       Unused yet. Submit 0.
    @return           <=0 failure (e.g. wrong severity text), 1 success.
*/
int Xorriso_set_problem_status(struct XorrisO *xorriso, char *severity,
                               int flag);


/* The next two functions are part of Xorriso_eval_problem_status().
   You may use them to build an own advisor function.
*/

/** Obtain the current problem status of the xorriso handle.
    @param xorriso    The environment handle
    @param severity   The severity text matching the current problem status
    @param flag       Unused yet. Submit 0.
    @return           The severity rank number. 0= no problem occured.
*/
int Xorriso_get_problem_status(struct XorrisO *xorriso, char severity[80],
                               int flag);


/** Forward any pending messages from the library message queues to the
    xorriso message system which puts out on info channel. This registers
    the severity of the library events like the severity of a message submitted
    via Xorriso_msgs_submit().
    xorriso sets the message queues of the libraries to queuing "ALL".
    Many inner functions of xorriso call Xorriso_process_msg_queues() on their
    own because they expect library output pending. Nevertheless, a loop of
    xorriso option calls should either call Xorriso_eval_problem_status() or
    Xorriso_process_msg_queues() with each cycle.
    @param xorriso    The environment handle
    @param flag       Unused yet. Submit 0.
    @return           1 on success, <=0 if failure
*/
int Xorriso_process_msg_queues(struct XorrisO *xorriso, int flag);


/** Write a message for option -errfile_log. 
    @param xorriso    The environment handle
    @param error_code The unique error code of your message.
                      Submit 0 if you do not have reserved error codes within
                      the libburnia project.
    @param msg_text   Not more than 8196 characters of message text.
    @param os_errno   Eventual errno related to the message. Submit 0 if
                      the message is not related to a operating system error.
    @param flag       bit0-7= meaning of msg_text
                      ( 0= ERRFILE path , for internal use mainly )
                        1= mark line text (only to be put out if enabled)
    @return <=0 error , >0 success
*/
int Xorriso_process_errfile(struct XorrisO *xorriso,
                            int error_code, char msg_text[], int os_errno,
                            int flag);


/* The outlist stack allows to redirect the info and result messages from
   their normal channels into a pair of string lists which can at some
   later time be retrieved by the application.
   These redirection caches can be stacked to allow stacked applications.
   xorriso itself uses them for internal purposes. 
*/

/* A list item able of forming double chained lists */
struct Xorriso_lsT;

/** Maximum number of stacked redirections */
#define Xorriso_max_outlist_stacK 32

/** Enable a new redirection of info and/or result channel. The normal message
    output and eventual older redirections will not see new messages until
    the redirection is ended by a call to Xorriso_pull_outlists() with the
    stack_handle value returned by this call.
    Redirected output is not written to the files of Xorriso_option_logfile()
    and the Xorriso_option_pkt_output() protocol will not be applied.
    @param xorriso      The environment handle
    @param stack_handle returns an id number which is unique as long as
                        its redirection is stacked. It may be re-used after
                        its redirection was pulled from the stack.
    @param flag         Bitfield for control purposes
                         bit0= redirect result channel
                         bit1= redirect info channel
                        If bit0 and bit1 are 0, both channels get redirected.
    @return           1 on success, <=0 if failure
*/
int Xorriso_push_outlists(struct XorrisO *xorriso, int *stack_handle,
                          int flag);


/** Disable the redirection given by stack_handle. If it was the current
    receiver of messages then switch output to the next older redirection
    resp. to the normal channels if no redirections are stacked any more.
    The messages collected by the disabled redirection are handed out as
    two lists. Both lists have to be disposed via Xorriso_lst_destroy_all() 
    when they are no longer needed.
    The message lists are either NULL or represented by their first
    Xorriso_lsT item.
    @param xorriso       The environment handle
    @param stack_handle  The id number returned by Xorriso_push_outlists()
    @param result_list   Result and mark messages (usually directed to stdout)
    @param info_list     Info and mark messages (usually directed to stderr)
    @param flag          unused yet, submit 0
    @return              1 on success, <=0 if failure
*/
int Xorriso_pull_outlists(struct XorrisO *xorriso, int stack_handle,
                          struct Xorriso_lsT **result_list,
                          struct Xorriso_lsT **info_list, int flag);


/** Obtain the text message from the current list item.
    @param entry    The current list item
    @param flag     unused yet, submit 0
    @return         Pointer to the text content of the list item.
                    This pointer does not have to be freed.
*/
char *Xorriso_lst_get_text(struct Xorriso_lsT *entry, int flag);


/** Obtain the address of the next item in the chain of messages.
    An iteration over the output of Xorriso_pull_outlists() starts at the
    returned result_list resp. info_list and ends when this function returns
    NULL.
    @param entry    The current list item
    @param flag     unused yet, submit 0
    @return         Pointer to the next list item or NULL if end of list.
                    This pointer does not have to be freed.
*/
struct Xorriso_lsT *Xorriso_lst_get_next(struct Xorriso_lsT *entry, int flag);


/** Obtain the address of the previous item in the chain of messages.
    @param entry    The current list item
    @param flag     unused yet, submit 0
    @return         Pointer to the previous list item or NULL if start of list.
                    This pointer does not have to be freed.
*/
struct Xorriso_lsT *Xorriso_lst_get_prev(struct Xorriso_lsT *entry, int flag);


/** Destroy all list items which are directly or indirectly connected to
    the given link item.
    All pointers obtained by Xorriso_lst_get_text() become invalid by this.
    Apply this to each of the two list handles obtained by 
    Xorriso_pull_outlists() when the lists are no longer needed.
    @param lstring  *lstring will be freed and set to NULL.
                    It is not dangerous to submit a pointer to a NULL-pointer.
    @param flag     unused yet, submit 0
    @return         -1= lstring was NULL (i.e. wrong use of this call),
                     0= *lstring was already NULL,
                     1= item actually disposed
*/
int Xorriso_lst_destroy_all(struct Xorriso_lsT **lstring, int flag);



/* ---------------------------- Options API ------------------------ */
/*    See man 1 xorriso for explanation of the particular options    */
/*
   Before each call to an option function, there should happen:
   Xorriso_set_problem_status() with empty severity text.

   After each call to an option function, there should happen:
   Xorriso_eval_problem_status()
   One should follow its eventual advice to abort.

   Options with a varying number of arguments get then passed like
   Xorriso_interpreter(). E.g.:
     int Xorriso_option_add(struct XorrisO *xorriso, int argc, char **argv,
                            int *idx, int flag);
   The option functions will begin to read the arguments at position *idx
   and will see the list end either at the next argv which contains the
   -list_delimiter text or at argv[argc-1].
   After the call, *idx will be the index of the first not yet interpreted
   argv.

   Do not set any flag bits which are not described by "@param flag".
   I.e. if flag is not mentioned, then submit 0.
   Yet undefined flag bits might get a meaning in future. Unset bits will
   then produce the traditional behavior, whereas set bits might bring
   surprises to inadverted callers.
*/


/* Option -abort_on */
int Xorriso_option_abort_on(struct XorrisO *xorriso, char *severity, int flag);

/* Option -abstract_file */
/* @since 0.6.0 */
int Xorriso_option_abstract_file(struct XorrisO *xorriso, char *name,
                                 int flag);

/* Option -acl "on"|"off" */
int Xorriso_option_acl(struct XorrisO *xorriso, char *mode, int flag);

/* Option -add */
/* @param flag bit0=do not report the added item
               bit1=do not reset pacifier, no final pacifier message
*/
int Xorriso_option_add(struct XorrisO *xorriso, int argc, char **argv,
                       int *idx, int flag);

/* Option -add_plainly "on"|"off" */
int Xorriso_option_add_plainly(struct XorrisO *xorriso, char *mode,
                                   int flag);


/* Option -alter_date, alter_date_r */
/* @param flag bit0=recursive (-alter_date_r)
*/
int Xorriso_option_alter_date(struct XorrisO *xorriso, 
                              char *time_type, char *timestring,
                              int argc, char **argv, int *idx, int flag);

/* Option -append_partition */
/* @since 0.6.4 */
int Xorriso_option_append_partition(struct XorrisO *xorriso, char *partno_text,
                                  char *type_text, char *image_path, int flag);

/* Option -application_id */
int Xorriso_option_application_id(struct XorrisO *xorriso, char *name, 
                                  int flag);

/* Option -as */
/* @param flag bit0=do not report the added item
               bit1=do not reset pacifier, no final pacifier message
*/  
int Xorriso_option_as(struct XorrisO *xorriso, int argc, char **argv,
                      int *idx, int flag);

/* Option -assert_volid */
int Xorriso_option_assert_volid(struct XorrisO *xorriso, char *pattern,
                                char *severity, int flag);

/* Option -auto_charset "on"|"off" */
int Xorriso_option_auto_charset(struct XorrisO *xorriso, char *mode, int flag);

/* Option -backslash_codes */
int Xorriso_option_backslash_codes(struct XorrisO *xorriso, char *mode,
                                   int flag);

/* Option -ban_stdio_write */
int Xorriso_option_ban_stdio_write(struct XorrisO *xorriso, int flag);

/* Option -biblio_file */
/* @since 0.6.0 */
int Xorriso_option_biblio_file(struct XorrisO *xorriso, char *name, int flag);

/* Option -blank and -format */
/* @param flag bit0= format rather than blank
   @return <=0 error , 1 success, 2 revoked by -reassure
*/
int Xorriso_option_blank(struct XorrisO *xorriso, char *mode, int flag);

/* Option -boot_image */
int Xorriso_option_boot_image(struct XorrisO *xorriso, char *form,
                              char *treatment, int flag);

/* Option -calm_drive */
int Xorriso_option_calm_drive(struct XorrisO *xorriso, char *which, int flag);

/* Option -cd alias -cdi */
int Xorriso_option_cdi(struct XorrisO *xorriso, char *iso_rr_path, int flag);

/* Option -cdx */
int Xorriso_option_cdx(struct XorrisO *xorriso, char *disk_path, int flag);

/* Option -charset */
/* @param flag bit0= set in_charset
               bit1= set out_charset
*/
int Xorriso_option_charset(struct XorrisO *xorriso, char *name, int flag);

/* Options -check_md5 and -check_md5_r
   @param flag bit0= issue summary message
               bit1= do not reset pacifier, no final pacifier message
               bit2= do not issue pacifier messages at all
               bit3= recursive: -check_md5_r
*/
int Xorriso_option_check_md5(struct XorrisO *xorriso,
                             int argc, char **argv, int *idx, int flag);

/* Option -check_media */
int Xorriso_option_check_media(struct XorrisO *xorriso,
                               int argc, char **argv, int *idx, int flag);

/* Option -check_media_defaults */
int Xorriso_option_check_media_defaults(struct XorrisO *xorriso,
                                    int argc, char **argv, int *idx, int flag);

/* Option -chgrp alias -chgrpi , chgrp_r alias chgrpi */
/* @param flag bit0=recursive (-chgrp_r)
*/
int Xorriso_option_chgrpi(struct XorrisO *xorriso, char *gid,
                          int argc, char **argv, int *idx, int flag);

/* Option -chmod alias -chmodi , -chmod_r alias chmod_ri */
/* @param flag bit0=recursive (-chmod_r)
*/
int Xorriso_option_chmodi(struct XorrisO *xorriso, char *mode,
                          int argc, char **argv, int *idx, int flag);

/* Option -chown alias -chowni , chown_r alias chown_ri */
/* @param flag bit0=recursive (-chown_r)
*/
int Xorriso_option_chowni(struct XorrisO *xorriso, char *uid,
                          int argc, char **argv, int *idx, int flag);

/* Option -clone */
/* @since 1.0.2 */
int Xorriso_option_clone(struct XorrisO *xorriso, char *origin, char *dest,
                         int flag);

/* Option -close "on"|"off" */
int Xorriso_option_close(struct XorrisO *xorriso, char *mode, int flag);

/* Option -close_damaged */
/* @since 1.1.0 */
int Xorriso_option_close_damaged(struct XorrisO *xorriso, char *mode,
                                 int flag);

/* Option -close_filter_list */
int Xorriso_option_close_filter_list(struct XorrisO *xorriso, int flag);

/* Option -commit */
/* @param flag bit0= leave indrive and outdrive aquired as they were,
                     i.e. do not aquire outdrive as new in-out-drive
               bit1= do not perform eventual -reassure
   @return <=0 error , 1 success, 2 revoked by -reassure
*/
int Xorriso_option_commit(struct XorrisO *xorriso, int flag);

/* Option -commit_eject  */
/* @return <=0 error , 1 success, 2 revoked by -reassure
*/
int Xorriso_option_commit_eject(struct XorrisO *xorriso, char *which, int flag);

/* Option -compare and -compare_r
   @param flag bit0= issue summary message
               bit1= do not reset pacifier, no final pacifier message
               bit2= do not issue pacifier messages at all
               bit3= recursive: -compare_r
*/
int Xorriso_option_compare(struct XorrisO *xorriso, char *disk_path,
                           char *iso_path, int flag);

/* Option -compliance */
int Xorriso_option_compliance(struct XorrisO *xorriso, char *mode, int flag);

/* Option -copyright_file */
/* @since 0.6.0 */
int Xorriso_option_copyright_file(struct XorrisO *xorriso, char *name,
                                  int flag);

/* Option -cp_clone */
/* @since 1.0.2 */
int Xorriso_option_cp_clone(struct XorrisO *xorriso, int argc, char **argv,
                            int *idx, int flag);

/* Option -cpr alias -cpri */
int Xorriso_option_cpri( struct XorrisO *xorriso, int argc, char **argv,
                         int *idx, int flag);

/* Options -cpx , -cpax, -cp_rx , -cp_rax */
/* @param flag bit0= recursive (-cp_rx, -cp_rax)
               bit1= full property restore (-cpax, -cp_rax)
*/
int Xorriso_option_cpx(struct XorrisO *xorriso, int argc, char **argv,
                         int *idx, int flag);

/* Option -cut_out */
int Xorriso_option_cut_out(struct XorrisO *xorriso, char *disk_path,
                char *start, char *count, char *iso_rr_path, int flag);

/* Options -dev , -indev, -outdev */
/* @param flag bit0=use as indev , bit1= use as outdev
   @return <=0 error , 1 success, 2 revoked by -reassure
*/
int Xorriso_option_dev(struct XorrisO *xorriso, char *adr, int flag);

/* Option -devices */
/* @param flag bit0= perform -device_links rather than -devices
   @return <=0 error , 1 success, 2 revoked by -reassure
*/
int Xorriso_option_devices(struct XorrisO *xorriso, int flag);

/* Option -dialog "on"|"off" */
int Xorriso_option_dialog(struct XorrisO *xorriso, char *mode, int flag);

/* Option -disk_dev_ino "on"|"off" */
int Xorriso_option_disk_dev_ino(struct XorrisO *xorriso, char *mode, int flag);

/* Option -disk_pattern "on"|"ls"|"off" */
int Xorriso_option_disk_pattern(struct XorrisO *xorriso, char *mode, int flag);

/* Option -displacement [-]offset */
/* @since 0.6.6 */
int Xorriso_option_displacement(struct XorrisO *xorriso, char *value,
                                int flag);

/* Option -drive_class */
int Xorriso_option_drive_class(struct XorrisO *xorriso,
                               char *d_class, char *pattern, int flag);

/* Option -dummy "on"|"off" */
int Xorriso_option_dummy(struct XorrisO *xorriso, char *mode, int flag);

/* Option -dvd_obs "default"|"32k"|"64k" */
int Xorriso_option_dvd_obs(struct XorrisO *xorriso, char *obs, int flag);

/* Option -early_stdio_test */
/* @since 1.0.6 */
int Xorriso_option_early_stdio_test(struct XorrisO *xorriso, char *mode,
                                    int flag);

/* Option -eject */
/* @param flag bit0=do not report toc of eventually remaining drives
*/
int Xorriso_option_eject(struct XorrisO *xorriso, char *which, int flag);

/* Options -end , and -rollback_end */
/* @param flag bit0= discard pending changes 
   @return <=0 error , 1 success, 2 revoked by -reassure
*/
int Xorriso_option_end(struct XorrisO *xorriso, int flag);

/* Option -errfile_log marked|plain  path|-|"" */
int Xorriso_option_errfile_log(struct XorrisO *xorriso,
                               char *mode, char *path, int flag);

/* Option -error_behavior */
int Xorriso_option_error_behavior(struct XorrisO *xorriso, 
                                  char *occasion, char *behavior, int flag);

/* Option -external_filter */
int Xorriso_option_external_filter(struct XorrisO *xorriso,
                                   int argc, char **argv, int *idx, int flag);

/* Options -extract , -extract_single */
/* @param flag bit0=do not report the restored item
               bit1=do not reset pacifier, no final pacifier message
               bit5= -extract_single: do not insert directory tree
*/
int Xorriso_option_extract(struct XorrisO *xorriso, char *disk_path,
                       char *iso_path, int flag);

/* Option -extract_cut */
int Xorriso_option_extract_cut(struct XorrisO *xorriso, char *iso_rr_path,
                          char *start, char *count, char *disk_path, int flag);

/* Option -file_size_limit */
int Xorriso_option_file_size_limit(struct XorrisO *xorriso,
                                   int argc, char **argv, int *idx, int flag);


/* Option -find alias -findi, and -findx */
/* @param flag bit0= -findx rather than -findi
               bit1= do not reset pacifier, no final pacifier message
                     do not reset find_compare_result
*/ 
int Xorriso_option_find(struct XorrisO *xorriso, int argc, char **argv,
                       int *idx, int flag);

/* Option -follow */
int Xorriso_option_follow(struct XorrisO *xorriso, char *mode, int flag);

/* Option -fs */
int Xorriso_option_fs(struct XorrisO *xorriso, char *size, int flag);

/* Option -getfacl alias -getfacli, -getfacl_r alias -getfacl_ri */
/* @param flag bit0=recursive -getfacl_r
*/
int Xorriso_option_getfacli(struct XorrisO *xorriso,
                            int argc, char **argv, int *idx, int flag);

/* Option -gid */
int Xorriso_option_gid(struct XorrisO *xorriso, char *gid, int flag);

/* Option -grow_blindly */
int Xorriso_option_grow_blindly(struct XorrisO *xorriso, char *msc2, int flag);

/* Option -hardlinks "on"|"off" */
int Xorriso_option_hardlinks(struct XorrisO *xorriso, char *mode, int flag);

/* Option -help and part of -prog_help */
int Xorriso_option_help(struct XorrisO *xorriso, int flag);

/* Option -hide */
/* @since 0.6.0 */
int Xorriso_option_hide(struct XorrisO *xorriso, char *hide_state,
                        int argc, char **argv, int *idx, int flag);

/* Option -history */
int Xorriso_option_history(struct XorrisO *xorriso, char *line, int flag);

/* Option -iso_rr_pattern "on"|"ls"|"off" */
int Xorriso_option_iso_rr_pattern(struct XorrisO *xorriso, char *mode,
                                  int flag);

/* Option -jigdo aspect argument */
/* @since 0.6.4 */
int Xorriso_option_jigdo(struct XorrisO *xorriso, char *aspect, char *arg,
                         int flag);

/* Option -joliet "on"|"off" */
int Xorriso_option_joliet(struct XorrisO *xorriso, char *mode, int flag);

/* Option -list_delimiter */
int Xorriso_option_list_delimiter(struct XorrisO *xorriso, char *text,
                                  int flag);

/* Option -list_extras */
int Xorriso_option_list_extras(struct XorrisO *xorriso, char *mode, int flag);

/* Option -list_formats */
int Xorriso_option_list_formats(struct XorrisO *xorriso, int flag);

/* Option -list_profiles */
int Xorriso_option_list_profiles(struct XorrisO *xorriso, char *which,
                                 int flag);

/* Option -list_speeds */
int Xorriso_option_list_speeds(struct XorrisO *xorriso, int flag);

/* Option -load session|track|sbsector value */
/* @param flag bit0= with adr_mode sbsector: adr_value is possibly 16 too high
   @return <=0 error , 1 success, 2 revoked by -reassure
*/
int Xorriso_option_load(struct XorrisO *xorriso, char *adr_mode,
                          char *adr_value, int flag);

/* Option -logfile */
int Xorriso_option_logfile(struct XorrisO *xorriso, char *channel, 
                                                      char *fileadr, int flag);

/* Options -ls  alias -lsi   and -lsl  alias -lsli
       and -lsd alias -lsdi  and -lsdl alias -lsdli
       and -du  alias -dui   and -dus  alias -dusi
   @param flag bit0= long format (-lsl , -du)
               bit1= do not expand patterns but use literally
               bit2= du rather than ls
               bit3= list directories as themselves (ls -d)
*/
int Xorriso_option_lsi(struct XorrisO *xorriso, int argc, char **argv,
                      int *idx, int flag);

/* Options -lsx, -lslx, -lsdx , -lsdlx , -dux , -dusx
   @param flag bit0= long format (-lslx , -dux)
               bit1= do not expand patterns but use literally
               bit2= du rather than ls
               bit3= list directories as themselves (ls -d)
*/
int Xorriso_option_lsx(struct XorrisO *xorriso, int argc, char **argv,
                      int *idx, int flag);

/* Option -map */
/* @param flag bit0=do not report the added item
               bit1=do not reset pacifier, no final pacifier message
*/
int Xorriso_option_map(struct XorrisO *xorriso, char *disk_path,
                       char *iso_path, int flag);

/* Options -map_l , -compare_l , -update_l , -extract_l */
/* @param flag bit8-11= mode 0= -map_l
                             1= -compare_l
                             2= -update_l
                             3= -extract_l
*/
int Xorriso_option_map_l(struct XorrisO *xorriso, int argc, char **argv,
                         int *idx, int flag);

/* Option -mark */
int Xorriso_option_mark(struct XorrisO *xorriso, char *mark, int flag);

/* Option -md5 */
int Xorriso_option_md5(struct XorrisO *xorriso, char *mode, int flag);

/* Option -mkdir alias -mkdiri */
int Xorriso_option_mkdiri(struct XorrisO *xorriso, int argc, char **argv,
                          int *idx, int flag);

/* Options -mount , -mount_cmd , -session_string */
/* @param bit0= -mount_cmd: print mount command to result channel rather
                            than performing it
          bit1= perform -session_string rather than -mount_cmd
*/ 
int Xorriso_option_mount(struct XorrisO *xorriso, char *dev, char *adr_mode,
                         char *adr, char *cmd, int flag);

/* Option -mount_opts option[:...] */
int Xorriso_option_mount_opts(struct XorrisO *xorriso, char *mode, int flag);

/* Option -mv alias -mvi */
int Xorriso_option_mvi(struct XorrisO *xorriso, int argc, char **argv,
                      int *idx, int flag);

/* Option -no_rc */
int Xorriso_option_no_rc(struct XorrisO *xorriso, int flag);

/* Option -not_leaf , -as mkisofs -hide without '/' */
/* @param flag  bit0= add to iso_rr hide list rather than to disk exclusions
                      @since 0.6.0
                bit1= add to joliet hide list rather than disk exclusions
                      @since 0.6.0
*/
int Xorriso_option_not_leaf(struct XorrisO *xorriso, char *pattern, int flag);

/* Option -not_list , -quoted_not_list */
/* @param flag bit0= -quoted_not_list */
int Xorriso_option_not_list(struct XorrisO *xorriso, char *adr, int flag);

/* Option -not_mgt */
int Xorriso_option_not_mgt(struct XorrisO *xorriso, char *setting, int flag);

/* Option -not_paths , -as mkisofs -hide with '/' */
/* @param flag  bit0= add to iso_rr hide list rather than to disk exclusions
                      @since 0.6.0
                bit1= add to joliet hide list rather than disk exclusions
                      @since 0.6.0
                bit2= enable disk pattern expansion regardless of -disk_pattern
*/ 
int Xorriso_option_not_paths(struct XorrisO *xorriso, int argc, char **argv,
                             int *idx, int flag);

/* Option -options_from_file */
/* @return <=0 error , 1 = success , 3 = request to end program run */
int Xorriso_option_options_from_file(struct XorrisO *xorriso, char *adr,
                                     int flag);

/* Option -osirrox "on"|"off" */
int Xorriso_option_osirrox(struct XorrisO *xorriso, char *mode, int flag);

/* Option -overwrite "on"|"nondir"|"off" */
int Xorriso_option_overwrite(struct XorrisO *xorriso, char *mode, int flag);

/* Option -pacifier */
int Xorriso_option_pacifier(struct XorrisO *xorriso, char *style, int flag);

/* Option -padding */
int Xorriso_option_padding(struct XorrisO *xorriso, char *size, int flag);

/* Option -page */
int Xorriso_option_page(struct XorrisO *xorriso, int len, int width, int flag);

/* Option -paste_in */
int Xorriso_option_paste_in(struct XorrisO *xorriso, char *iso_rr_path,
                          char *disk_path, char *start, char *count, int flag);

/* Option -path_list , -quoted_path_list */
/* @param flag bit0= -quoted_path_list */
int Xorriso_option_path_list(struct XorrisO *xorriso, char *adr, int flag);

/* Option -pathspecs */
int Xorriso_option_pathspecs(struct XorrisO *xorriso, char *mode, int flag);

/* Option -pkt_output */
int Xorriso_option_pkt_output(struct XorrisO *xorriso, char *mode, int flag);

/* Option -preparer_id */
/* @since 0.6.2 */
int Xorriso_option_preparer_id(struct XorrisO *xorriso, char *name, int flag);

/* Options -print, -print_info , -print_mark */
/* @param flag bit0-1= output channel:
                       0= result channel
                       1= info channel @since 1.0.6
                       2= mark channel @since 1.0.6
*/
int Xorriso_option_print(struct XorrisO *xorriso, char *text, int flag);

/* Option -print_size
   @param flag bit0= report in mkisofs compatible form on real stdout
*/
int Xorriso_option_print_size(struct XorrisO *xorriso, int flag);

/* Option -prog */
int Xorriso_option_prog(struct XorrisO *xorriso, char *name, int flag);

/* Option -prompt */
int Xorriso_option_prompt(struct XorrisO *xorriso, char *text, int flag);

/* Option -prog_help */
int Xorriso_option_prog_help(struct XorrisO *xorriso, char *name, int flag);

/* Option -publisher */
int Xorriso_option_publisher(struct XorrisO *xorriso, char *name, int flag);

/* Option -pvd_info */
int Xorriso_option_pvd_info(struct XorrisO *xorriso, int flag);

/* Option -pwd alias -pwdi */
int Xorriso_option_pwdi(struct XorrisO *xorriso, int flag);

/* Option -pwdx */
int Xorriso_option_pwdx(struct XorrisO *xorriso, int flag);

/* Option -read_mkisofsrc */
/* @since 0.6.0 */
int Xorriso_option_read_mkisofsrc(struct XorrisO *xorriso, int flag);

/* Option -reassure "on"|"tree"|"off" */
int Xorriso_option_reassure(struct XorrisO *xorriso, char *mode, int flag);

/* Option -report_about */
int Xorriso_option_report_about(struct XorrisO *xorriso, char *severity, 
                                int flag);

/* Option -return_with */
int Xorriso_option_return_with(struct XorrisO *xorriso, char *severity,
                               int exit_value, int flag);

/* Options -rm alias -rmi , -rm_r alias -rm_ri , -rmdir alias -rmdiri */
/* @param flag bit0=recursive , bit2= remove empty directory: rmdir */
int Xorriso_option_rmi(struct XorrisO *xorriso, int argc, char **argv,
                       int *idx, int flag);

/* Option -rollback */
/* @param flag bit0= do not -reassure
   @return <=0 error , 1 success, 2 revoked by -reassure
*/
int Xorriso_option_rollback(struct XorrisO *xorriso, int flag);

/* Option -rom_toc_scan */
int Xorriso_option_rom_toc_scan(struct XorrisO *xorriso, char *mode,
                                int flag);

/* Option -scdbackup_tag */
int Xorriso_option_scdbackup_tag(struct XorrisO *xorriso, char *list_path,
                                 char *record_name, int flag);
/* Option -scsi_log */
int Xorriso_option_scsi_log(struct XorrisO *xorriso, char *mode, int flag);

/* Option -session_log */
int Xorriso_option_session_log(struct XorrisO *xorriso, char *path, int flag);

/* Option -setfacl_list alias -setfacl_listi */
int Xorriso_option_setfacl_listi(struct XorrisO *xorriso, char *disk_path,
                                 int flag);

/* Option -setfacl alias -setfacli , -setfacl_r  alias -setfacl_ri */
/* @param flag bit0=recursive -setfacl_r
*/
int Xorriso_option_setfacli(struct XorrisO *xorriso, char *acl_text,
                            int argc, char **argv, int *idx, int flag);

/* Options -setfattr alias -setfattri, -setfattr_r alias -setfattr_ri */
/* @param flag   bit0=recursive -setfattr_r
*/
int Xorriso_option_setfattri(struct XorrisO *xorriso, char *name, char *value,
                            int argc, char **argv, int *idx, int flag);

/* Option -setfattr_list alias -setfattr_listi */
int Xorriso_option_setfattr_listi(struct XorrisO *xorriso, char *path, 
                                  int flag);

/* Options -set_filter , -set_filter_r */ 
/* @param flag   bit0=recursive -set_filter_r
*/
int Xorriso_option_set_filter(struct XorrisO *xorriso, char *name,
                              int argc, char **argv, int *idx, int flag);

/* Option -signal_handling */
/* @param flag bit0= do not yet install the eventual handler
*/
int Xorriso_option_signal_handling(struct XorrisO *xorriso, char *mode,
                                   int flag);

/* Option -sleep */
int Xorriso_option_sleep(struct XorrisO *xorriso, char *duration, int flag);

/* Option -speed */
int Xorriso_option_speed(struct XorrisO *xorriso, char *speed, int flag);

/* Option -split_size */
int Xorriso_option_split_size(struct XorrisO *xorriso, char *s, int flag);

/* Option -status */
int Xorriso_option_status(struct XorrisO *xorriso, char *mode, int flag);

/* Option -status_history_max */
int Xorriso_option_status_history_max(struct XorrisO *xorriso, int num1, 
                                      int flag);

/* Option -stdio_sync "on"|"off"|size */
int Xorriso_option_stdio_sync(struct XorrisO *xorriso, char *rythm, int flag);

/* Option -stream_recording */
int Xorriso_option_stream_recording(struct XorrisO *xorriso, char *mode,
                                    int flag);

/* Option -system_id */
int Xorriso_option_system_id(struct XorrisO *xorriso, char *name, int flag);

/* Option -tell_media_space */
int Xorriso_option_tell_media_space(struct XorrisO *xorriso, int flag);

/* Option -temp_mem_limit */
int Xorriso_option_temp_mem_limit(struct XorrisO *xorriso, char *size, 
                                  int flag);

/* Option -toc */
int Xorriso_option_toc(struct XorrisO *xorriso, int flag);

/* Option -uid */
int Xorriso_option_uid(struct XorrisO *xorriso, char *uid, int flag);

/* Option -unregister_filter */
int Xorriso_option_unregister_filter(struct XorrisO *xorriso, char *name,
                                     int flag);

/* Options -update and -update_r
   @param flag bit0= issue summary message
               bit1= do not reset pacifier, no final pacifier message
               bit2= do not issue pacifier messages at all
               bit3= recursive: -update_r
*/ 
int Xorriso_option_update(struct XorrisO *xorriso, char *disk_path,
                          char *iso_path, int flag);

/* Option -use_readline */
int Xorriso_option_use_readline(struct XorrisO *xorriso, char *mode, int flag);

/* Option -version */
int Xorriso_option_version(struct XorrisO *xorriso, int flag);

/* Option -volid */
/* @param flag bit0= do not warn of problematic volid
*/
int Xorriso_option_volid(struct XorrisO *xorriso, char *volid, int flag);

/* Option -volset_id */
int Xorriso_option_volset_id(struct XorrisO *xorriso, char *name, int flag);

/* Option -volume_date */
int Xorriso_option_volume_date(struct XorrisO *xorriso,
                               char *time_type, char *timestring, int flag);

/* Option -xattr "on"|"off" */
int Xorriso_option_xattr(struct XorrisO *xorriso, char *mode, int flag);

/* Option -zisofs */
int Xorriso_option_zisofs(struct XorrisO *xorriso, char *mode, int flag);


#endif /* Xorriso_includeD */


