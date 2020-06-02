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
baseCommand: [python,
             /usr/lib/python2.7/dist-packages/lofarpipe/recipes/plugins/PipelineStep_createMapfile.py,
             createmap_cal.mapfile]

hints:
  DockerRequirement:
      dockerPull: kernsuite/prefactor

inputs:
  number:
    type: int?
    doc: "Number of times to expand a dummy mapfile"
    inputBinding:
      prefix: -n

  mapfile_in:
    type: File?
    doc: "Input mapfile to be changed"

  folder:
    type: Directory
    doc: "Path to the directory containing the data"
    inputBinding:
      prefix: -f

  pattern:
    type: string?
    default: "*.MS"
    doc: "Pattern the files should contain (*.MS)"

  exclude_pattern:
    type: string?
    doc: "Files with the given pattern -p should be ignored"

  suffix:
    type: string?
    doc: "Suffix to add to the file names"

  method:
    type: string?
    doc: "Method of creating the mapfile"

  directory:
    type: Directory?
    doc: "Directory to store the mapfile in"

outputs:
  mapfile:
    type: File
    outputBinding:
      glob: "createmap_cal.mapfile"



$namespaces:
  s: http://schema.org/
$schemas:
  - https://schema.org/version/latest/schema.rdf


s:license: "https://mit-license.org/"
s:author:
  s:person.url: "http://orcid.org/0000-0002-6136-3724"
