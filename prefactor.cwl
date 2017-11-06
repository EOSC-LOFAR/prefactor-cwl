cwlVersion: v1.0
class: Workflow

inputs:
  msin: Directory
  calibration_parset: File
  n_channels: int
  reference_station: string

outputs:
  phase_xx_yy_offset:
    type: File
    outputSource: phase/phase_xx_yy_offset

  freqs_for_phase_array:
    type: File
    outputSource: phase/freqs_for_phase_array

  phase_array:
    type: File
    outputSource: phase/phase_array

  station_names:
    type: File
    outputSource: phase/station_names

  polXX_dirpointing:
    type: File
    outputSource: plot_cal_phases/polXX_dirpointing

  polYY_dirpointing:
    type: File
    outputSource: plot_cal_phases/polYY_dirpointing



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

  calib_cal:
    run: steps/calib_cal.cwl
    in:
      observation: ndppp_prep_cal/msout
      parset: calibration_parset
      catalog: sky_cal/skymodel
    out:
      [msout]

  h5imp_cal:
    run: steps/h5imp_cal.cwl
    in:
      msin: calib_cal/msout
    out:
      [losoto_h5]

  fitclock:
    run: steps/fitclock.cwl
    in:
      globaldbname: h5imp_cal/losoto_h5
    out:
      [dTEC_1st, dTEC_1st.sm, dclock_1st, dclock_1st.sm]

# disabled until we have a bigger dataset
#
#  ampl:
#    run: steps/ampl.cwl
#    in:
#      n_chan: n_channels
#      globaldbname: h5imp_cal/losoto_h5
#    out:
#      [amplitude_array]
#
#  plot:
#    run: steps/plots.cwl
#    in:
#      amplitude_array: ampl/amplitude_array
#      dclock_1st: fitclock/dclock_1st
#      dclock_1st.sm: fitclock/dclock_1st.sm
#      dtec_1st.sm: fitclock/dTEC_1st.sm
#    out:
#      [dtec_allsols, dclock_allsols, amp_allsols]

  phase:
    run: steps/phase.cwl
    in:
      losoto: h5imp_cal/losoto_h5
    out:
      - freqs_for_phase_array
      - phase_array
      - station_names
      - phase_xx_yy_offset

  plot_cal_phases:
    run: steps/plot_cal_phases.cwl
    in:
      h5parm: h5imp_cal/losoto_h5
      reference_station: reference_station
    out:
      [polXX_dirpointing, polYY_dirpointing]
