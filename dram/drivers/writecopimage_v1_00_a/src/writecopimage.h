/*****************************************************************************
* Filename:          /home/cc/cs150/sp13/class/cs150-ar/finalproj/dram/drivers/writecopimage_v1_00_a/src/writecopimage.h
* Version:           1.00.a
* Description:       writecopimage (put image into DRAM, put processed image into DRAM) Driver Header File
* Date:              Wed Mar 13 12:33:24 2013 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef WRITECOPIMAGE_H
#define WRITECOPIMAGE_H

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
*	 input_0    An array of unsigned integers. Array size is 1
*	 input_1    An array of unsigned integers. Array size is 1
*	 input_2    An array of unsigned integers. Array size is 1
*	 input_3    An array of unsigned integers. Array size is 1
*	 input_4    An array of unsigned integers. Array size is 1
*	 input_5    An array of unsigned integers. Array size is 1
*	 input_6    An array of unsigned integers. Array size is 1
*	 input_7    An array of unsigned integers. Array size is 1
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
*    example code (writecopimage_app.c) for details.
*/

#define  writecopimage(\
		 input_slot_id,\
		 input_0,    \
		 input_1,    \
		 input_2,    \
		 input_3,    \
		 input_4,    \
		 input_5,    \
		 input_6,    \
		 input_7    \
		 )\
{\
   int i;\
\
   for (i=0; i<1; i++)\
   {\
      write_into_fsl(input_0[i], input_slot_id);\
      write_into_fsl(input_1[i], input_slot_id);\
      write_into_fsl(input_2[i], input_slot_id);\
      write_into_fsl(input_3[i], input_slot_id);\
      write_into_fsl(input_4[i], input_slot_id);\
      write_into_fsl(input_5[i], input_slot_id);\
      write_into_fsl(input_6[i], input_slot_id);\
      write_into_fsl(input_7[i], input_slot_id);\
   }\
\
}

XStatus WRITECOPIMAGE_SelfTest();

#endif 
