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
| calib\_cal              | implemented | [steps/steps/calibrate-stand-alone.cwl]() |
| h5\_imp\_cal\_map       | skip        |  |we don't use map files   |
| h5imp\_cal              | implemented | [](steps/losoto_importer.cwl) |
| mk\_inspect\_dir        | skip        |  | we don't need to create dirs |
| copy\_h5imp\_cal        | skip        |  |we don't need to copy things |
| fitclock                | implemented | steps/fit_clocktec_initialguess_losoto.cwl |
| ampl                    | implemented | steps/amplitudes_losoto_3.cwl  | disabled for test since not enough subbands
| plots                   | 
| phase                   |
| plot\_cal\_phases       |
| createmap\_cal\_pngs    |
| copy\_cal\_pngs         |
| createmap\_cal\_txts    |
| copy\_cal\_txts         |
| mk\_cal\_values\_dir    |
| createmap\_cal\_npys    |
| copy\_cal\_npys         |
