#include "cppdefs.h"
/*
** svn $Id: master.F 830 2017-01-24 21:21:11Z arango $
*************************************************** Hernan G. Arango ***
** Copyright (c) 2002-2017 The ROMS/TOMS Group                        **
**   Licensed under a MIT/X style license                             **
**   See License_ROMS.txt                                             **
************************************************************************
**                                                                    **
**  Master program to run ROMS/TOMS as single ocean model or coupled  **
**  to other models using the MCT or ESMF libraries.                  **
**                                                                    **
************************************************************************
*/

#if defined COAWST_COUPLING
# if defined MCT_LIB
#  include "mct_coupler.h"
# elif defined ESMF_LIB
#  include "esmf_coupler.h"
# endif
#elif defined INWAVE_MODEL_notyet
# include "inwave.h"
#elif defined ROMS_MODEL
# include "ocean.h"
#elif defined SWAN_MODEL
# include "waves.h"
#endif
