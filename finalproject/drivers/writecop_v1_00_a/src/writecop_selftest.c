/*****************************************************************************
* Filename:          /home/cc/cs150/sp13/class/cs150-at/finalproject/drivers/writecop_v1_00_a/src/writecop_selftest.c
* Version:           1.00.a
* Description:       
* Date:              Wed May  1 17:47:18 2013 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#include "xparameters.h"
#include "writecop.h"

/* IMPORTANT:
*  In order to run this self test, you need to modify the value of following
*  micros according to the slot ID defined in xparameters.h file. 
*/
#define input_slot_id   XPAR_FSL_WRITECOP_0_INPUT_SLOT_ID
XStatus WRITECOP_SelfTest()
{
	 unsigned int input_0[2];     

	 //Initialize your input data over here: 
	 input_0[0] = 12345;     
	 input_0[1] = 24690;     

	 //Call the macro with instance specific slot IDs
	 writecop(
		 input_slot_id,
		 input_0    
		 );


	 return XST_SUCCESS;
}
