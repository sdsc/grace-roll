# SDSC "grace" roll

## Overview

This roll builds the grace 2d plotting program


For more information about the various packages included in the grace roll
please visit their official web pages:

- <a href="http://plasma-gate.weizmann.ac.il/Grace" target="_blank">grace</a>  is a 2D plotting tool for the X Window System and Motif.

## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate grace  source file(s) using a machine that does have
Internet access and copy them into the `src/<package>` directories on your Rocks
development machine.


## Dependencies

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.

The roll sources assume that modulefiles provided by SDSC compiler
rolls are available, but it will build without them as long as the environment
variables they provide are otherwise defined.

The build process requires the mpi,fftw, hdf and netcdf rolls and assumes that
the modulefiles provided by the corresponding SDSC rolls are available.  It
will build without the modulefiles as long as the environment variables they
provide are otherwise defined.



## Building

To build the grace-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `grace-*.disk1.iso`.  If you built the
roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.

This roll source supports building with different compilers and for different
MPI flavors due to the fftw, hdf and netcdf libraries.  The `ROLLCOMPILER` and `ROLLMPI` make variables can be used to specify the names of compiler and MPI modulefiles to use for building the software, e.g.,

```shell
make ROLLCOMPILER=intel ROLLMPI=mvapich2_ib 2>&1 | tee build.log
```

The build process recognizes "gnu", "intel" or "pgi" as the value for the
`ROLLCOMPILER` variable; any MPI modulefile name may be used as the value of
the `ROLLMPI` variable.  The default values are "gnu" and "rocks-openmpi".

## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll grace
% cd /export/rocks/install
% rocks create distro
% rocks run roll grace | bash
```

In addition to the software itself, the roll installs package environment
module files in:

```shell
/opt/modulefiles/applications/grace
```


## Testing

The grace-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/grace.t 
```
