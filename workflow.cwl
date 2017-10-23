cwlVersion: v1.0
class: Workflow
inputs:
  ms:
    type: Directory
outputs:
  mapfile:
    type: File

steps:
  createmap_cal:
    run: createmap_cal.cwl
    in:
      ms: ms
    out:
      [mapfile]

