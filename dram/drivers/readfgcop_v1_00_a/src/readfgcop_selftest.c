/*****************************************************************************
* Filename:          /home/cc/cs150/sp13/class/cs150-ar/finalproj/dram/drivers/readfgcop_v1_00_a/src/readfgcop_selftest.c
* Version:           1.00.a
* Description:       
* Date:              Wed Mar 13 13:11:34 2013 (by Create and Import Peripheral Wizard)
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
	 unsigned int input_1[1];     
	 unsigned int input_2[1];     
	 unsigned int input_3[1];     
	 unsigned int input_4[1];     
	 unsigned int input_5[1];     
	 unsigned int input_6[1];     
	 unsigned int input_7[1];     
	 unsigned int output_0[1];     
	 unsigned int output_1[1];     
	 unsigned int output_2[1];     
	 unsigned int output_3[1];     
	 unsigned int output_4[1];     
	 unsigned int output_5[1];     
	 unsigned int output_6[1];     
	 unsigned int output_7[1];     

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
	 readfgcop(
		 input_slot_id,
		 output_slot_id,
		 input_0,    
		 input_1,    
		 input_2,    
		 input_3,    
		 input_4,    
		 input_5,    
		 input_6,    
		 input_7,      
		 output_0,      
		 output_1,      
		 output_2,      
		 output_3,      
		 output_4,      
		 output_5,      
		 output_6,      
		 output_7       
		 );

	 if (output_0[0] != 98760)
		 return XST_FAILURE;
	 if (output_7[0] != 98760)
		 return XST_FAILURE;

	 return XST_SUCCESS;
}
