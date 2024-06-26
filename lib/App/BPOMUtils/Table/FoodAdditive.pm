package App::BPOMUtils::Table::FoodAdditive;

use 5.010001;
use strict 'subs', 'vars';
use utf8;
use warnings;
use Log::ger;

use Exporter 'import';
use Perinci::Sub::Gen::AccessTable qw(gen_read_table_func);
use TableData::Business::ID::BPOM::FoodAdditive;

# AUTHORITY
# DATE
# DIST
# VERSION

our @EXPORT_OK = qw(
                       bpom_list_food_additives
               );

our %SPEC;

my $res = gen_read_table_func(
    name => 'bpom_list_food_additives',
    summary => 'List registered food additives in BPOM',
    table_data => TableData::Business::ID::BPOM::FoodAdditive->new,
    description => <<'MARKDOWN',
MARKDOWN
    extra_props => {
        examples => [
            {
                summary => 'Check for additives that contain "dextrin" but do not contain "gamma"',
                src_plang => 'bash',
                src => '[[prog]] -l --format text-pretty -- dextrin -gamma',
                test => 0,
            },
            {
                summary => 'Check for additives that contain "magnesium" or "titanium"',
                src_plang => 'bash',
                src => '[[prog]] -l --format text-pretty --or -- magnesium titanium',
                test => 0,
            },
            {
                summary => 'Check for additives that match some regular expressions',
                src_plang => 'bash',
                src => q{[[prog]] -l --format text-pretty -- /potassium/ '/citrate|phosphate/'},
                test => 0,
            },
        ],
    },
);
die "Can't generate function: $res->[0] - $res->[1]" unless $res->[0] == 200;

1;
# ABSTRACT:

=head1 DESCRIPTION

This distribution contains the following CLIs:

# INSERT_EXECS_LIST
