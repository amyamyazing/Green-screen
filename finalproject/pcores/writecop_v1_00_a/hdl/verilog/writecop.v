//----------------------------------------------------------------------------
// writecop - module
//----------------------------------------------------------------------------
// IMPORTANT:
// DO NOT MODIFY THIS FILE EXCEPT IN THE DESIGNATED SECTIONS.
//
// SEARCH FOR --USER TO DETERMINE WHERE CHANGES ARE ALLOWED.
//
// TYPICALLY, THE ONLY ACCEPTABLE CHANGES INVOLVE ADDING NEW
// PORTS AND GENERICS THAT GET PASSED THROUGH TO THE INSTANTIATION
// OF THE USER_LOGIC ENTITY.
//----------------------------------------------------------------------------
//
// ***************************************************************************
// ** Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.            **
// **                                                                       **
// ** Xilinx, Inc.                                                          **
// ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
// ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
// ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
// ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
// ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
// ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
// ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
// ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
// ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
// ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
// ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
// ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
// ** FOR A PARTICULAR PURPOSE.                                             **
// **                                                                       **
// ***************************************************************************
//
//----------------------------------------------------------------------------
// Filename:          writecop
// Version:           1.00.a
// Description:       Example FSL core (Verilog).
// Date:              Mon Mar  4 12:19:26 2013 (by Create and Import Peripheral Wizard)
// Verilog Standard:  Verilog-2001
//----------------------------------------------------------------------------
// Naming Conventions:
//   active low signals:                    "*_n"
//   clock signals:                         "clk", "clk_div#", "clk_#x"
//   reset signals:                         "rst", "rst_n"
//   generics:                              "C_*"
//   user defined types:                    "*_TYPE"
//   state machine next state:              "*_ns"
//   state machine current state:           "*_cs"
//   combinatorial signals:                 "*_com"
//   pipelined or register delay signals:   "*_d#"
//   counter signals:                       "*cnt*"
//   clock enable signals:                  "*_ce"
//   internal version of output port:       "*_i"
//   device pins:                           "*_pin"
//   ports:                                 "- Names begin with Uppercase"
//   processes:                             "*_PROCESS"
//   component instantiations:              "<ENTITY_>I_<#|FUNC>"
//----------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////
//
//
// Definition of Ports
// FSL_Clk             : Synchronous clock
// FSL_Rst           : System reset, should always come from FSL bus
// FSL_S_Clk       : Slave asynchronous clock
// FSL_S_Read      : Read signal, requiring next available input to be read
// FSL_S_Data      : Input data
// FSL_S_Control   : Control Bit, indicating the input data are control word
// FSL_S_Exists    : Data Exist Bit, indicating data exist in the input FSL bus
//
////////////////////////////////////////////////////////////////////////////////

//----------------------------------------
// Module Section
//----------------------------------------
module writecop 
	(
		// ADD USER PORTS BELOW THIS LINE 
		/*********************************/
		/**  NPI Interface Ports below ***/
		/**  CS150 Tutorial 1			 ***/
		/*********************************/
		system_dcm_locked,
		XIL_NPI_Addr, 
		XIL_NPI_AddrReq, 
		XIL_NPI_AddrAck, 
		XIL_NPI_RNW, 
		XIL_NPI_Size, 
		XIL_NPI_WrFIFO_Data, 
		XIL_NPI_WrFIFO_BE, 
		XIL_NPI_WrFIFO_Push, 
		XIL_NPI_RdFIFO_Data, 
		XIL_NPI_RdFIFO_Pop, 
		XIL_NPI_RdFIFO_RdWdAddr, 
		XIL_NPI_WrFIFO_Empty, 
		XIL_NPI_WrFIFO_AlmostFull, 
		XIL_NPI_WrFIFO_Flush, 
		// NPI_RdFIFO_DataAvailable, // I Only used for MPMC2 connections 
		XIL_NPI_RdFIFO_Empty, 
		XIL_NPI_RdFIFO_Flush, 
		XIL_NPI_RdFIFO_Latency, 
		XIL_NPI_RdModWr, 
		XIL_NPI_InitDone, 
		/**End of NPI Port addition **/
		// ADD USER PORTS ABOVE THIS LINE 

		// DO NOT EDIT BELOW THIS LINE ////////////////////
		// Bus protocol ports, do not add or delete. 
		FSL_Clk,
		FSL_Rst,
		FSL_S_Clk,
		FSL_S_Read,
		FSL_S_Data,
		FSL_S_Control,
		FSL_S_Exists
		// DO NOT EDIT ABOVE THIS LINE ////////////////////
	);

// ADD USER PORTS BELOW THIS LINE 
/*********************************/
/**  NPI Interface Ports below ***/
/**  CS150 Tutorial 1			 ***/
/*********************************/ 

/** NPI interface parameters 			**/
parameter C_PI_ADDR_WIDTH = 32; 
parameter C_PI_DATA_WIDTH = 64; 
parameter C_PI_BE_WIDTH = 8; 
parameter C_PI_RDWDADDR_WIDTH = 4;
/** End of NPI parameter definition **/
input		system_dcm_locked;
output 	[C_PI_ADDR_WIDTH-1:0] XIL_NPI_Addr; 
output 	XIL_NPI_AddrReq; 
input 	XIL_NPI_AddrAck; 
output 	XIL_NPI_RNW; 
output 	[3:0] XIL_NPI_Size; 
output 	[C_PI_DATA_WIDTH-1:0] XIL_NPI_WrFIFO_Data; 
output 	[C_PI_BE_WIDTH-1:0] XIL_NPI_WrFIFO_BE; 
output 	XIL_NPI_WrFIFO_Push; 
input 	[C_PI_DATA_WIDTH-1:0] XIL_NPI_RdFIFO_Data; 
output 	XIL_NPI_RdFIFO_Pop; 
input 	[C_PI_RDWDADDR_WIDTH-1:0] XIL_NPI_RdFIFO_RdWdAddr; 
input 	XIL_NPI_WrFIFO_Empty;  
input 	XIL_NPI_WrFIFO_AlmostFull; 
output 	XIL_NPI_WrFIFO_Flush; 
// input NPI_RdFIFO_DataAvailable; //Only used for MPMC2 designs 
input 	XIL_NPI_RdFIFO_Empty; 
output 	XIL_NPI_RdFIFO_Flush; 
input 	[1:0] XIL_NPI_RdFIFO_Latency; 
output 	XIL_NPI_RdModWr; 
input 	XIL_NPI_InitDone; 
/**End of NPI Port addition **/
// ADD USER PORTS ABOVE THIS LINE 

input                                     FSL_Clk;
input                                     FSL_Rst;
input                                     FSL_S_Clk;
output                                    FSL_S_Read;
input      [0 : 31]                       FSL_S_Data;
input                                     FSL_S_Control;
input                                     FSL_S_Exists;

// ADD USER PARAMETERS BELOW THIS LINE 
// --USER parameters added here 
// ADD USER PARAMETERS ABOVE THIS LINE


//----------------------------------------
// Implementation Section
//----------------------------------------


wire [31:0] FSL_Data_twisted;
// need to twist bytes around since 
// the endianness is different in DRAM
assign FSL_Data_twisted[7:0] = FSL_S_Data[0:7];
assign FSL_Data_twisted[15:8] = FSL_S_Data[8:15];
assign FSL_Data_twisted[23:16] = FSL_S_Data[16:23];
assign FSL_Data_twisted[31:24] = FSL_S_Data[24:31];

// we will read two numbers, first is the address,
// second is the value to write, then we write
// build a state machine to do that.
localparam INIT	 = 5'b00001;
localparam RDADDR  = 5'b00010;
localparam RDDATA  = 5'b00100;
localparam WRDATA  = 5'b01000;
localparam WRDATA2 = 5'b10000;
reg[4:0] state;

assign FSL_S_Read  = (state == RDADDR || state==RDDATA) ? FSL_S_Exists : 0;


wire rst;
assign rst = !system_dcm_locked;

reg[31:0] ADDR_MB;
reg[31:0] DATA_MB;

assign XIL_NPI_Addr = ADDR_MB;
assign XIL_NPI_RdModWr = 1'b0; // does not have to be asserted
assign XIL_NPI_RNW = 1'b0;  // always in write mode


assign XIL_NPI_Size = 4'h0; //double word transfer, check MPMC datasheet for other mode 
assign XIL_NPI_WrFIFO_Flush = 1'b0;
assign XIL_NPI_WrFIFO_BE = 8'h0F; // we just write into the lower word -- where the address is pointing to

assign XIL_NPI_WrFIFO_Data = {DATA_MB,DATA_MB};
	
assign XIL_NPI_WrFIFO_Push = (state == WRDATA2) & XIL_NPI_InitDone & ~XIL_NPI_WrFIFO_AlmostFull;

assign XIL_NPI_AddrReq = (state == WRDATA);

// we use FSL_S_Clk, which will be connected to the
// clock of the MPMC, realize we have a different clock
// domain in this coprocessor than in MicroBlaze, the 
// FSL FIFO is thus asynchronous
always@(posedge FSL_S_Clk)
begin
	if(FSL_Rst | rst )
		begin
			state <= INIT;
			ADDR_MB <= 0;
			DATA_MB <= 0;
			
		end
	else
		case(state)
			INIT:
				begin
					if(FSL_S_Exists == 1)
						state <= RDADDR;
				end
			RDADDR:
				begin
					if(FSL_S_Exists == 1)
						begin
							state <= RDDATA;
							ADDR_MB <= FSL_S_Data;
						end
				end
			RDDATA:
				begin
					if(FSL_S_Exists == 1)
						begin
							DATA_MB <= FSL_Data_twisted;
							state <= WRDATA;
							
						end
				end
			WRDATA:
				// to write to the DRAM
				// we need to assert the addrReq
				// and wait for the ack, after ack
				// we would assert push for one cycle
				begin 
					if(XIL_NPI_AddrAck)
						state <= WRDATA2; 
				end
							
			WRDATA2:
					// make sure the DRAM is init'ed properly and we
					// have space in wrFIFO
					if(XIL_NPI_InitDone & ~XIL_NPI_WrFIFO_AlmostFull) 
						state <= RDADDR; // get ready for taking in new pair
			default:
				state <= INIT;	
				
		endcase
end
	



endmodule
