/*****************************************************************************
* Filename:          /home/cc/cs150/sp13/class/cs150-at/finalproject/drivers/readfgcop_v1_00_a/src/readfgcop_selftest.c
* Version:           1.00.a
* Description:       
* Date:              Wed May  1 17:48:23 2013 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#include "xparameters.h"
#include "readfgcop.h"

/* IMPORTANT:
*  In order to run this self test, you need to modify the value of following
*  micros according to the slot ID defined in xparameters.h file. 
*/
#define input_slot_id   XPAR_FSL_READFGCOP_0_INPUT_SLOT_ID
#define output_slot_id  XPAR_FSL_READFGCOP_0_OUTPUT_SLOT_ID

XStatus READFGCOP_SelfTest()
{
	 unsigned int input_0[1];     
	 unsigned int output_0[1];     

	 //Initialize your input data over here: 
	 input_0[0] = 12345;     

	 //Call the macro with instance specific slot IDs
	 readfgcop(
		 input_slot_id,
		 output_slot_id,
		 input_0,      
		 output_0       
		 );

	 if (output_0[0] != 12345)
		 return XST_FAILURE;
	 if (output_0[0] != 12345)
		 return XST_FAILURE;

	 return XST_SUCCESS;
}
