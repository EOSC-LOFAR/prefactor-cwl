# $λ  python /usr/lib/prefactor/scripts/fit_clocktec_initialguess_losoto.py losoto.h5 gijs 10
# sol000
# CRITICAL: Solution-table amplitude000 not found in solset sol000.
# Traceback (most recent call last):
#   File "/usr/lib/prefactor/scripts/fit_clocktec_initialguess_losoto.py", line
#   54, in <module>
#       amptab = ionmodel.getSoltab('sol000','amplitude000')
#         File "/usr/lib/python2.7/dist-packages/losoto/h5parm.py", line 343,
#         in getSoltab
#             raise Exception("Solution-table "+soltab+" not found in solset
#             "+solset+".")
#             Exception: Solution-table amplitude000 not found in solset
#             sol000.
#             Closing remaining open files:losoto.h5...done
#
# globaldbname = 'L128487.h' # input h5 parm file
# calsource    = '3C295' # name for writing outputfiles
# ncpus        = 24 # number of CPUs avaulable for parallel fitting

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [python, /usr/lib/prefactor/scripts/fit_clocktec_initialguess_losoto.py]

inputs:
  globaldbname:
    type: File
    doc: "input h5 parm file"
    inputBinding:
      position: 1

arguments:
 - valueFrom: "fitclock"
   position: 2

 - valueFrom: $(runtime.cores)
   position: 3

outputs:
  dclock_1st:
    type: File
    outputBinding:
      glob: fitted_data_dclock_fitclock_1st.npy

  dTEC_1st:
    type: File
    outputBinding:
      glob: fitted_data_dTEC_fitclock_1st.npy
        
  dclock_1st.sm:
    type: File
    outputBinding:
      glob: fitted_data_dclock_fitclock_1st.sm.npy

  dTEC_1st.sm:
    type: File
    outputBinding:
      glob: fitted_data_dTEC_fitclock_1st.sm.npy
