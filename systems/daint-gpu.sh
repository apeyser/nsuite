# set up environment for building on the multicore part of daint

[ "$PE_ENV" = "CRAY" ] && module swap PrgEnv-cray PrgEnv-gnu
module load daint-gpu
module load CMake

module load cudatoolkit/9.0.103_3.7-6.0.4.1_2.1__g72b395b

# PyExtensions is needed for cython, mpi4py and others.
# It loads cray-python/3.6.1.1 which points python at version 3.6.1.1
module load PyExtensions/3.6.1.1-CrayGNU-17.08
ns_python=$(which python3)

# load after python tools because easybuild...
module swap gcc/6.2.0

ns_cc=$(which cc)
ns_cxx=$(which CC)
ns_with_mpi=ON

ns_arb_with_gpu=ON
ns_arb_arch=haswell

export CRAYPE_LINK_TYPE=dynamic

ns_makej=20
