cwlVersion: v1.0
class: CommandLineTool
baseCommand: [python, /usr/lib/prefactor/scripts/losotoImporter.py, losoto.h5]

hints:
  DockerRequirement:
      dockerImageId: kernsuite/prefactor
      dockerFile: |
        FROM kernsuite/base:3
        RUN docker-apt-install prefactor

inputs:
  msin:
    type: Directory
    doc: "Search pattern for measurement sets with instrument tables. (e.g. '/data/scratch/MyObs/calibrator/L*.dppp')"
    inputBinding:
      position: 1

  instrument:
    type: string
    doc: "Name of instrument tables of measurement sets. If starts with '/' -> instrument table is sub- directory within the MS directory"
    default: "/instrument"

  solset:
    type: string
    doc: "Solution-set name"
    default: "sol000"
    inputBinding:
      prefix: -s

  complevel:
    type: int
    doc: "Compression level from 0 (no compression, fast) to 9"
    default: 7
    inputBinding:
      prefix: -c   

  verbose:
    type: boolean?
    inputBinding:
      prefix: -v 

outputs:
  losoto_h5:
    type: File
    outputBinding:
      glob: "losoto.h5"
