#   /usr/lib/prefactor/scripts/find_skymodel_cal.py --help
# usage: find_skymodel_cal.py [-h] [--extsky EXTSKY] MSfile [MSfile ...] DirSky
# 
# Find automatically between skymodels the one to use (for the Calibrator)
# 
# positional arguments:
#   MSfile           One (or more MSs) for which we search the matching
#                    skymodel.
#   DirSky           Path to the skymodel file, or to the folder where the
#                    skymodels are stored.
# 
# optional arguments:
#   -h, --help       show this help message and exit
#   --extsky EXTSKY  extension of the skymodel files. (default: ".skymodel")
#
#
#
# PYTHONPATH=/usr/lib/prefactor/scripts/ python \
#   -c "from find_skymodel_cal import *;
#       result = main(ms_input='data/L591513_SB000_uv.MS',
#                     DirSkymodelCal='/usr/share/prefactor/skymodels/',
#                     extensionSky='.skymodel'))['SkymodelCal']"
#
#
#
cwlVersion: v1.0
class: CommandLineTool
baseCommand: [python, /usr/lib/prefactor/scripts/find_skymodel_cal.py]
inputs:
  extsky:
    type: string?
    doc: "extension of the skymodel files"
    default: ".skymodel"

  msin:
    type: Directory
    doc: "Path to the directory containing the data"
    inputBinding:
      position: 1

  DirSky:
    type: Directory
    doc: "Path to skymodel file, or folder where skymodels are stored"
    inputBinding:
      position: 2

outputs:
  skymodel: File

