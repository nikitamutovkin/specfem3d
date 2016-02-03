#!/bin/bash


#             ------------ BACTH AND SPECIFIC CLUSTER DIRECTIVES  ------

#MSUB -r Coupling_step4_and_step5_part_and_generdata_for_AxiSEM       # Nom du job
#MSUB -n 32
#MSUB -N 2
#MSUB -T 1000
#MSUB -q standard
#MSUB -Q test
#MSUB -e Test_generdata_run.e
#MSUB -o Test_generdata_run.o
#MSUB -A gen7165

### #MSUB -N 14

set -x
cd ${BRIDGE_MSUB_PWD}

######################################################################################################################

# NBPROC is declared as integer (important do not change)
declare -i NPROC NPROC_MINUS_ONE CPUS CHOICE MIDDLE

# NUMBER OF MPI PROCESSES
NPROC=32
CPUS=32

# MPIRUN COMMAND
MPIRUN=ccc_mprun

# ENTER OPTION FOR MPIRUN
OPTION=

# do not change
NPROC_MINUS_ONE="$NPROC-1"

# Define different paths and folders
source paths_for_coupling_SPECFEM3D_AxiSEM.sh

# ----------------------------------------------------
# 2 / ------- AxiSEM mesher and solver
# ----------------------------------------------------

### Cf AxiSEM directory

# ----------------------------------------------------
# 3 / ------- create specfem3D data base
# ----------------------------------------------------

source ${HOME_AxiSEM}/scripts_SPECFEM3D_for_AxiSEM.sh
run_create_partitioning_and_specfem_databases

######
####ccc_msub -q standard ./batch_coupling_step8_xspecfem3d.sh

