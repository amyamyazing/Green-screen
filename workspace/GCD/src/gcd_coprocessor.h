/*****************************************************************************
* Filename:          /home/cc/cs150/sp13/class/cs150-ar/Desktop/labs/lab5B/drivers/gcd_coprocessor_v1_00_a/src/gcd_coprocessor.h
* Version:           1.00.a
* Description:       gcd_coprocessor (new FSL core) Driver Header File
* Date:              Tue Feb 26 18:33:36 2013 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef GCD_COPROCESSOR_H
#define GCD_COPROCESSOR_H

#include "xstatus.h"

#include "fsl.h" 
#define write_into_fsl(val, id)  putfsl(val, id)
#define read_from_fsl(val, id)  getfsl(val, id)

/*
* A macro for accessing FSL peripheral.
*
* This example driver writes all the data in the input arguments
* into the input FSL bus through blocking writes. FSL peripheral will
* automatically read from the FSL bus. Once all the inputs
* have been written, the output from the FSL peripheral is read
* into output arguments through blocking reads.
*
* Arguments:
*	 input_slot_id
*		 Compile time constant indicating FSL slot from
*		 which coprocessor read the input data. Defined in
*		 xparameters.h .
*	 output_slot_id
*		 Compile time constant indicating FSL slot into
*		 which the coprocessor write output data. Defined in
*		 xparameters.h .
*	 input_0    An array of unsigned integers. Array size is 2
*	 output_0   An array of unsigned integers. Array size is 1
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
*    example code (gcd_coprocessor_app.c) for details.
*/

#define  gcd_coprocessor(\
		 input_slot_id,\
		 output_slot_id,\
		 input_0,      \
		 output_0       \
		 )\
{\
   int i;\
\
   for (i=0; i<2; i++)\
   {\
      write_into_fsl(input_0[i], input_slot_id);\
   }\
\
   for (i=0; i<1; i++)\
   {\
      read_from_fsl(output_0[i], output_slot_id);\
   }\
}

XStatus GCD_COPROCESSOR_SelfTest();

#endif 
