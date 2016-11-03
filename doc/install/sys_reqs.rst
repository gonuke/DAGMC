System Requirements
====================

The current best practice for using DAGMC assumes that users will prepare
their CAD-based models on a desktop/laptop/workstation and then either use
that model on the same computer for analysis or possibly upload it to a more
powerful server for the analysis phase.

Local workstation requirements
-------------------------------

In order to prepare models on your local workstation, you must have the solid
modeling software Cubit_ or its commercial counterpart, Trelis_, to prepare
solid models. These packages can be used to import CAD models from other tools
such as SolidWorks, CATIA, etc., or to create geometry from scratch. DAGMC
also relies on Trelis/Cubit to assign materials and other geometry-related
information.

DAGMC currently supports the use of Cubit/Trelis on Windows, OSX and Linux for
model preparation.

There are no other requirements, but for large models you may want to have large
RAM and a powerful graphics card on this computer.

Remote server requirements
---------------------------

DAGMC only supports Linux for coupling to Monte Carlo physics codes and
performing analysis.  Users are encouraged to be familiar with both compiling
and using the standard version of any physics code that they plan to use with
DAGMC.

Building DAGMC requires the following standard software development tools:

* CMake
* Make
* g++ or an similar C++ compiler (for all physics codes)
* gfortran or a similar FORTRAN compiler (for any physics code that uses FORTRAN)
  
DAGMC supports MPI parallelization but not OpenMP at this time.

..  _Cubit: https://cubit.sandia.gov
..  _Trelis: http://www.csimsoft.com/trelis
