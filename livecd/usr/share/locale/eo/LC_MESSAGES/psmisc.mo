��    Q      �  m   ,      �  Q  �  `   3
  b   �
  0   �
  p   (  k   �  #        )     F     ]  )   s  	   �  3   �     �  �   �      �  ,   �  $   �     �  #         2     S     s  #   �  !   �     �     �  <     <   B  <     %   �      �          "     =     T     c     w     �     �     �  �   �  &   �     �     �       �     d   �     a  $   x  u   �  C     =   W     �  &   �     �  )   �       H   *  (   s  E  �  �   �  �   �  .   �  F   �  "     -   0     ^  
   ~     �     �     �     �     �     �     �                      �  &  n  �  f     ^     7   �        �   �   $   #!  %   H!     n!     �!  3   �!  
   �!  D   �!     ("  �   E"  .   �"  4   #  *   B#      m#  &   �#  *   �#  (   �#  "   	$  2   ,$  &   _$     �$  *   �$  <   �$  <   %  <   K%  %   �%      �%  '   �%     �%     &     3&     F&     \&  #   z&  $   �&  #   �&  �   �&  *   �'  &   �'     �'     (  �   +(  i   +)     �)      �)  t   �)  C   J*  ?   �*     �*  '   �*     +  /   ,+     \+  M   w+  *   �+  b  �+    S-  �   \.  5   /  8   M/  "   �/  6   �/  $   �/     0     0  
   %0     00     D0     Y0     m0  ,   u0     �0     �0     �0     �0         P       -            #   	   /   *       N   M       %               4   0      "              @      A            O   ?   Q                            
       $          3         J          &           !              8           ,      )       L   .            2          1   7   H   (      B          <   +   =          K   6       '   :                    ;   E   >   D   I   9   C   5   G   F           killall -l, --list
       killall -V, --version

  -e,--exact          require exact match for very long names
  -I,--ignore-case    case insensitive process name match
  -g,--process-group  kill process group instead of process
  -y,--younger-than   kill processes younger than TIME
  -o,--older-than     kill processes older than TIME
  -i,--interactive    ask for confirmation before killing
  -l,--list           list all known signal names
  -q,--quiet          don't print complaints
  -r,--regexp         interpret NAME as an extended regular expression
  -s,--signal SIGNAL  send this signal instead of SIGTERM
  -u,--user USER      kill only process(es) running as USER
  -v,--verbose        report if the signal was successfully sent
  -V,--version        display version information
  -w,--wait           wait for processes to die
   -                     reset options

  udp/tcp names: [local_port][,[rmt_host][,[rmt_port]]]

   -4,--ipv4             search IPv4 sockets only
  -6,--ipv6             search IPv6 sockets only
   -Z     show         SELinux security contexts
   -Z,--context REGEXP kill only process(es) having context
                      (must precede other arguments)
   PID    start at this PID; default is 1 (init)
  USER   show only trees rooted at processes of this user

 %*s USER        PID ACCESS COMMAND
 %s is empty (not mounted ?)
 %s: Invalid option %s
 %s: no process found
 %s: unknown signal; %s -l lists signals.
 (unknown) /proc is not mounted, cannot stat /proc/self/stat.
 Bad regular expression: %s
 CPU Times
  This Process    (user system guest blkio): %6.2f %6.2f %6.2f %6.2f
  Child processes (user system guest):       %6.2f %6.2f %6.2f
 Can't get terminal capabilities
 Cannot allocate memory for matched proc: %s
 Cannot find socket's device number.
 Cannot find user %s
 Cannot get UID from process status
 Cannot open /proc directory: %s
 Cannot open /proc/net/unix: %s
 Cannot open a network socket.
 Cannot open protocol file "%s": %s
 Cannot resolve local port %s: %s
 Cannot stat %s: %s
 Cannot stat file %s: %s
 Copyright (C) 1993-2005 Werner Almesberger and Craig Small

 Copyright (C) 1993-2009 Werner Almesberger and Craig Small

 Copyright (C) 1993-2010 Werner Almesberger and Craig Small

 Copyright (C) 2007 Trent Waddington

 Copyright (C) 2009 Craig Small

 Could not kill process %d: %s
 Error attaching to pid %i
 Invalid namespace name Invalid option Invalid time format Kill %s(%s%d) ? (y/N)  Kill process %d ? (y/N)  Killed %s(%s%d) with signal %d
 Maximum number of names is %d
 Memory
  Vsize:       %-10s
  RSS:         %-10s 		 RSS Limit: %s
  Code Start:  %#-10lx		 Code Stop:  %#-10lx
  Stack Start: %#-10lx
  Stack Pointer (ESP): %#10lx	 Inst Pointer (EIP): %#10lx
 Namespace option requires an argument. No process specification given No processes found.
 No such user name: %s
 PSmisc comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it under
the terms of the GNU General Public License.
For more information about these matters, see the files named COPYING.
 Page Faults
  This Process    (minor major): %8lu  %8lu
  Child Processes (minor major): %8lu  %8lu
 Press return to close
 Process with pid %d does not exist.
 Process, Group and Session IDs
  Process ID: %d		  Parent ID: %d
    Group ID: %d		 Session ID: %d
  T Group ID: %d

 Process: %-14s		State: %c (%s)
  CPU#:  %-3d		TTY: %s	Threads: %ld
 Scheduling
  Policy: %s
  Nice:   %ld 		 RT Priority: %ld %s
 Signal %s(%s%d) ? (y/N)  Specified filename %s does not exist.
 TERM is not set
 Unable to open stat file for pid %d (%s)
 Unknown local port AF %d
 Usage: killall [-Z CONTEXT] [-u USER] [ -eIgiqrvw ] [ -SIGNAL ] NAME...
 Usage: killall [OPTION]... [--] NAME...
 Usage: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8 output 8 bit clean streams.
    -n don't display read/write from fd headers.
    -c peek at any new child processes too.
    -d remove duplicate read/writes from the output.
    -V prints version info.
    -h prints this help.

  Press CTRL-C to end output.
 Usage: pidof [ -eg ] NAME...
       pidof -V

    -e      require exact match for very long names;
            skip if the command line is unavailable
    -g      show process group ID instead of process ID
    -V      display version information

 Usage: prtstat [options] PID ...
       prtstat -V
Print information about a process
    -r,--raw       Raw display of information
    -V,--version   Display version information and exit
 You can only use files with mountpoint options You cannot search for only IPv4 and only IPv6 sockets at the same time You must provide at least one PID. all option cannot be used with silent option. asprintf in print_stat failed.
 disk sleep fuser (PSmisc) %s
 paging peekfd (PSmisc) %s
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 running skipping partial match %s(%d)
 sleeping traced unknown zombie Project-Id-Version: psmisc 22.12
Report-Msgid-Bugs-To: csmall@small.dropbear.id.au
POT-Creation-Date: 2012-01-25 22:02+1100
PO-Revision-Date: 2011-03-19 21:55-0300
Last-Translator: Felipe Castro <fefcas@gmail.com>
Language-Team: Esperanto <translation-team-eo@lists.sourceforge.net>
Language: eo
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
        killall -l, --list
       killall -V, --version

  -e,--exact          postuli ĝustan kongruon por tre longaj nomoj
  -I,--ignore-case    sen-uskleca procez-noma kongruo
  -g,--process-group  mortigi procez-grupon anstataŭ procezon
  -y,--younger-than   mortigi procezon pli nova ol TEMPO
  -o,--older-than     mortigi procezon pli malnova ol TEMPO
  -i,--interactive    peti konfirmon antaŭ ol mortigi
  -l,--list           listigi ĉiujn konatajn signal-nomojn
  -q,--quiet          ne printi plendojn
  -r,--regexp         interpreti NOMO kiel etenditan regul-esprimon
  -s,--signal SIGNALO sendi tiun ĉi signalon anstataŭ SIGTERM
  -u,--user UZANTO    mortigi nur procezo(j)n rulantajn kiel UZANTO
  -v,--verbose        raporti ĉu signalo estis sukcese sendata
  -V,--version        montrigi informon pri versio
  -w,--wait           atendi ke procezoj mortu
   -                     reŝargaj elektiloj

  udp/tcp nomoj: [local_port][,[rmt_host][,[rmt_port]]]

   -4,--ipv4             serĉi nur ingojn IPv4
  -6,--ipv6             serĉi nur ingojn IPv6
   -Z     montri         sekurecajn kuntekstojn SELinux
   -Z,--context REGEXP mortigi nur procezo(j)n kiuj havu kuntekston
                      (devas veni antaŭ aliaj argumentoj)
   PID    komencas ĉe tiu ĉi PID; apriore estas is 1 (init)
  UZANTO montri nur arbojn kiuj havas radikojn ĉe procezoj de tiu ĉi uzanto

 %*s UZANTO        PID ALIRO KOMANDO
 %s estas malplena (ĉu ne muntita ?)
 %s: Malvalida elektilo %s
 %s: neniu procezo trovite
 %s: nekonata signalo; %s -l listigas la signalojn.
 (nekonate) /proc ne estas muntita, ni ne povas apliki stat en /proc/self/stat.
 Malĝusta regul-esprimo: %s
 CPU-Tempoj
  Tiu ĉi Procezo (uzanto sistemo gastigo blkio): %6.2f %6.2f %6.2f %6.2f
  Idaj procezoj  (uzanto sistemo gastigo):       %6.2f %6.2f %6.2f
 Ni ne povas koni la kapablojn de la terminalo
 Ni ne povas rezervi memoron por kongruinta proc: %s
 Ni ne povas trovi aparat-numeron de ingo.
 Ni ne povas trovi la uzanton %s
 Ni ne povas preni UID el procez-stato
 Ni ne povas malfermi dosierujon /proc: %s
 Ni ne povas malfermi /proc/net/unix: %s
 Ni ne povas malfermi retan ingon.
 Ni ne povas malfermi protokolan dosieron "%s": %s
 Ni ne povas solvi lokan pordon %s: %s
 Ni ne povas apliki stat %s: %s
 Ni ne povas apliki stat en dosiero %s: %s
 Kopirajto (C) 1993-2005 Werner Almesberger kaj Craig Small

 Kopirajto (C) 1993-2009 Werner Almesberger kaj Craig Small

 Kopirajto (C) 1993-2010 Werner Almesberger kaj Craig Small

 Kopirajto (C) 2007 Trent Waddington

 Kopirajto (C) 2009 Craig Small

 Ni ne povis mortigi la procezon %d: %s
 Eraro dum konektiĝo al pid %i
 Malvalida nomo por nomspaco Malvalida elektilo Malvalida tempo-formo Ĉu mortigi %s(%s%d) ? (y/N)  Ĉu mortigi la procezon %d ? (y/N)  Ni mortigis %s(%s%d) per signalo %d
 Maksimuma nombro da nomoj estas %d
 Memoro
  Vsize:       %-10s
  RSS:         %-10s 		 RSS-Limo: %s
  Kod-Komenco: %#-10lx		 Kod-Fino: %#-10lx
  Stak-Komenco: %#-10lx
  Stak-Indikilo (ESP): %#10lx	 Inst-Indikilo (EIP): %#10lx
 Nomspaca elektilo postulas unu argumenton. Neniu specifo pri procezo estis donata Neniu procezo trovite.
 Neniu uzant-nomo tia: %s
 PSmisc venas kun ABSOLUTE NENIUN GARANTION.
Tio ĉi estas libera programaro, kaj vi estas invitata redisdoni ĝin sub
la kondiĉoj de la Ĝenerala Publika Permesilo GNU.
Por pli da informoj pri tiuj ĉi aferoj, vidu la dosierojn nomitajn COPYING (angle).
 Paĝ-Eraroj
  Tiu ĉi Procezo (malpleja pleja): %8lu  %8lu
  Idaj Procezoj  (malpleja pleja): %8lu  %8lu
 Premu la enigklavon por fermi
 Procezo kun pid %d ne ekzistas.
 ID de Procezo, Grupo kaj Seanco
  Proceza ID: %d		  Patra ID: %d
    Grupa ID: %d		 Seanca ID: %d
  T Grupa ID: %d

 Procezo: %-14s		Stato: %c (%s)
  CPU#:  %-3d		TTY: %s	Fadenoj: %ld
 Planado
  Strategio: %s
  Nice:   %ld 		 RT Prioritato: %ld %s
 Ĉu signali %s(%s%d) ? (y/N)  La indikita dosiernomo %s ne ekzistas.
 TERM ne estas difinita
 Ne eblas malfermi stat-dosiero por pid %d (%s)
 Nekonata loka pordo AF %d
 Uzado: killall [-Z KUNTEKSTO] [-u UZANTO] [ -eIgiqrvw ] [ -SIGNALO ] NOMO...
 Uzado: killall [ELEKTILO]... [--] NOMO...
 Uzado: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8 eligi 8-bitan purajn fluojn.
    -n ne montrigi leg/skribo el kaplinioj fd.
    -c rigardeti ankaŭ iun ajn novan idan procezon.
    -d forigi duobligitaj leg/skribojn el la eligo.
    -V printi information pri versio.
    -h printi tiun ĉi helpon.

  Premu CTRL-C por ĉesigi eligon.
 Uzado: pidof [ -eg ] NOMO...
       pidof -V

    -e      postuli ĝustan kongruon por tre longaj nomoj;
            preterpasas se la komand-linio ne disponeblas
    -g      montri procezan grup-ID anstataŭ procezan ID
    -V      montrigi informon pri versio

 Uzado: prtstat [elektiloj] PID ...
       prtstat -V
Printi informon pri procezo
    -r,--raw       Kruda montrigo de informaro
    -V,--version   Montrigi informon pri versio kaj eligi
 Vi nur povas uzi dosierojn kun munt-punktaj elektiloj Vi ne povas serĉi ingojn nur IPv4 kaj nur IPv6 samtempe Vi devas provizi minimume unu PID. elektilo all ne povas esti uzata kun silenta elektilo. asprintf en print_stat malsukcesis.
 disk-dormado fuser (PSmisc) %s
 paĝiganta peekfd (PSmisc) %s
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 rulanta ni preterpasas ne kompletan kongruon %s(%d)
 dormanta spursekvata nekonata zombia 