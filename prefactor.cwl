cwlVersion: v1.0
class: Workflow

inputs:
  msin: Directory
  calibration_parset: File
  skymodel: File
  n_channels: int

outputs:
  dTEC_1st:
    type: File
    outputSource: fit_clocktec_initialguess_losoto/dTEC_1st

  dTEC_1st.sm:
    type: File
    outputSource: fit_clocktec_initialguess_losoto/dTEC_1st.sm

  dclock_1st:
    type: File
    outputSource: fit_clocktec_initialguess_losoto/dclock_1st

  dclock_1st.sm:
    type: File
    outputSource: fit_clocktec_initialguess_losoto/dTEC_1st.sm



steps:
  ndppp_prep_cal:
    run: steps/ndppp_prep_cal.cwl
    in:
      msin: msin
    out:
        [msout]

  calibrate-stand-alone:
    run: steps/calibrate-stand-alone.cwl
    in:
      observation: ndppp_prep_cal/msout
      parset: calibration_parset
      catalog: skymodel
    out:
      [msout]

  losoto_importer:
    run: steps/losoto_importer.cwl
    in:
      msin: calibrate-stand-alone/msout
    out:
      [h5]

  fit_clocktec_initialguess_losoto:
    run: steps/fit_clocktec_initialguess_losoto.cwl
    in:
      globaldbname: losoto_importer/h5
    out:
      [dTEC_1st, dTEC_1st.sm, dclock_1st, dclock_1st.sm]

## skip: test set has 16 subbands, we need > 20
#  amplitudes_losoto_3:
#    run: steps/amplitudes_losoto_3.cwl
#    in:
#      n_chan: n_channels
#      globaldbname: losoto_importer/h5
#    out:
#      [h5]

