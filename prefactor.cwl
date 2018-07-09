class: Workflow
cwlVersion: v1.0
$namespaces:
  iana: 'https://www.iana.org/assignments/media-types/'
  s: 'http://schema.org/'
  sbg: 'https://www.sevenbridges.com'
inputs:
  - id: avg.freqstep
    type: int
    'sbg:x': 0
    'sbg:y': 760.859375
  - id: avg.timestep
    type: int
    'sbg:x': 2.050618738437429
    'sbg:y': 635.6694313540631
  - id: flag.baseline
    type: string
    'sbg:x': 0
    'sbg:y': 508.42886896968884
  - id: ms_array
    type: 'Directory[]'
    'sbg:x': 0
    'sbg:y': 387.34016280062684
  - id: reference_station
    type: string
    'sbg:x': 686.3942805752233
    'sbg:y': 384.6133505100363
  - id: maxlambda_lowres
    type: int
    'sbg:x': 365.14990234375
    'sbg:y': 1073.7664794921875
  - id: cellsize_lowres_deg
    type: float
    'sbg:x': 659.09765625
    'sbg:y': 1562.2476806640625
  - id: numcpu
    type: int
    'sbg:x': 582.6122436523438
    'sbg:y': 917.6689453125
  - id: mem_pct
    type: int
    'sbg:x': 507.46807861328125
    'sbg:y': 992.467529296875
  - id: image_padding
    type: float
    'sbg:x': 445.6634521484375
    'sbg:y': 1421.35595703125
outputs:
  - id: amp_allsols
    outputSource:
      - plots/amp_allsols
    type: File
    format: 'iana:image/png'
    'sbg:x': 1601.221435546875
    'sbg:y': 707.4609375
  - id: amplitude_array
    outputSource:
      - ampl/amplitude_array
    type: File
    label: Amplitude solutions
    format: 'https://docs.scipy.org/doc/numpy-dev/neps/npy-format.html'
    'sbg:x': 1329.674560546875
    'sbg:y': 1201.578125
  - id: dTEC_1st
    outputSource:
      - fitclock/dTEC_1st
    type: File
    label: TEC solutions
    format: 'https://docs.scipy.org/doc/numpy-dev/neps/npy-format.html'
    'sbg:x': 1329.674560546875
    'sbg:y': 881.5625
  - id: dTEC_1st_sm
    outputSource:
      - fitclock/dTEC_1st_sm
    type: File
    label: Smoothed TEC solutions
    format: 'https://docs.scipy.org/doc/numpy-dev/neps/npy-format.html'
    'sbg:x': 1329.674560546875
    'sbg:y': 774.890625
  - id: dclock_1st
    outputSource:
      - fitclock/dclock_1st
    type: File
    label: Clock solutions
    format: 'https://docs.scipy.org/doc/numpy-dev/neps/npy-format.html'
    'sbg:x': 1329.674560546875
    'sbg:y': 1094.90625
  - id: dclock_1st_sm
    outputSource:
      - fitclock/dclock_1st_sm
    type: File
    label: Smoothed clock solutions
    format: 'https://docs.scipy.org/doc/numpy-dev/neps/npy-format.html'
    'sbg:x': 1329.674560546875
    'sbg:y': 988.234375
  - id: dclock_allsols
    outputSource:
      - plots/dclock_allsols
    type: File
    format: 'iana:image/png'
    'sbg:x': 1601.221435546875
    'sbg:y': 600.7890625
  - id: dtec_allsols
    outputSource:
      - plots/dtec_allsols
    type: File
    format: 'iana:image/png'
    'sbg:x': 1601.221435546875
    'sbg:y': 494.1171875
  - id: freqs_for_phase_array
    outputSource:
      - phase/freqs_for_phase_array
    type: File
    label: Frequencies
    format: 'https://docs.scipy.org/doc/numpy-dev/neps/npy-format.html'
    'sbg:x': 1329.674560546875
    'sbg:y': 668.21875
  - id: losoto_h5
    outputSource:
      - h5imp_cal/losoto_h5
    type: File
    label: H5Parm solutions
    format: 'http://revoltek.github.io/losoto/cookbook.pdf'
    'sbg:x': 989.2411499023438
    'sbg:y': 654.15625
  - id: phase_array
    outputSource:
      - phase/phase_array
    type: File
    label: Phase solutions
    format: 'https://docs.scipy.org/doc/numpy-dev/neps/npy-format.html'
    'sbg:x': 1329.674560546875
    'sbg:y': 561.546875
  - id: phase_xx_yy_offset
    outputSource:
      - phase/phase_xx_yy_offset
    type: File
    format: 'iana:image/png'
    'sbg:x': 1329.674560546875
    'sbg:y': 454.84375
  - id: polXX_dirpointing
    outputSource:
      - plot_cal_phases/polXX_dirpointing
    type: File
    format: 'iana:image/png'
    'sbg:x': 1329.674560546875
    'sbg:y': 213.4375
  - id: polYY_dirpointing
    outputSource:
      - plot_cal_phases/polYY_dirpointing
    type: File
    format: 'iana:image/png'
    'sbg:x': 1329.674560546875
    'sbg:y': 106.703125
  - id: station_names
    outputSource:
      - phase/station_names
    type: File
    label: Station names
    format: 'https://docs.scipy.org/doc/numpy-dev/neps/npy-format.html'
    'sbg:x': 1329.674560546875
    'sbg:y': 0
  - id: mscalib
    outputSource:
      - calib_cal/mscalib
    type: Directory
    'sbg:x': 554.20556640625
    'sbg:y': 247.71946716308594
  - id: residual
    outputSource:
      - create_image/residual
    type: File
    'sbg:x': 1266.4437255859375
    'sbg:y': 1438.96875
  - id: psf
    outputSource:
      - create_image/psf
    type: File
    'sbg:x': 1357.1339111328125
    'sbg:y': 1563.899169921875
  - id: model
    outputSource:
      - create_image/model
    type: File
    'sbg:x': 1382.1199951171875
    'sbg:y': 1770.5523681640625
  - id: dirty
    outputSource:
      - create_image/dirty
    type: File
    'sbg:x': 1247.0101318359375
    'sbg:y': 1887.154052734375
steps:
  - id: ampl
    in:
      - id: globaldbname
        source: h5imp_cal/losoto_h5
    out:
      - id: amplitude_array
    run: steps/ampl.cwl
    label: Smooth amplitudes
    'sbg:x': 986.1626055760511
    'sbg:y': 947.9818119984596
  - id: calib_cal
    in:
      - id: catalog
        source: sky_cal/skymodel
      - id: observation
        source: ndppp_prep_cal/msout
    out:
      - id: mscalib
    run: steps/calib_cal.cwl
    label: BBS calibrate
    scatter:
      - observation
    scatterMethod: dotproduct
    'sbg:x': 561.5525369302443
    'sbg:y': 559.9828426632535
  - id: fitclock
    in:
      - id: globaldbname
        source: h5imp_cal/losoto_h5
    out:
      - id: dTEC_1st
      - id: dTEC_1st_sm
      - id: dclock_1st
      - id: dclock_1st_sm
    run: steps/fitclock.cwl
    label: Separate clock/TEC
    scatter:
      - globaldbname
    'sbg:x': 989.2411499023438
    'sbg:y': 781.828125
  - id: h5imp_cal
    in:
      - id: ms_array
        source:
          - calib_cal/mscalib
    out:
      - id: losoto_h5
    run: steps/h5imp_cal.cwl
    label: Convert solutions to H5parm
    'sbg:x': 771.0662841796875
    'sbg:y': 506.7917785644531
  - id: ndppp_prep_cal
    in:
      - id: avg.freqstep
        source: avg.freqstep
      - id: avg.timestep
        source: avg.timestep
      - id: flag.baseline
        source: flag.baseline
      - id: msin
        source: ms_array
    out:
      - id: msout
    run: steps/ndppp_prep_cal.cwl
    label: DPPP flag and average
    scatter:
      - msin
    'sbg:x': 150.328125
    'sbg:y': 579.7578125
  - id: phase
    in:
      - id: losoto
        source: h5imp_cal/losoto_h5
    out:
      - id: freqs_for_phase_array
      - id: phase_array
      - id: phase_xx_yy_offset
      - id: station_names
    run: steps/phase.cwl
    label: Find global phase offset
    'sbg:x': 989.2411499023438
    'sbg:y': 419.78125
  - id: plot_cal_phases
    in:
      - id: h5parm
        source: h5imp_cal/losoto_h5
      - id: reference_station
        source: reference_station
    out:
      - id: polXX_dirpointing
      - id: polYY_dirpointing
    run: steps/plot_cal_phases.cwl
    label: Plot raw calibration results
    'sbg:x': 989.2411499023438
    'sbg:y': 285.078125
  - id: plots
    in:
      - id: amplitude_array
        source: ampl/amplitude_array
      - id: dclock_1st_sm
        source: fitclock/dclock_1st_sm
      - id: dtec_1st_sm
        source: fitclock/dTEC_1st_sm
    out:
      - id: amp_allsols
      - id: dclock_allsols
      - id: dtec_allsols
    run: steps/plots.cwl
    label: 'Plot clock, TEC, amplitude'
    'sbg:x': 1329.674560546875
    'sbg:y': 334.140625
  - id: sky_cal
    in:
      - id: ms
        source: ndppp_prep_cal/msout
    out:
      - id: skymodel
    run: steps/sky_cal.cwl
    label: Find calibrator skymodel
    scatter:
      - ms
    'sbg:x': 372.8497619628906
    'sbg:y': 648.4842488362813
  - id: do_magic
    in:
      - id: prepcals
        source:
          - calib_cal/mscalib
    out:
      - id: mapfile_paths
      - id: mapfile_deep_high_padded
      - id: mapfile_deep_high_size
      - id: mapfile_deep_low_padded_size
      - id: mapfile_deep_low_size
      - id: mapfile_freqstep
      - id: mapfile_high_padded_size
      - id: mapfile_high_size
      - id: mapfile_low_padded_size
      - id: mapfile_low_size
      - id: mapfile_nbands
      - id: mapfile_nchansout_clean1
      - id: mapfile_nwavelengths_high
      - id: mapfile_nwavelengths_low
      - id: mapfile_single
      - id: mapfile_timestep
    run: steps/do_magic.cwl
    label: do_magic
    'sbg:x': -212.82080078125
    'sbg:y': 1252.842041015625
  - id: create_image
    in:
      - id: mapfile_deep_low_size
        source: do_magic/mapfile_deep_low_size
      - id: mapfile_nchansout_clean1
        source: do_magic/mapfile_nchansout_clean1
      - id: mapfile_nwavelengths_low
        source: do_magic/mapfile_nwavelengths_low
      - id: image_padding
        source: image_padding
      - id: maxlambda_lowres
        source: maxlambda_lowres
      - id: cellsize_lowres_deg
        source: cellsize_lowres_deg
      - id: numcpu
        source: numcpu
      - id: mem_pct
        source: mem_pct
      - id: prepcals
        source:
          - calib_cal/mscalib
    out:
      - id: psf
      - id: dirty
      - id: residual
      - id: model
    run: steps/create_image.cwl
    label: create_image
    'sbg:x': 1045.0379638671875
    'sbg:y': 1565.4278564453125
requirements:
  - class: ScatterFeatureRequirement
$schemas:
  - 'https://schema.org/docs/schema_org_rdfa.html'
's:author':
  's:person.url': 'http://orcid.org/0000-0002-6136-3724'
's:license': 'https://mit-license.org/'
