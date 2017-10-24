# msin                   = createmap_cal.output.mapfile # The input data.
# msin.datacolumn        = DATA
# msin.baseline          = CS*&; RS*&; CS*&RS*
# msout.datacolumn       = DATA
# msout.writefullresflag = False
# msout.overwrite        = True ############
# steps                  = [flag,filter,avg,flagamp]
# flag.type              = preflagger
# flag.baseline          = {{ flag_baselines }}
# filter.type            = filter
# filter.baseline        = CS*, RS*&&
# filter.remove          = true                     # fully kick out the international stations.
# avg.type               = average
# avg.timestep           = {{ avg_timestep }}       # average to 4 second intervals , PLEASE ADJUST!
# avg.freqstep           = {{ avg_freqstep }}       # average to 2 ch/SB , PLEASE ADJUST!
# flagamp.type           = preflagger
# flagamp.amplmin        = 1e-30

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [NDPPP]

inputs:
  msin:
    type: File
    inputBinding:
        itemSeparator: "="
        separate: False

  steps:
    type: string
    default: "[flag,filter,avg,flagamp]"
    inputBinding:
        itemSeparator: "="
        separate: False

outputs:
  msout:
    type: Directory
