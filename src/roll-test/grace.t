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

# grace-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'grace installed');
  ok(-d "/opt/grace", "grace installed");
} else {
  ok(! $isInstalled, 'grace not installed');
}

$packageHome = '/opt/grace';
SKIP: {
  skip 'grace not installed', 1 if ! -d $packageHome;
  $output=`. /etc/profile.d/modules.sh;module load grace;/opt/grace/bin/xmgrace  -help 2>&1`;
  ok($output =~ /Can't open display/, 'xmgrace executable exists');
}
