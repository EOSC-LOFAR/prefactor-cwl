cwlVersion: v1.0
class: CommandLineTool
baseCommand: [python, /usr/lib/prefactor/scripts/losotoImporter.py, losoto.h5]

hints:
  DockerRequirement:
      dockerImageId: kernsuite/prefactor

inputs:
  ms_array:
    type: Directory[]
    doc: "List of path patterns of measurement sets with instrument tables"
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


$namespaces:
  s: http://schema.org/
$schemas:
  - https://schema.org/docs/schema_org_rdfa.html



s:license: "https://mit-license.org/"
s:author:
  s:person.url: "http://orcid.org/0000-0002-6136-3724"
