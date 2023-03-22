# Data sets
This repository contains the data sets and time-domain simulation models of the paper "Allocation of spinning reserves in autonomous grids considering frequency stability constraints and short-term solar power variations" authored by Erick F. Alves, Louis Polleux, Gilles Guerassimoff, Magnus Korpås, Elisabetta Tedeschi. With these files, it is possible to reproduce most simulations and results obtained in the paper.

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6334799.svg)](https://doi.org/10.5281/zenodo.6334799)

# Folder organization
- Results: final results and values of intermediate steps of the optimization model implemented in Gurobi 9.1 and described in section III-A and III-B of the paper. 
- Validation: test system implemented in OpenModelica for validation of the results and described in section III-C of paper.  
- Solar convex hulls: hourly convex hulls obtained using the procedure detailed in Appendix A.
- Solar irradiance profiles: high-resolution irradiance timeseries from NREL used to identify the worst-case solar PV ramp scenarios.
