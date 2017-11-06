# /usr/lib/prefactor/scripts/examine_npys.py
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [python, /usr/lib/prefactor/scripts/examine_npys.py]

inputs:
  calsource:
    type: string
    inputBinding:
      position: 1

outputs:
  dtec:
    type: File
    outputBinding:
      glob: dtec_allsols.png

  dclock:
    type: File
    outputBinding:
      glob: dclock_allsols.png

  amp:
    type: File
    outputBinding:
      glob: amp_allsols.png
