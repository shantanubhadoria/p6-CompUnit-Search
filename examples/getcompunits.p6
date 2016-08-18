use v6;
use lib 'lib';

use CompUnit::Search;

my @modules = installed-compunits({$_ ~~ /Test\:\:.*/});

for @modules -> $module {
  say $module;
}
