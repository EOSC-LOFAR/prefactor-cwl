# globaldbname = args[1] # input h5 parm file
# calsource    = args[2] # name for writing outputfiles
# n_chan       = args[3] # number of channels solved for per subband (i.e., the
# number of solutions along the frequencies axis of the MS)
# if len(args) > 4:
#     bad_sblist_str = args[4]
#         bad_sblist = [int(SB) for SB in
#         bad_sblist_str.strip('\"\'').split(';')]
#         else:
#             bad_sblist   = [] # run first with all subbands,
#                                   # then determine which subbands are bad
#                                   based on the plots and set "bad_sblist"
#                                                         # accordingly and
#                                                         re-run (some trial
#                                                         and error will be
#                                                         needed)

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [python, /usr/lib/prefactor/scripts/amplitudes_losoto_3.py]

inputs:
  globaldbname:
    type: File
    doc: "input h5 parm file"
    inputBinding:
      position: 1

  n_chan:
    type: int
    doc: "number of channels solved for per subband (i.e., number of solutions along frequencies axis of MS)"

  bad_sblist:
    type: int[]?
    inputBinding:
      position: 4

arguments:
 - valueFrom: "fitclock"
   position: 2

 - valueFrom: $(runtime.cores)
   position: 3

outputs:
  h5:
    type: File
    outputBinding:
      glob: "*.h5"
