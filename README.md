Van Der A formulation 
Using logarithmic interpolation 

Flags
<h1>
# SSW_LOGINT                             --> Logarithmic interpolation 
# SSW_LOGINT_STOKES                     --> Madsen calculation to utilize Stokes flow velocity components
</h1>

Using bedload flags
# if defined BEDLOAD_VANDERA 
#  if defined BEDLOAD_VANDERA_MADSEN      --> Madsen calculation for near bottom current velocity calculation for bedload  
# if defined BEDLOAD_VANDERA_CALC_WB    --> Madsen calculation for near bottom current velocity with a fixed elevation
# ifdef BEDLOAD_VANDERA_ZEROCURR         --> To have no effect of current velocity on bedload 
# ifdef BEDLOAD_VANDERA_WAVE_AVGD_STRESS --> Boundary layer streaming term that would enhance crest transport
# ifdef BEDLOAD_VANDERA_SURFACE_WAVE     --> Change time period on surface waves 
# ifdef BEDLOAD
