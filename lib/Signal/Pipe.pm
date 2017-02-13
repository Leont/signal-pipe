package Signal::Pipe;

use strict;
use warnings;

use Exporter 5.57 'import';
our @EXPORT = 'selfpipe';

use XSLoader;

XSLoader::load(__PACKAGE__, __PACKAGE__->VERSION);

1;

# ABSTRACT: Self pipes for signal handling

=head1 SYNOPSIS

 use POSIX 'SIGINT';
 use Signal::Pipe 'selfpipe';
 my $fh = selfpipe(SIGINT);
 add_handler($fh, sub {
   if (sysread($fh, my $buf, 128)) {
     # handle signal
   }
 });

=func selfpipe($signo)

This function sets a signal handler C<$signo> for the process that will write one byte for each handled signal to the file handle that is returned by this function. When the handle becomes readable, you want to drain the filehandle using sysread. The handle is automatically made non-blocking, and signals may be squashed.

Note that there may only be one such handle for each signal in the process, and that the signal delivery is mostly shared between different threads in the same process.

=head1 SEE ALSO

=over 4

=item * L<Async::Interrupt|Async::Interrupt>

A module that can do a similar thing (and some other things).

=item * L<Linux::FD::Signal>

A linux specific module that allows one to pass much more information.

=back
