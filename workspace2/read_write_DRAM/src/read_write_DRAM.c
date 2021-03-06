/*
 * Copyright (c) 2009 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/*
 * helloworld.c: simple test application
 */
#include <stdio.h>
#include "readbgcop.h"
#include "readfgcop.h"
#include "writecop.h"

int getOperation()
{
	xil_printf("Select the operation you want to perform:\n\r");
	xil_printf("0.Read using CPU, 1.Read using coprocessor, "
	    			"2. Write using CPU, 3. Write using coprocessor\n\r");
	while(1)
	{

		char curC = getchar();
		xil_printf("%c\r\n", curC);
		int opNum = curC -'0';
		if(opNum>=0 && opNum <4)
			return opNum;
		else
			xil_printf("Invalid operation, try again.\n\r");
	}
}
int getHexNum()
{

	int curHex = 0;
	while(1)
	{
		char curC = getchar();
		xil_printf("%c", curC);
		if(curC == '\r')
		{
			xil_printf("\r\n");

			return curHex;
		}
		else if(curC >= '0' && curC <='9')
		{
			curHex = (curHex<<4)+(curC - '0');
		}
		else if(curC>= 'a' && curC <= 'f')
		{
			curHex = (curHex<<4)+(curC-'a'+10);
		}
		else if(curC>= 'A' && curC <= 'F')
		{
			curHex = (curHex<<4)+(curC-'A'+10);
		}

	}
}
int main()
{
    unsigned int input_0[2];
    unsigned int input_1[2];
    unsigned int output_0[1];
    unsigned int output_1[1];
	unsigned int* addr = 0x903a9800;
	unsigned int* addr2 = 0x90000000;
	input_0[0] = addr;
	input_1[0] = addr2;
	//input_0[0] = addr;
    while(1)
    {
    	int op = 1;



    	if(op>1)
    	{
    		//unsigned int newNum
    		xil_printf("Specify value to write in hex\n\r");
    		unsigned int val = getHexNum();

    		if(op==2)
    			*addr = val;
    		else
    		{
    			input_0[1] = val;
    			writecop(
    					 2,
    					 input_0
    					 );

    		}
    		xil_printf("Written %x to %x\r\n",  val, addr);
    	}
    	else
    	{
    		// reading
    		if(op==0)
    			output_0[0] = *addr;
    		else
    		{
    			readbgcop(
							 0,
							 0,
							 input_0,
							 output_0
							 );
    			readfgcop(
							 1,
							 1,
							 input_1,
							 output_1
							 );
    		}
    		//xil_printf("%x is read from bg DRAM address %x\r\n", output_0[0], input_0[0]);
       		//xil_printf("%x is read from fg DRAM address %x\r\n", output_1[0], input_1[0]);
    	}
    	if(input_1[0] == 0x903a97f8 && input_0[0] == 0x90752ff8){
    		input_1[0] = 0x90000000;
    		input_0[0] = 0x903a9800;
    	} else {
    	   input_0[0] = input_0[0] + 0x00000008;
    	   input_1[0] = input_1[0] + 0x00000008;
    	}
    }




    return 0;
}
//int main()
//{
//    unsigned int input_0[2];
//    unsigned int output_0[1];
//    while(1)
//    {
//    	int op = getOperation();
//    	xil_printf("Specify address in hex (must be 8 byte aligned and between 90000000 and 9fffffff)\n\r");
//    	unsigned int addrNum = getHexNum();
//    	if(addrNum<0x90000000 || addrNum>0x9fffffff || (addrNum%8))
//    	{
//    		xil_printf("Invalid Address %x, try again\r\n",addrNum);
//    		continue;
//    	}
//    	unsigned int* addr = addrNum;
//    	input_0[0] = addr;
//
//    	if(op>1)
//    	{
//    		//unsigned int newNum
//    		xil_printf("Specify value to write in hex\n\r");
//    		unsigned int val = getHexNum();
//
//    		if(op==2)
//    			*addr = val;
//    		else
//    		{
//    			input_0[1] = val;
//    			writecop(
//    					 2,
//    					 input_0
//    					 );
//
//    		}
//    		xil_printf("Written %x to %x\r\n",  val, addr);
//    	}
//    	else
//    	{
//    		// reading
//    		if(op==0)
//    			output_0[0] = *addr;
//    		else
//    		{
//    			readbgcop(
//							 0,
//							 0,
//							 input_0,
//							 output_0
//							 );
//    		}
//    		xil_printf("%x is read from DRAM\r\n", output_0[0]);
//    	}
//    }
//
//
//
//
//    return 0;
//}
