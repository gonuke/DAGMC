User's guide
============

..  |UW2| replace:: UW\ :sup:`2`

This document is intended for users of the DAGMC toolkit who want
to better understand all the potential workflows for each Monte Carlo
code.  This documentation assumes that the user is already familiar
with Monte Carlo radiation transport in general,and the specific use
of the Monte Carlo physics code that they wil use with DAGMC.

Overview
---------

In general, using DAGMC with a physics code includes the following
steps:

1. Import or create a geometry in Cubit/Trelis
2. Use Cubit/Trelis to prepare your geometry
3. Export the model in the DAGMC format
4. (Optional) Upload your model to a compute server
5. Prepare the reduced input file with parameters not included in the geometry model
6. Run the physics code modified with DAGMC
7. Post-process your output, possibly plotting 3-D results with the geometry

   
UW - Madison has developed several workflows for the Monte Carlo
codes it supports. Exactly which workflow suits your needs depends on
which codes you expect to use and how much manual data transfer you
wish to do.

+---------------------------------+----------------+----------------+
| Feature                         | |UW2| Workflow | Basic Workflow |
+----------------------+----------+----------------+----------------+
|  Material assignment | MCNP5    |      **S**     |     **S**      |
|                      +----------+----------------+----------------+
|                      | Fluka    |      **S**     |     **S**      |
|                      +----------+----------------+----------------+
|                      | Geant4   |      **S**     |     **S**      |
|                      +----------+----------------+----------------+
|                      | Tripoli4 |      **S**     |     **S**      |
+----------------------+----------+----------------+----------------+
|  Boundary condition  | MCNP5    |      **S**     |     **S**      |
|       assignment     +----------+----------------+----------------+
|                      | Fluka    |      **S**     |     **S**      |
|                      +----------+----------------+----------------+
|                      | Geant4   |      **S**     |     **S**      |
|                      +----------+----------------+----------------+
|                      | Tripoli4 |      **S**     |     **S**      |
+----------------------+----------+----------------+----------------+
|  Material definition | MCNP5    |      **A**     |     **M**      |
|                      +----------+----------------+----------------+
|                      | Fluka    |      **A**     |     **M**      |
|                      +----------+----------------+----------------+
|                      | Geant4   |      **A**     |     **M**      |
|                      +----------+----------------+----------------+
|                      | Tripoli4 |      **N**     |     **M**      |
+----------------------+----------+----------------+----------------+
|  Tally assignment    | MCNP5    |      **A**     |     **M**      |
|                      +----------+----------------+----------------+
|                      | Fluka    |      **A**     |     **M**      |
|                      +----------+----------------+----------------+
|                      | Geant4   |      **A**     |     **M**      |
|                      +----------+----------------+----------------+
|                      | Tripoli4 |      **N**     |     **M**      |
+----------------------+----------+----------------+----------------+

**S** supported capability, **N** not supported,
**A** automatic production at run time, **M** manually performed

So, if you are interested in running your geometry in multiple physics 
packages with minimal effort, the |UW2| workflow is your best option
as it does the most work for you, however if you are interested
in only a specific physics engine one of the basic workflows may
interest you more. We still would recommend the |UW2| workflow as it 
offers robust and tested methods for material creation.

..  toctree::
    :maxdepth: 1

    trelis_basics
    uw2
    codes/index
    trelis_workflow
    tally
    tools
    postprocessing

..  toctree::
    :hidden:

    mcnp2cad
