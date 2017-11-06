# prefactor-cwl
CWL version of prefactor

https://github.com/lofar-astron/prefactor/

# usage

For now only works on Ubuntu 16:04. Note that this is temporary, more
platforms will be supported when we start using containerisation.

First add KERN-dev repo
```bash
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository -s ppa:kernsuite/kern-dev
$ sudo apt-add-repository multiverse
$ sudo apt-get update
```

Then install requirements:
```bash
$ sudo apt install lofar prefactor python-virtualenv
```

To run the pipeline with the example dataset just run:
```bash
$ make run
```

# steps

the pipeline consists of these steps:

| step name               | status      | file   | comment          |
| ------------------------|-------------|--------|------------------|
| createmap\_cal          | skip        |  | we don't use map files   |
| ndppp\_prep\_cal        | implemented | [steps/ndppp_prep_cal.cwl](steps/ndppp_prep_cal.cwl) |
| combine\_data\_cal\_map | skip        |  |We don't use map files   |
| sky\_cal                | implemented | [steps/sky_cal.cwl](steps/sky_cal.cwl)    |
| sky\_cal\_path          | skip        |  |we don't use map files   |
| calib\_cal              | implemented | [steps/steps/calibrate-stand-alone.cwl](steps/steps/calibrate-stand-alone.cwl) |
| h5\_imp\_cal\_map       | skip        |  |we don't use map files   |
| h5imp\_cal              | implemented | [steps/losoto_importer.cwl](steps/losoto_importer.cwl) |
| mk\_inspect\_dir        | skip        |  | we don't need to create dirs |
| copy\_h5imp\_cal        | skip        |  | this is managed by CWL |
| fitclock                | implemented | [steps/fit_clocktec_initialguess_losoto.cwl](steps/fit_clocktec_initialguess_losoto.cwl) |
| ampl                    | implemented | [steps/amplitudes_losoto_3.cwl](steps/amplitudes_losoto_3.cwl)  | disabled for test since not enough subbands
| plots                   | implemented | [steps/plots.cwl](steps/plots.cwl) | 
| phase                   | implemented | [steps/phase.cwl](steps/phase.cwl) |
| plot\_cal\_phases       | implemented | [steps/plot_cal_phases.cwl](steps/plot_cal_phases.cwl) |
| createmap\_cal\_pngs    | skip        | | we don't use map files |
| copy\_cal\_pngs         | skip        | | this is managed by CWL |
| createmap\_cal\_txts    | skip        | | we don't use map files |
| copy\_cal\_txts         | skip        | | this is managed by CWL |
| mk\_cal\_values\_dir    | skip        | | this is managed by CWL |
| createmap\_cal\_npys    | skip        | | we don't use map files |
| copy\_cal\_npys         | skip        | | this is managed by CWL |
