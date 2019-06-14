
# include Interface
source mcPolymerInterface.tcl 
set addDataProcessing(PolymerAnalysis) "PolymerAnalysis.cfg"

# define low molecular species
Monomer M 130
Initiator I 0.8
Species I_


Concentration M 2.0
Concentration I 0.1

SpeciesMacro P_
SpeciesMacro D
disableLogDistribution
 

# reaction coefficients
RateConstant kd 6.33e-5
RateConstant ki 50
RateConstant kp 50
RateConstant ktd 5e5
RateConstant ktc 5e5



InitiatorDecomposition I --> I_ + I_ kd
Initiation I_ + M --> P_ ki
Propagation P_ + M --> P_ kp
Termination P_ + P_ --> D ktc
TerminationDisp P_ + P_ --> D + D  ktd



ListAllSpecies
ListAllRateConstants 

# set frequency for writing intermediate results
Setdt 1800
# define number of molecules for simulation 1e8..1e10
InitSimulation 1e9

# start simulation to overall reaction time
Simulation 86400




