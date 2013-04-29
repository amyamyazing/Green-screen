/*****************************************************************************
* Filename:          /home/cc/cs150/sp13/class/cs150-ar/finalproj/dram/drivers/writecopimage_v1_00_a/src/writecopimage_selftest.c
* Version:           1.00.a
* Description:       
* Date:              Wed Mar 13 12:33:24 2013 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#include "xparameters.h"
#include "writecopimage.h"

/* IMPORTANT:
*  In order to run this self test, you need to modify the value of following
*  micros according to the slot ID defined in xparameters.h file. 
*/
#define input_slot_id   XPAR_FSL_WRITECOPIMAGE_0_INPUT_SLOT_ID
XStatus WRITECOPIMAGE_SelfTest()
{
	 unsigned int input_0[1];     
	 unsigned int input_1[1];     
	 unsigned int input_2[1];     
	 unsigned int input_3[1];     
	 unsigned int input_4[1];     
	 unsigned int input_5[1];     
	 unsigned int input_6[1];     
	 unsigned int input_7[1];     

	 //Initialize your input data over here: 
	 input_0[0] = 12345;     
	 input_1[0] = 12345;     
	 input_2[0] = 12345;     
	 input_3[0] = 12345;     
	 input_4[0] = 12345;     
	 input_5[0] = 12345;     
	 input_6[0] = 12345;     
	 input_7[0] = 12345;     

	 //Call the macro with instance specific slot IDs
	 writecopimage(
		 input_slot_id,
		 input_0,    
		 input_1,    
		 input_2,    
		 input_3,    
		 input_4,    
		 input_5,    
		 input_6,    
		 input_7    
		 );


	 return XST_SUCCESS;
}
