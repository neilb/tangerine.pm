use strict;
use warnings;
use Test::More tests => 18;

for my $file (qw(
    lib/Tangerine.pm
    lib/Tangerine/HookData.pm
    lib/Tangerine/Hook.pm
    lib/Tangerine/Occurence.pm
    lib/Tangerine/Utils.pm
    lib/Tangerine/hook/anymoose.pm
    lib/Tangerine/hook/if.pm
    lib/Tangerine/hook/inline.pm
    lib/Tangerine/hook/list.pm
    lib/Tangerine/hook/moduleruntime.pm
    lib/Tangerine/hook/mooselike.pm
    lib/Tangerine/hook/package.pm
    lib/Tangerine/hook/prefixedlist.pm
    lib/Tangerine/hook/require.pm
    lib/Tangerine/hook/tests.pm
    lib/Tangerine/hook/testloading.pm
    lib/Tangerine/hook/testrequires.pm
    lib/Tangerine/hook/use.pm
    )) {
        require_ok $file;
    }
