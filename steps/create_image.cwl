class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  s: 'http://schema.org/'
  sbg: 'https://www.sevenbridges.com'
id: create_image

hints:
  DockerRequirement:
      dockerImageId: kernsuite/prefactor

baseCommand: [python]
inputs:
  - id: mapfile_deep_low_size
    type: File
  - id: mapfile_nchansout_clean1
    type: File
  - id: mapfile_nwavelengths_low
    type: File
  - id: image_padding
    type: float
  - id: maxlambda_lowres
    type: int
  - id: cellsize_lowres_deg
    type: float
  - id: numcpu
    type: int
  - id: mem_pct
    type: int
  - id: prepcals
    type: 'Directory[]'
    inputBinding:
      position: 19
outputs:
  - id: psf
    type: File
    outputBinding:
      glob: wsclean-MFS-psf.fits
  - id: dirty
    type: File
    outputBinding:
      glob: wsclean-MFS-dirty.fits
  - id: residual
    type: File
    outputBinding:
      glob: wsclean-MFS-residual.fits
  - id: model
    type: File
    outputBinding:
      glob: wsclean-MFS-model.fits
label: create_image
arguments:
  - position: 0
    prefix: '-c'
    valueFrom: |
      import ast
      import sys
      import subprocess as SP
      cmlopts = ["wsclean"]
      padfil = open("$(inputs.mapfile_deep_low_size.path)")
      cmlopts.append("-size")
      cmlopts.extend(ast.literal_eval(padfil.read())[0]["file"].split())
      ncfil = open("$(inputs.mapfile_nchansout_clean1.path)")
      cmlopts.append("-channels-out")
      cmlopts.append(ast.literal_eval(ncfil.read())[0]["file"])
      nwfil = open("$(inputs.mapfile_nwavelengths_low.path)")
      cmlopts.append("-baseline-averaging")
      cmlopts.append(ast.literal_eval(nwfil.read())[0]["file"])
      cmlopts.extend(sys.argv[1:])
      print " ".join(cmlopts)
      SP.call(cmlopts)
  - position: 1
    prefix: '-padding'
    valueFrom: $(inputs.image_padding)
  - position: 2
    prefix: '-niter'
    valueFrom: '20000'
  - position: 3
    prefix: '-threshold'
    valueFrom: '0.0'
  - position: 4
    prefix: '-pol'
    valueFrom: I
  - position: 5
    prefix: '-weight'
    valueFrom: briggs
  - position: 6
    prefix: ''
    separate: false
    valueFrom: '0.0'
  - position: 7
    prefix: '-mgain'
    valueFrom: '0.65'
  - position: 8
    prefix: '-minuv-l'
    valueFrom: '80'
  - position: 9
    prefix: '-maxuv-l'
    valueFrom: $(inputs.maxlambda_lowres)
  - position: 10
    prefix: '-weighting-rank-filter'
    valueFrom: '3'
  - position: 11
    prefix: '-temp-dir'
    valueFrom: .
  - position: 12
    prefix: '-scale'
    valueFrom: $(inputs.cellsize_lowres_deg)
  - position: 13
    prefix: '-j'
    valueFrom: $(inputs.numcpu)
  - position: 14
    prefix: '-mem'
    valueFrom: $(inputs.mem_pct)
  - position: 15
    prefix: ''
    separate: false
    valueFrom: '-no-update-model-required'
  - position: 16
    prefix: ''
    separate: false
    valueFrom: '-reorder'
  - position: 17
    prefix: ''
    separate: false
    valueFrom: '-fit-beam'
  - position: 18
    prefix: ''
    separate: false
    valueFrom: '-join-channels'
requirements:
  - class: InlineJavascriptRequirement
$schemas:
  - 'https://schema.org/docs/schema_org_rdfa.html'
's:author':
  's:person.url': 'https://orcid.org/0000-0001-5125-9539'
's:license': 'https://mit-license.org/'
'sbg:job':
  inputs:
    input:
      basename: input.ext
      class: File
      contents: file contents
      nameext: .ext
      nameroot: input
      path: /path/to/input.ext
      secondaryFiles: []
      size: 0
  runtime:
    cores: 1
    ram: 1000
