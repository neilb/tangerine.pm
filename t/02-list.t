use strict;
use warnings;
use Test::More tests => 37;
use Tangerine;

my $scanner = Tangerine->new(file => 't/data/list');

ok($scanner->run, 'List run');

my %expected = (
    Alfa => {
        count => 1,
        lines => [ 1 ],
    },
    Beta => {
        count => 1,
        lines => [ 2 ],
    },
    Charlie => {
        count => 1,
        lines => [ 2 ],
    },
    'Delta::Echo::Foxtrot' => {
        count => 1,
        lines => [ 3 ],
    },
    Golf => {
        count => 1,
        lines => [ 4 ],
    },
    Hotel => {
        count => 1,
        lines => [ 5 ],
    },
    India => {
        count => 1,
        lines => [ 6 ],
    },
    Julliet => {
        count => 1,
        lines => [ 7 ],
    },
    Lima => {
        count => 1,
        lines => [ 9 ],
    },
    November => {
        count => 1,
        lines => [ 10 ],
    },
    Oscar => {
        count => 1,
        lines => [ 10 ],
    },
    Papa => {
        count => 1,
        lines => [ 10 ],
    },
    aliased => {
        count => 2,
        lines => [ 3, 9 ],
    },
    base => {
        count => 4,
        lines => [ 1, 4, 5, 8 ],
    },
    ok => {
        count => 2,
        lines => [ 6, 7 ],
    },
    parent => {
        count => 1,
        lines => [ 2 ],
    },
    superclass => {
        count => 1,
        lines => [ 10 ],
    },
);

is_deeply([sort keys %{$scanner->uses}], [sort keys %expected], 'List uses');
for (sort keys %expected) {
    is(scalar @{$scanner->uses->{$_}}, $expected{$_}->{count},
        "List uses count ($_)");
    is_deeply([ sort { $a <=> $b } map { $_->line } @{$scanner->uses->{$_}} ],
        $expected{$_}->{lines}, "List uses line number ($_)");
}
is ($scanner->uses->{Papa}->[0]->version, '1.00', 'List Papa version');
