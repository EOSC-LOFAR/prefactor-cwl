cwlVersion: v1.0
class: Workflow
inputs:
  msin: Directory
  calibration_parset: File
  skymodel: File
  n_channels: int
outputs:
  msout: 
    type: Directory
    outputSource: calibrate-stand-alone/msout
  h5:
    type: File
    outputSource: amplitudes_losoto_3/h5

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

  losoto_importer:
    run: losoto_importer.cwl
    in:
      msin: calibrate-stand-alone/msout
    out:
      [h5]

  fit_clocktec_initialguess_losoto:
    run: fit_clocktec_initialguess_losoto.cwl
    in:
      globaldbname: losoto_importer/h5
    out:
      [h5]

  amplitudes_losoto_3:
    run: amplitudes_losoto_3.cwl
    in:
      n_chan: n_channels
      globaldbname: fit_clocktec_initialguess_losoto/h5
    out:
      [h5]

