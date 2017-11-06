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

 * createmap\_cal (we don't use map files)
 * ndppp\_prep\_cal **ndppp\_prep\_cal.cwl**
 * combine\_data\_cal\_map (skip, we don't use map)
 * sky\_cal
 * sky\_cal\_path
 * calib\_cal
 * h5\_imp\_cal\_map
 * h5imp\_cal
 * mk\_inspect\_dir
 * copy\_h5imp\_cal
 * fitclock
 * ampl
 * plots
 * phase
 * plot\_cal\_phases
 * createmap\_cal\_pngs
 * copy\_cal\_pngs
 * createmap\_cal\_txts
 * copy\_cal\_txts
 * mk\_cal\_values\_dir
 * createmap\_cal\_npys
 * copy\_cal\_npys
