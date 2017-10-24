cwlVersion: v1.0
class: Workflow
inputs:
  data_folder: Directory
outputs:
  mapfile: File

steps:
  createmap_cal:
    run: createmap_cal.cwl
    in:
      folder: data_folder
    out:
      [mapfile]

  #ndppp_prep_cal:
    #run: ndppp_prep_cal.cwl
    #in:
    #  msin:  createmap_cal/mapfile
    #out:
    #  -

