# $   /usr/lib/prefactor/scripts/losotoImporter.py --help
# Usage: losotoImporter.py [-v] <H5parm> <MSPattern>
#   <H5parm>    = (Path)name of the (new) H5parm file to be written.
#   <MSPattern> = Search pattern for the measurement sets with instrument tables.
#                 (e.g. "/data/scratch/MyObs/calibrator/L*.dppp")
#                 Probably needs to be put in quotes when called from a shell!
# 
# Options:
#   -h, --help            show this help message and exit
#   -i INSTRUMENT, --instrument=INSTRUMENT
#                         Name of the instrument tables of the measurement sets.
#                         If it starts with "/" -> instrument table is sub-
#                         directory within the MS directory.
#                         (default="/instrument")
#   -v, --verbose         Go Vebose! (default=False)
#   -s SOLSET, --solset=SOLSET
#                         Solution-set name (default=sol###)
#   -c COMPLEVEL, --complevel=COMPLEVEL
#                         Compression level from 0 (no compression, fast) to 9
#                         (max compression, slow) (default=5)

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [python, /usr/lib/prefactor/scripts/losotoImporter.py, losoto.h5]

inputs:
  msin:
    type: Directory
    doc: "Search pattern for measurement sets with instrument tables. (e.g. '/data/scratch/MyObs/calibrator/L*.dppp')"
    inputBinding:
      position: 1

  instrument:
    type: string?
    doc: "Name of instrument tables of measurement sets. If starts with '/' -> instrument table is sub- directory within the MS directory"

  solset:
    type: string?
    doc: "Solution-set name"
    inputBinding:
      prefix: -s

  complevel:
    type: int?
    doc: "Compression level from 0 (no compression, fast) to 9"
    inputBinding:
      prefix: -c   

  verbose:
    type: boolean?
    inputBinding:
      prefix: -v 

outputs:
  h5:
    type: File
    outputBinding:
      glob: "losoto.h5"
