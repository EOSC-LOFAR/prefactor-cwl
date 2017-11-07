cwlVersion: v1.0
class: CommandLineTool
baseCommand: [python, /usr/lib/prefactor/scripts/amplitudes_losoto_3.py]

hints:
  DockerRequirement:
      dockerImageId: kernsuite/prefactor
      dockerFile: |
        FROM kernsuite/base:3
        RUN docker-apt-install prefactor

inputs:
  globaldbname:
    type: File
    doc: "input h5 parm file"
    inputBinding:
      position: 1

  n_chan:
    type: int
    doc: "number of channels solved for per subband (i.e., number of solutions along frequencies axis of MS)"
    inputBinding:
      position: 3

  bad_sblist:
    type: int[]?
    inputBinding:
      position: 4

arguments:
 # calsource
 - valueFrom: "fitclock"
   position: 2

outputs:
  amplitude_array:
    type: File
    outputBinding:
      glob: "fitclock_amplitude_array.npy"
