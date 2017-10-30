# prefactor-cwl
CWL version of prefactor

https://github.com/lofar-astron/prefactor/

# usage

For now only works on Ubuntu 16:04. Note that this is temporary, more
platforms will be supported when we start using containerisation.

First add KERN-dev repo
```
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository -s ppa:kernsuite/kern-dev
$ sudo apt-add-repository multiverse
$ sudo apt-get update
```

Then install requirements:
```
$ sudo apt install lofar prefactor
```

# steps

the pipeline consists of these steps:

 * createmap_cal
 * ndppp_prep_cal
 * combine_data_cal_map
 * sky_cal
 * sky_cal_path
 * calib_cal
 * h5_imp_cal_map
 * h5imp_cal
 * mk_inspect_dir
 * copy_h5imp_cal
 * fitclock
 * ampl
 * plots
 * phase
 * plot_cal_phases
 * createmap_cal_pngs
 * copy_cal_pngs
 * createmap_cal_txts
 * copy_cal_txts
 * mk_cal_values_dir
 * createmap_cal_npys
 * copy_cal_npys
