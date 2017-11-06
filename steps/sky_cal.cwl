# from the parset:
#
# ! find_skymodel_cal_auto    = /usr/lib/prefactor/scripts/find_skymodel_cal.py
#
# set this to True if you want the pipeline run to continue if single bands fail
# ! error_tolerance           =  False
#
# # Either: the path to the skymodel for the calibrator (ASCII-file)
# or: the path to a directory with the skymodels for the different calibrators
#! calibrator_path_skymodel = /usr/share/prefactor/skymodels/
#
#sky_cal.control.type               = pythonplugin
#sky_cal.control.executable         = {{ find_skymodel_cal_auto }}
#sky_cal.control.error_tolerance    = {{ error_tolerance }}
#sky_cal.argument.flags             = [combine_data_cal_map.output.mapfile]
#sky_cal.argument.DirSkymodelCal    = {{ calibrator_path_skymodel }}

cwlVersion: v1.0
class: CommandLineTool

baseCommand: python
requirements:
  - class: InlineJavascriptRequirement
  - class: EnvVarRequirement
    envDef:
      PYTHONPATH: /usr/lib/prefactor/scripts/

inputs:
  ms:
    type: Directory

  DirSkymodelCal:
    type: string
    default: /usr/share/prefactor/skymodels/

  extensionSky:
    type: string
    default: ".skymodel"

arguments:
  - prefix: -c
    valueFrom: |
      from find_skymodel_cal import main
      from shutil import copyfile
      from os import path
      DirSkymodelCal="$(inputs.DirSkymodelCal)"
      SkymodelCal = main(ms_input="$(inputs.ms.path)",
           DirSkymodelCal=DirSkymodelCal,
           extensionSky="$(inputs.extensionSky)",
      )['SkymodelCal']
      copyfile(path.join(DirSkymodelCal, SkymodelCal), "selected.skymodel")

outputs:
   skymodel:
     type: File
     outputBinding:
       glob: "selected.skymodel"
