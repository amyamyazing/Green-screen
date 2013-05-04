/*****************************************************************************
* Filename:          /home/cc/cs150/sp13/class/cs150-at/finalproject/drivers/writecop_v1_00_a/src/writecop.h
* Version:           1.00.a
* Description:       writecop (new FSL core) Driver Header File
* Date:              Wed May  1 17:47:18 2013 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef WRITECOP_H
#define WRITECOP_H

#include "xstatus.h"

#include "fsl.h" 
#define write_into_fsl(val, id)  putfsl(val, id)
#define read_from_fsl(val, id)  getfsl(val, id)

/*
* A macro for accessing FSL peripheral.
*
* This example driver writes all the data in the input arguments
* into the input FSL bus through blocking writes. FSL peripheral will
* automatically read from the FSL bus.
*
* Arguments:
*	 input_slot_id
*		 Compile time constant indicating FSL slot from
*		 which coprocessor read the input data. Defined in
*		 xparameters.h .
*	 input_0    An array of unsigned integers. Array size is 2
*
* Caveats:
*    The output_slot_id and input_slot_id arguments must be
*    constants available at compile time. Do not pass
*    variables for these arguments.
*
*    Since this is a macro, using it too many times will
*    increase the size of your application. In such cases,
*    or when this macro is too simplistic for your
*    application you may want to create your own instance
*    specific driver function (not a macro) using the 
*    macros defined in this file and the slot
*    identifiers defined in xparameters.h .  Please see the
*    example code (writecop_app.c) for details.
*/

#define  writecop(\
		 input_slot_id,\
		 input_0    \
		 )\
{\
   int i;\
\
   for (i=0; i<2; i++)\
   {\
      write_into_fsl(input_0[i], input_slot_id);\
   }\
\
}

XStatus WRITECOP_SelfTest();

#endif 
