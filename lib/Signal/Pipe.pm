package Signal::Pipe;

use strict;
use warnings;

use Exporter 5.57 'import';
our @EXPORT = 'selfpipe';

use XSLoader;

XSLoader::load(__PACKAGE__, __PACKAGE__->VERSION);

1;

# ABSTRACT: Self pipes for signal handling
