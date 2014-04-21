# SDSC grace-roll

## Overview

This roll bundles grace

For more information about the various packages included in the grace roll please visit their official web pages:


- <a href="http://plasma-gate.weizmann.ac.il/Grace/" target="_blank"></a> is .


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate grace source file(s) using a machine that does
have Internet access and copy them into the `src/grace` directories on your
Rocks development machine.


## Dependencies

The fftw and netcdf rolls must be installed first


## Building

To build the grace-roll, execute these instructions on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make default 2>&1 | tee build.log
% grep "RPM build error" build.log
```

If nothing is returned from the grep command then the roll should have been
created as... `grace-*.iso`. If you built the roll on a Rocks frontend then
proceed to the installation step. If you built the roll on a Rocks development
appliance you need to copy the roll to your Rocks frontend before continuing
with installation.

This roll source supports building with different compilers and for different
network fabrics and mpi flavors.  By default, it builds using the gnu compilers.

```shell
make
```

produces a roll with a name that begins "`grace`"; it
contains and installs similarly-named rpms.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll grace
% cd /export/rocks/install
% rocks create distro
% rocks run roll grace | bash
```

In addition to the software itself, the roll installs grace environment
module files in:

```shell
/opt/modulefiles/applications/grace
```


## Testing

The grace-roll includes a test script which can be run to verify proper
installation of the grace-roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/grace.t 
ok 1 - grace is installed
ok 2 - grace test run
ok 3 - grace module installed
ok 4 - grace version module installed
ok 5 - grace version module link created
1..5
```
