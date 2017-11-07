# /usr/lib/prefactor/scripts/find_cal_global_phaseoffset_losoto.py
# 
# Since we can't run this script from the command line we call it
# from python. 
# 
cwlVersion: v1.0
class: CommandLineTool

baseCommand: python
requirements:
  - class: InlineJavascriptRequirement
  - class: EnvVarRequirement
    envDef:
      PYTHONPATH: /usr/lib/prefactor/scripts/

hints:
  DockerRequirement:
      dockerImageId: kernsuite/prefactor
      dockerFile: |
        FROM kernsuite/base:3
        RUN docker-apt-install prefactor

inputs:
  losoto:
    type: File

  refstation_id:
    type: int?
    default: 2

  source_id:
    type: int?
    default: 0

arguments:
  - prefix: -c
    valueFrom: |
      from find_cal_global_phaseoffset_losoto import main
      main(losotoname="$(inputs.losoto.path)",
           store_basename="cwl",
           refstationID=$(inputs.refstation_id),
           sourceID=$(inputs.source_id)
      )

outputs:
    freqs_for_phase_array:
      type: File
      outputBinding:
        glob: "freqs_for_phase_array.npy"

    phase_array:
      type: File
      outputBinding:
        glob: "cwl_phase_array.npy"

    station_names:
      type: File
      outputBinding:
        glob: "cwl_station_names.npy"

    phase_xx_yy_offset:
      type: File
      outputBinding:
        glob: "phase_xx_yy_offset.png"
