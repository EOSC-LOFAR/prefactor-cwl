# below the definition in the prefactor parset
#
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
baseCommand: [NDPPP, avg.type=average, flag.type=preflagger, flagamp.type=preflagger, msout=out.MS]

hints:
  DockerRequirement:
      dockerImageId: kernsuite/lofar
      dockerFile: |
        FROM kernsuite/base:3
        RUN docker-apt-install lofar

inputs:
  msin:
    type: Directory
    inputBinding:
      prefix: "msin="
      separate: False

  steps:
    type: string
    default: "[flag,filter,avg,flagamp]"
    inputBinding:
      prefix: "steps="
      separate: False

  baseline:
    type: string
    default: "[CS013HBA*]"
    inputBinding:
      prefix: "baseline="
      separate: False

  avg.timeresolution:
    type: int
    default: 4
    inputBinding:
      prefix: "average.timeresolution="
      separate: False

  avg.freqresolution:
    type: string
    default: "48.82kHz"
    inputBinding:
      prefix: "average.freqresolution="
      separate: False

outputs:
  msout:
    type: Directory
    outputBinding:
      glob: "out.MS"


$namespaces:
  s: http://schema.org/
$schemas:
  - https://schema.org/docs/schema_org_rdfa.html



s:license: "https://mit-license.org/"
s:author:
  s:person.url: "http://orcid.org/0000-0002-6136-3724"
