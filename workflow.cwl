cwlVersion: v1.0
class: Workflow
inputs:
  data_folder:
    type: Directory
outputs:
  mapfile:
    type: File

steps:
  createmap_cal:
    run: createmap_cal.cwl
    in:
      folder: data_folder
    out:
      [mapfile]

