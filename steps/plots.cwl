# plotsols_script           = /usr/lib/prefactor/scripts/examine_npys.py
# and generate some output plots
#plots.control.kind             = recipe
#plots.control.type             = executable_args
#plots.control.mapfile_in       = h5imp_cal.output.h5parm.mapfile
#plots.control.executable       = {{ plotsols_script }}
#plots.control.skip_infile      = True
#plots.control.arguments        = [caldata_transfer]


cwlVersion: v1.0
class: CommandLineTool
baseCommand: python

inputs:
  amplitude_array:
    type: File

  dclock_1st.sm:
    type: File

  dtec_1st.sm:
    type: File

outputs:
  dtec_allsols:
    type: File
    outputBinding:
      glob: dtec_allsols.png

  dclock_allsols:
    type: File
    outputBinding:
      glob: dclock_allsols.png

  amp_allsols:
    type: File
    outputBinding:
      glob: amp_allsols.png

arguments:
  - prefix: -c
    valueFrom: |
      import matplotlib as mpl
      mpl.use('Agg')
      import numpy as np
      import pylab

      amparray   = np.load("$(inputs.amplitude_array)")
      clockarray = np.load("$(inputs.dclock_1st.sm)")
      dtecarray  = np.load("$(inputs.dtec_1st.sm)")
      numants = len(dtecarray[0,:])
      
      for i in range(0,numants):
          pylab.plot(dtecarray[:,i])
      pylab.xlabel('Time')
      pylab.ylabel('dTEC [$10^{16}$ m$^{-2}$]')
      pylab.savefig('dtec_allsols.png')
      pylab.close()
      pylab.cla()
      
      for i in range(0,numants):
          pylab.plot(1e9*clockarray[:,i])
      pylab.xlabel('Time')
      pylab.ylabel('dClock [ns]')
      pylab.savefig('dclock_allsols.png')
      pylab.close()
      pylab.cla()
      
      
      for i in range(0,numants):
        pylab.plot(np.median(amparray[i,:,:,0], axis=0))
        pylab.plot(np.median(amparray[i,:,:,1], axis=0))
      pylab.xlabel('Subband number')
      pylab.ylabel('Amplitude')
      pylab.ylim(0,2.*np.median(amparray))
      pylab.savefig('amp_allsols.png')
      pylab.close()
      pylab.cla()
      
