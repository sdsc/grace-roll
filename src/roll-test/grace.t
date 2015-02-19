#!/usr/bin/perl -w
# grace roll installation test.  Usage:
# grace.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/grace';
my $output;

my $TESTFILE = 'tmpgrace';

# grace-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'grace installed');
} else {
  ok(! $isInstalled, 'grace not installed');
}

SKIP: {

  skip 'grace not installed', 4 if ! $isInstalled;
  $output = `module load grace; xmgrace -help 2>&1`;
  ok($output =~ /Can't open display/, 'xmgrace works');

  skip 'modules not installed', 3 if ! -f '/etc/profile.d/modules.sh';
  `/bin/ls /opt/modulefiles/applications/grace/[0-9]* 2>&1`;
  ok($? == 0, 'grace module installed');
  `/bin/ls /opt/modulefiles/applications/grace/.version.[0-9]* 2>&1`;
  ok($? == 0, 'grace version module installed');
  ok(-l '/opt/modulefiles/applications/grace/.version',
     'grace version module link created');

}

`rm -fr $TESTFILE*`;
