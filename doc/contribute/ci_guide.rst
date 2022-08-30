Continuous Integration and Testing
==================================

DAGMC uses Github Actions to perform regular testing:
* each pull request is automatically tested while under review
* the new version of the code is tested after each pull request is merged

DAGMC is tested with a range of configurations:
* Ubuntu versions: 18.04, 20.04
* Compilers: gcc, clang
* MOAB version: 5.4.0, develop, master
* HDF5: 1.10.4

A Github workflow creates a docker image for each of those configurations.