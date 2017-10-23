#usage: PipelineStep_createMapfile.py [-h] [-n NUMBER] [-M MAPFILE_IN]
#                                     [-f FOLDER] [-p PATTERN] [-e] [-s SUFFIX]
#                                     [-m METHOD] [-d DIRECTORY]
#                                     name
#
#This script lets you create Mapfiles for the Lofar Pipeline Framework
#
#positional arguments:
#  name                  Give the name of the file to output
#
#optional arguments:
#  -h, --help            show this help message and exit
#  -n NUMBER, --number NUMBER
#                        Number of times to expand a dummy mapfile
#  -M MAPFILE_IN, --mapfile_in MAPFILE_IN
#                        Input mapfile to be changed.
#  -f FOLDER, --folder FOLDER
#                        Path to the directory containing the data.
#  -p PATTERN, --pattern PATTERN
#                        Pattern the files should contain (*.MS).
#  -e, --exclude_pattern
#                        Files with the given pattern -p should be ignored
#  -s SUFFIX, --suffix SUFFIX
#                        Suffix to add to the file names.
#  -m METHOD, --method METHOD
#                        Method of creating the mapfile.
#  -d DIRECTORY, --directory DIRECTORY
#                        Directory to store the mapfile in.

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [python, /usr/lib/python2.7/dist-packages/lofarpipe/recipes/plugins/PipelineStep_createMapfile.py, createmap_cal.mapfile]
inputs:
  number:
    type: int?

  mapfile_in:
    type: File?

  folder:
    type: Directory?

  pattern:
    type: string?

  exclude_pattern:
    type: string?

  suffix:
    type: string?

  method:
    type: string?

  directory:
    type: Directory?

outputs:
  mapfile:
    type: File
    outputBinding:
      glob: "createmap_cal.mapfile"


