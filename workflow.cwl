cwlVersion: v1.0
class: Workflow
inputs:
  msin: Directory
  calibration_parset: File
  skymodel: File
outputs:
  msout: 
    type: Directory
    outputSource: calibrate-stand-alone/msout

steps:
  ndppp_prep_cal:
    run: ndppp_prep_cal.cwl
    in:
      msin: msin
    out:
        [msout]

  calibrate-stand-alone:
    run: calibrate-stand-alone.cwl
    in:
        observation: ndppp_prep_cal/msout
        parset: calibration_parset
        catalog: skymodel
    out:
        [msout]
