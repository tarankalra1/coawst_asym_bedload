Van Der A formulation 

#if defined BEDLOAD_VANDERA 
#if defined BEDLOAD_VANDERA_MADSEN      --> Madsen calculation for current velocity calculation for bedload  
#ifdef BEDLOAD_VANDERA_ZEROCURR         --> To have no effect of current velocity on bedload 
#ifdef BEDLOAD_VANDERA_STOKES           --> When using current velocity for bedload, use Stokes flow 
#ifdef BEDLOAD_VANDERA_WAVE_AVGD_STRESS --> Boundary layer streaming term that would enhance crest transport
#ifdef BEDLOAD_VANDERA_SURFACE_WAVE     --> Change time period on surface waves 
# coawst_asym_bedload
