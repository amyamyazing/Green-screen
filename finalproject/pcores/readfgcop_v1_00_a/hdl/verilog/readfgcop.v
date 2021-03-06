//----------------------------------------------------------------------------
// readfgcop - module
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
// Filename:          readfgcop
// Version:           1.00.a
// Description:       Example FSL core (Verilog).
// Date:              Mon Mar  4 12:51:06 2013 (by Create and Import Peripheral Wizard)
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
// FSL_M_Clk       : Master asynchronous clock
// FSL_M_Write     : Write signal, enabling writing to output FSL bus
// FSL_M_Data      : Output data
// FSL_M_Control   : Control Bit, indicating the output data are contol word
// FSL_M_Full      : Full Bit, indicating output FSL bus is full
//
////////////////////////////////////////////////////////////////////////////////

//----------------------------------------
// Module Section
//----------------------------------------
module readfgcop 
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
		OUTFG_Port,
		// DO NOT EDIT BELOW THIS LINE ////////////////////
		// Bus protocol ports, do not add or delete. 
		FSL_Clk,
		FSL_Rst,
		FSL_S_Clk,
		FSL_S_Read,
		FSL_S_Data,
		FSL_S_Control,
		FSL_S_Exists,
		FSL_M_Clk,
		FSL_M_Write,
		FSL_M_Data,
		FSL_M_Control,
		FSL_M_Full
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
output [0 : 31]  OUTFG_Port;
// ADD USER PORTS ABOVE THIS LINE 

input                                     FSL_Clk;
input                                     FSL_Rst;
input                                     FSL_S_Clk;
output                                    FSL_S_Read;
input      [0 : 31]                       FSL_S_Data;
input                                     FSL_S_Control;
input                                     FSL_S_Exists;
input                                     FSL_M_Clk;
output                                    FSL_M_Write;
output     [0 : 31]                       FSL_M_Data;
output                                    FSL_M_Control;
input                                     FSL_M_Full;

// ADD USER PARAMETERS BELOW THIS LINE 
// --USER parameters added here 
// ADD USER PARAMETERS ABOVE THIS LINE


//----------------------------------------
// Implementation Section
//----------------------------------------
// we will build a simple state machine
// it will read one word from the FSL,
// use it as address, and then fetch
// the data from DRAM, finally write to
// FSL
localparam INIT 	= 6'b000001; 
localparam RDADDR	= 6'b000010;
localparam FTDATA	= 6'b000100;
localparam WAITEMP	= 6'b001000;
localparam WAITLAT	= 6'b010000;
localparam WRDATA	= 6'b100000;

reg [5:0] state;

reg[31:0] ADDR_MB;
reg[31:0] DATA_MB;

assign FSL_S_Read  = (state == RDADDR) ? FSL_S_Exists : 0;
assign FSL_M_Write = (state == WRDATA) ? ~FSL_M_Full : 0;
//assign FSL_M_Data = DATA_MB;
// twist around
assign FSL_M_Data [0:7] = DATA_MB[7:0]; 
assign FSL_M_Data [8:15] = DATA_MB[15:8];
assign FSL_M_Data [16:23] = DATA_MB[23:16];
assign FSL_M_Data [24:31] = DATA_MB[31:24];

assign OUTFG_Port [0:7] = DATA_MB[7:0];
assign OUTFG_Port [8:15] = DATA_MB[15:8];
assign OUTFG_Port [16:23] = DATA_MB[23:16];
assign OUTFG_Port [24:31] = DATA_MB[31:24];

assign XIL_NPI_Addr = ADDR_MB;
assign XIL_NPI_RdModWr = 1'b0; // does not have to be asserted
assign XIL_NPI_RNW = XIL_NPI_AddrReq;  // we will assert this to read when AddrReq is high


assign XIL_NPI_Size = 4'h0; //double word transfer, check MPMC datasheet for other mode 
assign XIL_NPI_WrFIFO_Flush = 1'b0;
assign XIL_NPI_WrFIFO_BE = 8'h00; // not writing

assign XIL_NPI_AddrReq = (state == FTDATA);

assign XIL_NPI_RdFIFO_Pop = (state == WAITEMP) & (~XIL_NPI_RdFIFO_Empty) & XIL_NPI_InitDone; // the FIFO_Empty flag should be 0 after pop is one

wire rst;
assign rst = !system_dcm_locked;

reg [1:0] latency_counter; // this counter is used to keep track of
			   // when to latch in the returned data
			   // from DRAM
reg startlat;
// In this module we will make both FSL_S_Clk and
// and FSL_M_Clk equivalent to the MPMC clock

always @(posedge FSL_S_Clk) 
   begin  
      if (FSL_Rst | rst)              
        begin
				state <= INIT;
				ADDR_MB <= 0;
				DATA_MB <= 0;
				latency_counter <=0;
				startlat <=0;
        end
      else
        case (state)
	INIT: 
		if (FSL_S_Exists == 1)
		begin
			state <= RDADDR;
		end
	RDADDR: 
		if (FSL_S_Exists == 1) 
		begin
			latency_counter <= XIL_NPI_RdFIFO_Latency;
			ADDR_MB <= FSL_S_Data;
			state <= FTDATA;
		end
	FTDATA: 
		if(XIL_NPI_AddrAck)
			state <= WAITEMP;
	WAITEMP:// we wait for the FIFO to be non-empty 
		begin
			if((~XIL_NPI_RdFIFO_Empty) & XIL_NPI_InitDone)
			  begin
			    if(latency_counter == 0)
					begin
					  DATA_MB <=  XIL_NPI_RdFIFO_Data[31:0];
					  state <= WRDATA;
					end
			    else
					begin
					  latency_counter <= latency_counter-1;
					  state <= WAITLAT; 
					end	
			  end				
		end
	WAITLAT:
		begin
			if(latency_counter == 0)
			  begin
				DATA_MB <=  XIL_NPI_RdFIFO_Data[31:0];
				state <= WRDATA;
			  end
			else
			  latency_counter <= latency_counter -1;
		end
	WRDATA:	 // the FSL_M_Clk would be the same as the FSL_S_Clk
		begin
			if (FSL_M_Full == 0)  
				state<= RDADDR;
		end
	default:
		state <= INIT;
        endcase
   end

	


endmodule