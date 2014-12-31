#!/usr/bin/perl 

use strict;
use warnings;

$SIG{INT}  = \&signal_handler;
$SIG{TERM} = \&signal_handler;

#
# start supervisord
#
my $return = system('/usr/bin/supervisord -c /etc/supervisor/supervisord.conf') ;

#
# only wait if startup was OK
#

if ($? ==0) {

    print "init started....\n" ;

    # wait for processes to statup

    sleep(2) ;

    # output information about started processes

    print "Process status is:\n" ;

    my $sv_status = `/usr/bin/supervisorctl status` ;
    print "$sv_status..................................................................\n" ;

    # wait forever for shutdown signal

    while (1) {
        sleep(200);
    }


} else {

    # something gone bad, inform user and wait to let user fix it thru a shell

    print "supervisord did not start correctly\n" ;
    print "use the command\n" ;
    print "docker exec -it <container ID> /bin/bash\n" ;
    print "to login an correct the problem\n" ; 
    # wait forever for shutdown signal

    while (1) {
        sleep(200);
    }

}

sub signal_handler {

   print "Shutting down all processes....\n" ;

   # shutdown all services started by supervisord

   my $return = system('/usr/bin/supervisorctl shutdown') ;

   exit(0) ;
}

