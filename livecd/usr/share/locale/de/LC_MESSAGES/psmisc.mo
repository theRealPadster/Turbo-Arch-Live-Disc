��    Q      �  m   ,      �  Q  �  `   3
  b   �
  0   �
  p   (  k   �  #        )     F     ]  )   s  	   �  3   �     �  �   �      �  ,   �  $   �     �  #         2     S     s  #   �  !   �     �     �  <     <   B  <     %   �      �          "     =     T     c     w     �     �     �  �   �  &   �     �     �       �     d   �     a  $   x  u   �  C     =   W     �  &   �     �  )   �       H   *  (   s  E  �  �   �  �   �  .   �  F   �  "     -   0     ^  
   ~     �     �     �     �     �     �     �                      �  &  �  �  �   X  ^   �  ,   8   �   e   �   �   "   ~!  =   �!     �!     �!  6   "     K"  ?   W"  $   �"  �   �"  3   L#  <   �#  1   �#     �#  *   $  2   :$  /   m$  '   �$  -   �$  )   �$  )   %  4   G%  <   |%  <   �%  <   �%  %   3&      Y&  $   z&      �&     �&     �&     �&      '     '     8'  %   X'  �   ~'  -   D(  $   r(     �(  #   �(  �   �(  e   �)  "   +*  $   N*  y   s*  E   �*  G   3+     {+  *   �+     �+  0   �+     ,  G   .,  *   v,  v  �,    .  �   /  B   �/  f   20  (   �0  9   �0  '   �0     $1     41     G1     S1     g1     |1     �1  9   �1     �1     �1  	   �1     �1         P       -            #   	   /   *       N   M       %               4   0      "              @      A            O   ?   Q                            
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
 sleeping traced unknown zombie Project-Id-Version: psmisc 22.11-pre1
Report-Msgid-Bugs-To: csmall@small.dropbear.id.au
POT-Creation-Date: 2012-01-25 22:02+1100
PO-Revision-Date: 2010-03-28 23:45+0100
Last-Translator: Roland Illig <roland.illig@gmx.de>
Language-Team: German <translation-team-de@lists.sourceforge.net>
Language: de
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
        killall -l, --list
       killall -V, --version

  -e,--exact          verlange genaue Übereinstimmung für sehr lange Namen
  -I,--ignore-case    Groß- und Kleinschreibung nicht beachten
  -g,--process-group  breche Prozessgruppe statt Einzelprozess ab
  -y,--younger-than   Prozesse jünger als ZEIT abbrechen
  -o,--older-than     Prozesse älter als ZEIT abbrechen
  -i,--interactive    verlange vor Abbruch Bestätigung des Benutzers
  -l,--list           liste alle bekannten Signalnamen auf
  -q,--quiet          keine Warnungen und Fehler ausgeben
  -r,--regexp         NAME ist ein erweiteter regulärer Ausdruck
  -s,--signal SIGNAL  sende benutzerdefiniertes Signal anstatt SIGTERM
  -u,--user USER      nur Prozesse von angegebenem Benutzer abbrechen
  -v,--verbose        berichte, falls das Signal erfolgreich gesendet wurde
  -V,--version        zeige Version
  -w,--wait           warte auf das Ende der Prozesse
   -                     Zurücksetzen der Optionen

  udp/tcp-Namen: [lokaler_port][,[entfernter_rechner][,[entfernter_port]]]

   -4,--ipv4             suche nur IPv4-Sockets
  -6,--ipv6             suche nur IPv6-Sockets
     -Z     zeige SELinux-Sicherheitskontext
   -Z,--context REGEXP breche nur Prozesse ab, die einen Kontext haben
                        (muss vor anderen Argumenten stehen)
     PID       mit dieser PID starten; Vorgabewert ist 1 (init)
    BENUTZER  zeige nur Prozessbäume, deren Wurzeln Prozesse dieses Benutzers sind

 %*s BEN.        PID ZUGR.  BEFEHL
 %s ist leer (Dateisystem möglicherweise nicht eingebunden?)
 %s: Ungültige Option %s
 %s: Kein Prozess gefunden
 %s: unbekanntes Signal; %s -l listet die Signale auf.
 (unbekannt) /proc ist nicht eingehängt, kann /proc/self/stat nicht lesen.
 Ungültiger regulärer Ausdruck: %s
 CPU-Zeiten
  Dieser Prozess  (user system guest blkio): %6.2f %6.2f %6.2f %6.2f
  Kindprozesse    (user system guest):       %6.2f %6.2f %6.2f
 Kann die Fähigkeiten des Terminals nicht erkennen
 Kein Speicher mehr verfügbar für zugehöriges Prozess: %s
 Kann die Gerätenummer der Sockets nicht finden.
 Kann Benutzer %s nicht finden!
 Kann keine UID vom Prozessstatus erhalten
 Verzeichnis /proc kann nicht geöffnet werden: %s
 /proc/net/unix kann nicht geöffnet werden: %s
 Kann keine Netzwerkverbindung öffnen.
 Kann Protokolldatei »%s« nicht öffnen: %s
 Kann lokalen Port %s nicht auflösen: %s
 Kann Status von "%s" nicht ermitteln: %s
 Status der Datei %s kann nicht ermittelt werden: %s
 Copyright (C) 1993-2005 Werner Almesberger und Craig Small

 Copyright (C) 1993-2009 Werner Almesberger and Craig Small

 Copyright (C) 1993-2010 Werner Almesberger und Craig Small

 Copyright (C) 2007 Trent Waddington

 Copyright (C) 2009 Craig Small

 Kann Prozess %d nicht abbrechen: %s
 Fehler beim Anhängen an PID %i
 Ungültiger Namensraum Ungültige Option Ungültiges Zeitformat %s(%s%d) abbrechen? (y/N)  Prozess %d abbrechen? (y/N)  %s(%s%d) mit Signal %d beendet
 Die maximale Anzahl von Namen ist %d
 Speicher
  Vsize:       %-10s
  RSS:         %-10s 		 RSS-Grenzwert: %s
  Code-Start:  %#-10lx		 Code-Ende:  %#-10lx
  Stack-Start: %#-10lx
  Stackzeiger (ESP): %#10lx	 Befehlszeiger (EIP): %#10lx
 Die Namensraum-Option benötigt ein Argument. Keine Prozessspezifikation angegeben Keine Prozesse gefunden.
 Kein Benutzer mit dem Namen »%s«
 Für PSmisc gibt es KEINERLEI GARANTIE.
Es ist freie Software und Sie dürfen sie gern gemäß den Bedingungen
der GNU General Public License (GPL) weiter vertreiben.
Zusätzliche Informationen dazu finden Sie in der Datei namens COPYING.
 Seitenfehler
  Dieser Prozess  (klein groß): %8lu  %8lu
  Kindprozesse    (klein groß): %8lu  %8lu
 Drücken Sie Enter zum Schließen
 Prozess mit PID %d existiert nicht.
 Prozess-, Gruppen- und Session-IDs
  Prozess-ID: %d		  Eltern-ID: %d
  Gruppen-ID: %d		 Session-ID: %d
T-Gruppen-ID: %d

 Prozess: %-14s		Zustand: %c (%s)
  CPU#:  %-3d		TTY: %s	Threads: %ld
 Prozessplanung
  Richtlinie: %s
  Nett:   %ld 		 RT-Priorität: %ld %s
 Signal %s(%s%d) senden? (y/N)  Angegebener Dateiname %s existiert nicht.
 TERM ist nicht gesetzt
 Konnte Stat-Datei für PID %d nicht öffnen: %s
 Unbekannter lokaler Port AF %d
 Aufruf: killall [-Z CONTEXT] [-u USER] [ -eIgiqrvw ] [-SIGNAL] NAME...
 Aufruf: killall - [OPTION]... [--]NAME...
 Aufruf: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8 8-Bit-Ausgabe erzwingen.
    -n Header für Lesen/Schreiben aus FDs nicht anzeigen.
    -c Auch nach neuen Kindprozessen Ausschau halten.
    -d Doppeltes Lesen/Schreiben nicht ausgeben.
    -V Versionsinformationen ausgeben.
    -h Diese Hilfe ausgeben.

  Drücken Sie Strg-C, um die Ausgabe zu beenden.
 Aufruf: pidof [-eg] NAME...
        pidof -V

    -e   exakte Übereinstimmung für sehr lange Namen erforderlich;
           ignorieren, wenn die Kommandozeile nicht verfügbar ist
    -g   zeige Prozessgruppen-ID statt der Prozess-ID
    -V   zeige Version

 Aufruf: prtstat [Optionen] PID ...
        prtstat -V
Informationen über einen Prozess ausgeben
    -r,--raw       Rohe Ausgabe der Informationen
    -V,--version   Versionsinformationen anzeigen und beenden
 Dateien können nur mit der Einhängepunkt-Option verwendet werden Sie können nicht gleichzeitig ausschließlich nach IPv4 und ausschließlich nach IPv6-Sockets suchen. Sie müssen mindestens eine PID angeben. Option -a kann nicht mit der Option -s kombiniert werden. asprintf in print_stat fehlgeschlagen.
 schläft (Disk) fuser (PSmisc) %s
 auslagerung peekfd (PSmisc) %s
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 läuft überspringe unvollständige Übereinstimmung von %s(%d)
 schläft schritt unbekannt zombie 