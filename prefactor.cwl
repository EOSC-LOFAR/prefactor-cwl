cwlVersion: v1.0
class: Workflow

inputs:
  msin: Directory
  calibration_parset: File
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

  sky_cal:
    run: steps/sky_cal.cwl
    in:
      ms: ndppp_prep_cal/msout
    out:
      [skymodel]

  calibrate-stand-alone:
    run: steps/calibrate-stand-alone.cwl
    in:
      observation: ndppp_prep_cal/msout
      parset: calibration_parset
      catalog: sky_cal/skymodel
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
  amplitudes_losoto_3:
    run: steps/amplitudes_losoto_3.cwl
    in:
      n_chan: n_channels
      globaldbname: losoto_importer/h5
    out:
      [amplitude_array]

  plot:
    run: steps/plots.cwl
    in:
      amplitude_array: amplitudes_losoto_3/amplitude_array
      dclock_1st: fit_clocktec_initialguess_losoto/dclock_1st
      dclock_1st.sm: fit_clocktec_initialguess_losoto/dclock_1st.sm
      dtec_1st.sm: fit_clocktec_initialguess_losoto/dTEC_1st.sm
    out:
      [dtec_allsols, dclock_allsols, amp_allsols]
