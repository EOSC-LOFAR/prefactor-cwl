# $ losoto -h
# Usage: losoto [-v|-V] h5parm parset [default: losoto.parset]
# Francesco de Gasperin (fdg@strw.leidenuniv.nl)
# 
# Options:
#   --version             show program's version number and exit
#   -h, --help            show this help message and exit
#   -q                    Quiet
#   -v                    Verbose
#   -f FILTER, --filter=FILTER
#                         Filter to use with "-i" option to filter on solution
#                         set names (default=None)
#   -i                    List information about h5parm file (default=False). A
#                         filter on the solution set names can be specified with
#                         the "-f" option.
#   -d DELETE, --delete=DELETE
#                         Specify a solution table to be deleted. Use the
#                         solset/soltab sintax.
# 
cwlVersion: v1.0
class: CommandLineTool

baseCommand: [losoto]

label: "Plot raw calibration results"

hints:
  DockerRequirement:
      dockerPull: kernsuite/prefactor

requirements:
  InitialWorkDirRequirement:
    listing:
      - entryname: losoto.parset
        entry: |
          flags                        =  [hdf5file]
          LoSoTo.Steps                 =  [plot]
          LoSoTo.Solset                =  [sol000]
          LoSoTo.Soltab                =  [sol000/phase000]
          LoSoTo.SolType               =  [phase]
          LoSoTo.ant                   =  []
          LoSoTo.pol                   =  [XX,YY]
          LoSoTo.dir                   =  [pointing]
          LoSoTo.Steps.plot.Operation  =  PLOT
          LoSoTo.Steps.plot.PlotType   =  2D
          LoSoTo.Steps.plot.Axes       =  [time,freq]
          LoSoTo.Steps.plot.TableAxis  =  [ant]
          LoSoTo.Steps.plot.ColorAxis  =  [pol]
          LoSoTo.Steps.plot.Reference  =  $(inputs.reference_station) 
          LoSoTo.Steps.plot.PlotFlag   =  False
          LoSoTo.Steps.plot.Prefix     =  cwl_
      - entry: $(inputs.h5parm)
        writable: true

inputs:
  h5parm:
    type: File
    format: http://revoltek.github.io/losoto/cookbook.pdf
    inputBinding:
      position: 1

  reference_station:
    type: string

arguments:
  - valueFrom: losoto.parset
    position: 2
  
outputs:
  polXX_dirpointing:
    type: File
    format: image/png
    outputBinding:
      glob: "cwl_polXX_dirpointing.png"

  polYY_dirpointing:
    type: File
    format: image/png
    outputBinding:
      glob: "cwl_polYY_dirpointing.png"

$namespaces:
  s: http://schema.org/
$schemas:
  - https://schema.org/version/latest/schema.rdf



s:license: "https://mit-license.org/"
s:author:
  s:person.url: "http://orcid.org/0000-0002-6136-3724"
