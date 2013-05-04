//-----------------------------------------------------------------------------
// system.v
//-----------------------------------------------------------------------------

module system
  (
    fpga_0_RS232_Uart_1_RX_pin,
    fpga_0_RS232_Uart_1_TX_pin,
    fpga_0_DDR2_SDRAM_DDR2_Clk_pin,
    fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin,
    fpga_0_DDR2_SDRAM_DDR2_CE_pin,
    fpga_0_DDR2_SDRAM_DDR2_CS_n_pin,
    fpga_0_DDR2_SDRAM_DDR2_ODT_pin,
    fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin,
    fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin,
    fpga_0_DDR2_SDRAM_DDR2_WE_n_pin,
    fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin,
    fpga_0_DDR2_SDRAM_DDR2_Addr_pin,
    fpga_0_DDR2_SDRAM_DDR2_DQ_pin,
    fpga_0_DDR2_SDRAM_DDR2_DM_pin,
    fpga_0_DDR2_SDRAM_DDR2_DQS_pin,
    fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin,
    fpga_0_clk_1_sys_clk_pin,
    fpga_0_rst_1_sys_rst_pin,
    readfgcop_0_OUTFG_Port_pin,
    readbgcop_0_OUTBG_Port_pin,
    clock_generator_0_CLKOUT4_pin,
    clock_generator_0_CLKOUT5_pin,
    clock_generator_0_CLKOUT6_pin,
    readbgcop_0_system_dcm_locked_pin,
    readbgcop_0_FSL_M_Write_pin,
    readfgcop_0_FSL_M_Write_pin,
    readfgcop_0_FSL_S_Read_pin,
    readbgcop_0_FSL_S_Read_pin,
    readbgcop_0_XIL_NPI_Addr_pin,
    readfgcop_0_XIL_NPI_Addr_pin
  );
  input fpga_0_RS232_Uart_1_RX_pin;
  output fpga_0_RS232_Uart_1_TX_pin;
  output [1:0] fpga_0_DDR2_SDRAM_DDR2_Clk_pin;
  output [1:0] fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin;
  output [1:0] fpga_0_DDR2_SDRAM_DDR2_CE_pin;
  output [1:0] fpga_0_DDR2_SDRAM_DDR2_CS_n_pin;
  output [1:0] fpga_0_DDR2_SDRAM_DDR2_ODT_pin;
  output fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin;
  output fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin;
  output fpga_0_DDR2_SDRAM_DDR2_WE_n_pin;
  output [1:0] fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin;
  output [12:0] fpga_0_DDR2_SDRAM_DDR2_Addr_pin;
  inout [63:0] fpga_0_DDR2_SDRAM_DDR2_DQ_pin;
  output [7:0] fpga_0_DDR2_SDRAM_DDR2_DM_pin;
  inout [7:0] fpga_0_DDR2_SDRAM_DDR2_DQS_pin;
  inout [7:0] fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin;
  input fpga_0_clk_1_sys_clk_pin;
  input fpga_0_rst_1_sys_rst_pin;
  output [0:31] readfgcop_0_OUTFG_Port_pin;
  output [0:31] readbgcop_0_OUTBG_Port_pin;
  output clock_generator_0_CLKOUT4_pin;
  output clock_generator_0_CLKOUT5_pin;
  output clock_generator_0_CLKOUT6_pin;
  output readbgcop_0_system_dcm_locked_pin;
  output readbgcop_0_FSL_M_Write_pin;
  output readfgcop_0_FSL_M_Write_pin;
  output readfgcop_0_FSL_S_Read_pin;
  output readbgcop_0_FSL_S_Read_pin;
  output [31:0] readbgcop_0_XIL_NPI_Addr_pin;
  output [31:0] readfgcop_0_XIL_NPI_Addr_pin;

  // Internal signals

  wire CLK_S;
  wire Dcm_all_locked;
  wire Debug_SYS_Rst;
  wire Ext_BRK;
  wire Ext_NM_BRK;
  wire [0:31] OUTBG_Port_net;
  wire [0:31] OUTFG_Port_net;
  wire clk_62_5000MHzPLL0;
  wire clk_125_0000MHz90PLL0;
  wire clk_125_0000MHzPLL0;
  wire clk_200_0000MHz;
  wire clock_generator_0_CLKOUT4;
  wire clock_generator_0_CLKOUT5;
  wire clock_generator_0_CLKOUT6;
  wire [0:31] dlmb_LMB_ABus;
  wire dlmb_LMB_AddrStrobe;
  wire [0:3] dlmb_LMB_BE;
  wire dlmb_LMB_CE;
  wire [0:31] dlmb_LMB_ReadDBus;
  wire dlmb_LMB_ReadStrobe;
  wire dlmb_LMB_Ready;
  wire dlmb_LMB_Rst;
  wire dlmb_LMB_UE;
  wire dlmb_LMB_Wait;
  wire [0:31] dlmb_LMB_WriteDBus;
  wire dlmb_LMB_WriteStrobe;
  wire [0:31] dlmb_M_ABus;
  wire dlmb_M_AddrStrobe;
  wire [0:3] dlmb_M_BE;
  wire [0:31] dlmb_M_DBus;
  wire dlmb_M_ReadStrobe;
  wire dlmb_M_WriteStrobe;
  wire [0:0] dlmb_Sl_CE;
  wire [0:31] dlmb_Sl_DBus;
  wire [0:0] dlmb_Sl_Ready;
  wire [0:0] dlmb_Sl_UE;
  wire [0:0] dlmb_Sl_Wait;
  wire [0:31] dlmb_port_BRAM_Addr;
  wire dlmb_port_BRAM_Clk;
  wire [0:31] dlmb_port_BRAM_Din;
  wire [0:31] dlmb_port_BRAM_Dout;
  wire dlmb_port_BRAM_EN;
  wire dlmb_port_BRAM_Rst;
  wire [0:3] dlmb_port_BRAM_WEN;
  wire [0:31] ilmb_LMB_ABus;
  wire ilmb_LMB_AddrStrobe;
  wire [0:3] ilmb_LMB_BE;
  wire ilmb_LMB_CE;
  wire [0:31] ilmb_LMB_ReadDBus;
  wire ilmb_LMB_ReadStrobe;
  wire ilmb_LMB_Ready;
  wire ilmb_LMB_Rst;
  wire ilmb_LMB_UE;
  wire ilmb_LMB_Wait;
  wire [0:31] ilmb_LMB_WriteDBus;
  wire ilmb_LMB_WriteStrobe;
  wire [0:31] ilmb_M_ABus;
  wire ilmb_M_AddrStrobe;
  wire ilmb_M_ReadStrobe;
  wire [0:0] ilmb_Sl_CE;
  wire [0:31] ilmb_Sl_DBus;
  wire [0:0] ilmb_Sl_Ready;
  wire [0:0] ilmb_Sl_UE;
  wire [0:0] ilmb_Sl_Wait;
  wire [0:31] ilmb_port_BRAM_Addr;
  wire ilmb_port_BRAM_Clk;
  wire [0:31] ilmb_port_BRAM_Din;
  wire [0:31] ilmb_port_BRAM_Dout;
  wire ilmb_port_BRAM_EN;
  wire ilmb_port_BRAM_Rst;
  wire [0:3] ilmb_port_BRAM_WEN;
  wire [0:1] mb_plb_M_ABort;
  wire [0:63] mb_plb_M_ABus;
  wire [0:15] mb_plb_M_BE;
  wire [0:3] mb_plb_M_MSize;
  wire [0:1] mb_plb_M_RNW;
  wire [0:31] mb_plb_M_TAttribute;
  wire [0:63] mb_plb_M_UABus;
  wire [0:1] mb_plb_M_busLock;
  wire [0:1] mb_plb_M_lockErr;
  wire [0:3] mb_plb_M_priority;
  wire [0:1] mb_plb_M_rdBurst;
  wire [0:1] mb_plb_M_request;
  wire [0:7] mb_plb_M_size;
  wire [0:5] mb_plb_M_type;
  wire [0:1] mb_plb_M_wrBurst;
  wire [0:127] mb_plb_M_wrDBus;
  wire [0:31] mb_plb_PLB_ABus;
  wire [0:7] mb_plb_PLB_BE;
  wire [0:1] mb_plb_PLB_MAddrAck;
  wire [0:1] mb_plb_PLB_MBusy;
  wire [0:1] mb_plb_PLB_MIRQ;
  wire [0:1] mb_plb_PLB_MRdBTerm;
  wire [0:1] mb_plb_PLB_MRdDAck;
  wire [0:127] mb_plb_PLB_MRdDBus;
  wire [0:1] mb_plb_PLB_MRdErr;
  wire [0:7] mb_plb_PLB_MRdWdAddr;
  wire [0:1] mb_plb_PLB_MRearbitrate;
  wire [0:3] mb_plb_PLB_MSSize;
  wire [0:1] mb_plb_PLB_MSize;
  wire [0:1] mb_plb_PLB_MTimeout;
  wire [0:1] mb_plb_PLB_MWrBTerm;
  wire [0:1] mb_plb_PLB_MWrDAck;
  wire [0:1] mb_plb_PLB_MWrErr;
  wire mb_plb_PLB_PAValid;
  wire mb_plb_PLB_RNW;
  wire mb_plb_PLB_SAValid;
  wire [0:15] mb_plb_PLB_TAttribute;
  wire [0:31] mb_plb_PLB_UABus;
  wire mb_plb_PLB_abort;
  wire mb_plb_PLB_busLock;
  wire mb_plb_PLB_lockErr;
  wire [0:0] mb_plb_PLB_masterID;
  wire mb_plb_PLB_rdBurst;
  wire [0:1] mb_plb_PLB_rdPendPri;
  wire mb_plb_PLB_rdPendReq;
  wire [0:2] mb_plb_PLB_rdPrim;
  wire [0:1] mb_plb_PLB_reqPri;
  wire [0:3] mb_plb_PLB_size;
  wire [0:2] mb_plb_PLB_type;
  wire mb_plb_PLB_wrBurst;
  wire [0:63] mb_plb_PLB_wrDBus;
  wire [0:1] mb_plb_PLB_wrPendPri;
  wire mb_plb_PLB_wrPendReq;
  wire [0:2] mb_plb_PLB_wrPrim;
  wire [0:2] mb_plb_SPLB_Rst;
  wire [0:5] mb_plb_Sl_MBusy;
  wire [0:5] mb_plb_Sl_MIRQ;
  wire [0:5] mb_plb_Sl_MRdErr;
  wire [0:5] mb_plb_Sl_MWrErr;
  wire [0:5] mb_plb_Sl_SSize;
  wire [0:2] mb_plb_Sl_addrAck;
  wire [0:2] mb_plb_Sl_rdBTerm;
  wire [0:2] mb_plb_Sl_rdComp;
  wire [0:2] mb_plb_Sl_rdDAck;
  wire [0:191] mb_plb_Sl_rdDBus;
  wire [0:11] mb_plb_Sl_rdWdAddr;
  wire [0:2] mb_plb_Sl_rearbitrate;
  wire [0:2] mb_plb_Sl_wait;
  wire [0:2] mb_plb_Sl_wrBTerm;
  wire [0:2] mb_plb_Sl_wrComp;
  wire [0:2] mb_plb_Sl_wrDAck;
  wire mb_reset;
  wire microblaze_0_mdm_bus_Dbg_Capture;
  wire microblaze_0_mdm_bus_Dbg_Clk;
  wire [0:7] microblaze_0_mdm_bus_Dbg_Reg_En;
  wire microblaze_0_mdm_bus_Dbg_Shift;
  wire microblaze_0_mdm_bus_Dbg_TDI;
  wire microblaze_0_mdm_bus_Dbg_TDO;
  wire microblaze_0_mdm_bus_Dbg_Update;
  wire microblaze_0_mdm_bus_Debug_Rst;
  wire microblaze_0_to_readbgcop_0_FSL_M_Control;
  wire [0:31] microblaze_0_to_readbgcop_0_FSL_M_Data;
  wire microblaze_0_to_readbgcop_0_FSL_M_Full;
  wire microblaze_0_to_readbgcop_0_FSL_M_Write;
  wire microblaze_0_to_readbgcop_0_FSL_S_Control;
  wire [0:31] microblaze_0_to_readbgcop_0_FSL_S_Data;
  wire microblaze_0_to_readbgcop_0_FSL_S_Exists;
  wire microblaze_0_to_readbgcop_0_FSL_S_Read;
  wire microblaze_0_to_readfgcop_0_FSL_M_Control;
  wire [0:31] microblaze_0_to_readfgcop_0_FSL_M_Data;
  wire microblaze_0_to_readfgcop_0_FSL_M_Full;
  wire microblaze_0_to_readfgcop_0_FSL_M_Write;
  wire microblaze_0_to_readfgcop_0_FSL_S_Control;
  wire [0:31] microblaze_0_to_readfgcop_0_FSL_S_Data;
  wire microblaze_0_to_readfgcop_0_FSL_S_Exists;
  wire microblaze_0_to_readfgcop_0_FSL_S_Read;
  wire microblaze_0_to_writecop_0_FSL_M_Control;
  wire [0:31] microblaze_0_to_writecop_0_FSL_M_Data;
  wire microblaze_0_to_writecop_0_FSL_M_Full;
  wire microblaze_0_to_writecop_0_FSL_M_Write;
  wire microblaze_0_to_writecop_0_FSL_S_Control;
  wire [0:31] microblaze_0_to_writecop_0_FSL_S_Data;
  wire microblaze_0_to_writecop_0_FSL_S_Exists;
  wire microblaze_0_to_writecop_0_FSL_S_Read;
  wire microblaze_0_to_writecop_0_LMB_Rst;
  wire net_gnd0;
  wire [0:0] net_gnd1;
  wire [1:0] net_gnd2;
  wire [0:2] net_gnd3;
  wire [0:3] net_gnd4;
  wire [5:0] net_gnd6;
  wire [0:7] net_gnd8;
  wire [0:9] net_gnd10;
  wire [0:15] net_gnd16;
  wire [29:0] net_gnd30;
  wire [0:31] net_gnd32;
  wire [0:35] net_gnd36;
  wire [0:63] net_gnd64;
  wire [0:127] net_gnd128;
  wire [0:4095] net_gnd4096;
  wire net_vcc0;
  wire [0:3] net_vcc4;
  wire [31:0] readbgcop_0_XIL_NPI_Addr;
  wire readbgcop_0_XIL_NPI_AddrAck;
  wire readbgcop_0_XIL_NPI_AddrReq;
  wire readbgcop_0_XIL_NPI_InitDone;
  wire [1:0] readbgcop_0_XIL_NPI_RDFIFO_Latency;
  wire readbgcop_0_XIL_NPI_RNW;
  wire [63:0] readbgcop_0_XIL_NPI_RdFIFO_Data;
  wire readbgcop_0_XIL_NPI_RdFIFO_Empty;
  wire readbgcop_0_XIL_NPI_RdFIFO_Flush;
  wire readbgcop_0_XIL_NPI_RdFIFO_Pop;
  wire [3:0] readbgcop_0_XIL_NPI_RdFIFO_RdWdAddr;
  wire readbgcop_0_XIL_NPI_RdModWr;
  wire [3:0] readbgcop_0_XIL_NPI_Size;
  wire readbgcop_0_XIL_NPI_WrFIFO_AlmostFull;
  wire [7:0] readbgcop_0_XIL_NPI_WrFIFO_BE;
  wire [63:0] readbgcop_0_XIL_NPI_WrFIFO_Data;
  wire readbgcop_0_XIL_NPI_WrFIFO_Empty;
  wire readbgcop_0_XIL_NPI_WrFIFO_Flush;
  wire readbgcop_0_XIL_NPI_WrFIFO_Push;
  wire readbgcop_0_to_microblaze_0_FSL_M_Control;
  wire [0:31] readbgcop_0_to_microblaze_0_FSL_M_Data;
  wire readbgcop_0_to_microblaze_0_FSL_M_Full;
  wire readbgcop_0_to_microblaze_0_FSL_M_Write;
  wire readbgcop_0_to_microblaze_0_FSL_S_Control;
  wire [0:31] readbgcop_0_to_microblaze_0_FSL_S_Data;
  wire readbgcop_0_to_microblaze_0_FSL_S_Exists;
  wire readbgcop_0_to_microblaze_0_FSL_S_Read;
  wire readbgcop_0_to_microblaze_0_LMB_Rst;
  wire [31:0] readfgcop_0_XIL_NPI_Addr;
  wire readfgcop_0_XIL_NPI_AddrAck;
  wire readfgcop_0_XIL_NPI_AddrReq;
  wire readfgcop_0_XIL_NPI_InitDone;
  wire [1:0] readfgcop_0_XIL_NPI_RDFIFO_Latency;
  wire readfgcop_0_XIL_NPI_RNW;
  wire [63:0] readfgcop_0_XIL_NPI_RdFIFO_Data;
  wire readfgcop_0_XIL_NPI_RdFIFO_Empty;
  wire readfgcop_0_XIL_NPI_RdFIFO_Flush;
  wire readfgcop_0_XIL_NPI_RdFIFO_Pop;
  wire [3:0] readfgcop_0_XIL_NPI_RdFIFO_RdWdAddr;
  wire readfgcop_0_XIL_NPI_RdModWr;
  wire [3:0] readfgcop_0_XIL_NPI_Size;
  wire readfgcop_0_XIL_NPI_WrFIFO_AlmostFull;
  wire [7:0] readfgcop_0_XIL_NPI_WrFIFO_BE;
  wire [63:0] readfgcop_0_XIL_NPI_WrFIFO_Data;
  wire readfgcop_0_XIL_NPI_WrFIFO_Empty;
  wire readfgcop_0_XIL_NPI_WrFIFO_Flush;
  wire readfgcop_0_XIL_NPI_WrFIFO_Push;
  wire readfgcop_0_to_microblaze_0_FSL_M_Control;
  wire [0:31] readfgcop_0_to_microblaze_0_FSL_M_Data;
  wire readfgcop_0_to_microblaze_0_FSL_M_Full;
  wire readfgcop_0_to_microblaze_0_FSL_M_Write;
  wire readfgcop_0_to_microblaze_0_FSL_S_Control;
  wire [0:31] readfgcop_0_to_microblaze_0_FSL_S_Data;
  wire readfgcop_0_to_microblaze_0_FSL_S_Exists;
  wire readfgcop_0_to_microblaze_0_FSL_S_Read;
  wire readfgcop_0_to_microblaze_0_LMB_Rst;
  wire [0:0] sys_bus_reset;
  wire [0:0] sys_periph_reset;
  wire sys_rst_s;
  wire [31:0] writecop_0_XIL_NPI_Addr;
  wire writecop_0_XIL_NPI_AddrAck;
  wire writecop_0_XIL_NPI_AddrReq;
  wire writecop_0_XIL_NPI_InitDone;
  wire [1:0] writecop_0_XIL_NPI_RDFIFO_Latency;
  wire writecop_0_XIL_NPI_RNW;
  wire [63:0] writecop_0_XIL_NPI_RdFIFO_Data;
  wire writecop_0_XIL_NPI_RdFIFO_Empty;
  wire writecop_0_XIL_NPI_RdFIFO_Flush;
  wire writecop_0_XIL_NPI_RdFIFO_Pop;
  wire [3:0] writecop_0_XIL_NPI_RdFIFO_RdWdAddr;
  wire writecop_0_XIL_NPI_RdModWr;
  wire [3:0] writecop_0_XIL_NPI_Size;
  wire writecop_0_XIL_NPI_WrFIFO_AlmostFull;
  wire [7:0] writecop_0_XIL_NPI_WrFIFO_BE;
  wire [63:0] writecop_0_XIL_NPI_WrFIFO_Data;
  wire writecop_0_XIL_NPI_WrFIFO_Empty;
  wire writecop_0_XIL_NPI_WrFIFO_Flush;
  wire writecop_0_XIL_NPI_WrFIFO_Push;

  // Internal assignments

  assign CLK_S = fpga_0_clk_1_sys_clk_pin;
  assign sys_rst_s = fpga_0_rst_1_sys_rst_pin;
  assign readfgcop_0_OUTFG_Port_pin = OUTFG_Port_net;
  assign readbgcop_0_OUTBG_Port_pin = OUTBG_Port_net;
  assign clock_generator_0_CLKOUT4_pin = clock_generator_0_CLKOUT4;
  assign clock_generator_0_CLKOUT5_pin = clock_generator_0_CLKOUT5;
  assign clock_generator_0_CLKOUT6_pin = clock_generator_0_CLKOUT6;
  assign readbgcop_0_system_dcm_locked_pin = Dcm_all_locked;
  assign readbgcop_0_FSL_M_Write_pin = readbgcop_0_to_microblaze_0_FSL_M_Write;
  assign readfgcop_0_FSL_M_Write_pin = readfgcop_0_to_microblaze_0_FSL_M_Write;
  assign readfgcop_0_FSL_S_Read_pin = microblaze_0_to_readfgcop_0_FSL_S_Read;
  assign readbgcop_0_FSL_S_Read_pin = microblaze_0_to_readbgcop_0_FSL_S_Read;
  assign readbgcop_0_XIL_NPI_Addr_pin = readbgcop_0_XIL_NPI_Addr;
  assign readfgcop_0_XIL_NPI_Addr_pin = readfgcop_0_XIL_NPI_Addr;
  assign net_gnd0 = 1'b0;
  assign net_gnd1[0:0] = 1'b0;
  assign net_gnd10[0:9] = 10'b0000000000;
  assign net_gnd128[0:127] = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  assign net_gnd16[0:15] = 16'b0000000000000000;
  assign net_gnd2[1:0] = 2'b00;
  assign net_gnd3[0:2] = 3'b000;
  assign net_gnd30[29:0] = 30'b000000000000000000000000000000;
  assign net_gnd32[0:31] = 32'b00000000000000000000000000000000;
  assign net_gnd36[0:35] = 36'b000000000000000000000000000000000000;
  assign net_gnd4[0:3] = 4'b0000;
  assign net_gnd4096[0:4095] = 4096'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  assign net_gnd6[5:0] = 6'b000000;
  assign net_gnd64[0:63] = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  assign net_gnd8[0:7] = 8'b00000000;
  assign net_vcc0 = 1'b1;
  assign net_vcc4[0:3] = 4'b1111;

  (* BOX_TYPE = "user_black_box" *)
  system_microblaze_0_wrapper
    microblaze_0 (
      .CLK ( clk_62_5000MHzPLL0 ),
      .RESET ( dlmb_LMB_Rst ),
      .MB_RESET ( mb_reset ),
      .INTERRUPT ( net_gnd0 ),
      .INTERRUPT_ADDRESS ( net_gnd32 ),
      .INTERRUPT_ACK (  ),
      .EXT_BRK ( Ext_BRK ),
      .EXT_NM_BRK ( Ext_NM_BRK ),
      .DBG_STOP ( net_gnd0 ),
      .MB_Halted (  ),
      .MB_Error (  ),
      .LOCKSTEP_MASTER_OUT (  ),
      .LOCKSTEP_SLAVE_IN ( net_gnd4096 ),
      .LOCKSTEP_OUT (  ),
      .INSTR ( ilmb_LMB_ReadDBus ),
      .IREADY ( ilmb_LMB_Ready ),
      .IWAIT ( ilmb_LMB_Wait ),
      .ICE ( ilmb_LMB_CE ),
      .IUE ( ilmb_LMB_UE ),
      .INSTR_ADDR ( ilmb_M_ABus ),
      .IFETCH ( ilmb_M_ReadStrobe ),
      .I_AS ( ilmb_M_AddrStrobe ),
      .IPLB_M_ABort ( mb_plb_M_ABort[1] ),
      .IPLB_M_ABus ( mb_plb_M_ABus[32:63] ),
      .IPLB_M_UABus ( mb_plb_M_UABus[32:63] ),
      .IPLB_M_BE ( mb_plb_M_BE[8:15] ),
      .IPLB_M_busLock ( mb_plb_M_busLock[1] ),
      .IPLB_M_lockErr ( mb_plb_M_lockErr[1] ),
      .IPLB_M_MSize ( mb_plb_M_MSize[2:3] ),
      .IPLB_M_priority ( mb_plb_M_priority[2:3] ),
      .IPLB_M_rdBurst ( mb_plb_M_rdBurst[1] ),
      .IPLB_M_request ( mb_plb_M_request[1] ),
      .IPLB_M_RNW ( mb_plb_M_RNW[1] ),
      .IPLB_M_size ( mb_plb_M_size[4:7] ),
      .IPLB_M_TAttribute ( mb_plb_M_TAttribute[16:31] ),
      .IPLB_M_type ( mb_plb_M_type[3:5] ),
      .IPLB_M_wrBurst ( mb_plb_M_wrBurst[1] ),
      .IPLB_M_wrDBus ( mb_plb_M_wrDBus[64:127] ),
      .IPLB_MBusy ( mb_plb_PLB_MBusy[1] ),
      .IPLB_MRdErr ( mb_plb_PLB_MRdErr[1] ),
      .IPLB_MWrErr ( mb_plb_PLB_MWrErr[1] ),
      .IPLB_MIRQ ( mb_plb_PLB_MIRQ[1] ),
      .IPLB_MWrBTerm ( mb_plb_PLB_MWrBTerm[1] ),
      .IPLB_MWrDAck ( mb_plb_PLB_MWrDAck[1] ),
      .IPLB_MAddrAck ( mb_plb_PLB_MAddrAck[1] ),
      .IPLB_MRdBTerm ( mb_plb_PLB_MRdBTerm[1] ),
      .IPLB_MRdDAck ( mb_plb_PLB_MRdDAck[1] ),
      .IPLB_MRdDBus ( mb_plb_PLB_MRdDBus[64:127] ),
      .IPLB_MRdWdAddr ( mb_plb_PLB_MRdWdAddr[4:7] ),
      .IPLB_MRearbitrate ( mb_plb_PLB_MRearbitrate[1] ),
      .IPLB_MSSize ( mb_plb_PLB_MSSize[2:3] ),
      .IPLB_MTimeout ( mb_plb_PLB_MTimeout[1] ),
      .DATA_READ ( dlmb_LMB_ReadDBus ),
      .DREADY ( dlmb_LMB_Ready ),
      .DWAIT ( dlmb_LMB_Wait ),
      .DCE ( dlmb_LMB_CE ),
      .DUE ( dlmb_LMB_UE ),
      .DATA_WRITE ( dlmb_M_DBus ),
      .DATA_ADDR ( dlmb_M_ABus ),
      .D_AS ( dlmb_M_AddrStrobe ),
      .READ_STROBE ( dlmb_M_ReadStrobe ),
      .WRITE_STROBE ( dlmb_M_WriteStrobe ),
      .BYTE_ENABLE ( dlmb_M_BE ),
      .DPLB_M_ABort ( mb_plb_M_ABort[0] ),
      .DPLB_M_ABus ( mb_plb_M_ABus[0:31] ),
      .DPLB_M_UABus ( mb_plb_M_UABus[0:31] ),
      .DPLB_M_BE ( mb_plb_M_BE[0:7] ),
      .DPLB_M_busLock ( mb_plb_M_busLock[0] ),
      .DPLB_M_lockErr ( mb_plb_M_lockErr[0] ),
      .DPLB_M_MSize ( mb_plb_M_MSize[0:1] ),
      .DPLB_M_priority ( mb_plb_M_priority[0:1] ),
      .DPLB_M_rdBurst ( mb_plb_M_rdBurst[0] ),
      .DPLB_M_request ( mb_plb_M_request[0] ),
      .DPLB_M_RNW ( mb_plb_M_RNW[0] ),
      .DPLB_M_size ( mb_plb_M_size[0:3] ),
      .DPLB_M_TAttribute ( mb_plb_M_TAttribute[0:15] ),
      .DPLB_M_type ( mb_plb_M_type[0:2] ),
      .DPLB_M_wrBurst ( mb_plb_M_wrBurst[0] ),
      .DPLB_M_wrDBus ( mb_plb_M_wrDBus[0:63] ),
      .DPLB_MBusy ( mb_plb_PLB_MBusy[0] ),
      .DPLB_MRdErr ( mb_plb_PLB_MRdErr[0] ),
      .DPLB_MWrErr ( mb_plb_PLB_MWrErr[0] ),
      .DPLB_MIRQ ( mb_plb_PLB_MIRQ[0] ),
      .DPLB_MWrBTerm ( mb_plb_PLB_MWrBTerm[0] ),
      .DPLB_MWrDAck ( mb_plb_PLB_MWrDAck[0] ),
      .DPLB_MAddrAck ( mb_plb_PLB_MAddrAck[0] ),
      .DPLB_MRdBTerm ( mb_plb_PLB_MRdBTerm[0] ),
      .DPLB_MRdDAck ( mb_plb_PLB_MRdDAck[0] ),
      .DPLB_MRdDBus ( mb_plb_PLB_MRdDBus[0:63] ),
      .DPLB_MRdWdAddr ( mb_plb_PLB_MRdWdAddr[0:3] ),
      .DPLB_MRearbitrate ( mb_plb_PLB_MRearbitrate[0] ),
      .DPLB_MSSize ( mb_plb_PLB_MSSize[0:1] ),
      .DPLB_MTimeout ( mb_plb_PLB_MTimeout[0] ),
      .M_AXI_IP_AWID (  ),
      .M_AXI_IP_AWADDR (  ),
      .M_AXI_IP_AWLEN (  ),
      .M_AXI_IP_AWSIZE (  ),
      .M_AXI_IP_AWBURST (  ),
      .M_AXI_IP_AWLOCK (  ),
      .M_AXI_IP_AWCACHE (  ),
      .M_AXI_IP_AWPROT (  ),
      .M_AXI_IP_AWQOS (  ),
      .M_AXI_IP_AWVALID (  ),
      .M_AXI_IP_AWREADY ( net_gnd0 ),
      .M_AXI_IP_WDATA (  ),
      .M_AXI_IP_WSTRB (  ),
      .M_AXI_IP_WLAST (  ),
      .M_AXI_IP_WVALID (  ),
      .M_AXI_IP_WREADY ( net_gnd0 ),
      .M_AXI_IP_BID ( net_gnd1[0:0] ),
      .M_AXI_IP_BRESP ( net_gnd2 ),
      .M_AXI_IP_BVALID ( net_gnd0 ),
      .M_AXI_IP_BREADY (  ),
      .M_AXI_IP_ARID (  ),
      .M_AXI_IP_ARADDR (  ),
      .M_AXI_IP_ARLEN (  ),
      .M_AXI_IP_ARSIZE (  ),
      .M_AXI_IP_ARBURST (  ),
      .M_AXI_IP_ARLOCK (  ),
      .M_AXI_IP_ARCACHE (  ),
      .M_AXI_IP_ARPROT (  ),
      .M_AXI_IP_ARQOS (  ),
      .M_AXI_IP_ARVALID (  ),
      .M_AXI_IP_ARREADY ( net_gnd0 ),
      .M_AXI_IP_RID ( net_gnd1[0:0] ),
      .M_AXI_IP_RDATA ( net_gnd32[0:31] ),
      .M_AXI_IP_RRESP ( net_gnd2 ),
      .M_AXI_IP_RLAST ( net_gnd0 ),
      .M_AXI_IP_RVALID ( net_gnd0 ),
      .M_AXI_IP_RREADY (  ),
      .M_AXI_DP_AWID (  ),
      .M_AXI_DP_AWADDR (  ),
      .M_AXI_DP_AWLEN (  ),
      .M_AXI_DP_AWSIZE (  ),
      .M_AXI_DP_AWBURST (  ),
      .M_AXI_DP_AWLOCK (  ),
      .M_AXI_DP_AWCACHE (  ),
      .M_AXI_DP_AWPROT (  ),
      .M_AXI_DP_AWQOS (  ),
      .M_AXI_DP_AWVALID (  ),
      .M_AXI_DP_AWREADY ( net_gnd0 ),
      .M_AXI_DP_WDATA (  ),
      .M_AXI_DP_WSTRB (  ),
      .M_AXI_DP_WLAST (  ),
      .M_AXI_DP_WVALID (  ),
      .M_AXI_DP_WREADY ( net_gnd0 ),
      .M_AXI_DP_BID ( net_gnd1[0:0] ),
      .M_AXI_DP_BRESP ( net_gnd2 ),
      .M_AXI_DP_BVALID ( net_gnd0 ),
      .M_AXI_DP_BREADY (  ),
      .M_AXI_DP_ARID (  ),
      .M_AXI_DP_ARADDR (  ),
      .M_AXI_DP_ARLEN (  ),
      .M_AXI_DP_ARSIZE (  ),
      .M_AXI_DP_ARBURST (  ),
      .M_AXI_DP_ARLOCK (  ),
      .M_AXI_DP_ARCACHE (  ),
      .M_AXI_DP_ARPROT (  ),
      .M_AXI_DP_ARQOS (  ),
      .M_AXI_DP_ARVALID (  ),
      .M_AXI_DP_ARREADY ( net_gnd0 ),
      .M_AXI_DP_RID ( net_gnd1[0:0] ),
      .M_AXI_DP_RDATA ( net_gnd32[0:31] ),
      .M_AXI_DP_RRESP ( net_gnd2 ),
      .M_AXI_DP_RLAST ( net_gnd0 ),
      .M_AXI_DP_RVALID ( net_gnd0 ),
      .M_AXI_DP_RREADY (  ),
      .M_AXI_IC_AWID (  ),
      .M_AXI_IC_AWADDR (  ),
      .M_AXI_IC_AWLEN (  ),
      .M_AXI_IC_AWSIZE (  ),
      .M_AXI_IC_AWBURST (  ),
      .M_AXI_IC_AWLOCK (  ),
      .M_AXI_IC_AWCACHE (  ),
      .M_AXI_IC_AWPROT (  ),
      .M_AXI_IC_AWQOS (  ),
      .M_AXI_IC_AWVALID (  ),
      .M_AXI_IC_AWREADY ( net_gnd0 ),
      .M_AXI_IC_AWUSER (  ),
      .M_AXI_IC_WDATA (  ),
      .M_AXI_IC_WSTRB (  ),
      .M_AXI_IC_WLAST (  ),
      .M_AXI_IC_WVALID (  ),
      .M_AXI_IC_WREADY ( net_gnd0 ),
      .M_AXI_IC_WUSER (  ),
      .M_AXI_IC_BID ( net_gnd1[0:0] ),
      .M_AXI_IC_BRESP ( net_gnd2 ),
      .M_AXI_IC_BVALID ( net_gnd0 ),
      .M_AXI_IC_BREADY (  ),
      .M_AXI_IC_BUSER ( net_gnd1[0:0] ),
      .M_AXI_IC_ARID (  ),
      .M_AXI_IC_ARADDR (  ),
      .M_AXI_IC_ARLEN (  ),
      .M_AXI_IC_ARSIZE (  ),
      .M_AXI_IC_ARBURST (  ),
      .M_AXI_IC_ARLOCK (  ),
      .M_AXI_IC_ARCACHE (  ),
      .M_AXI_IC_ARPROT (  ),
      .M_AXI_IC_ARQOS (  ),
      .M_AXI_IC_ARVALID (  ),
      .M_AXI_IC_ARREADY ( net_gnd0 ),
      .M_AXI_IC_ARUSER (  ),
      .M_AXI_IC_RID ( net_gnd1[0:0] ),
      .M_AXI_IC_RDATA ( net_gnd32[0:31] ),
      .M_AXI_IC_RRESP ( net_gnd2 ),
      .M_AXI_IC_RLAST ( net_gnd0 ),
      .M_AXI_IC_RVALID ( net_gnd0 ),
      .M_AXI_IC_RREADY (  ),
      .M_AXI_IC_RUSER ( net_gnd1[0:0] ),
      .M_AXI_DC_AWID (  ),
      .M_AXI_DC_AWADDR (  ),
      .M_AXI_DC_AWLEN (  ),
      .M_AXI_DC_AWSIZE (  ),
      .M_AXI_DC_AWBURST (  ),
      .M_AXI_DC_AWLOCK (  ),
      .M_AXI_DC_AWCACHE (  ),
      .M_AXI_DC_AWPROT (  ),
      .M_AXI_DC_AWQOS (  ),
      .M_AXI_DC_AWVALID (  ),
      .M_AXI_DC_AWREADY ( net_gnd0 ),
      .M_AXI_DC_AWUSER (  ),
      .M_AXI_DC_WDATA (  ),
      .M_AXI_DC_WSTRB (  ),
      .M_AXI_DC_WLAST (  ),
      .M_AXI_DC_WVALID (  ),
      .M_AXI_DC_WREADY ( net_gnd0 ),
      .M_AXI_DC_WUSER (  ),
      .M_AXI_DC_BID ( net_gnd1[0:0] ),
      .M_AXI_DC_BRESP ( net_gnd2 ),
      .M_AXI_DC_BVALID ( net_gnd0 ),
      .M_AXI_DC_BREADY (  ),
      .M_AXI_DC_BUSER ( net_gnd1[0:0] ),
      .M_AXI_DC_ARID (  ),
      .M_AXI_DC_ARADDR (  ),
      .M_AXI_DC_ARLEN (  ),
      .M_AXI_DC_ARSIZE (  ),
      .M_AXI_DC_ARBURST (  ),
      .M_AXI_DC_ARLOCK (  ),
      .M_AXI_DC_ARCACHE (  ),
      .M_AXI_DC_ARPROT (  ),
      .M_AXI_DC_ARQOS (  ),
      .M_AXI_DC_ARVALID (  ),
      .M_AXI_DC_ARREADY ( net_gnd0 ),
      .M_AXI_DC_ARUSER (  ),
      .M_AXI_DC_RID ( net_gnd1[0:0] ),
      .M_AXI_DC_RDATA ( net_gnd32[0:31] ),
      .M_AXI_DC_RRESP ( net_gnd2 ),
      .M_AXI_DC_RLAST ( net_gnd0 ),
      .M_AXI_DC_RVALID ( net_gnd0 ),
      .M_AXI_DC_RREADY (  ),
      .M_AXI_DC_RUSER ( net_gnd1[0:0] ),
      .DBG_CLK ( microblaze_0_mdm_bus_Dbg_Clk ),
      .DBG_TDI ( microblaze_0_mdm_bus_Dbg_TDI ),
      .DBG_TDO ( microblaze_0_mdm_bus_Dbg_TDO ),
      .DBG_REG_EN ( microblaze_0_mdm_bus_Dbg_Reg_En ),
      .DBG_SHIFT ( microblaze_0_mdm_bus_Dbg_Shift ),
      .DBG_CAPTURE ( microblaze_0_mdm_bus_Dbg_Capture ),
      .DBG_UPDATE ( microblaze_0_mdm_bus_Dbg_Update ),
      .DEBUG_RST ( microblaze_0_mdm_bus_Debug_Rst ),
      .Trace_Instruction (  ),
      .Trace_Valid_Instr (  ),
      .Trace_PC (  ),
      .Trace_Reg_Write (  ),
      .Trace_Reg_Addr (  ),
      .Trace_MSR_Reg (  ),
      .Trace_PID_Reg (  ),
      .Trace_New_Reg_Value (  ),
      .Trace_Exception_Taken (  ),
      .Trace_Exception_Kind (  ),
      .Trace_Jump_Taken (  ),
      .Trace_Delay_Slot (  ),
      .Trace_Data_Address (  ),
      .Trace_Data_Access (  ),
      .Trace_Data_Read (  ),
      .Trace_Data_Write (  ),
      .Trace_Data_Write_Value (  ),
      .Trace_Data_Byte_Enable (  ),
      .Trace_DCache_Req (  ),
      .Trace_DCache_Hit (  ),
      .Trace_DCache_Rdy (  ),
      .Trace_DCache_Read (  ),
      .Trace_ICache_Req (  ),
      .Trace_ICache_Hit (  ),
      .Trace_ICache_Rdy (  ),
      .Trace_OF_PipeRun (  ),
      .Trace_EX_PipeRun (  ),
      .Trace_MEM_PipeRun (  ),
      .Trace_MB_Halted (  ),
      .Trace_Jump_Hit (  ),
      .FSL0_S_CLK (  ),
      .FSL0_S_READ ( readbgcop_0_to_microblaze_0_FSL_S_Read ),
      .FSL0_S_DATA ( readbgcop_0_to_microblaze_0_FSL_S_Data ),
      .FSL0_S_CONTROL ( readbgcop_0_to_microblaze_0_FSL_S_Control ),
      .FSL0_S_EXISTS ( readbgcop_0_to_microblaze_0_FSL_S_Exists ),
      .FSL0_M_CLK (  ),
      .FSL0_M_WRITE ( microblaze_0_to_readbgcop_0_FSL_M_Write ),
      .FSL0_M_DATA ( microblaze_0_to_readbgcop_0_FSL_M_Data ),
      .FSL0_M_CONTROL ( microblaze_0_to_readbgcop_0_FSL_M_Control ),
      .FSL0_M_FULL ( microblaze_0_to_readbgcop_0_FSL_M_Full ),
      .FSL1_S_CLK (  ),
      .FSL1_S_READ ( readfgcop_0_to_microblaze_0_FSL_S_Read ),
      .FSL1_S_DATA ( readfgcop_0_to_microblaze_0_FSL_S_Data ),
      .FSL1_S_CONTROL ( readfgcop_0_to_microblaze_0_FSL_S_Control ),
      .FSL1_S_EXISTS ( readfgcop_0_to_microblaze_0_FSL_S_Exists ),
      .FSL1_M_CLK (  ),
      .FSL1_M_WRITE ( microblaze_0_to_readfgcop_0_FSL_M_Write ),
      .FSL1_M_DATA ( microblaze_0_to_readfgcop_0_FSL_M_Data ),
      .FSL1_M_CONTROL ( microblaze_0_to_readfgcop_0_FSL_M_Control ),
      .FSL1_M_FULL ( microblaze_0_to_readfgcop_0_FSL_M_Full ),
      .FSL2_S_CLK (  ),
      .FSL2_S_READ (  ),
      .FSL2_S_DATA ( net_gnd32 ),
      .FSL2_S_CONTROL ( net_gnd0 ),
      .FSL2_S_EXISTS ( net_gnd0 ),
      .FSL2_M_CLK (  ),
      .FSL2_M_WRITE ( microblaze_0_to_writecop_0_FSL_M_Write ),
      .FSL2_M_DATA ( microblaze_0_to_writecop_0_FSL_M_Data ),
      .FSL2_M_CONTROL ( microblaze_0_to_writecop_0_FSL_M_Control ),
      .FSL2_M_FULL ( microblaze_0_to_writecop_0_FSL_M_Full ),
      .FSL3_S_CLK (  ),
      .FSL3_S_READ (  ),
      .FSL3_S_DATA ( net_gnd32 ),
      .FSL3_S_CONTROL ( net_gnd0 ),
      .FSL3_S_EXISTS ( net_gnd0 ),
      .FSL3_M_CLK (  ),
      .FSL3_M_WRITE (  ),
      .FSL3_M_DATA (  ),
      .FSL3_M_CONTROL (  ),
      .FSL3_M_FULL ( net_gnd0 ),
      .FSL4_S_CLK (  ),
      .FSL4_S_READ (  ),
      .FSL4_S_DATA ( net_gnd32 ),
      .FSL4_S_CONTROL ( net_gnd0 ),
      .FSL4_S_EXISTS ( net_gnd0 ),
      .FSL4_M_CLK (  ),
      .FSL4_M_WRITE (  ),
      .FSL4_M_DATA (  ),
      .FSL4_M_CONTROL (  ),
      .FSL4_M_FULL ( net_gnd0 ),
      .FSL5_S_CLK (  ),
      .FSL5_S_READ (  ),
      .FSL5_S_DATA ( net_gnd32 ),
      .FSL5_S_CONTROL ( net_gnd0 ),
      .FSL5_S_EXISTS ( net_gnd0 ),
      .FSL5_M_CLK (  ),
      .FSL5_M_WRITE (  ),
      .FSL5_M_DATA (  ),
      .FSL5_M_CONTROL (  ),
      .FSL5_M_FULL ( net_gnd0 ),
      .FSL6_S_CLK (  ),
      .FSL6_S_READ (  ),
      .FSL6_S_DATA ( net_gnd32 ),
      .FSL6_S_CONTROL ( net_gnd0 ),
      .FSL6_S_EXISTS ( net_gnd0 ),
      .FSL6_M_CLK (  ),
      .FSL6_M_WRITE (  ),
      .FSL6_M_DATA (  ),
      .FSL6_M_CONTROL (  ),
      .FSL6_M_FULL ( net_gnd0 ),
      .FSL7_S_CLK (  ),
      .FSL7_S_READ (  ),
      .FSL7_S_DATA ( net_gnd32 ),
      .FSL7_S_CONTROL ( net_gnd0 ),
      .FSL7_S_EXISTS ( net_gnd0 ),
      .FSL7_M_CLK (  ),
      .FSL7_M_WRITE (  ),
      .FSL7_M_DATA (  ),
      .FSL7_M_CONTROL (  ),
      .FSL7_M_FULL ( net_gnd0 ),
      .FSL8_S_CLK (  ),
      .FSL8_S_READ (  ),
      .FSL8_S_DATA ( net_gnd32 ),
      .FSL8_S_CONTROL ( net_gnd0 ),
      .FSL8_S_EXISTS ( net_gnd0 ),
      .FSL8_M_CLK (  ),
      .FSL8_M_WRITE (  ),
      .FSL8_M_DATA (  ),
      .FSL8_M_CONTROL (  ),
      .FSL8_M_FULL ( net_gnd0 ),
      .FSL9_S_CLK (  ),
      .FSL9_S_READ (  ),
      .FSL9_S_DATA ( net_gnd32 ),
      .FSL9_S_CONTROL ( net_gnd0 ),
      .FSL9_S_EXISTS ( net_gnd0 ),
      .FSL9_M_CLK (  ),
      .FSL9_M_WRITE (  ),
      .FSL9_M_DATA (  ),
      .FSL9_M_CONTROL (  ),
      .FSL9_M_FULL ( net_gnd0 ),
      .FSL10_S_CLK (  ),
      .FSL10_S_READ (  ),
      .FSL10_S_DATA ( net_gnd32 ),
      .FSL10_S_CONTROL ( net_gnd0 ),
      .FSL10_S_EXISTS ( net_gnd0 ),
      .FSL10_M_CLK (  ),
      .FSL10_M_WRITE (  ),
      .FSL10_M_DATA (  ),
      .FSL10_M_CONTROL (  ),
      .FSL10_M_FULL ( net_gnd0 ),
      .FSL11_S_CLK (  ),
      .FSL11_S_READ (  ),
      .FSL11_S_DATA ( net_gnd32 ),
      .FSL11_S_CONTROL ( net_gnd0 ),
      .FSL11_S_EXISTS ( net_gnd0 ),
      .FSL11_M_CLK (  ),
      .FSL11_M_WRITE (  ),
      .FSL11_M_DATA (  ),
      .FSL11_M_CONTROL (  ),
      .FSL11_M_FULL ( net_gnd0 ),
      .FSL12_S_CLK (  ),
      .FSL12_S_READ (  ),
      .FSL12_S_DATA ( net_gnd32 ),
      .FSL12_S_CONTROL ( net_gnd0 ),
      .FSL12_S_EXISTS ( net_gnd0 ),
      .FSL12_M_CLK (  ),
      .FSL12_M_WRITE (  ),
      .FSL12_M_DATA (  ),
      .FSL12_M_CONTROL (  ),
      .FSL12_M_FULL ( net_gnd0 ),
      .FSL13_S_CLK (  ),
      .FSL13_S_READ (  ),
      .FSL13_S_DATA ( net_gnd32 ),
      .FSL13_S_CONTROL ( net_gnd0 ),
      .FSL13_S_EXISTS ( net_gnd0 ),
      .FSL13_M_CLK (  ),
      .FSL13_M_WRITE (  ),
      .FSL13_M_DATA (  ),
      .FSL13_M_CONTROL (  ),
      .FSL13_M_FULL ( net_gnd0 ),
      .FSL14_S_CLK (  ),
      .FSL14_S_READ (  ),
      .FSL14_S_DATA ( net_gnd32 ),
      .FSL14_S_CONTROL ( net_gnd0 ),
      .FSL14_S_EXISTS ( net_gnd0 ),
      .FSL14_M_CLK (  ),
      .FSL14_M_WRITE (  ),
      .FSL14_M_DATA (  ),
      .FSL14_M_CONTROL (  ),
      .FSL14_M_FULL ( net_gnd0 ),
      .FSL15_S_CLK (  ),
      .FSL15_S_READ (  ),
      .FSL15_S_DATA ( net_gnd32 ),
      .FSL15_S_CONTROL ( net_gnd0 ),
      .FSL15_S_EXISTS ( net_gnd0 ),
      .FSL15_M_CLK (  ),
      .FSL15_M_WRITE (  ),
      .FSL15_M_DATA (  ),
      .FSL15_M_CONTROL (  ),
      .FSL15_M_FULL ( net_gnd0 ),
      .M0_AXIS_TLAST (  ),
      .M0_AXIS_TDATA (  ),
      .M0_AXIS_TVALID (  ),
      .M0_AXIS_TREADY ( net_gnd0 ),
      .S0_AXIS_TLAST ( net_gnd0 ),
      .S0_AXIS_TDATA ( net_gnd32[0:31] ),
      .S0_AXIS_TVALID ( net_gnd0 ),
      .S0_AXIS_TREADY (  ),
      .M1_AXIS_TLAST (  ),
      .M1_AXIS_TDATA (  ),
      .M1_AXIS_TVALID (  ),
      .M1_AXIS_TREADY ( net_gnd0 ),
      .S1_AXIS_TLAST ( net_gnd0 ),
      .S1_AXIS_TDATA ( net_gnd32[0:31] ),
      .S1_AXIS_TVALID ( net_gnd0 ),
      .S1_AXIS_TREADY (  ),
      .M2_AXIS_TLAST (  ),
      .M2_AXIS_TDATA (  ),
      .M2_AXIS_TVALID (  ),
      .M2_AXIS_TREADY ( net_gnd0 ),
      .S2_AXIS_TLAST ( net_gnd0 ),
      .S2_AXIS_TDATA ( net_gnd32[0:31] ),
      .S2_AXIS_TVALID ( net_gnd0 ),
      .S2_AXIS_TREADY (  ),
      .M3_AXIS_TLAST (  ),
      .M3_AXIS_TDATA (  ),
      .M3_AXIS_TVALID (  ),
      .M3_AXIS_TREADY ( net_gnd0 ),
      .S3_AXIS_TLAST ( net_gnd0 ),
      .S3_AXIS_TDATA ( net_gnd32[0:31] ),
      .S3_AXIS_TVALID ( net_gnd0 ),
      .S3_AXIS_TREADY (  ),
      .M4_AXIS_TLAST (  ),
      .M4_AXIS_TDATA (  ),
      .M4_AXIS_TVALID (  ),
      .M4_AXIS_TREADY ( net_gnd0 ),
      .S4_AXIS_TLAST ( net_gnd0 ),
      .S4_AXIS_TDATA ( net_gnd32[0:31] ),
      .S4_AXIS_TVALID ( net_gnd0 ),
      .S4_AXIS_TREADY (  ),
      .M5_AXIS_TLAST (  ),
      .M5_AXIS_TDATA (  ),
      .M5_AXIS_TVALID (  ),
      .M5_AXIS_TREADY ( net_gnd0 ),
      .S5_AXIS_TLAST ( net_gnd0 ),
      .S5_AXIS_TDATA ( net_gnd32[0:31] ),
      .S5_AXIS_TVALID ( net_gnd0 ),
      .S5_AXIS_TREADY (  ),
      .M6_AXIS_TLAST (  ),
      .M6_AXIS_TDATA (  ),
      .M6_AXIS_TVALID (  ),
      .M6_AXIS_TREADY ( net_gnd0 ),
      .S6_AXIS_TLAST ( net_gnd0 ),
      .S6_AXIS_TDATA ( net_gnd32[0:31] ),
      .S6_AXIS_TVALID ( net_gnd0 ),
      .S6_AXIS_TREADY (  ),
      .M7_AXIS_TLAST (  ),
      .M7_AXIS_TDATA (  ),
      .M7_AXIS_TVALID (  ),
      .M7_AXIS_TREADY ( net_gnd0 ),
      .S7_AXIS_TLAST ( net_gnd0 ),
      .S7_AXIS_TDATA ( net_gnd32[0:31] ),
      .S7_AXIS_TVALID ( net_gnd0 ),
      .S7_AXIS_TREADY (  ),
      .M8_AXIS_TLAST (  ),
      .M8_AXIS_TDATA (  ),
      .M8_AXIS_TVALID (  ),
      .M8_AXIS_TREADY ( net_gnd0 ),
      .S8_AXIS_TLAST ( net_gnd0 ),
      .S8_AXIS_TDATA ( net_gnd32[0:31] ),
      .S8_AXIS_TVALID ( net_gnd0 ),
      .S8_AXIS_TREADY (  ),
      .M9_AXIS_TLAST (  ),
      .M9_AXIS_TDATA (  ),
      .M9_AXIS_TVALID (  ),
      .M9_AXIS_TREADY ( net_gnd0 ),
      .S9_AXIS_TLAST ( net_gnd0 ),
      .S9_AXIS_TDATA ( net_gnd32[0:31] ),
      .S9_AXIS_TVALID ( net_gnd0 ),
      .S9_AXIS_TREADY (  ),
      .M10_AXIS_TLAST (  ),
      .M10_AXIS_TDATA (  ),
      .M10_AXIS_TVALID (  ),
      .M10_AXIS_TREADY ( net_gnd0 ),
      .S10_AXIS_TLAST ( net_gnd0 ),
      .S10_AXIS_TDATA ( net_gnd32[0:31] ),
      .S10_AXIS_TVALID ( net_gnd0 ),
      .S10_AXIS_TREADY (  ),
      .M11_AXIS_TLAST (  ),
      .M11_AXIS_TDATA (  ),
      .M11_AXIS_TVALID (  ),
      .M11_AXIS_TREADY ( net_gnd0 ),
      .S11_AXIS_TLAST ( net_gnd0 ),
      .S11_AXIS_TDATA ( net_gnd32[0:31] ),
      .S11_AXIS_TVALID ( net_gnd0 ),
      .S11_AXIS_TREADY (  ),
      .M12_AXIS_TLAST (  ),
      .M12_AXIS_TDATA (  ),
      .M12_AXIS_TVALID (  ),
      .M12_AXIS_TREADY ( net_gnd0 ),
      .S12_AXIS_TLAST ( net_gnd0 ),
      .S12_AXIS_TDATA ( net_gnd32[0:31] ),
      .S12_AXIS_TVALID ( net_gnd0 ),
      .S12_AXIS_TREADY (  ),
      .M13_AXIS_TLAST (  ),
      .M13_AXIS_TDATA (  ),
      .M13_AXIS_TVALID (  ),
      .M13_AXIS_TREADY ( net_gnd0 ),
      .S13_AXIS_TLAST ( net_gnd0 ),
      .S13_AXIS_TDATA ( net_gnd32[0:31] ),
      .S13_AXIS_TVALID ( net_gnd0 ),
      .S13_AXIS_TREADY (  ),
      .M14_AXIS_TLAST (  ),
      .M14_AXIS_TDATA (  ),
      .M14_AXIS_TVALID (  ),
      .M14_AXIS_TREADY ( net_gnd0 ),
      .S14_AXIS_TLAST ( net_gnd0 ),
      .S14_AXIS_TDATA ( net_gnd32[0:31] ),
      .S14_AXIS_TVALID ( net_gnd0 ),
      .S14_AXIS_TREADY (  ),
      .M15_AXIS_TLAST (  ),
      .M15_AXIS_TDATA (  ),
      .M15_AXIS_TVALID (  ),
      .M15_AXIS_TREADY ( net_gnd0 ),
      .S15_AXIS_TLAST ( net_gnd0 ),
      .S15_AXIS_TDATA ( net_gnd32[0:31] ),
      .S15_AXIS_TVALID ( net_gnd0 ),
      .S15_AXIS_TREADY (  ),
      .ICACHE_FSL_IN_CLK (  ),
      .ICACHE_FSL_IN_READ (  ),
      .ICACHE_FSL_IN_DATA ( net_gnd32 ),
      .ICACHE_FSL_IN_CONTROL ( net_gnd0 ),
      .ICACHE_FSL_IN_EXISTS ( net_gnd0 ),
      .ICACHE_FSL_OUT_CLK (  ),
      .ICACHE_FSL_OUT_WRITE (  ),
      .ICACHE_FSL_OUT_DATA (  ),
      .ICACHE_FSL_OUT_CONTROL (  ),
      .ICACHE_FSL_OUT_FULL ( net_gnd0 ),
      .DCACHE_FSL_IN_CLK (  ),
      .DCACHE_FSL_IN_READ (  ),
      .DCACHE_FSL_IN_DATA ( net_gnd32 ),
      .DCACHE_FSL_IN_CONTROL ( net_gnd0 ),
      .DCACHE_FSL_IN_EXISTS ( net_gnd0 ),
      .DCACHE_FSL_OUT_CLK (  ),
      .DCACHE_FSL_OUT_WRITE (  ),
      .DCACHE_FSL_OUT_DATA (  ),
      .DCACHE_FSL_OUT_CONTROL (  ),
      .DCACHE_FSL_OUT_FULL ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_mb_plb_wrapper
    mb_plb (
      .PLB_Clk ( clk_62_5000MHzPLL0 ),
      .SYS_Rst ( sys_bus_reset[0] ),
      .PLB_Rst (  ),
      .SPLB_Rst ( mb_plb_SPLB_Rst ),
      .MPLB_Rst (  ),
      .PLB_dcrAck (  ),
      .PLB_dcrDBus (  ),
      .DCR_ABus ( net_gnd10 ),
      .DCR_DBus ( net_gnd32 ),
      .DCR_Read ( net_gnd0 ),
      .DCR_Write ( net_gnd0 ),
      .M_ABus ( mb_plb_M_ABus ),
      .M_UABus ( mb_plb_M_UABus ),
      .M_BE ( mb_plb_M_BE ),
      .M_RNW ( mb_plb_M_RNW ),
      .M_abort ( mb_plb_M_ABort ),
      .M_busLock ( mb_plb_M_busLock ),
      .M_TAttribute ( mb_plb_M_TAttribute ),
      .M_lockErr ( mb_plb_M_lockErr ),
      .M_MSize ( mb_plb_M_MSize ),
      .M_priority ( mb_plb_M_priority ),
      .M_rdBurst ( mb_plb_M_rdBurst ),
      .M_request ( mb_plb_M_request ),
      .M_size ( mb_plb_M_size ),
      .M_type ( mb_plb_M_type ),
      .M_wrBurst ( mb_plb_M_wrBurst ),
      .M_wrDBus ( mb_plb_M_wrDBus ),
      .Sl_addrAck ( mb_plb_Sl_addrAck ),
      .Sl_MRdErr ( mb_plb_Sl_MRdErr ),
      .Sl_MWrErr ( mb_plb_Sl_MWrErr ),
      .Sl_MBusy ( mb_plb_Sl_MBusy ),
      .Sl_rdBTerm ( mb_plb_Sl_rdBTerm ),
      .Sl_rdComp ( mb_plb_Sl_rdComp ),
      .Sl_rdDAck ( mb_plb_Sl_rdDAck ),
      .Sl_rdDBus ( mb_plb_Sl_rdDBus ),
      .Sl_rdWdAddr ( mb_plb_Sl_rdWdAddr ),
      .Sl_rearbitrate ( mb_plb_Sl_rearbitrate ),
      .Sl_SSize ( mb_plb_Sl_SSize ),
      .Sl_wait ( mb_plb_Sl_wait ),
      .Sl_wrBTerm ( mb_plb_Sl_wrBTerm ),
      .Sl_wrComp ( mb_plb_Sl_wrComp ),
      .Sl_wrDAck ( mb_plb_Sl_wrDAck ),
      .Sl_MIRQ ( mb_plb_Sl_MIRQ ),
      .PLB_MIRQ ( mb_plb_PLB_MIRQ ),
      .PLB_ABus ( mb_plb_PLB_ABus ),
      .PLB_UABus ( mb_plb_PLB_UABus ),
      .PLB_BE ( mb_plb_PLB_BE ),
      .PLB_MAddrAck ( mb_plb_PLB_MAddrAck ),
      .PLB_MTimeout ( mb_plb_PLB_MTimeout ),
      .PLB_MBusy ( mb_plb_PLB_MBusy ),
      .PLB_MRdErr ( mb_plb_PLB_MRdErr ),
      .PLB_MWrErr ( mb_plb_PLB_MWrErr ),
      .PLB_MRdBTerm ( mb_plb_PLB_MRdBTerm ),
      .PLB_MRdDAck ( mb_plb_PLB_MRdDAck ),
      .PLB_MRdDBus ( mb_plb_PLB_MRdDBus ),
      .PLB_MRdWdAddr ( mb_plb_PLB_MRdWdAddr ),
      .PLB_MRearbitrate ( mb_plb_PLB_MRearbitrate ),
      .PLB_MWrBTerm ( mb_plb_PLB_MWrBTerm ),
      .PLB_MWrDAck ( mb_plb_PLB_MWrDAck ),
      .PLB_MSSize ( mb_plb_PLB_MSSize ),
      .PLB_PAValid ( mb_plb_PLB_PAValid ),
      .PLB_RNW ( mb_plb_PLB_RNW ),
      .PLB_SAValid ( mb_plb_PLB_SAValid ),
      .PLB_abort ( mb_plb_PLB_abort ),
      .PLB_busLock ( mb_plb_PLB_busLock ),
      .PLB_TAttribute ( mb_plb_PLB_TAttribute ),
      .PLB_lockErr ( mb_plb_PLB_lockErr ),
      .PLB_masterID ( mb_plb_PLB_masterID[0:0] ),
      .PLB_MSize ( mb_plb_PLB_MSize ),
      .PLB_rdPendPri ( mb_plb_PLB_rdPendPri ),
      .PLB_wrPendPri ( mb_plb_PLB_wrPendPri ),
      .PLB_rdPendReq ( mb_plb_PLB_rdPendReq ),
      .PLB_wrPendReq ( mb_plb_PLB_wrPendReq ),
      .PLB_rdBurst ( mb_plb_PLB_rdBurst ),
      .PLB_rdPrim ( mb_plb_PLB_rdPrim ),
      .PLB_reqPri ( mb_plb_PLB_reqPri ),
      .PLB_size ( mb_plb_PLB_size ),
      .PLB_type ( mb_plb_PLB_type ),
      .PLB_wrBurst ( mb_plb_PLB_wrBurst ),
      .PLB_wrDBus ( mb_plb_PLB_wrDBus ),
      .PLB_wrPrim ( mb_plb_PLB_wrPrim ),
      .PLB_SaddrAck (  ),
      .PLB_SMRdErr (  ),
      .PLB_SMWrErr (  ),
      .PLB_SMBusy (  ),
      .PLB_SrdBTerm (  ),
      .PLB_SrdComp (  ),
      .PLB_SrdDAck (  ),
      .PLB_SrdDBus (  ),
      .PLB_SrdWdAddr (  ),
      .PLB_Srearbitrate (  ),
      .PLB_Sssize (  ),
      .PLB_Swait (  ),
      .PLB_SwrBTerm (  ),
      .PLB_SwrComp (  ),
      .PLB_SwrDAck (  ),
      .Bus_Error_Det (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_ilmb_wrapper
    ilmb (
      .LMB_Clk ( clk_62_5000MHzPLL0 ),
      .SYS_Rst ( sys_bus_reset[0] ),
      .LMB_Rst ( ilmb_LMB_Rst ),
      .M_ABus ( ilmb_M_ABus ),
      .M_ReadStrobe ( ilmb_M_ReadStrobe ),
      .M_WriteStrobe ( net_gnd0 ),
      .M_AddrStrobe ( ilmb_M_AddrStrobe ),
      .M_DBus ( net_gnd32 ),
      .M_BE ( net_gnd4 ),
      .Sl_DBus ( ilmb_Sl_DBus ),
      .Sl_Ready ( ilmb_Sl_Ready[0:0] ),
      .Sl_Wait ( ilmb_Sl_Wait[0:0] ),
      .Sl_UE ( ilmb_Sl_UE[0:0] ),
      .Sl_CE ( ilmb_Sl_CE[0:0] ),
      .LMB_ABus ( ilmb_LMB_ABus ),
      .LMB_ReadStrobe ( ilmb_LMB_ReadStrobe ),
      .LMB_WriteStrobe ( ilmb_LMB_WriteStrobe ),
      .LMB_AddrStrobe ( ilmb_LMB_AddrStrobe ),
      .LMB_ReadDBus ( ilmb_LMB_ReadDBus ),
      .LMB_WriteDBus ( ilmb_LMB_WriteDBus ),
      .LMB_Ready ( ilmb_LMB_Ready ),
      .LMB_Wait ( ilmb_LMB_Wait ),
      .LMB_UE ( ilmb_LMB_UE ),
      .LMB_CE ( ilmb_LMB_CE ),
      .LMB_BE ( ilmb_LMB_BE )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_dlmb_wrapper
    dlmb (
      .LMB_Clk ( clk_62_5000MHzPLL0 ),
      .SYS_Rst ( sys_bus_reset[0] ),
      .LMB_Rst ( dlmb_LMB_Rst ),
      .M_ABus ( dlmb_M_ABus ),
      .M_ReadStrobe ( dlmb_M_ReadStrobe ),
      .M_WriteStrobe ( dlmb_M_WriteStrobe ),
      .M_AddrStrobe ( dlmb_M_AddrStrobe ),
      .M_DBus ( dlmb_M_DBus ),
      .M_BE ( dlmb_M_BE ),
      .Sl_DBus ( dlmb_Sl_DBus ),
      .Sl_Ready ( dlmb_Sl_Ready[0:0] ),
      .Sl_Wait ( dlmb_Sl_Wait[0:0] ),
      .Sl_UE ( dlmb_Sl_UE[0:0] ),
      .Sl_CE ( dlmb_Sl_CE[0:0] ),
      .LMB_ABus ( dlmb_LMB_ABus ),
      .LMB_ReadStrobe ( dlmb_LMB_ReadStrobe ),
      .LMB_WriteStrobe ( dlmb_LMB_WriteStrobe ),
      .LMB_AddrStrobe ( dlmb_LMB_AddrStrobe ),
      .LMB_ReadDBus ( dlmb_LMB_ReadDBus ),
      .LMB_WriteDBus ( dlmb_LMB_WriteDBus ),
      .LMB_Ready ( dlmb_LMB_Ready ),
      .LMB_Wait ( dlmb_LMB_Wait ),
      .LMB_UE ( dlmb_LMB_UE ),
      .LMB_CE ( dlmb_LMB_CE ),
      .LMB_BE ( dlmb_LMB_BE )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_dlmb_cntlr_wrapper
    dlmb_cntlr (
      .LMB_Clk ( clk_62_5000MHzPLL0 ),
      .LMB_Rst ( dlmb_LMB_Rst ),
      .LMB_ABus ( dlmb_LMB_ABus ),
      .LMB_WriteDBus ( dlmb_LMB_WriteDBus ),
      .LMB_AddrStrobe ( dlmb_LMB_AddrStrobe ),
      .LMB_ReadStrobe ( dlmb_LMB_ReadStrobe ),
      .LMB_WriteStrobe ( dlmb_LMB_WriteStrobe ),
      .LMB_BE ( dlmb_LMB_BE ),
      .Sl_DBus ( dlmb_Sl_DBus ),
      .Sl_Ready ( dlmb_Sl_Ready[0] ),
      .Sl_Wait ( dlmb_Sl_Wait[0] ),
      .Sl_UE ( dlmb_Sl_UE[0] ),
      .Sl_CE ( dlmb_Sl_CE[0] ),
      .BRAM_Rst_A ( dlmb_port_BRAM_Rst ),
      .BRAM_Clk_A ( dlmb_port_BRAM_Clk ),
      .BRAM_EN_A ( dlmb_port_BRAM_EN ),
      .BRAM_WEN_A ( dlmb_port_BRAM_WEN ),
      .BRAM_Addr_A ( dlmb_port_BRAM_Addr ),
      .BRAM_Din_A ( dlmb_port_BRAM_Din ),
      .BRAM_Dout_A ( dlmb_port_BRAM_Dout ),
      .Interrupt (  ),
      .SPLB_CTRL_PLB_ABus ( net_gnd32 ),
      .SPLB_CTRL_PLB_PAValid ( net_gnd0 ),
      .SPLB_CTRL_PLB_masterID ( net_gnd1[0:0] ),
      .SPLB_CTRL_PLB_RNW ( net_gnd0 ),
      .SPLB_CTRL_PLB_BE ( net_gnd4 ),
      .SPLB_CTRL_PLB_size ( net_gnd4 ),
      .SPLB_CTRL_PLB_type ( net_gnd3 ),
      .SPLB_CTRL_PLB_wrDBus ( net_gnd32 ),
      .SPLB_CTRL_Sl_addrAck (  ),
      .SPLB_CTRL_Sl_SSize (  ),
      .SPLB_CTRL_Sl_wait (  ),
      .SPLB_CTRL_Sl_rearbitrate (  ),
      .SPLB_CTRL_Sl_wrDAck (  ),
      .SPLB_CTRL_Sl_wrComp (  ),
      .SPLB_CTRL_Sl_rdDBus (  ),
      .SPLB_CTRL_Sl_rdDAck (  ),
      .SPLB_CTRL_Sl_rdComp (  ),
      .SPLB_CTRL_Sl_MBusy (  ),
      .SPLB_CTRL_Sl_MWrErr (  ),
      .SPLB_CTRL_Sl_MRdErr (  ),
      .SPLB_CTRL_PLB_UABus ( net_gnd32 ),
      .SPLB_CTRL_PLB_SAValid ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdPrim ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPrim ( net_gnd0 ),
      .SPLB_CTRL_PLB_abort ( net_gnd0 ),
      .SPLB_CTRL_PLB_busLock ( net_gnd0 ),
      .SPLB_CTRL_PLB_MSize ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_lockErr ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrBurst ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdBurst ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPendReq ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdPendReq ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_reqPri ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_TAttribute ( net_gnd16 ),
      .SPLB_CTRL_Sl_wrBTerm (  ),
      .SPLB_CTRL_Sl_rdWdAddr (  ),
      .SPLB_CTRL_Sl_rdBTerm (  ),
      .SPLB_CTRL_Sl_MIRQ (  ),
      .S_AXI_CTRL_ACLK ( net_vcc0 ),
      .S_AXI_CTRL_ARESETN ( net_gnd0 ),
      .S_AXI_CTRL_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32[0:31] ),
      .S_AXI_CTRL_WSTRB ( net_gnd4[0:3] ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_ilmb_cntlr_wrapper
    ilmb_cntlr (
      .LMB_Clk ( clk_62_5000MHzPLL0 ),
      .LMB_Rst ( ilmb_LMB_Rst ),
      .LMB_ABus ( ilmb_LMB_ABus ),
      .LMB_WriteDBus ( ilmb_LMB_WriteDBus ),
      .LMB_AddrStrobe ( ilmb_LMB_AddrStrobe ),
      .LMB_ReadStrobe ( ilmb_LMB_ReadStrobe ),
      .LMB_WriteStrobe ( ilmb_LMB_WriteStrobe ),
      .LMB_BE ( ilmb_LMB_BE ),
      .Sl_DBus ( ilmb_Sl_DBus ),
      .Sl_Ready ( ilmb_Sl_Ready[0] ),
      .Sl_Wait ( ilmb_Sl_Wait[0] ),
      .Sl_UE ( ilmb_Sl_UE[0] ),
      .Sl_CE ( ilmb_Sl_CE[0] ),
      .BRAM_Rst_A ( ilmb_port_BRAM_Rst ),
      .BRAM_Clk_A ( ilmb_port_BRAM_Clk ),
      .BRAM_EN_A ( ilmb_port_BRAM_EN ),
      .BRAM_WEN_A ( ilmb_port_BRAM_WEN ),
      .BRAM_Addr_A ( ilmb_port_BRAM_Addr ),
      .BRAM_Din_A ( ilmb_port_BRAM_Din ),
      .BRAM_Dout_A ( ilmb_port_BRAM_Dout ),
      .Interrupt (  ),
      .SPLB_CTRL_PLB_ABus ( net_gnd32 ),
      .SPLB_CTRL_PLB_PAValid ( net_gnd0 ),
      .SPLB_CTRL_PLB_masterID ( net_gnd1[0:0] ),
      .SPLB_CTRL_PLB_RNW ( net_gnd0 ),
      .SPLB_CTRL_PLB_BE ( net_gnd4 ),
      .SPLB_CTRL_PLB_size ( net_gnd4 ),
      .SPLB_CTRL_PLB_type ( net_gnd3 ),
      .SPLB_CTRL_PLB_wrDBus ( net_gnd32 ),
      .SPLB_CTRL_Sl_addrAck (  ),
      .SPLB_CTRL_Sl_SSize (  ),
      .SPLB_CTRL_Sl_wait (  ),
      .SPLB_CTRL_Sl_rearbitrate (  ),
      .SPLB_CTRL_Sl_wrDAck (  ),
      .SPLB_CTRL_Sl_wrComp (  ),
      .SPLB_CTRL_Sl_rdDBus (  ),
      .SPLB_CTRL_Sl_rdDAck (  ),
      .SPLB_CTRL_Sl_rdComp (  ),
      .SPLB_CTRL_Sl_MBusy (  ),
      .SPLB_CTRL_Sl_MWrErr (  ),
      .SPLB_CTRL_Sl_MRdErr (  ),
      .SPLB_CTRL_PLB_UABus ( net_gnd32 ),
      .SPLB_CTRL_PLB_SAValid ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdPrim ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPrim ( net_gnd0 ),
      .SPLB_CTRL_PLB_abort ( net_gnd0 ),
      .SPLB_CTRL_PLB_busLock ( net_gnd0 ),
      .SPLB_CTRL_PLB_MSize ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_lockErr ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrBurst ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdBurst ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPendReq ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdPendReq ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_reqPri ( net_gnd2[1:0] ),
      .SPLB_CTRL_PLB_TAttribute ( net_gnd16 ),
      .SPLB_CTRL_Sl_wrBTerm (  ),
      .SPLB_CTRL_Sl_rdWdAddr (  ),
      .SPLB_CTRL_Sl_rdBTerm (  ),
      .SPLB_CTRL_Sl_MIRQ (  ),
      .S_AXI_CTRL_ACLK ( net_vcc0 ),
      .S_AXI_CTRL_ARESETN ( net_gnd0 ),
      .S_AXI_CTRL_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32[0:31] ),
      .S_AXI_CTRL_WSTRB ( net_gnd4[0:3] ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_lmb_bram_wrapper
    lmb_bram (
      .BRAM_Rst_A ( ilmb_port_BRAM_Rst ),
      .BRAM_Clk_A ( ilmb_port_BRAM_Clk ),
      .BRAM_EN_A ( ilmb_port_BRAM_EN ),
      .BRAM_WEN_A ( ilmb_port_BRAM_WEN ),
      .BRAM_Addr_A ( ilmb_port_BRAM_Addr ),
      .BRAM_Din_A ( ilmb_port_BRAM_Din ),
      .BRAM_Dout_A ( ilmb_port_BRAM_Dout ),
      .BRAM_Rst_B ( dlmb_port_BRAM_Rst ),
      .BRAM_Clk_B ( dlmb_port_BRAM_Clk ),
      .BRAM_EN_B ( dlmb_port_BRAM_EN ),
      .BRAM_WEN_B ( dlmb_port_BRAM_WEN ),
      .BRAM_Addr_B ( dlmb_port_BRAM_Addr ),
      .BRAM_Din_B ( dlmb_port_BRAM_Din ),
      .BRAM_Dout_B ( dlmb_port_BRAM_Dout )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_rs232_uart_1_wrapper
    RS232_Uart_1 (
      .SPLB_Clk ( clk_62_5000MHzPLL0 ),
      .SPLB_Rst ( mb_plb_SPLB_Rst[0] ),
      .PLB_ABus ( mb_plb_PLB_ABus ),
      .PLB_PAValid ( mb_plb_PLB_PAValid ),
      .PLB_masterID ( mb_plb_PLB_masterID[0:0] ),
      .PLB_RNW ( mb_plb_PLB_RNW ),
      .PLB_BE ( mb_plb_PLB_BE ),
      .PLB_size ( mb_plb_PLB_size ),
      .PLB_type ( mb_plb_PLB_type ),
      .PLB_wrDBus ( mb_plb_PLB_wrDBus ),
      .PLB_UABus ( mb_plb_PLB_UABus ),
      .PLB_SAValid ( mb_plb_PLB_SAValid ),
      .PLB_rdPrim ( mb_plb_PLB_rdPrim[0] ),
      .PLB_wrPrim ( mb_plb_PLB_wrPrim[0] ),
      .PLB_abort ( mb_plb_PLB_abort ),
      .PLB_busLock ( mb_plb_PLB_busLock ),
      .PLB_MSize ( mb_plb_PLB_MSize ),
      .PLB_lockErr ( mb_plb_PLB_lockErr ),
      .PLB_wrBurst ( mb_plb_PLB_wrBurst ),
      .PLB_rdBurst ( mb_plb_PLB_rdBurst ),
      .PLB_wrPendReq ( mb_plb_PLB_wrPendReq ),
      .PLB_rdPendReq ( mb_plb_PLB_rdPendReq ),
      .PLB_wrPendPri ( mb_plb_PLB_wrPendPri ),
      .PLB_rdPendPri ( mb_plb_PLB_rdPendPri ),
      .PLB_reqPri ( mb_plb_PLB_reqPri ),
      .PLB_TAttribute ( mb_plb_PLB_TAttribute ),
      .Sl_addrAck ( mb_plb_Sl_addrAck[0] ),
      .Sl_SSize ( mb_plb_Sl_SSize[0:1] ),
      .Sl_wait ( mb_plb_Sl_wait[0] ),
      .Sl_rearbitrate ( mb_plb_Sl_rearbitrate[0] ),
      .Sl_wrDAck ( mb_plb_Sl_wrDAck[0] ),
      .Sl_wrComp ( mb_plb_Sl_wrComp[0] ),
      .Sl_rdDBus ( mb_plb_Sl_rdDBus[0:63] ),
      .Sl_rdDAck ( mb_plb_Sl_rdDAck[0] ),
      .Sl_rdComp ( mb_plb_Sl_rdComp[0] ),
      .Sl_MBusy ( mb_plb_Sl_MBusy[0:1] ),
      .Sl_MWrErr ( mb_plb_Sl_MWrErr[0:1] ),
      .Sl_MRdErr ( mb_plb_Sl_MRdErr[0:1] ),
      .Sl_wrBTerm ( mb_plb_Sl_wrBTerm[0] ),
      .Sl_rdWdAddr ( mb_plb_Sl_rdWdAddr[0:3] ),
      .Sl_rdBTerm ( mb_plb_Sl_rdBTerm[0] ),
      .Sl_MIRQ ( mb_plb_Sl_MIRQ[0:1] ),
      .RX ( fpga_0_RS232_Uart_1_RX_pin ),
      .TX ( fpga_0_RS232_Uart_1_TX_pin ),
      .Interrupt (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_ddr2_sdram_wrapper
    DDR2_SDRAM (
      .FSL0_M_Clk ( net_vcc0 ),
      .FSL0_M_Write ( net_gnd0 ),
      .FSL0_M_Data ( net_gnd32 ),
      .FSL0_M_Control ( net_gnd0 ),
      .FSL0_M_Full (  ),
      .FSL0_S_Clk ( net_gnd0 ),
      .FSL0_S_Read ( net_gnd0 ),
      .FSL0_S_Data (  ),
      .FSL0_S_Control (  ),
      .FSL0_S_Exists (  ),
      .FSL0_B_M_Clk ( net_vcc0 ),
      .FSL0_B_M_Write ( net_gnd0 ),
      .FSL0_B_M_Data ( net_gnd32 ),
      .FSL0_B_M_Control ( net_gnd0 ),
      .FSL0_B_M_Full (  ),
      .FSL0_B_S_Clk ( net_gnd0 ),
      .FSL0_B_S_Read ( net_gnd0 ),
      .FSL0_B_S_Data (  ),
      .FSL0_B_S_Control (  ),
      .FSL0_B_S_Exists (  ),
      .SPLB0_Clk ( clk_62_5000MHzPLL0 ),
      .SPLB0_Rst ( mb_plb_SPLB_Rst[1] ),
      .SPLB0_PLB_ABus ( mb_plb_PLB_ABus ),
      .SPLB0_PLB_PAValid ( mb_plb_PLB_PAValid ),
      .SPLB0_PLB_SAValid ( mb_plb_PLB_SAValid ),
      .SPLB0_PLB_masterID ( mb_plb_PLB_masterID[0:0] ),
      .SPLB0_PLB_RNW ( mb_plb_PLB_RNW ),
      .SPLB0_PLB_BE ( mb_plb_PLB_BE ),
      .SPLB0_PLB_UABus ( mb_plb_PLB_UABus ),
      .SPLB0_PLB_rdPrim ( mb_plb_PLB_rdPrim[1] ),
      .SPLB0_PLB_wrPrim ( mb_plb_PLB_wrPrim[1] ),
      .SPLB0_PLB_abort ( mb_plb_PLB_abort ),
      .SPLB0_PLB_busLock ( mb_plb_PLB_busLock ),
      .SPLB0_PLB_MSize ( mb_plb_PLB_MSize ),
      .SPLB0_PLB_size ( mb_plb_PLB_size ),
      .SPLB0_PLB_type ( mb_plb_PLB_type ),
      .SPLB0_PLB_lockErr ( mb_plb_PLB_lockErr ),
      .SPLB0_PLB_wrPendReq ( mb_plb_PLB_wrPendReq ),
      .SPLB0_PLB_wrPendPri ( mb_plb_PLB_wrPendPri ),
      .SPLB0_PLB_rdPendReq ( mb_plb_PLB_rdPendReq ),
      .SPLB0_PLB_rdPendPri ( mb_plb_PLB_rdPendPri ),
      .SPLB0_PLB_reqPri ( mb_plb_PLB_reqPri ),
      .SPLB0_PLB_TAttribute ( mb_plb_PLB_TAttribute ),
      .SPLB0_PLB_rdBurst ( mb_plb_PLB_rdBurst ),
      .SPLB0_PLB_wrBurst ( mb_plb_PLB_wrBurst ),
      .SPLB0_PLB_wrDBus ( mb_plb_PLB_wrDBus ),
      .SPLB0_Sl_addrAck ( mb_plb_Sl_addrAck[1] ),
      .SPLB0_Sl_SSize ( mb_plb_Sl_SSize[2:3] ),
      .SPLB0_Sl_wait ( mb_plb_Sl_wait[1] ),
      .SPLB0_Sl_rearbitrate ( mb_plb_Sl_rearbitrate[1] ),
      .SPLB0_Sl_wrDAck ( mb_plb_Sl_wrDAck[1] ),
      .SPLB0_Sl_wrComp ( mb_plb_Sl_wrComp[1] ),
      .SPLB0_Sl_wrBTerm ( mb_plb_Sl_wrBTerm[1] ),
      .SPLB0_Sl_rdDBus ( mb_plb_Sl_rdDBus[64:127] ),
      .SPLB0_Sl_rdWdAddr ( mb_plb_Sl_rdWdAddr[4:7] ),
      .SPLB0_Sl_rdDAck ( mb_plb_Sl_rdDAck[1] ),
      .SPLB0_Sl_rdComp ( mb_plb_Sl_rdComp[1] ),
      .SPLB0_Sl_rdBTerm ( mb_plb_Sl_rdBTerm[1] ),
      .SPLB0_Sl_MBusy ( mb_plb_Sl_MBusy[2:3] ),
      .SPLB0_Sl_MRdErr ( mb_plb_Sl_MRdErr[2:3] ),
      .SPLB0_Sl_MWrErr ( mb_plb_Sl_MWrErr[2:3] ),
      .SPLB0_Sl_MIRQ ( mb_plb_Sl_MIRQ[2:3] ),
      .SDMA0_Clk ( net_gnd0 ),
      .SDMA0_Rx_IntOut (  ),
      .SDMA0_Tx_IntOut (  ),
      .SDMA0_RstOut (  ),
      .SDMA0_TX_D (  ),
      .SDMA0_TX_Rem (  ),
      .SDMA0_TX_SOF (  ),
      .SDMA0_TX_EOF (  ),
      .SDMA0_TX_SOP (  ),
      .SDMA0_TX_EOP (  ),
      .SDMA0_TX_Src_Rdy (  ),
      .SDMA0_TX_Dst_Rdy ( net_vcc0 ),
      .SDMA0_RX_D ( net_gnd32 ),
      .SDMA0_RX_Rem ( net_vcc4 ),
      .SDMA0_RX_SOF ( net_vcc0 ),
      .SDMA0_RX_EOF ( net_vcc0 ),
      .SDMA0_RX_SOP ( net_vcc0 ),
      .SDMA0_RX_EOP ( net_vcc0 ),
      .SDMA0_RX_Src_Rdy ( net_vcc0 ),
      .SDMA0_RX_Dst_Rdy (  ),
      .SDMA_CTRL0_Clk ( net_vcc0 ),
      .SDMA_CTRL0_Rst ( net_gnd0 ),
      .SDMA_CTRL0_PLB_ABus ( net_gnd32 ),
      .SDMA_CTRL0_PLB_PAValid ( net_gnd0 ),
      .SDMA_CTRL0_PLB_SAValid ( net_gnd0 ),
      .SDMA_CTRL0_PLB_masterID ( net_gnd1[0:0] ),
      .SDMA_CTRL0_PLB_RNW ( net_gnd0 ),
      .SDMA_CTRL0_PLB_BE ( net_gnd8 ),
      .SDMA_CTRL0_PLB_UABus ( net_gnd32 ),
      .SDMA_CTRL0_PLB_rdPrim ( net_gnd0 ),
      .SDMA_CTRL0_PLB_wrPrim ( net_gnd0 ),
      .SDMA_CTRL0_PLB_abort ( net_gnd0 ),
      .SDMA_CTRL0_PLB_busLock ( net_gnd0 ),
      .SDMA_CTRL0_PLB_MSize ( net_gnd2[1:0] ),
      .SDMA_CTRL0_PLB_size ( net_gnd4 ),
      .SDMA_CTRL0_PLB_type ( net_gnd3 ),
      .SDMA_CTRL0_PLB_lockErr ( net_gnd0 ),
      .SDMA_CTRL0_PLB_wrPendReq ( net_gnd0 ),
      .SDMA_CTRL0_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL0_PLB_rdPendReq ( net_gnd0 ),
      .SDMA_CTRL0_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL0_PLB_reqPri ( net_gnd2[1:0] ),
      .SDMA_CTRL0_PLB_TAttribute ( net_gnd16 ),
      .SDMA_CTRL0_PLB_rdBurst ( net_gnd0 ),
      .SDMA_CTRL0_PLB_wrBurst ( net_gnd0 ),
      .SDMA_CTRL0_PLB_wrDBus ( net_gnd64 ),
      .SDMA_CTRL0_Sl_addrAck (  ),
      .SDMA_CTRL0_Sl_SSize (  ),
      .SDMA_CTRL0_Sl_wait (  ),
      .SDMA_CTRL0_Sl_rearbitrate (  ),
      .SDMA_CTRL0_Sl_wrDAck (  ),
      .SDMA_CTRL0_Sl_wrComp (  ),
      .SDMA_CTRL0_Sl_wrBTerm (  ),
      .SDMA_CTRL0_Sl_rdDBus (  ),
      .SDMA_CTRL0_Sl_rdWdAddr (  ),
      .SDMA_CTRL0_Sl_rdDAck (  ),
      .SDMA_CTRL0_Sl_rdComp (  ),
      .SDMA_CTRL0_Sl_rdBTerm (  ),
      .SDMA_CTRL0_Sl_MBusy (  ),
      .SDMA_CTRL0_Sl_MRdErr (  ),
      .SDMA_CTRL0_Sl_MWrErr (  ),
      .SDMA_CTRL0_Sl_MIRQ (  ),
      .PIM0_Addr ( net_gnd32[0:31] ),
      .PIM0_AddrReq ( net_gnd0 ),
      .PIM0_AddrAck (  ),
      .PIM0_RNW ( net_gnd0 ),
      .PIM0_Size ( net_gnd4[0:3] ),
      .PIM0_RdModWr ( net_gnd0 ),
      .PIM0_WrFIFO_Data ( net_gnd64[0:63] ),
      .PIM0_WrFIFO_BE ( net_gnd8[0:7] ),
      .PIM0_WrFIFO_Push ( net_gnd0 ),
      .PIM0_RdFIFO_Data (  ),
      .PIM0_RdFIFO_Pop ( net_gnd0 ),
      .PIM0_RdFIFO_RdWdAddr (  ),
      .PIM0_WrFIFO_Empty (  ),
      .PIM0_WrFIFO_AlmostFull (  ),
      .PIM0_WrFIFO_Flush ( net_gnd0 ),
      .PIM0_RdFIFO_Empty (  ),
      .PIM0_RdFIFO_Flush ( net_gnd0 ),
      .PIM0_RdFIFO_Latency (  ),
      .PIM0_InitDone (  ),
      .PPC440MC0_MIMCReadNotWrite ( net_gnd0 ),
      .PPC440MC0_MIMCAddress ( net_gnd36 ),
      .PPC440MC0_MIMCAddressValid ( net_gnd0 ),
      .PPC440MC0_MIMCWriteData ( net_gnd128 ),
      .PPC440MC0_MIMCWriteDataValid ( net_gnd0 ),
      .PPC440MC0_MIMCByteEnable ( net_gnd16 ),
      .PPC440MC0_MIMCBankConflict ( net_gnd0 ),
      .PPC440MC0_MIMCRowConflict ( net_gnd0 ),
      .PPC440MC0_MCMIReadData (  ),
      .PPC440MC0_MCMIReadDataValid (  ),
      .PPC440MC0_MCMIReadDataErr (  ),
      .PPC440MC0_MCMIAddrReadyToAccept (  ),
      .VFBC0_Cmd_Clk ( net_gnd0 ),
      .VFBC0_Cmd_Reset ( net_gnd0 ),
      .VFBC0_Cmd_Data ( net_gnd32[0:31] ),
      .VFBC0_Cmd_Write ( net_gnd0 ),
      .VFBC0_Cmd_End ( net_gnd0 ),
      .VFBC0_Cmd_Full (  ),
      .VFBC0_Cmd_Almost_Full (  ),
      .VFBC0_Cmd_Idle (  ),
      .VFBC0_Wd_Clk ( net_gnd0 ),
      .VFBC0_Wd_Reset ( net_gnd0 ),
      .VFBC0_Wd_Write ( net_gnd0 ),
      .VFBC0_Wd_End_Burst ( net_gnd0 ),
      .VFBC0_Wd_Flush ( net_gnd0 ),
      .VFBC0_Wd_Data ( net_gnd32[0:31] ),
      .VFBC0_Wd_Data_BE ( net_gnd4[0:3] ),
      .VFBC0_Wd_Full (  ),
      .VFBC0_Wd_Almost_Full (  ),
      .VFBC0_Rd_Clk ( net_gnd0 ),
      .VFBC0_Rd_Reset ( net_gnd0 ),
      .VFBC0_Rd_Read ( net_gnd0 ),
      .VFBC0_Rd_End_Burst ( net_gnd0 ),
      .VFBC0_Rd_Flush ( net_gnd0 ),
      .VFBC0_Rd_Data (  ),
      .VFBC0_Rd_Empty (  ),
      .VFBC0_Rd_Almost_Empty (  ),
      .MCB0_cmd_clk ( net_gnd0 ),
      .MCB0_cmd_en ( net_gnd0 ),
      .MCB0_cmd_instr ( net_gnd3[0:2] ),
      .MCB0_cmd_bl ( net_gnd6 ),
      .MCB0_cmd_byte_addr ( net_gnd30 ),
      .MCB0_cmd_empty (  ),
      .MCB0_cmd_full (  ),
      .MCB0_wr_clk ( net_gnd0 ),
      .MCB0_wr_en ( net_gnd0 ),
      .MCB0_wr_mask ( net_gnd8[0:7] ),
      .MCB0_wr_data ( net_gnd64[0:63] ),
      .MCB0_wr_full (  ),
      .MCB0_wr_empty (  ),
      .MCB0_wr_count (  ),
      .MCB0_wr_underrun (  ),
      .MCB0_wr_error (  ),
      .MCB0_rd_clk ( net_gnd0 ),
      .MCB0_rd_en ( net_gnd0 ),
      .MCB0_rd_data (  ),
      .MCB0_rd_full (  ),
      .MCB0_rd_empty (  ),
      .MCB0_rd_count (  ),
      .MCB0_rd_overflow (  ),
      .MCB0_rd_error (  ),
      .FSL1_M_Clk ( net_vcc0 ),
      .FSL1_M_Write ( net_gnd0 ),
      .FSL1_M_Data ( net_gnd32 ),
      .FSL1_M_Control ( net_gnd0 ),
      .FSL1_M_Full (  ),
      .FSL1_S_Clk ( net_gnd0 ),
      .FSL1_S_Read ( net_gnd0 ),
      .FSL1_S_Data (  ),
      .FSL1_S_Control (  ),
      .FSL1_S_Exists (  ),
      .FSL1_B_M_Clk ( net_vcc0 ),
      .FSL1_B_M_Write ( net_gnd0 ),
      .FSL1_B_M_Data ( net_gnd32 ),
      .FSL1_B_M_Control ( net_gnd0 ),
      .FSL1_B_M_Full (  ),
      .FSL1_B_S_Clk ( net_gnd0 ),
      .FSL1_B_S_Read ( net_gnd0 ),
      .FSL1_B_S_Data (  ),
      .FSL1_B_S_Control (  ),
      .FSL1_B_S_Exists (  ),
      .SPLB1_Clk ( net_vcc0 ),
      .SPLB1_Rst ( net_gnd0 ),
      .SPLB1_PLB_ABus ( net_gnd32 ),
      .SPLB1_PLB_PAValid ( net_gnd0 ),
      .SPLB1_PLB_SAValid ( net_gnd0 ),
      .SPLB1_PLB_masterID ( net_gnd1[0:0] ),
      .SPLB1_PLB_RNW ( net_gnd0 ),
      .SPLB1_PLB_BE ( net_gnd8 ),
      .SPLB1_PLB_UABus ( net_gnd32 ),
      .SPLB1_PLB_rdPrim ( net_gnd0 ),
      .SPLB1_PLB_wrPrim ( net_gnd0 ),
      .SPLB1_PLB_abort ( net_gnd0 ),
      .SPLB1_PLB_busLock ( net_gnd0 ),
      .SPLB1_PLB_MSize ( net_gnd2[1:0] ),
      .SPLB1_PLB_size ( net_gnd4 ),
      .SPLB1_PLB_type ( net_gnd3 ),
      .SPLB1_PLB_lockErr ( net_gnd0 ),
      .SPLB1_PLB_wrPendReq ( net_gnd0 ),
      .SPLB1_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SPLB1_PLB_rdPendReq ( net_gnd0 ),
      .SPLB1_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SPLB1_PLB_reqPri ( net_gnd2[1:0] ),
      .SPLB1_PLB_TAttribute ( net_gnd16 ),
      .SPLB1_PLB_rdBurst ( net_gnd0 ),
      .SPLB1_PLB_wrBurst ( net_gnd0 ),
      .SPLB1_PLB_wrDBus ( net_gnd64 ),
      .SPLB1_Sl_addrAck (  ),
      .SPLB1_Sl_SSize (  ),
      .SPLB1_Sl_wait (  ),
      .SPLB1_Sl_rearbitrate (  ),
      .SPLB1_Sl_wrDAck (  ),
      .SPLB1_Sl_wrComp (  ),
      .SPLB1_Sl_wrBTerm (  ),
      .SPLB1_Sl_rdDBus (  ),
      .SPLB1_Sl_rdWdAddr (  ),
      .SPLB1_Sl_rdDAck (  ),
      .SPLB1_Sl_rdComp (  ),
      .SPLB1_Sl_rdBTerm (  ),
      .SPLB1_Sl_MBusy (  ),
      .SPLB1_Sl_MRdErr (  ),
      .SPLB1_Sl_MWrErr (  ),
      .SPLB1_Sl_MIRQ (  ),
      .SDMA1_Clk ( net_gnd0 ),
      .SDMA1_Rx_IntOut (  ),
      .SDMA1_Tx_IntOut (  ),
      .SDMA1_RstOut (  ),
      .SDMA1_TX_D (  ),
      .SDMA1_TX_Rem (  ),
      .SDMA1_TX_SOF (  ),
      .SDMA1_TX_EOF (  ),
      .SDMA1_TX_SOP (  ),
      .SDMA1_TX_EOP (  ),
      .SDMA1_TX_Src_Rdy (  ),
      .SDMA1_TX_Dst_Rdy ( net_vcc0 ),
      .SDMA1_RX_D ( net_gnd32 ),
      .SDMA1_RX_Rem ( net_vcc4 ),
      .SDMA1_RX_SOF ( net_vcc0 ),
      .SDMA1_RX_EOF ( net_vcc0 ),
      .SDMA1_RX_SOP ( net_vcc0 ),
      .SDMA1_RX_EOP ( net_vcc0 ),
      .SDMA1_RX_Src_Rdy ( net_vcc0 ),
      .SDMA1_RX_Dst_Rdy (  ),
      .SDMA_CTRL1_Clk ( net_vcc0 ),
      .SDMA_CTRL1_Rst ( net_gnd0 ),
      .SDMA_CTRL1_PLB_ABus ( net_gnd32 ),
      .SDMA_CTRL1_PLB_PAValid ( net_gnd0 ),
      .SDMA_CTRL1_PLB_SAValid ( net_gnd0 ),
      .SDMA_CTRL1_PLB_masterID ( net_gnd1[0:0] ),
      .SDMA_CTRL1_PLB_RNW ( net_gnd0 ),
      .SDMA_CTRL1_PLB_BE ( net_gnd8 ),
      .SDMA_CTRL1_PLB_UABus ( net_gnd32 ),
      .SDMA_CTRL1_PLB_rdPrim ( net_gnd0 ),
      .SDMA_CTRL1_PLB_wrPrim ( net_gnd0 ),
      .SDMA_CTRL1_PLB_abort ( net_gnd0 ),
      .SDMA_CTRL1_PLB_busLock ( net_gnd0 ),
      .SDMA_CTRL1_PLB_MSize ( net_gnd2[1:0] ),
      .SDMA_CTRL1_PLB_size ( net_gnd4 ),
      .SDMA_CTRL1_PLB_type ( net_gnd3 ),
      .SDMA_CTRL1_PLB_lockErr ( net_gnd0 ),
      .SDMA_CTRL1_PLB_wrPendReq ( net_gnd0 ),
      .SDMA_CTRL1_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL1_PLB_rdPendReq ( net_gnd0 ),
      .SDMA_CTRL1_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL1_PLB_reqPri ( net_gnd2[1:0] ),
      .SDMA_CTRL1_PLB_TAttribute ( net_gnd16 ),
      .SDMA_CTRL1_PLB_rdBurst ( net_gnd0 ),
      .SDMA_CTRL1_PLB_wrBurst ( net_gnd0 ),
      .SDMA_CTRL1_PLB_wrDBus ( net_gnd64 ),
      .SDMA_CTRL1_Sl_addrAck (  ),
      .SDMA_CTRL1_Sl_SSize (  ),
      .SDMA_CTRL1_Sl_wait (  ),
      .SDMA_CTRL1_Sl_rearbitrate (  ),
      .SDMA_CTRL1_Sl_wrDAck (  ),
      .SDMA_CTRL1_Sl_wrComp (  ),
      .SDMA_CTRL1_Sl_wrBTerm (  ),
      .SDMA_CTRL1_Sl_rdDBus (  ),
      .SDMA_CTRL1_Sl_rdWdAddr (  ),
      .SDMA_CTRL1_Sl_rdDAck (  ),
      .SDMA_CTRL1_Sl_rdComp (  ),
      .SDMA_CTRL1_Sl_rdBTerm (  ),
      .SDMA_CTRL1_Sl_MBusy (  ),
      .SDMA_CTRL1_Sl_MRdErr (  ),
      .SDMA_CTRL1_Sl_MWrErr (  ),
      .SDMA_CTRL1_Sl_MIRQ (  ),
      .PIM1_Addr ( readbgcop_0_XIL_NPI_Addr ),
      .PIM1_AddrReq ( readbgcop_0_XIL_NPI_AddrReq ),
      .PIM1_AddrAck ( readbgcop_0_XIL_NPI_AddrAck ),
      .PIM1_RNW ( readbgcop_0_XIL_NPI_RNW ),
      .PIM1_Size ( readbgcop_0_XIL_NPI_Size ),
      .PIM1_RdModWr ( readbgcop_0_XIL_NPI_RdModWr ),
      .PIM1_WrFIFO_Data ( readbgcop_0_XIL_NPI_WrFIFO_Data ),
      .PIM1_WrFIFO_BE ( readbgcop_0_XIL_NPI_WrFIFO_BE ),
      .PIM1_WrFIFO_Push ( readbgcop_0_XIL_NPI_WrFIFO_Push ),
      .PIM1_RdFIFO_Data ( readbgcop_0_XIL_NPI_RdFIFO_Data ),
      .PIM1_RdFIFO_Pop ( readbgcop_0_XIL_NPI_RdFIFO_Pop ),
      .PIM1_RdFIFO_RdWdAddr ( readbgcop_0_XIL_NPI_RdFIFO_RdWdAddr ),
      .PIM1_WrFIFO_Empty ( readbgcop_0_XIL_NPI_WrFIFO_Empty ),
      .PIM1_WrFIFO_AlmostFull ( readbgcop_0_XIL_NPI_WrFIFO_AlmostFull ),
      .PIM1_WrFIFO_Flush ( readbgcop_0_XIL_NPI_WrFIFO_Flush ),
      .PIM1_RdFIFO_Empty ( readbgcop_0_XIL_NPI_RdFIFO_Empty ),
      .PIM1_RdFIFO_Flush ( readbgcop_0_XIL_NPI_RdFIFO_Flush ),
      .PIM1_RdFIFO_Latency ( readbgcop_0_XIL_NPI_RDFIFO_Latency ),
      .PIM1_InitDone ( readbgcop_0_XIL_NPI_InitDone ),
      .PPC440MC1_MIMCReadNotWrite ( net_gnd0 ),
      .PPC440MC1_MIMCAddress ( net_gnd36 ),
      .PPC440MC1_MIMCAddressValid ( net_gnd0 ),
      .PPC440MC1_MIMCWriteData ( net_gnd128 ),
      .PPC440MC1_MIMCWriteDataValid ( net_gnd0 ),
      .PPC440MC1_MIMCByteEnable ( net_gnd16 ),
      .PPC440MC1_MIMCBankConflict ( net_gnd0 ),
      .PPC440MC1_MIMCRowConflict ( net_gnd0 ),
      .PPC440MC1_MCMIReadData (  ),
      .PPC440MC1_MCMIReadDataValid (  ),
      .PPC440MC1_MCMIReadDataErr (  ),
      .PPC440MC1_MCMIAddrReadyToAccept (  ),
      .VFBC1_Cmd_Clk ( net_gnd0 ),
      .VFBC1_Cmd_Reset ( net_gnd0 ),
      .VFBC1_Cmd_Data ( net_gnd32[0:31] ),
      .VFBC1_Cmd_Write ( net_gnd0 ),
      .VFBC1_Cmd_End ( net_gnd0 ),
      .VFBC1_Cmd_Full (  ),
      .VFBC1_Cmd_Almost_Full (  ),
      .VFBC1_Cmd_Idle (  ),
      .VFBC1_Wd_Clk ( net_gnd0 ),
      .VFBC1_Wd_Reset ( net_gnd0 ),
      .VFBC1_Wd_Write ( net_gnd0 ),
      .VFBC1_Wd_End_Burst ( net_gnd0 ),
      .VFBC1_Wd_Flush ( net_gnd0 ),
      .VFBC1_Wd_Data ( net_gnd32[0:31] ),
      .VFBC1_Wd_Data_BE ( net_gnd4[0:3] ),
      .VFBC1_Wd_Full (  ),
      .VFBC1_Wd_Almost_Full (  ),
      .VFBC1_Rd_Clk ( net_gnd0 ),
      .VFBC1_Rd_Reset ( net_gnd0 ),
      .VFBC1_Rd_Read ( net_gnd0 ),
      .VFBC1_Rd_End_Burst ( net_gnd0 ),
      .VFBC1_Rd_Flush ( net_gnd0 ),
      .VFBC1_Rd_Data (  ),
      .VFBC1_Rd_Empty (  ),
      .VFBC1_Rd_Almost_Empty (  ),
      .MCB1_cmd_clk ( net_gnd0 ),
      .MCB1_cmd_en ( net_gnd0 ),
      .MCB1_cmd_instr ( net_gnd3[0:2] ),
      .MCB1_cmd_bl ( net_gnd6 ),
      .MCB1_cmd_byte_addr ( net_gnd30 ),
      .MCB1_cmd_empty (  ),
      .MCB1_cmd_full (  ),
      .MCB1_wr_clk ( net_gnd0 ),
      .MCB1_wr_en ( net_gnd0 ),
      .MCB1_wr_mask ( net_gnd8[0:7] ),
      .MCB1_wr_data ( net_gnd64[0:63] ),
      .MCB1_wr_full (  ),
      .MCB1_wr_empty (  ),
      .MCB1_wr_count (  ),
      .MCB1_wr_underrun (  ),
      .MCB1_wr_error (  ),
      .MCB1_rd_clk ( net_gnd0 ),
      .MCB1_rd_en ( net_gnd0 ),
      .MCB1_rd_data (  ),
      .MCB1_rd_full (  ),
      .MCB1_rd_empty (  ),
      .MCB1_rd_count (  ),
      .MCB1_rd_overflow (  ),
      .MCB1_rd_error (  ),
      .FSL2_M_Clk ( net_vcc0 ),
      .FSL2_M_Write ( net_gnd0 ),
      .FSL2_M_Data ( net_gnd32 ),
      .FSL2_M_Control ( net_gnd0 ),
      .FSL2_M_Full (  ),
      .FSL2_S_Clk ( net_gnd0 ),
      .FSL2_S_Read ( net_gnd0 ),
      .FSL2_S_Data (  ),
      .FSL2_S_Control (  ),
      .FSL2_S_Exists (  ),
      .FSL2_B_M_Clk ( net_vcc0 ),
      .FSL2_B_M_Write ( net_gnd0 ),
      .FSL2_B_M_Data ( net_gnd32 ),
      .FSL2_B_M_Control ( net_gnd0 ),
      .FSL2_B_M_Full (  ),
      .FSL2_B_S_Clk ( net_gnd0 ),
      .FSL2_B_S_Read ( net_gnd0 ),
      .FSL2_B_S_Data (  ),
      .FSL2_B_S_Control (  ),
      .FSL2_B_S_Exists (  ),
      .SPLB2_Clk ( net_vcc0 ),
      .SPLB2_Rst ( net_gnd0 ),
      .SPLB2_PLB_ABus ( net_gnd32 ),
      .SPLB2_PLB_PAValid ( net_gnd0 ),
      .SPLB2_PLB_SAValid ( net_gnd0 ),
      .SPLB2_PLB_masterID ( net_gnd1[0:0] ),
      .SPLB2_PLB_RNW ( net_gnd0 ),
      .SPLB2_PLB_BE ( net_gnd8 ),
      .SPLB2_PLB_UABus ( net_gnd32 ),
      .SPLB2_PLB_rdPrim ( net_gnd0 ),
      .SPLB2_PLB_wrPrim ( net_gnd0 ),
      .SPLB2_PLB_abort ( net_gnd0 ),
      .SPLB2_PLB_busLock ( net_gnd0 ),
      .SPLB2_PLB_MSize ( net_gnd2[1:0] ),
      .SPLB2_PLB_size ( net_gnd4 ),
      .SPLB2_PLB_type ( net_gnd3 ),
      .SPLB2_PLB_lockErr ( net_gnd0 ),
      .SPLB2_PLB_wrPendReq ( net_gnd0 ),
      .SPLB2_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SPLB2_PLB_rdPendReq ( net_gnd0 ),
      .SPLB2_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SPLB2_PLB_reqPri ( net_gnd2[1:0] ),
      .SPLB2_PLB_TAttribute ( net_gnd16 ),
      .SPLB2_PLB_rdBurst ( net_gnd0 ),
      .SPLB2_PLB_wrBurst ( net_gnd0 ),
      .SPLB2_PLB_wrDBus ( net_gnd64 ),
      .SPLB2_Sl_addrAck (  ),
      .SPLB2_Sl_SSize (  ),
      .SPLB2_Sl_wait (  ),
      .SPLB2_Sl_rearbitrate (  ),
      .SPLB2_Sl_wrDAck (  ),
      .SPLB2_Sl_wrComp (  ),
      .SPLB2_Sl_wrBTerm (  ),
      .SPLB2_Sl_rdDBus (  ),
      .SPLB2_Sl_rdWdAddr (  ),
      .SPLB2_Sl_rdDAck (  ),
      .SPLB2_Sl_rdComp (  ),
      .SPLB2_Sl_rdBTerm (  ),
      .SPLB2_Sl_MBusy (  ),
      .SPLB2_Sl_MRdErr (  ),
      .SPLB2_Sl_MWrErr (  ),
      .SPLB2_Sl_MIRQ (  ),
      .SDMA2_Clk ( net_gnd0 ),
      .SDMA2_Rx_IntOut (  ),
      .SDMA2_Tx_IntOut (  ),
      .SDMA2_RstOut (  ),
      .SDMA2_TX_D (  ),
      .SDMA2_TX_Rem (  ),
      .SDMA2_TX_SOF (  ),
      .SDMA2_TX_EOF (  ),
      .SDMA2_TX_SOP (  ),
      .SDMA2_TX_EOP (  ),
      .SDMA2_TX_Src_Rdy (  ),
      .SDMA2_TX_Dst_Rdy ( net_vcc0 ),
      .SDMA2_RX_D ( net_gnd32 ),
      .SDMA2_RX_Rem ( net_vcc4 ),
      .SDMA2_RX_SOF ( net_vcc0 ),
      .SDMA2_RX_EOF ( net_vcc0 ),
      .SDMA2_RX_SOP ( net_vcc0 ),
      .SDMA2_RX_EOP ( net_vcc0 ),
      .SDMA2_RX_Src_Rdy ( net_vcc0 ),
      .SDMA2_RX_Dst_Rdy (  ),
      .SDMA_CTRL2_Clk ( net_vcc0 ),
      .SDMA_CTRL2_Rst ( net_gnd0 ),
      .SDMA_CTRL2_PLB_ABus ( net_gnd32 ),
      .SDMA_CTRL2_PLB_PAValid ( net_gnd0 ),
      .SDMA_CTRL2_PLB_SAValid ( net_gnd0 ),
      .SDMA_CTRL2_PLB_masterID ( net_gnd1[0:0] ),
      .SDMA_CTRL2_PLB_RNW ( net_gnd0 ),
      .SDMA_CTRL2_PLB_BE ( net_gnd8 ),
      .SDMA_CTRL2_PLB_UABus ( net_gnd32 ),
      .SDMA_CTRL2_PLB_rdPrim ( net_gnd0 ),
      .SDMA_CTRL2_PLB_wrPrim ( net_gnd0 ),
      .SDMA_CTRL2_PLB_abort ( net_gnd0 ),
      .SDMA_CTRL2_PLB_busLock ( net_gnd0 ),
      .SDMA_CTRL2_PLB_MSize ( net_gnd2[1:0] ),
      .SDMA_CTRL2_PLB_size ( net_gnd4 ),
      .SDMA_CTRL2_PLB_type ( net_gnd3 ),
      .SDMA_CTRL2_PLB_lockErr ( net_gnd0 ),
      .SDMA_CTRL2_PLB_wrPendReq ( net_gnd0 ),
      .SDMA_CTRL2_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL2_PLB_rdPendReq ( net_gnd0 ),
      .SDMA_CTRL2_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL2_PLB_reqPri ( net_gnd2[1:0] ),
      .SDMA_CTRL2_PLB_TAttribute ( net_gnd16 ),
      .SDMA_CTRL2_PLB_rdBurst ( net_gnd0 ),
      .SDMA_CTRL2_PLB_wrBurst ( net_gnd0 ),
      .SDMA_CTRL2_PLB_wrDBus ( net_gnd64 ),
      .SDMA_CTRL2_Sl_addrAck (  ),
      .SDMA_CTRL2_Sl_SSize (  ),
      .SDMA_CTRL2_Sl_wait (  ),
      .SDMA_CTRL2_Sl_rearbitrate (  ),
      .SDMA_CTRL2_Sl_wrDAck (  ),
      .SDMA_CTRL2_Sl_wrComp (  ),
      .SDMA_CTRL2_Sl_wrBTerm (  ),
      .SDMA_CTRL2_Sl_rdDBus (  ),
      .SDMA_CTRL2_Sl_rdWdAddr (  ),
      .SDMA_CTRL2_Sl_rdDAck (  ),
      .SDMA_CTRL2_Sl_rdComp (  ),
      .SDMA_CTRL2_Sl_rdBTerm (  ),
      .SDMA_CTRL2_Sl_MBusy (  ),
      .SDMA_CTRL2_Sl_MRdErr (  ),
      .SDMA_CTRL2_Sl_MWrErr (  ),
      .SDMA_CTRL2_Sl_MIRQ (  ),
      .PIM2_Addr ( readfgcop_0_XIL_NPI_Addr ),
      .PIM2_AddrReq ( readfgcop_0_XIL_NPI_AddrReq ),
      .PIM2_AddrAck ( readfgcop_0_XIL_NPI_AddrAck ),
      .PIM2_RNW ( readfgcop_0_XIL_NPI_RNW ),
      .PIM2_Size ( readfgcop_0_XIL_NPI_Size ),
      .PIM2_RdModWr ( readfgcop_0_XIL_NPI_RdModWr ),
      .PIM2_WrFIFO_Data ( readfgcop_0_XIL_NPI_WrFIFO_Data ),
      .PIM2_WrFIFO_BE ( readfgcop_0_XIL_NPI_WrFIFO_BE ),
      .PIM2_WrFIFO_Push ( readfgcop_0_XIL_NPI_WrFIFO_Push ),
      .PIM2_RdFIFO_Data ( readfgcop_0_XIL_NPI_RdFIFO_Data ),
      .PIM2_RdFIFO_Pop ( readfgcop_0_XIL_NPI_RdFIFO_Pop ),
      .PIM2_RdFIFO_RdWdAddr ( readfgcop_0_XIL_NPI_RdFIFO_RdWdAddr ),
      .PIM2_WrFIFO_Empty ( readfgcop_0_XIL_NPI_WrFIFO_Empty ),
      .PIM2_WrFIFO_AlmostFull ( readfgcop_0_XIL_NPI_WrFIFO_AlmostFull ),
      .PIM2_WrFIFO_Flush ( readfgcop_0_XIL_NPI_WrFIFO_Flush ),
      .PIM2_RdFIFO_Empty ( readfgcop_0_XIL_NPI_RdFIFO_Empty ),
      .PIM2_RdFIFO_Flush ( readfgcop_0_XIL_NPI_RdFIFO_Flush ),
      .PIM2_RdFIFO_Latency ( readfgcop_0_XIL_NPI_RDFIFO_Latency ),
      .PIM2_InitDone ( readfgcop_0_XIL_NPI_InitDone ),
      .PPC440MC2_MIMCReadNotWrite ( net_gnd0 ),
      .PPC440MC2_MIMCAddress ( net_gnd36 ),
      .PPC440MC2_MIMCAddressValid ( net_gnd0 ),
      .PPC440MC2_MIMCWriteData ( net_gnd128 ),
      .PPC440MC2_MIMCWriteDataValid ( net_gnd0 ),
      .PPC440MC2_MIMCByteEnable ( net_gnd16 ),
      .PPC440MC2_MIMCBankConflict ( net_gnd0 ),
      .PPC440MC2_MIMCRowConflict ( net_gnd0 ),
      .PPC440MC2_MCMIReadData (  ),
      .PPC440MC2_MCMIReadDataValid (  ),
      .PPC440MC2_MCMIReadDataErr (  ),
      .PPC440MC2_MCMIAddrReadyToAccept (  ),
      .VFBC2_Cmd_Clk ( net_gnd0 ),
      .VFBC2_Cmd_Reset ( net_gnd0 ),
      .VFBC2_Cmd_Data ( net_gnd32[0:31] ),
      .VFBC2_Cmd_Write ( net_gnd0 ),
      .VFBC2_Cmd_End ( net_gnd0 ),
      .VFBC2_Cmd_Full (  ),
      .VFBC2_Cmd_Almost_Full (  ),
      .VFBC2_Cmd_Idle (  ),
      .VFBC2_Wd_Clk ( net_gnd0 ),
      .VFBC2_Wd_Reset ( net_gnd0 ),
      .VFBC2_Wd_Write ( net_gnd0 ),
      .VFBC2_Wd_End_Burst ( net_gnd0 ),
      .VFBC2_Wd_Flush ( net_gnd0 ),
      .VFBC2_Wd_Data ( net_gnd32[0:31] ),
      .VFBC2_Wd_Data_BE ( net_gnd4[0:3] ),
      .VFBC2_Wd_Full (  ),
      .VFBC2_Wd_Almost_Full (  ),
      .VFBC2_Rd_Clk ( net_gnd0 ),
      .VFBC2_Rd_Reset ( net_gnd0 ),
      .VFBC2_Rd_Read ( net_gnd0 ),
      .VFBC2_Rd_End_Burst ( net_gnd0 ),
      .VFBC2_Rd_Flush ( net_gnd0 ),
      .VFBC2_Rd_Data (  ),
      .VFBC2_Rd_Empty (  ),
      .VFBC2_Rd_Almost_Empty (  ),
      .MCB2_cmd_clk ( net_gnd0 ),
      .MCB2_cmd_en ( net_gnd0 ),
      .MCB2_cmd_instr ( net_gnd3[0:2] ),
      .MCB2_cmd_bl ( net_gnd6 ),
      .MCB2_cmd_byte_addr ( net_gnd30 ),
      .MCB2_cmd_empty (  ),
      .MCB2_cmd_full (  ),
      .MCB2_wr_clk ( net_gnd0 ),
      .MCB2_wr_en ( net_gnd0 ),
      .MCB2_wr_mask ( net_gnd8[0:7] ),
      .MCB2_wr_data ( net_gnd64[0:63] ),
      .MCB2_wr_full (  ),
      .MCB2_wr_empty (  ),
      .MCB2_wr_count (  ),
      .MCB2_wr_underrun (  ),
      .MCB2_wr_error (  ),
      .MCB2_rd_clk ( net_gnd0 ),
      .MCB2_rd_en ( net_gnd0 ),
      .MCB2_rd_data (  ),
      .MCB2_rd_full (  ),
      .MCB2_rd_empty (  ),
      .MCB2_rd_count (  ),
      .MCB2_rd_overflow (  ),
      .MCB2_rd_error (  ),
      .FSL3_M_Clk ( net_vcc0 ),
      .FSL3_M_Write ( net_gnd0 ),
      .FSL3_M_Data ( net_gnd32 ),
      .FSL3_M_Control ( net_gnd0 ),
      .FSL3_M_Full (  ),
      .FSL3_S_Clk ( net_gnd0 ),
      .FSL3_S_Read ( net_gnd0 ),
      .FSL3_S_Data (  ),
      .FSL3_S_Control (  ),
      .FSL3_S_Exists (  ),
      .FSL3_B_M_Clk ( net_vcc0 ),
      .FSL3_B_M_Write ( net_gnd0 ),
      .FSL3_B_M_Data ( net_gnd32 ),
      .FSL3_B_M_Control ( net_gnd0 ),
      .FSL3_B_M_Full (  ),
      .FSL3_B_S_Clk ( net_gnd0 ),
      .FSL3_B_S_Read ( net_gnd0 ),
      .FSL3_B_S_Data (  ),
      .FSL3_B_S_Control (  ),
      .FSL3_B_S_Exists (  ),
      .SPLB3_Clk ( net_vcc0 ),
      .SPLB3_Rst ( net_gnd0 ),
      .SPLB3_PLB_ABus ( net_gnd32 ),
      .SPLB3_PLB_PAValid ( net_gnd0 ),
      .SPLB3_PLB_SAValid ( net_gnd0 ),
      .SPLB3_PLB_masterID ( net_gnd1[0:0] ),
      .SPLB3_PLB_RNW ( net_gnd0 ),
      .SPLB3_PLB_BE ( net_gnd8 ),
      .SPLB3_PLB_UABus ( net_gnd32 ),
      .SPLB3_PLB_rdPrim ( net_gnd0 ),
      .SPLB3_PLB_wrPrim ( net_gnd0 ),
      .SPLB3_PLB_abort ( net_gnd0 ),
      .SPLB3_PLB_busLock ( net_gnd0 ),
      .SPLB3_PLB_MSize ( net_gnd2[1:0] ),
      .SPLB3_PLB_size ( net_gnd4 ),
      .SPLB3_PLB_type ( net_gnd3 ),
      .SPLB3_PLB_lockErr ( net_gnd0 ),
      .SPLB3_PLB_wrPendReq ( net_gnd0 ),
      .SPLB3_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SPLB3_PLB_rdPendReq ( net_gnd0 ),
      .SPLB3_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SPLB3_PLB_reqPri ( net_gnd2[1:0] ),
      .SPLB3_PLB_TAttribute ( net_gnd16 ),
      .SPLB3_PLB_rdBurst ( net_gnd0 ),
      .SPLB3_PLB_wrBurst ( net_gnd0 ),
      .SPLB3_PLB_wrDBus ( net_gnd64 ),
      .SPLB3_Sl_addrAck (  ),
      .SPLB3_Sl_SSize (  ),
      .SPLB3_Sl_wait (  ),
      .SPLB3_Sl_rearbitrate (  ),
      .SPLB3_Sl_wrDAck (  ),
      .SPLB3_Sl_wrComp (  ),
      .SPLB3_Sl_wrBTerm (  ),
      .SPLB3_Sl_rdDBus (  ),
      .SPLB3_Sl_rdWdAddr (  ),
      .SPLB3_Sl_rdDAck (  ),
      .SPLB3_Sl_rdComp (  ),
      .SPLB3_Sl_rdBTerm (  ),
      .SPLB3_Sl_MBusy (  ),
      .SPLB3_Sl_MRdErr (  ),
      .SPLB3_Sl_MWrErr (  ),
      .SPLB3_Sl_MIRQ (  ),
      .SDMA3_Clk ( net_gnd0 ),
      .SDMA3_Rx_IntOut (  ),
      .SDMA3_Tx_IntOut (  ),
      .SDMA3_RstOut (  ),
      .SDMA3_TX_D (  ),
      .SDMA3_TX_Rem (  ),
      .SDMA3_TX_SOF (  ),
      .SDMA3_TX_EOF (  ),
      .SDMA3_TX_SOP (  ),
      .SDMA3_TX_EOP (  ),
      .SDMA3_TX_Src_Rdy (  ),
      .SDMA3_TX_Dst_Rdy ( net_vcc0 ),
      .SDMA3_RX_D ( net_gnd32 ),
      .SDMA3_RX_Rem ( net_vcc4 ),
      .SDMA3_RX_SOF ( net_vcc0 ),
      .SDMA3_RX_EOF ( net_vcc0 ),
      .SDMA3_RX_SOP ( net_vcc0 ),
      .SDMA3_RX_EOP ( net_vcc0 ),
      .SDMA3_RX_Src_Rdy ( net_vcc0 ),
      .SDMA3_RX_Dst_Rdy (  ),
      .SDMA_CTRL3_Clk ( net_vcc0 ),
      .SDMA_CTRL3_Rst ( net_gnd0 ),
      .SDMA_CTRL3_PLB_ABus ( net_gnd32 ),
      .SDMA_CTRL3_PLB_PAValid ( net_gnd0 ),
      .SDMA_CTRL3_PLB_SAValid ( net_gnd0 ),
      .SDMA_CTRL3_PLB_masterID ( net_gnd1[0:0] ),
      .SDMA_CTRL3_PLB_RNW ( net_gnd0 ),
      .SDMA_CTRL3_PLB_BE ( net_gnd8 ),
      .SDMA_CTRL3_PLB_UABus ( net_gnd32 ),
      .SDMA_CTRL3_PLB_rdPrim ( net_gnd0 ),
      .SDMA_CTRL3_PLB_wrPrim ( net_gnd0 ),
      .SDMA_CTRL3_PLB_abort ( net_gnd0 ),
      .SDMA_CTRL3_PLB_busLock ( net_gnd0 ),
      .SDMA_CTRL3_PLB_MSize ( net_gnd2[1:0] ),
      .SDMA_CTRL3_PLB_size ( net_gnd4 ),
      .SDMA_CTRL3_PLB_type ( net_gnd3 ),
      .SDMA_CTRL3_PLB_lockErr ( net_gnd0 ),
      .SDMA_CTRL3_PLB_wrPendReq ( net_gnd0 ),
      .SDMA_CTRL3_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL3_PLB_rdPendReq ( net_gnd0 ),
      .SDMA_CTRL3_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL3_PLB_reqPri ( net_gnd2[1:0] ),
      .SDMA_CTRL3_PLB_TAttribute ( net_gnd16 ),
      .SDMA_CTRL3_PLB_rdBurst ( net_gnd0 ),
      .SDMA_CTRL3_PLB_wrBurst ( net_gnd0 ),
      .SDMA_CTRL3_PLB_wrDBus ( net_gnd64 ),
      .SDMA_CTRL3_Sl_addrAck (  ),
      .SDMA_CTRL3_Sl_SSize (  ),
      .SDMA_CTRL3_Sl_wait (  ),
      .SDMA_CTRL3_Sl_rearbitrate (  ),
      .SDMA_CTRL3_Sl_wrDAck (  ),
      .SDMA_CTRL3_Sl_wrComp (  ),
      .SDMA_CTRL3_Sl_wrBTerm (  ),
      .SDMA_CTRL3_Sl_rdDBus (  ),
      .SDMA_CTRL3_Sl_rdWdAddr (  ),
      .SDMA_CTRL3_Sl_rdDAck (  ),
      .SDMA_CTRL3_Sl_rdComp (  ),
      .SDMA_CTRL3_Sl_rdBTerm (  ),
      .SDMA_CTRL3_Sl_MBusy (  ),
      .SDMA_CTRL3_Sl_MRdErr (  ),
      .SDMA_CTRL3_Sl_MWrErr (  ),
      .SDMA_CTRL3_Sl_MIRQ (  ),
      .PIM3_Addr ( writecop_0_XIL_NPI_Addr ),
      .PIM3_AddrReq ( writecop_0_XIL_NPI_AddrReq ),
      .PIM3_AddrAck ( writecop_0_XIL_NPI_AddrAck ),
      .PIM3_RNW ( writecop_0_XIL_NPI_RNW ),
      .PIM3_Size ( writecop_0_XIL_NPI_Size ),
      .PIM3_RdModWr ( writecop_0_XIL_NPI_RdModWr ),
      .PIM3_WrFIFO_Data ( writecop_0_XIL_NPI_WrFIFO_Data ),
      .PIM3_WrFIFO_BE ( writecop_0_XIL_NPI_WrFIFO_BE ),
      .PIM3_WrFIFO_Push ( writecop_0_XIL_NPI_WrFIFO_Push ),
      .PIM3_RdFIFO_Data ( writecop_0_XIL_NPI_RdFIFO_Data ),
      .PIM3_RdFIFO_Pop ( writecop_0_XIL_NPI_RdFIFO_Pop ),
      .PIM3_RdFIFO_RdWdAddr ( writecop_0_XIL_NPI_RdFIFO_RdWdAddr ),
      .PIM3_WrFIFO_Empty ( writecop_0_XIL_NPI_WrFIFO_Empty ),
      .PIM3_WrFIFO_AlmostFull ( writecop_0_XIL_NPI_WrFIFO_AlmostFull ),
      .PIM3_WrFIFO_Flush ( writecop_0_XIL_NPI_WrFIFO_Flush ),
      .PIM3_RdFIFO_Empty ( writecop_0_XIL_NPI_RdFIFO_Empty ),
      .PIM3_RdFIFO_Flush ( writecop_0_XIL_NPI_RdFIFO_Flush ),
      .PIM3_RdFIFO_Latency ( writecop_0_XIL_NPI_RDFIFO_Latency ),
      .PIM3_InitDone ( writecop_0_XIL_NPI_InitDone ),
      .PPC440MC3_MIMCReadNotWrite ( net_gnd0 ),
      .PPC440MC3_MIMCAddress ( net_gnd36 ),
      .PPC440MC3_MIMCAddressValid ( net_gnd0 ),
      .PPC440MC3_MIMCWriteData ( net_gnd128 ),
      .PPC440MC3_MIMCWriteDataValid ( net_gnd0 ),
      .PPC440MC3_MIMCByteEnable ( net_gnd16 ),
      .PPC440MC3_MIMCBankConflict ( net_gnd0 ),
      .PPC440MC3_MIMCRowConflict ( net_gnd0 ),
      .PPC440MC3_MCMIReadData (  ),
      .PPC440MC3_MCMIReadDataValid (  ),
      .PPC440MC3_MCMIReadDataErr (  ),
      .PPC440MC3_MCMIAddrReadyToAccept (  ),
      .VFBC3_Cmd_Clk ( net_gnd0 ),
      .VFBC3_Cmd_Reset ( net_gnd0 ),
      .VFBC3_Cmd_Data ( net_gnd32[0:31] ),
      .VFBC3_Cmd_Write ( net_gnd0 ),
      .VFBC3_Cmd_End ( net_gnd0 ),
      .VFBC3_Cmd_Full (  ),
      .VFBC3_Cmd_Almost_Full (  ),
      .VFBC3_Cmd_Idle (  ),
      .VFBC3_Wd_Clk ( net_gnd0 ),
      .VFBC3_Wd_Reset ( net_gnd0 ),
      .VFBC3_Wd_Write ( net_gnd0 ),
      .VFBC3_Wd_End_Burst ( net_gnd0 ),
      .VFBC3_Wd_Flush ( net_gnd0 ),
      .VFBC3_Wd_Data ( net_gnd32[0:31] ),
      .VFBC3_Wd_Data_BE ( net_gnd4[0:3] ),
      .VFBC3_Wd_Full (  ),
      .VFBC3_Wd_Almost_Full (  ),
      .VFBC3_Rd_Clk ( net_gnd0 ),
      .VFBC3_Rd_Reset ( net_gnd0 ),
      .VFBC3_Rd_Read ( net_gnd0 ),
      .VFBC3_Rd_End_Burst ( net_gnd0 ),
      .VFBC3_Rd_Flush ( net_gnd0 ),
      .VFBC3_Rd_Data (  ),
      .VFBC3_Rd_Empty (  ),
      .VFBC3_Rd_Almost_Empty (  ),
      .MCB3_cmd_clk ( net_gnd0 ),
      .MCB3_cmd_en ( net_gnd0 ),
      .MCB3_cmd_instr ( net_gnd3[0:2] ),
      .MCB3_cmd_bl ( net_gnd6 ),
      .MCB3_cmd_byte_addr ( net_gnd30 ),
      .MCB3_cmd_empty (  ),
      .MCB3_cmd_full (  ),
      .MCB3_wr_clk ( net_gnd0 ),
      .MCB3_wr_en ( net_gnd0 ),
      .MCB3_wr_mask ( net_gnd8[0:7] ),
      .MCB3_wr_data ( net_gnd64[0:63] ),
      .MCB3_wr_full (  ),
      .MCB3_wr_empty (  ),
      .MCB3_wr_count (  ),
      .MCB3_wr_underrun (  ),
      .MCB3_wr_error (  ),
      .MCB3_rd_clk ( net_gnd0 ),
      .MCB3_rd_en ( net_gnd0 ),
      .MCB3_rd_data (  ),
      .MCB3_rd_full (  ),
      .MCB3_rd_empty (  ),
      .MCB3_rd_count (  ),
      .MCB3_rd_overflow (  ),
      .MCB3_rd_error (  ),
      .FSL4_M_Clk ( net_vcc0 ),
      .FSL4_M_Write ( net_gnd0 ),
      .FSL4_M_Data ( net_gnd32 ),
      .FSL4_M_Control ( net_gnd0 ),
      .FSL4_M_Full (  ),
      .FSL4_S_Clk ( net_gnd0 ),
      .FSL4_S_Read ( net_gnd0 ),
      .FSL4_S_Data (  ),
      .FSL4_S_Control (  ),
      .FSL4_S_Exists (  ),
      .FSL4_B_M_Clk ( net_vcc0 ),
      .FSL4_B_M_Write ( net_gnd0 ),
      .FSL4_B_M_Data ( net_gnd32 ),
      .FSL4_B_M_Control ( net_gnd0 ),
      .FSL4_B_M_Full (  ),
      .FSL4_B_S_Clk ( net_gnd0 ),
      .FSL4_B_S_Read ( net_gnd0 ),
      .FSL4_B_S_Data (  ),
      .FSL4_B_S_Control (  ),
      .FSL4_B_S_Exists (  ),
      .SPLB4_Clk ( net_vcc0 ),
      .SPLB4_Rst ( net_gnd0 ),
      .SPLB4_PLB_ABus ( net_gnd32 ),
      .SPLB4_PLB_PAValid ( net_gnd0 ),
      .SPLB4_PLB_SAValid ( net_gnd0 ),
      .SPLB4_PLB_masterID ( net_gnd1[0:0] ),
      .SPLB4_PLB_RNW ( net_gnd0 ),
      .SPLB4_PLB_BE ( net_gnd8 ),
      .SPLB4_PLB_UABus ( net_gnd32 ),
      .SPLB4_PLB_rdPrim ( net_gnd0 ),
      .SPLB4_PLB_wrPrim ( net_gnd0 ),
      .SPLB4_PLB_abort ( net_gnd0 ),
      .SPLB4_PLB_busLock ( net_gnd0 ),
      .SPLB4_PLB_MSize ( net_gnd2[1:0] ),
      .SPLB4_PLB_size ( net_gnd4 ),
      .SPLB4_PLB_type ( net_gnd3 ),
      .SPLB4_PLB_lockErr ( net_gnd0 ),
      .SPLB4_PLB_wrPendReq ( net_gnd0 ),
      .SPLB4_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SPLB4_PLB_rdPendReq ( net_gnd0 ),
      .SPLB4_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SPLB4_PLB_reqPri ( net_gnd2[1:0] ),
      .SPLB4_PLB_TAttribute ( net_gnd16 ),
      .SPLB4_PLB_rdBurst ( net_gnd0 ),
      .SPLB4_PLB_wrBurst ( net_gnd0 ),
      .SPLB4_PLB_wrDBus ( net_gnd64 ),
      .SPLB4_Sl_addrAck (  ),
      .SPLB4_Sl_SSize (  ),
      .SPLB4_Sl_wait (  ),
      .SPLB4_Sl_rearbitrate (  ),
      .SPLB4_Sl_wrDAck (  ),
      .SPLB4_Sl_wrComp (  ),
      .SPLB4_Sl_wrBTerm (  ),
      .SPLB4_Sl_rdDBus (  ),
      .SPLB4_Sl_rdWdAddr (  ),
      .SPLB4_Sl_rdDAck (  ),
      .SPLB4_Sl_rdComp (  ),
      .SPLB4_Sl_rdBTerm (  ),
      .SPLB4_Sl_MBusy (  ),
      .SPLB4_Sl_MRdErr (  ),
      .SPLB4_Sl_MWrErr (  ),
      .SPLB4_Sl_MIRQ (  ),
      .SDMA4_Clk ( net_gnd0 ),
      .SDMA4_Rx_IntOut (  ),
      .SDMA4_Tx_IntOut (  ),
      .SDMA4_RstOut (  ),
      .SDMA4_TX_D (  ),
      .SDMA4_TX_Rem (  ),
      .SDMA4_TX_SOF (  ),
      .SDMA4_TX_EOF (  ),
      .SDMA4_TX_SOP (  ),
      .SDMA4_TX_EOP (  ),
      .SDMA4_TX_Src_Rdy (  ),
      .SDMA4_TX_Dst_Rdy ( net_vcc0 ),
      .SDMA4_RX_D ( net_gnd32 ),
      .SDMA4_RX_Rem ( net_vcc4 ),
      .SDMA4_RX_SOF ( net_vcc0 ),
      .SDMA4_RX_EOF ( net_vcc0 ),
      .SDMA4_RX_SOP ( net_vcc0 ),
      .SDMA4_RX_EOP ( net_vcc0 ),
      .SDMA4_RX_Src_Rdy ( net_vcc0 ),
      .SDMA4_RX_Dst_Rdy (  ),
      .SDMA_CTRL4_Clk ( net_vcc0 ),
      .SDMA_CTRL4_Rst ( net_gnd0 ),
      .SDMA_CTRL4_PLB_ABus ( net_gnd32 ),
      .SDMA_CTRL4_PLB_PAValid ( net_gnd0 ),
      .SDMA_CTRL4_PLB_SAValid ( net_gnd0 ),
      .SDMA_CTRL4_PLB_masterID ( net_gnd1[0:0] ),
      .SDMA_CTRL4_PLB_RNW ( net_gnd0 ),
      .SDMA_CTRL4_PLB_BE ( net_gnd8 ),
      .SDMA_CTRL4_PLB_UABus ( net_gnd32 ),
      .SDMA_CTRL4_PLB_rdPrim ( net_gnd0 ),
      .SDMA_CTRL4_PLB_wrPrim ( net_gnd0 ),
      .SDMA_CTRL4_PLB_abort ( net_gnd0 ),
      .SDMA_CTRL4_PLB_busLock ( net_gnd0 ),
      .SDMA_CTRL4_PLB_MSize ( net_gnd2[1:0] ),
      .SDMA_CTRL4_PLB_size ( net_gnd4 ),
      .SDMA_CTRL4_PLB_type ( net_gnd3 ),
      .SDMA_CTRL4_PLB_lockErr ( net_gnd0 ),
      .SDMA_CTRL4_PLB_wrPendReq ( net_gnd0 ),
      .SDMA_CTRL4_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL4_PLB_rdPendReq ( net_gnd0 ),
      .SDMA_CTRL4_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL4_PLB_reqPri ( net_gnd2[1:0] ),
      .SDMA_CTRL4_PLB_TAttribute ( net_gnd16 ),
      .SDMA_CTRL4_PLB_rdBurst ( net_gnd0 ),
      .SDMA_CTRL4_PLB_wrBurst ( net_gnd0 ),
      .SDMA_CTRL4_PLB_wrDBus ( net_gnd64 ),
      .SDMA_CTRL4_Sl_addrAck (  ),
      .SDMA_CTRL4_Sl_SSize (  ),
      .SDMA_CTRL4_Sl_wait (  ),
      .SDMA_CTRL4_Sl_rearbitrate (  ),
      .SDMA_CTRL4_Sl_wrDAck (  ),
      .SDMA_CTRL4_Sl_wrComp (  ),
      .SDMA_CTRL4_Sl_wrBTerm (  ),
      .SDMA_CTRL4_Sl_rdDBus (  ),
      .SDMA_CTRL4_Sl_rdWdAddr (  ),
      .SDMA_CTRL4_Sl_rdDAck (  ),
      .SDMA_CTRL4_Sl_rdComp (  ),
      .SDMA_CTRL4_Sl_rdBTerm (  ),
      .SDMA_CTRL4_Sl_MBusy (  ),
      .SDMA_CTRL4_Sl_MRdErr (  ),
      .SDMA_CTRL4_Sl_MWrErr (  ),
      .SDMA_CTRL4_Sl_MIRQ (  ),
      .PIM4_Addr ( net_gnd32[0:31] ),
      .PIM4_AddrReq ( net_gnd0 ),
      .PIM4_AddrAck (  ),
      .PIM4_RNW ( net_gnd0 ),
      .PIM4_Size ( net_gnd4[0:3] ),
      .PIM4_RdModWr ( net_gnd0 ),
      .PIM4_WrFIFO_Data ( net_gnd64[0:63] ),
      .PIM4_WrFIFO_BE ( net_gnd8[0:7] ),
      .PIM4_WrFIFO_Push ( net_gnd0 ),
      .PIM4_RdFIFO_Data (  ),
      .PIM4_RdFIFO_Pop ( net_gnd0 ),
      .PIM4_RdFIFO_RdWdAddr (  ),
      .PIM4_WrFIFO_Empty (  ),
      .PIM4_WrFIFO_AlmostFull (  ),
      .PIM4_WrFIFO_Flush ( net_gnd0 ),
      .PIM4_RdFIFO_Empty (  ),
      .PIM4_RdFIFO_Flush ( net_gnd0 ),
      .PIM4_RdFIFO_Latency (  ),
      .PIM4_InitDone (  ),
      .PPC440MC4_MIMCReadNotWrite ( net_gnd0 ),
      .PPC440MC4_MIMCAddress ( net_gnd36 ),
      .PPC440MC4_MIMCAddressValid ( net_gnd0 ),
      .PPC440MC4_MIMCWriteData ( net_gnd128 ),
      .PPC440MC4_MIMCWriteDataValid ( net_gnd0 ),
      .PPC440MC4_MIMCByteEnable ( net_gnd16 ),
      .PPC440MC4_MIMCBankConflict ( net_gnd0 ),
      .PPC440MC4_MIMCRowConflict ( net_gnd0 ),
      .PPC440MC4_MCMIReadData (  ),
      .PPC440MC4_MCMIReadDataValid (  ),
      .PPC440MC4_MCMIReadDataErr (  ),
      .PPC440MC4_MCMIAddrReadyToAccept (  ),
      .VFBC4_Cmd_Clk ( net_gnd0 ),
      .VFBC4_Cmd_Reset ( net_gnd0 ),
      .VFBC4_Cmd_Data ( net_gnd32[0:31] ),
      .VFBC4_Cmd_Write ( net_gnd0 ),
      .VFBC4_Cmd_End ( net_gnd0 ),
      .VFBC4_Cmd_Full (  ),
      .VFBC4_Cmd_Almost_Full (  ),
      .VFBC4_Cmd_Idle (  ),
      .VFBC4_Wd_Clk ( net_gnd0 ),
      .VFBC4_Wd_Reset ( net_gnd0 ),
      .VFBC4_Wd_Write ( net_gnd0 ),
      .VFBC4_Wd_End_Burst ( net_gnd0 ),
      .VFBC4_Wd_Flush ( net_gnd0 ),
      .VFBC4_Wd_Data ( net_gnd32[0:31] ),
      .VFBC4_Wd_Data_BE ( net_gnd4[0:3] ),
      .VFBC4_Wd_Full (  ),
      .VFBC4_Wd_Almost_Full (  ),
      .VFBC4_Rd_Clk ( net_gnd0 ),
      .VFBC4_Rd_Reset ( net_gnd0 ),
      .VFBC4_Rd_Read ( net_gnd0 ),
      .VFBC4_Rd_End_Burst ( net_gnd0 ),
      .VFBC4_Rd_Flush ( net_gnd0 ),
      .VFBC4_Rd_Data (  ),
      .VFBC4_Rd_Empty (  ),
      .VFBC4_Rd_Almost_Empty (  ),
      .MCB4_cmd_clk ( net_gnd0 ),
      .MCB4_cmd_en ( net_gnd0 ),
      .MCB4_cmd_instr ( net_gnd3[0:2] ),
      .MCB4_cmd_bl ( net_gnd6 ),
      .MCB4_cmd_byte_addr ( net_gnd30 ),
      .MCB4_cmd_empty (  ),
      .MCB4_cmd_full (  ),
      .MCB4_wr_clk ( net_gnd0 ),
      .MCB4_wr_en ( net_gnd0 ),
      .MCB4_wr_mask ( net_gnd8[0:7] ),
      .MCB4_wr_data ( net_gnd64[0:63] ),
      .MCB4_wr_full (  ),
      .MCB4_wr_empty (  ),
      .MCB4_wr_count (  ),
      .MCB4_wr_underrun (  ),
      .MCB4_wr_error (  ),
      .MCB4_rd_clk ( net_gnd0 ),
      .MCB4_rd_en ( net_gnd0 ),
      .MCB4_rd_data (  ),
      .MCB4_rd_full (  ),
      .MCB4_rd_empty (  ),
      .MCB4_rd_count (  ),
      .MCB4_rd_overflow (  ),
      .MCB4_rd_error (  ),
      .FSL5_M_Clk ( net_vcc0 ),
      .FSL5_M_Write ( net_gnd0 ),
      .FSL5_M_Data ( net_gnd32 ),
      .FSL5_M_Control ( net_gnd0 ),
      .FSL5_M_Full (  ),
      .FSL5_S_Clk ( net_gnd0 ),
      .FSL5_S_Read ( net_gnd0 ),
      .FSL5_S_Data (  ),
      .FSL5_S_Control (  ),
      .FSL5_S_Exists (  ),
      .FSL5_B_M_Clk ( net_vcc0 ),
      .FSL5_B_M_Write ( net_gnd0 ),
      .FSL5_B_M_Data ( net_gnd32 ),
      .FSL5_B_M_Control ( net_gnd0 ),
      .FSL5_B_M_Full (  ),
      .FSL5_B_S_Clk ( net_gnd0 ),
      .FSL5_B_S_Read ( net_gnd0 ),
      .FSL5_B_S_Data (  ),
      .FSL5_B_S_Control (  ),
      .FSL5_B_S_Exists (  ),
      .SPLB5_Clk ( net_vcc0 ),
      .SPLB5_Rst ( net_gnd0 ),
      .SPLB5_PLB_ABus ( net_gnd32 ),
      .SPLB5_PLB_PAValid ( net_gnd0 ),
      .SPLB5_PLB_SAValid ( net_gnd0 ),
      .SPLB5_PLB_masterID ( net_gnd1[0:0] ),
      .SPLB5_PLB_RNW ( net_gnd0 ),
      .SPLB5_PLB_BE ( net_gnd8 ),
      .SPLB5_PLB_UABus ( net_gnd32 ),
      .SPLB5_PLB_rdPrim ( net_gnd0 ),
      .SPLB5_PLB_wrPrim ( net_gnd0 ),
      .SPLB5_PLB_abort ( net_gnd0 ),
      .SPLB5_PLB_busLock ( net_gnd0 ),
      .SPLB5_PLB_MSize ( net_gnd2[1:0] ),
      .SPLB5_PLB_size ( net_gnd4 ),
      .SPLB5_PLB_type ( net_gnd3 ),
      .SPLB5_PLB_lockErr ( net_gnd0 ),
      .SPLB5_PLB_wrPendReq ( net_gnd0 ),
      .SPLB5_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SPLB5_PLB_rdPendReq ( net_gnd0 ),
      .SPLB5_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SPLB5_PLB_reqPri ( net_gnd2[1:0] ),
      .SPLB5_PLB_TAttribute ( net_gnd16 ),
      .SPLB5_PLB_rdBurst ( net_gnd0 ),
      .SPLB5_PLB_wrBurst ( net_gnd0 ),
      .SPLB5_PLB_wrDBus ( net_gnd64 ),
      .SPLB5_Sl_addrAck (  ),
      .SPLB5_Sl_SSize (  ),
      .SPLB5_Sl_wait (  ),
      .SPLB5_Sl_rearbitrate (  ),
      .SPLB5_Sl_wrDAck (  ),
      .SPLB5_Sl_wrComp (  ),
      .SPLB5_Sl_wrBTerm (  ),
      .SPLB5_Sl_rdDBus (  ),
      .SPLB5_Sl_rdWdAddr (  ),
      .SPLB5_Sl_rdDAck (  ),
      .SPLB5_Sl_rdComp (  ),
      .SPLB5_Sl_rdBTerm (  ),
      .SPLB5_Sl_MBusy (  ),
      .SPLB5_Sl_MRdErr (  ),
      .SPLB5_Sl_MWrErr (  ),
      .SPLB5_Sl_MIRQ (  ),
      .SDMA5_Clk ( net_gnd0 ),
      .SDMA5_Rx_IntOut (  ),
      .SDMA5_Tx_IntOut (  ),
      .SDMA5_RstOut (  ),
      .SDMA5_TX_D (  ),
      .SDMA5_TX_Rem (  ),
      .SDMA5_TX_SOF (  ),
      .SDMA5_TX_EOF (  ),
      .SDMA5_TX_SOP (  ),
      .SDMA5_TX_EOP (  ),
      .SDMA5_TX_Src_Rdy (  ),
      .SDMA5_TX_Dst_Rdy ( net_vcc0 ),
      .SDMA5_RX_D ( net_gnd32 ),
      .SDMA5_RX_Rem ( net_vcc4 ),
      .SDMA5_RX_SOF ( net_vcc0 ),
      .SDMA5_RX_EOF ( net_vcc0 ),
      .SDMA5_RX_SOP ( net_vcc0 ),
      .SDMA5_RX_EOP ( net_vcc0 ),
      .SDMA5_RX_Src_Rdy ( net_vcc0 ),
      .SDMA5_RX_Dst_Rdy (  ),
      .SDMA_CTRL5_Clk ( net_vcc0 ),
      .SDMA_CTRL5_Rst ( net_gnd0 ),
      .SDMA_CTRL5_PLB_ABus ( net_gnd32 ),
      .SDMA_CTRL5_PLB_PAValid ( net_gnd0 ),
      .SDMA_CTRL5_PLB_SAValid ( net_gnd0 ),
      .SDMA_CTRL5_PLB_masterID ( net_gnd1[0:0] ),
      .SDMA_CTRL5_PLB_RNW ( net_gnd0 ),
      .SDMA_CTRL5_PLB_BE ( net_gnd8 ),
      .SDMA_CTRL5_PLB_UABus ( net_gnd32 ),
      .SDMA_CTRL5_PLB_rdPrim ( net_gnd0 ),
      .SDMA_CTRL5_PLB_wrPrim ( net_gnd0 ),
      .SDMA_CTRL5_PLB_abort ( net_gnd0 ),
      .SDMA_CTRL5_PLB_busLock ( net_gnd0 ),
      .SDMA_CTRL5_PLB_MSize ( net_gnd2[1:0] ),
      .SDMA_CTRL5_PLB_size ( net_gnd4 ),
      .SDMA_CTRL5_PLB_type ( net_gnd3 ),
      .SDMA_CTRL5_PLB_lockErr ( net_gnd0 ),
      .SDMA_CTRL5_PLB_wrPendReq ( net_gnd0 ),
      .SDMA_CTRL5_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL5_PLB_rdPendReq ( net_gnd0 ),
      .SDMA_CTRL5_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL5_PLB_reqPri ( net_gnd2[1:0] ),
      .SDMA_CTRL5_PLB_TAttribute ( net_gnd16 ),
      .SDMA_CTRL5_PLB_rdBurst ( net_gnd0 ),
      .SDMA_CTRL5_PLB_wrBurst ( net_gnd0 ),
      .SDMA_CTRL5_PLB_wrDBus ( net_gnd64 ),
      .SDMA_CTRL5_Sl_addrAck (  ),
      .SDMA_CTRL5_Sl_SSize (  ),
      .SDMA_CTRL5_Sl_wait (  ),
      .SDMA_CTRL5_Sl_rearbitrate (  ),
      .SDMA_CTRL5_Sl_wrDAck (  ),
      .SDMA_CTRL5_Sl_wrComp (  ),
      .SDMA_CTRL5_Sl_wrBTerm (  ),
      .SDMA_CTRL5_Sl_rdDBus (  ),
      .SDMA_CTRL5_Sl_rdWdAddr (  ),
      .SDMA_CTRL5_Sl_rdDAck (  ),
      .SDMA_CTRL5_Sl_rdComp (  ),
      .SDMA_CTRL5_Sl_rdBTerm (  ),
      .SDMA_CTRL5_Sl_MBusy (  ),
      .SDMA_CTRL5_Sl_MRdErr (  ),
      .SDMA_CTRL5_Sl_MWrErr (  ),
      .SDMA_CTRL5_Sl_MIRQ (  ),
      .PIM5_Addr ( net_gnd32[0:31] ),
      .PIM5_AddrReq ( net_gnd0 ),
      .PIM5_AddrAck (  ),
      .PIM5_RNW ( net_gnd0 ),
      .PIM5_Size ( net_gnd4[0:3] ),
      .PIM5_RdModWr ( net_gnd0 ),
      .PIM5_WrFIFO_Data ( net_gnd64[0:63] ),
      .PIM5_WrFIFO_BE ( net_gnd8[0:7] ),
      .PIM5_WrFIFO_Push ( net_gnd0 ),
      .PIM5_RdFIFO_Data (  ),
      .PIM5_RdFIFO_Pop ( net_gnd0 ),
      .PIM5_RdFIFO_RdWdAddr (  ),
      .PIM5_WrFIFO_Empty (  ),
      .PIM5_WrFIFO_AlmostFull (  ),
      .PIM5_WrFIFO_Flush ( net_gnd0 ),
      .PIM5_RdFIFO_Empty (  ),
      .PIM5_RdFIFO_Flush ( net_gnd0 ),
      .PIM5_RdFIFO_Latency (  ),
      .PIM5_InitDone (  ),
      .PPC440MC5_MIMCReadNotWrite ( net_gnd0 ),
      .PPC440MC5_MIMCAddress ( net_gnd36 ),
      .PPC440MC5_MIMCAddressValid ( net_gnd0 ),
      .PPC440MC5_MIMCWriteData ( net_gnd128 ),
      .PPC440MC5_MIMCWriteDataValid ( net_gnd0 ),
      .PPC440MC5_MIMCByteEnable ( net_gnd16 ),
      .PPC440MC5_MIMCBankConflict ( net_gnd0 ),
      .PPC440MC5_MIMCRowConflict ( net_gnd0 ),
      .PPC440MC5_MCMIReadData (  ),
      .PPC440MC5_MCMIReadDataValid (  ),
      .PPC440MC5_MCMIReadDataErr (  ),
      .PPC440MC5_MCMIAddrReadyToAccept (  ),
      .VFBC5_Cmd_Clk ( net_gnd0 ),
      .VFBC5_Cmd_Reset ( net_gnd0 ),
      .VFBC5_Cmd_Data ( net_gnd32[0:31] ),
      .VFBC5_Cmd_Write ( net_gnd0 ),
      .VFBC5_Cmd_End ( net_gnd0 ),
      .VFBC5_Cmd_Full (  ),
      .VFBC5_Cmd_Almost_Full (  ),
      .VFBC5_Cmd_Idle (  ),
      .VFBC5_Wd_Clk ( net_gnd0 ),
      .VFBC5_Wd_Reset ( net_gnd0 ),
      .VFBC5_Wd_Write ( net_gnd0 ),
      .VFBC5_Wd_End_Burst ( net_gnd0 ),
      .VFBC5_Wd_Flush ( net_gnd0 ),
      .VFBC5_Wd_Data ( net_gnd32[0:31] ),
      .VFBC5_Wd_Data_BE ( net_gnd4[0:3] ),
      .VFBC5_Wd_Full (  ),
      .VFBC5_Wd_Almost_Full (  ),
      .VFBC5_Rd_Clk ( net_gnd0 ),
      .VFBC5_Rd_Reset ( net_gnd0 ),
      .VFBC5_Rd_Read ( net_gnd0 ),
      .VFBC5_Rd_End_Burst ( net_gnd0 ),
      .VFBC5_Rd_Flush ( net_gnd0 ),
      .VFBC5_Rd_Data (  ),
      .VFBC5_Rd_Empty (  ),
      .VFBC5_Rd_Almost_Empty (  ),
      .MCB5_cmd_clk ( net_gnd0 ),
      .MCB5_cmd_en ( net_gnd0 ),
      .MCB5_cmd_instr ( net_gnd3[0:2] ),
      .MCB5_cmd_bl ( net_gnd6 ),
      .MCB5_cmd_byte_addr ( net_gnd30 ),
      .MCB5_cmd_empty (  ),
      .MCB5_cmd_full (  ),
      .MCB5_wr_clk ( net_gnd0 ),
      .MCB5_wr_en ( net_gnd0 ),
      .MCB5_wr_mask ( net_gnd8[0:7] ),
      .MCB5_wr_data ( net_gnd64[0:63] ),
      .MCB5_wr_full (  ),
      .MCB5_wr_empty (  ),
      .MCB5_wr_count (  ),
      .MCB5_wr_underrun (  ),
      .MCB5_wr_error (  ),
      .MCB5_rd_clk ( net_gnd0 ),
      .MCB5_rd_en ( net_gnd0 ),
      .MCB5_rd_data (  ),
      .MCB5_rd_full (  ),
      .MCB5_rd_empty (  ),
      .MCB5_rd_count (  ),
      .MCB5_rd_overflow (  ),
      .MCB5_rd_error (  ),
      .FSL6_M_Clk ( net_vcc0 ),
      .FSL6_M_Write ( net_gnd0 ),
      .FSL6_M_Data ( net_gnd32 ),
      .FSL6_M_Control ( net_gnd0 ),
      .FSL6_M_Full (  ),
      .FSL6_S_Clk ( net_gnd0 ),
      .FSL6_S_Read ( net_gnd0 ),
      .FSL6_S_Data (  ),
      .FSL6_S_Control (  ),
      .FSL6_S_Exists (  ),
      .FSL6_B_M_Clk ( net_vcc0 ),
      .FSL6_B_M_Write ( net_gnd0 ),
      .FSL6_B_M_Data ( net_gnd32 ),
      .FSL6_B_M_Control ( net_gnd0 ),
      .FSL6_B_M_Full (  ),
      .FSL6_B_S_Clk ( net_gnd0 ),
      .FSL6_B_S_Read ( net_gnd0 ),
      .FSL6_B_S_Data (  ),
      .FSL6_B_S_Control (  ),
      .FSL6_B_S_Exists (  ),
      .SPLB6_Clk ( net_vcc0 ),
      .SPLB6_Rst ( net_gnd0 ),
      .SPLB6_PLB_ABus ( net_gnd32 ),
      .SPLB6_PLB_PAValid ( net_gnd0 ),
      .SPLB6_PLB_SAValid ( net_gnd0 ),
      .SPLB6_PLB_masterID ( net_gnd1[0:0] ),
      .SPLB6_PLB_RNW ( net_gnd0 ),
      .SPLB6_PLB_BE ( net_gnd8 ),
      .SPLB6_PLB_UABus ( net_gnd32 ),
      .SPLB6_PLB_rdPrim ( net_gnd0 ),
      .SPLB6_PLB_wrPrim ( net_gnd0 ),
      .SPLB6_PLB_abort ( net_gnd0 ),
      .SPLB6_PLB_busLock ( net_gnd0 ),
      .SPLB6_PLB_MSize ( net_gnd2[1:0] ),
      .SPLB6_PLB_size ( net_gnd4 ),
      .SPLB6_PLB_type ( net_gnd3 ),
      .SPLB6_PLB_lockErr ( net_gnd0 ),
      .SPLB6_PLB_wrPendReq ( net_gnd0 ),
      .SPLB6_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SPLB6_PLB_rdPendReq ( net_gnd0 ),
      .SPLB6_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SPLB6_PLB_reqPri ( net_gnd2[1:0] ),
      .SPLB6_PLB_TAttribute ( net_gnd16 ),
      .SPLB6_PLB_rdBurst ( net_gnd0 ),
      .SPLB6_PLB_wrBurst ( net_gnd0 ),
      .SPLB6_PLB_wrDBus ( net_gnd64 ),
      .SPLB6_Sl_addrAck (  ),
      .SPLB6_Sl_SSize (  ),
      .SPLB6_Sl_wait (  ),
      .SPLB6_Sl_rearbitrate (  ),
      .SPLB6_Sl_wrDAck (  ),
      .SPLB6_Sl_wrComp (  ),
      .SPLB6_Sl_wrBTerm (  ),
      .SPLB6_Sl_rdDBus (  ),
      .SPLB6_Sl_rdWdAddr (  ),
      .SPLB6_Sl_rdDAck (  ),
      .SPLB6_Sl_rdComp (  ),
      .SPLB6_Sl_rdBTerm (  ),
      .SPLB6_Sl_MBusy (  ),
      .SPLB6_Sl_MRdErr (  ),
      .SPLB6_Sl_MWrErr (  ),
      .SPLB6_Sl_MIRQ (  ),
      .SDMA6_Clk ( net_gnd0 ),
      .SDMA6_Rx_IntOut (  ),
      .SDMA6_Tx_IntOut (  ),
      .SDMA6_RstOut (  ),
      .SDMA6_TX_D (  ),
      .SDMA6_TX_Rem (  ),
      .SDMA6_TX_SOF (  ),
      .SDMA6_TX_EOF (  ),
      .SDMA6_TX_SOP (  ),
      .SDMA6_TX_EOP (  ),
      .SDMA6_TX_Src_Rdy (  ),
      .SDMA6_TX_Dst_Rdy ( net_vcc0 ),
      .SDMA6_RX_D ( net_gnd32 ),
      .SDMA6_RX_Rem ( net_vcc4 ),
      .SDMA6_RX_SOF ( net_vcc0 ),
      .SDMA6_RX_EOF ( net_vcc0 ),
      .SDMA6_RX_SOP ( net_vcc0 ),
      .SDMA6_RX_EOP ( net_vcc0 ),
      .SDMA6_RX_Src_Rdy ( net_vcc0 ),
      .SDMA6_RX_Dst_Rdy (  ),
      .SDMA_CTRL6_Clk ( net_vcc0 ),
      .SDMA_CTRL6_Rst ( net_gnd0 ),
      .SDMA_CTRL6_PLB_ABus ( net_gnd32 ),
      .SDMA_CTRL6_PLB_PAValid ( net_gnd0 ),
      .SDMA_CTRL6_PLB_SAValid ( net_gnd0 ),
      .SDMA_CTRL6_PLB_masterID ( net_gnd1[0:0] ),
      .SDMA_CTRL6_PLB_RNW ( net_gnd0 ),
      .SDMA_CTRL6_PLB_BE ( net_gnd8 ),
      .SDMA_CTRL6_PLB_UABus ( net_gnd32 ),
      .SDMA_CTRL6_PLB_rdPrim ( net_gnd0 ),
      .SDMA_CTRL6_PLB_wrPrim ( net_gnd0 ),
      .SDMA_CTRL6_PLB_abort ( net_gnd0 ),
      .SDMA_CTRL6_PLB_busLock ( net_gnd0 ),
      .SDMA_CTRL6_PLB_MSize ( net_gnd2[1:0] ),
      .SDMA_CTRL6_PLB_size ( net_gnd4 ),
      .SDMA_CTRL6_PLB_type ( net_gnd3 ),
      .SDMA_CTRL6_PLB_lockErr ( net_gnd0 ),
      .SDMA_CTRL6_PLB_wrPendReq ( net_gnd0 ),
      .SDMA_CTRL6_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL6_PLB_rdPendReq ( net_gnd0 ),
      .SDMA_CTRL6_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL6_PLB_reqPri ( net_gnd2[1:0] ),
      .SDMA_CTRL6_PLB_TAttribute ( net_gnd16 ),
      .SDMA_CTRL6_PLB_rdBurst ( net_gnd0 ),
      .SDMA_CTRL6_PLB_wrBurst ( net_gnd0 ),
      .SDMA_CTRL6_PLB_wrDBus ( net_gnd64 ),
      .SDMA_CTRL6_Sl_addrAck (  ),
      .SDMA_CTRL6_Sl_SSize (  ),
      .SDMA_CTRL6_Sl_wait (  ),
      .SDMA_CTRL6_Sl_rearbitrate (  ),
      .SDMA_CTRL6_Sl_wrDAck (  ),
      .SDMA_CTRL6_Sl_wrComp (  ),
      .SDMA_CTRL6_Sl_wrBTerm (  ),
      .SDMA_CTRL6_Sl_rdDBus (  ),
      .SDMA_CTRL6_Sl_rdWdAddr (  ),
      .SDMA_CTRL6_Sl_rdDAck (  ),
      .SDMA_CTRL6_Sl_rdComp (  ),
      .SDMA_CTRL6_Sl_rdBTerm (  ),
      .SDMA_CTRL6_Sl_MBusy (  ),
      .SDMA_CTRL6_Sl_MRdErr (  ),
      .SDMA_CTRL6_Sl_MWrErr (  ),
      .SDMA_CTRL6_Sl_MIRQ (  ),
      .PIM6_Addr ( net_gnd32[0:31] ),
      .PIM6_AddrReq ( net_gnd0 ),
      .PIM6_AddrAck (  ),
      .PIM6_RNW ( net_gnd0 ),
      .PIM6_Size ( net_gnd4[0:3] ),
      .PIM6_RdModWr ( net_gnd0 ),
      .PIM6_WrFIFO_Data ( net_gnd64[0:63] ),
      .PIM6_WrFIFO_BE ( net_gnd8[0:7] ),
      .PIM6_WrFIFO_Push ( net_gnd0 ),
      .PIM6_RdFIFO_Data (  ),
      .PIM6_RdFIFO_Pop ( net_gnd0 ),
      .PIM6_RdFIFO_RdWdAddr (  ),
      .PIM6_WrFIFO_Empty (  ),
      .PIM6_WrFIFO_AlmostFull (  ),
      .PIM6_WrFIFO_Flush ( net_gnd0 ),
      .PIM6_RdFIFO_Empty (  ),
      .PIM6_RdFIFO_Flush ( net_gnd0 ),
      .PIM6_RdFIFO_Latency (  ),
      .PIM6_InitDone (  ),
      .PPC440MC6_MIMCReadNotWrite ( net_gnd0 ),
      .PPC440MC6_MIMCAddress ( net_gnd36 ),
      .PPC440MC6_MIMCAddressValid ( net_gnd0 ),
      .PPC440MC6_MIMCWriteData ( net_gnd128 ),
      .PPC440MC6_MIMCWriteDataValid ( net_gnd0 ),
      .PPC440MC6_MIMCByteEnable ( net_gnd16 ),
      .PPC440MC6_MIMCBankConflict ( net_gnd0 ),
      .PPC440MC6_MIMCRowConflict ( net_gnd0 ),
      .PPC440MC6_MCMIReadData (  ),
      .PPC440MC6_MCMIReadDataValid (  ),
      .PPC440MC6_MCMIReadDataErr (  ),
      .PPC440MC6_MCMIAddrReadyToAccept (  ),
      .VFBC6_Cmd_Clk ( net_gnd0 ),
      .VFBC6_Cmd_Reset ( net_gnd0 ),
      .VFBC6_Cmd_Data ( net_gnd32[0:31] ),
      .VFBC6_Cmd_Write ( net_gnd0 ),
      .VFBC6_Cmd_End ( net_gnd0 ),
      .VFBC6_Cmd_Full (  ),
      .VFBC6_Cmd_Almost_Full (  ),
      .VFBC6_Cmd_Idle (  ),
      .VFBC6_Wd_Clk ( net_gnd0 ),
      .VFBC6_Wd_Reset ( net_gnd0 ),
      .VFBC6_Wd_Write ( net_gnd0 ),
      .VFBC6_Wd_End_Burst ( net_gnd0 ),
      .VFBC6_Wd_Flush ( net_gnd0 ),
      .VFBC6_Wd_Data ( net_gnd32[0:31] ),
      .VFBC6_Wd_Data_BE ( net_gnd4[0:3] ),
      .VFBC6_Wd_Full (  ),
      .VFBC6_Wd_Almost_Full (  ),
      .VFBC6_Rd_Clk ( net_gnd0 ),
      .VFBC6_Rd_Reset ( net_gnd0 ),
      .VFBC6_Rd_Read ( net_gnd0 ),
      .VFBC6_Rd_End_Burst ( net_gnd0 ),
      .VFBC6_Rd_Flush ( net_gnd0 ),
      .VFBC6_Rd_Data (  ),
      .VFBC6_Rd_Empty (  ),
      .VFBC6_Rd_Almost_Empty (  ),
      .MCB6_cmd_clk ( net_gnd0 ),
      .MCB6_cmd_en ( net_gnd0 ),
      .MCB6_cmd_instr ( net_gnd3[0:2] ),
      .MCB6_cmd_bl ( net_gnd6 ),
      .MCB6_cmd_byte_addr ( net_gnd30 ),
      .MCB6_cmd_empty (  ),
      .MCB6_cmd_full (  ),
      .MCB6_wr_clk ( net_gnd0 ),
      .MCB6_wr_en ( net_gnd0 ),
      .MCB6_wr_mask ( net_gnd8[0:7] ),
      .MCB6_wr_data ( net_gnd64[0:63] ),
      .MCB6_wr_full (  ),
      .MCB6_wr_empty (  ),
      .MCB6_wr_count (  ),
      .MCB6_wr_underrun (  ),
      .MCB6_wr_error (  ),
      .MCB6_rd_clk ( net_gnd0 ),
      .MCB6_rd_en ( net_gnd0 ),
      .MCB6_rd_data (  ),
      .MCB6_rd_full (  ),
      .MCB6_rd_empty (  ),
      .MCB6_rd_count (  ),
      .MCB6_rd_overflow (  ),
      .MCB6_rd_error (  ),
      .FSL7_M_Clk ( net_vcc0 ),
      .FSL7_M_Write ( net_gnd0 ),
      .FSL7_M_Data ( net_gnd32 ),
      .FSL7_M_Control ( net_gnd0 ),
      .FSL7_M_Full (  ),
      .FSL7_S_Clk ( net_gnd0 ),
      .FSL7_S_Read ( net_gnd0 ),
      .FSL7_S_Data (  ),
      .FSL7_S_Control (  ),
      .FSL7_S_Exists (  ),
      .FSL7_B_M_Clk ( net_vcc0 ),
      .FSL7_B_M_Write ( net_gnd0 ),
      .FSL7_B_M_Data ( net_gnd32 ),
      .FSL7_B_M_Control ( net_gnd0 ),
      .FSL7_B_M_Full (  ),
      .FSL7_B_S_Clk ( net_gnd0 ),
      .FSL7_B_S_Read ( net_gnd0 ),
      .FSL7_B_S_Data (  ),
      .FSL7_B_S_Control (  ),
      .FSL7_B_S_Exists (  ),
      .SPLB7_Clk ( net_vcc0 ),
      .SPLB7_Rst ( net_gnd0 ),
      .SPLB7_PLB_ABus ( net_gnd32 ),
      .SPLB7_PLB_PAValid ( net_gnd0 ),
      .SPLB7_PLB_SAValid ( net_gnd0 ),
      .SPLB7_PLB_masterID ( net_gnd1[0:0] ),
      .SPLB7_PLB_RNW ( net_gnd0 ),
      .SPLB7_PLB_BE ( net_gnd8 ),
      .SPLB7_PLB_UABus ( net_gnd32 ),
      .SPLB7_PLB_rdPrim ( net_gnd0 ),
      .SPLB7_PLB_wrPrim ( net_gnd0 ),
      .SPLB7_PLB_abort ( net_gnd0 ),
      .SPLB7_PLB_busLock ( net_gnd0 ),
      .SPLB7_PLB_MSize ( net_gnd2[1:0] ),
      .SPLB7_PLB_size ( net_gnd4 ),
      .SPLB7_PLB_type ( net_gnd3 ),
      .SPLB7_PLB_lockErr ( net_gnd0 ),
      .SPLB7_PLB_wrPendReq ( net_gnd0 ),
      .SPLB7_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SPLB7_PLB_rdPendReq ( net_gnd0 ),
      .SPLB7_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SPLB7_PLB_reqPri ( net_gnd2[1:0] ),
      .SPLB7_PLB_TAttribute ( net_gnd16 ),
      .SPLB7_PLB_rdBurst ( net_gnd0 ),
      .SPLB7_PLB_wrBurst ( net_gnd0 ),
      .SPLB7_PLB_wrDBus ( net_gnd64 ),
      .SPLB7_Sl_addrAck (  ),
      .SPLB7_Sl_SSize (  ),
      .SPLB7_Sl_wait (  ),
      .SPLB7_Sl_rearbitrate (  ),
      .SPLB7_Sl_wrDAck (  ),
      .SPLB7_Sl_wrComp (  ),
      .SPLB7_Sl_wrBTerm (  ),
      .SPLB7_Sl_rdDBus (  ),
      .SPLB7_Sl_rdWdAddr (  ),
      .SPLB7_Sl_rdDAck (  ),
      .SPLB7_Sl_rdComp (  ),
      .SPLB7_Sl_rdBTerm (  ),
      .SPLB7_Sl_MBusy (  ),
      .SPLB7_Sl_MRdErr (  ),
      .SPLB7_Sl_MWrErr (  ),
      .SPLB7_Sl_MIRQ (  ),
      .SDMA7_Clk ( net_gnd0 ),
      .SDMA7_Rx_IntOut (  ),
      .SDMA7_Tx_IntOut (  ),
      .SDMA7_RstOut (  ),
      .SDMA7_TX_D (  ),
      .SDMA7_TX_Rem (  ),
      .SDMA7_TX_SOF (  ),
      .SDMA7_TX_EOF (  ),
      .SDMA7_TX_SOP (  ),
      .SDMA7_TX_EOP (  ),
      .SDMA7_TX_Src_Rdy (  ),
      .SDMA7_TX_Dst_Rdy ( net_vcc0 ),
      .SDMA7_RX_D ( net_gnd32 ),
      .SDMA7_RX_Rem ( net_vcc4 ),
      .SDMA7_RX_SOF ( net_vcc0 ),
      .SDMA7_RX_EOF ( net_vcc0 ),
      .SDMA7_RX_SOP ( net_vcc0 ),
      .SDMA7_RX_EOP ( net_vcc0 ),
      .SDMA7_RX_Src_Rdy ( net_vcc0 ),
      .SDMA7_RX_Dst_Rdy (  ),
      .SDMA_CTRL7_Clk ( net_vcc0 ),
      .SDMA_CTRL7_Rst ( net_gnd0 ),
      .SDMA_CTRL7_PLB_ABus ( net_gnd32 ),
      .SDMA_CTRL7_PLB_PAValid ( net_gnd0 ),
      .SDMA_CTRL7_PLB_SAValid ( net_gnd0 ),
      .SDMA_CTRL7_PLB_masterID ( net_gnd1[0:0] ),
      .SDMA_CTRL7_PLB_RNW ( net_gnd0 ),
      .SDMA_CTRL7_PLB_BE ( net_gnd8 ),
      .SDMA_CTRL7_PLB_UABus ( net_gnd32 ),
      .SDMA_CTRL7_PLB_rdPrim ( net_gnd0 ),
      .SDMA_CTRL7_PLB_wrPrim ( net_gnd0 ),
      .SDMA_CTRL7_PLB_abort ( net_gnd0 ),
      .SDMA_CTRL7_PLB_busLock ( net_gnd0 ),
      .SDMA_CTRL7_PLB_MSize ( net_gnd2[1:0] ),
      .SDMA_CTRL7_PLB_size ( net_gnd4 ),
      .SDMA_CTRL7_PLB_type ( net_gnd3 ),
      .SDMA_CTRL7_PLB_lockErr ( net_gnd0 ),
      .SDMA_CTRL7_PLB_wrPendReq ( net_gnd0 ),
      .SDMA_CTRL7_PLB_wrPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL7_PLB_rdPendReq ( net_gnd0 ),
      .SDMA_CTRL7_PLB_rdPendPri ( net_gnd2[1:0] ),
      .SDMA_CTRL7_PLB_reqPri ( net_gnd2[1:0] ),
      .SDMA_CTRL7_PLB_TAttribute ( net_gnd16 ),
      .SDMA_CTRL7_PLB_rdBurst ( net_gnd0 ),
      .SDMA_CTRL7_PLB_wrBurst ( net_gnd0 ),
      .SDMA_CTRL7_PLB_wrDBus ( net_gnd64 ),
      .SDMA_CTRL7_Sl_addrAck (  ),
      .SDMA_CTRL7_Sl_SSize (  ),
      .SDMA_CTRL7_Sl_wait (  ),
      .SDMA_CTRL7_Sl_rearbitrate (  ),
      .SDMA_CTRL7_Sl_wrDAck (  ),
      .SDMA_CTRL7_Sl_wrComp (  ),
      .SDMA_CTRL7_Sl_wrBTerm (  ),
      .SDMA_CTRL7_Sl_rdDBus (  ),
      .SDMA_CTRL7_Sl_rdWdAddr (  ),
      .SDMA_CTRL7_Sl_rdDAck (  ),
      .SDMA_CTRL7_Sl_rdComp (  ),
      .SDMA_CTRL7_Sl_rdBTerm (  ),
      .SDMA_CTRL7_Sl_MBusy (  ),
      .SDMA_CTRL7_Sl_MRdErr (  ),
      .SDMA_CTRL7_Sl_MWrErr (  ),
      .SDMA_CTRL7_Sl_MIRQ (  ),
      .PIM7_Addr ( net_gnd32[0:31] ),
      .PIM7_AddrReq ( net_gnd0 ),
      .PIM7_AddrAck (  ),
      .PIM7_RNW ( net_gnd0 ),
      .PIM7_Size ( net_gnd4[0:3] ),
      .PIM7_RdModWr ( net_gnd0 ),
      .PIM7_WrFIFO_Data ( net_gnd64[0:63] ),
      .PIM7_WrFIFO_BE ( net_gnd8[0:7] ),
      .PIM7_WrFIFO_Push ( net_gnd0 ),
      .PIM7_RdFIFO_Data (  ),
      .PIM7_RdFIFO_Pop ( net_gnd0 ),
      .PIM7_RdFIFO_RdWdAddr (  ),
      .PIM7_WrFIFO_Empty (  ),
      .PIM7_WrFIFO_AlmostFull (  ),
      .PIM7_WrFIFO_Flush ( net_gnd0 ),
      .PIM7_RdFIFO_Empty (  ),
      .PIM7_RdFIFO_Flush ( net_gnd0 ),
      .PIM7_RdFIFO_Latency (  ),
      .PIM7_InitDone (  ),
      .PPC440MC7_MIMCReadNotWrite ( net_gnd0 ),
      .PPC440MC7_MIMCAddress ( net_gnd36 ),
      .PPC440MC7_MIMCAddressValid ( net_gnd0 ),
      .PPC440MC7_MIMCWriteData ( net_gnd128 ),
      .PPC440MC7_MIMCWriteDataValid ( net_gnd0 ),
      .PPC440MC7_MIMCByteEnable ( net_gnd16 ),
      .PPC440MC7_MIMCBankConflict ( net_gnd0 ),
      .PPC440MC7_MIMCRowConflict ( net_gnd0 ),
      .PPC440MC7_MCMIReadData (  ),
      .PPC440MC7_MCMIReadDataValid (  ),
      .PPC440MC7_MCMIReadDataErr (  ),
      .PPC440MC7_MCMIAddrReadyToAccept (  ),
      .VFBC7_Cmd_Clk ( net_gnd0 ),
      .VFBC7_Cmd_Reset ( net_gnd0 ),
      .VFBC7_Cmd_Data ( net_gnd32[0:31] ),
      .VFBC7_Cmd_Write ( net_gnd0 ),
      .VFBC7_Cmd_End ( net_gnd0 ),
      .VFBC7_Cmd_Full (  ),
      .VFBC7_Cmd_Almost_Full (  ),
      .VFBC7_Cmd_Idle (  ),
      .VFBC7_Wd_Clk ( net_gnd0 ),
      .VFBC7_Wd_Reset ( net_gnd0 ),
      .VFBC7_Wd_Write ( net_gnd0 ),
      .VFBC7_Wd_End_Burst ( net_gnd0 ),
      .VFBC7_Wd_Flush ( net_gnd0 ),
      .VFBC7_Wd_Data ( net_gnd32[0:31] ),
      .VFBC7_Wd_Data_BE ( net_gnd4[0:3] ),
      .VFBC7_Wd_Full (  ),
      .VFBC7_Wd_Almost_Full (  ),
      .VFBC7_Rd_Clk ( net_gnd0 ),
      .VFBC7_Rd_Reset ( net_gnd0 ),
      .VFBC7_Rd_Read ( net_gnd0 ),
      .VFBC7_Rd_End_Burst ( net_gnd0 ),
      .VFBC7_Rd_Flush ( net_gnd0 ),
      .VFBC7_Rd_Data (  ),
      .VFBC7_Rd_Empty (  ),
      .VFBC7_Rd_Almost_Empty (  ),
      .MCB7_cmd_clk ( net_gnd0 ),
      .MCB7_cmd_en ( net_gnd0 ),
      .MCB7_cmd_instr ( net_gnd3[0:2] ),
      .MCB7_cmd_bl ( net_gnd6 ),
      .MCB7_cmd_byte_addr ( net_gnd30 ),
      .MCB7_cmd_empty (  ),
      .MCB7_cmd_full (  ),
      .MCB7_wr_clk ( net_gnd0 ),
      .MCB7_wr_en ( net_gnd0 ),
      .MCB7_wr_mask ( net_gnd8[0:7] ),
      .MCB7_wr_data ( net_gnd64[0:63] ),
      .MCB7_wr_full (  ),
      .MCB7_wr_empty (  ),
      .MCB7_wr_count (  ),
      .MCB7_wr_underrun (  ),
      .MCB7_wr_error (  ),
      .MCB7_rd_clk ( net_gnd0 ),
      .MCB7_rd_en ( net_gnd0 ),
      .MCB7_rd_data (  ),
      .MCB7_rd_full (  ),
      .MCB7_rd_empty (  ),
      .MCB7_rd_count (  ),
      .MCB7_rd_overflow (  ),
      .MCB7_rd_error (  ),
      .MPMC_CTRL_Clk ( net_vcc0 ),
      .MPMC_CTRL_Rst ( net_gnd0 ),
      .MPMC_CTRL_PLB_ABus ( net_gnd32 ),
      .MPMC_CTRL_PLB_PAValid ( net_gnd0 ),
      .MPMC_CTRL_PLB_SAValid ( net_gnd0 ),
      .MPMC_CTRL_PLB_masterID ( net_gnd1[0:0] ),
      .MPMC_CTRL_PLB_RNW ( net_gnd0 ),
      .MPMC_CTRL_PLB_BE ( net_gnd8 ),
      .MPMC_CTRL_PLB_UABus ( net_gnd32 ),
      .MPMC_CTRL_PLB_rdPrim ( net_gnd0 ),
      .MPMC_CTRL_PLB_wrPrim ( net_gnd0 ),
      .MPMC_CTRL_PLB_abort ( net_gnd0 ),
      .MPMC_CTRL_PLB_busLock ( net_gnd0 ),
      .MPMC_CTRL_PLB_MSize ( net_gnd2[1:0] ),
      .MPMC_CTRL_PLB_size ( net_gnd4 ),
      .MPMC_CTRL_PLB_type ( net_gnd3 ),
      .MPMC_CTRL_PLB_lockErr ( net_gnd0 ),
      .MPMC_CTRL_PLB_wrPendReq ( net_gnd0 ),
      .MPMC_CTRL_PLB_wrPendPri ( net_gnd2[1:0] ),
      .MPMC_CTRL_PLB_rdPendReq ( net_gnd0 ),
      .MPMC_CTRL_PLB_rdPendPri ( net_gnd2[1:0] ),
      .MPMC_CTRL_PLB_reqPri ( net_gnd2[1:0] ),
      .MPMC_CTRL_PLB_TAttribute ( net_gnd16 ),
      .MPMC_CTRL_PLB_rdBurst ( net_gnd0 ),
      .MPMC_CTRL_PLB_wrBurst ( net_gnd0 ),
      .MPMC_CTRL_PLB_wrDBus ( net_gnd64 ),
      .MPMC_CTRL_Sl_addrAck (  ),
      .MPMC_CTRL_Sl_SSize (  ),
      .MPMC_CTRL_Sl_wait (  ),
      .MPMC_CTRL_Sl_rearbitrate (  ),
      .MPMC_CTRL_Sl_wrDAck (  ),
      .MPMC_CTRL_Sl_wrComp (  ),
      .MPMC_CTRL_Sl_wrBTerm (  ),
      .MPMC_CTRL_Sl_rdDBus (  ),
      .MPMC_CTRL_Sl_rdWdAddr (  ),
      .MPMC_CTRL_Sl_rdDAck (  ),
      .MPMC_CTRL_Sl_rdComp (  ),
      .MPMC_CTRL_Sl_rdBTerm (  ),
      .MPMC_CTRL_Sl_MBusy (  ),
      .MPMC_CTRL_Sl_MRdErr (  ),
      .MPMC_CTRL_Sl_MWrErr (  ),
      .MPMC_CTRL_Sl_MIRQ (  ),
      .MPMC_Clk0 ( clk_125_0000MHzPLL0 ),
      .MPMC_Clk0_DIV2 ( clk_62_5000MHzPLL0 ),
      .MPMC_Clk90 ( clk_125_0000MHz90PLL0 ),
      .MPMC_Clk_200MHz ( clk_200_0000MHz ),
      .MPMC_Rst ( sys_periph_reset[0] ),
      .MPMC_Clk_Mem ( net_vcc0 ),
      .MPMC_Clk_Mem_2x ( net_vcc0 ),
      .MPMC_Clk_Mem_2x_180 ( net_vcc0 ),
      .MPMC_Clk_Mem_2x_CE0 ( net_vcc0 ),
      .MPMC_Clk_Mem_2x_CE90 ( net_vcc0 ),
      .MPMC_Clk_Rd_Base ( net_vcc0 ),
      .MPMC_Clk_Mem_2x_bufpll_o (  ),
      .MPMC_Clk_Mem_2x_180_bufpll_o (  ),
      .MPMC_Clk_Mem_2x_CE0_bufpll_o (  ),
      .MPMC_Clk_Mem_2x_CE90_bufpll_o (  ),
      .MPMC_PLL_Lock_bufpll_o (  ),
      .MPMC_PLL_Lock ( net_gnd0 ),
      .MPMC_Idelayctrl_Rdy_I ( net_vcc0 ),
      .MPMC_Idelayctrl_Rdy_O (  ),
      .MPMC_InitDone (  ),
      .MPMC_ECC_Intr (  ),
      .MPMC_DCM_PSEN (  ),
      .MPMC_DCM_PSINCDEC (  ),
      .MPMC_DCM_PSDONE ( net_gnd0 ),
      .MPMC_MCB_DRP_Clk ( net_vcc0 ),
      .SDRAM_Clk (  ),
      .SDRAM_CE (  ),
      .SDRAM_CS_n (  ),
      .SDRAM_RAS_n (  ),
      .SDRAM_CAS_n (  ),
      .SDRAM_WE_n (  ),
      .SDRAM_BankAddr (  ),
      .SDRAM_Addr (  ),
      .SDRAM_DQ (  ),
      .SDRAM_DM (  ),
      .DDR_Clk (  ),
      .DDR_Clk_n (  ),
      .DDR_CE (  ),
      .DDR_CS_n (  ),
      .DDR_RAS_n (  ),
      .DDR_CAS_n (  ),
      .DDR_WE_n (  ),
      .DDR_BankAddr (  ),
      .DDR_Addr (  ),
      .DDR_DQ (  ),
      .DDR_DM (  ),
      .DDR_DQS (  ),
      .DDR_DQS_Div_O (  ),
      .DDR_DQS_Div_I ( net_gnd0 ),
      .DDR2_Clk ( fpga_0_DDR2_SDRAM_DDR2_Clk_pin ),
      .DDR2_Clk_n ( fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin ),
      .DDR2_CE ( fpga_0_DDR2_SDRAM_DDR2_CE_pin ),
      .DDR2_CS_n ( fpga_0_DDR2_SDRAM_DDR2_CS_n_pin ),
      .DDR2_ODT ( fpga_0_DDR2_SDRAM_DDR2_ODT_pin ),
      .DDR2_RAS_n ( fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin ),
      .DDR2_CAS_n ( fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin ),
      .DDR2_WE_n ( fpga_0_DDR2_SDRAM_DDR2_WE_n_pin ),
      .DDR2_BankAddr ( fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin ),
      .DDR2_Addr ( fpga_0_DDR2_SDRAM_DDR2_Addr_pin ),
      .DDR2_DQ ( fpga_0_DDR2_SDRAM_DDR2_DQ_pin ),
      .DDR2_DM ( fpga_0_DDR2_SDRAM_DDR2_DM_pin ),
      .DDR2_DQS ( fpga_0_DDR2_SDRAM_DDR2_DQS_pin ),
      .DDR2_DQS_n ( fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin ),
      .DDR2_DQS_Div_O (  ),
      .DDR2_DQS_Div_I ( net_gnd0 ),
      .DDR3_Clk (  ),
      .DDR3_Clk_n (  ),
      .DDR3_CE (  ),
      .DDR3_CS_n (  ),
      .DDR3_ODT (  ),
      .DDR3_RAS_n (  ),
      .DDR3_CAS_n (  ),
      .DDR3_WE_n (  ),
      .DDR3_BankAddr (  ),
      .DDR3_Addr (  ),
      .DDR3_DQ (  ),
      .DDR3_DM (  ),
      .DDR3_Reset_n (  ),
      .DDR3_DQS (  ),
      .DDR3_DQS_n (  ),
      .mcbx_dram_addr (  ),
      .mcbx_dram_ba (  ),
      .mcbx_dram_ras_n (  ),
      .mcbx_dram_cas_n (  ),
      .mcbx_dram_we_n (  ),
      .mcbx_dram_cke (  ),
      .mcbx_dram_clk (  ),
      .mcbx_dram_clk_n (  ),
      .mcbx_dram_dq (  ),
      .mcbx_dram_dqs (  ),
      .mcbx_dram_dqs_n (  ),
      .mcbx_dram_udqs (  ),
      .mcbx_dram_udqs_n (  ),
      .mcbx_dram_udm (  ),
      .mcbx_dram_ldm (  ),
      .mcbx_dram_odt (  ),
      .mcbx_dram_ddr3_rst (  ),
      .selfrefresh_enter ( net_gnd0 ),
      .selfrefresh_mode (  ),
      .calib_recal ( net_gnd0 ),
      .rzq (  ),
      .zio (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_clock_generator_0_wrapper
    clock_generator_0 (
      .CLKIN ( CLK_S ),
      .CLKOUT0 ( clk_125_0000MHz90PLL0 ),
      .CLKOUT1 ( clk_125_0000MHzPLL0 ),
      .CLKOUT2 ( clk_200_0000MHz ),
      .CLKOUT3 ( clk_62_5000MHzPLL0 ),
      .CLKOUT4 ( clock_generator_0_CLKOUT4 ),
      .CLKOUT5 ( clock_generator_0_CLKOUT5 ),
      .CLKOUT6 ( clock_generator_0_CLKOUT6 ),
      .CLKOUT7 (  ),
      .CLKOUT8 (  ),
      .CLKOUT9 (  ),
      .CLKOUT10 (  ),
      .CLKOUT11 (  ),
      .CLKOUT12 (  ),
      .CLKOUT13 (  ),
      .CLKOUT14 (  ),
      .CLKOUT15 (  ),
      .CLKFBIN ( net_gnd0 ),
      .CLKFBOUT (  ),
      .PSCLK ( net_gnd0 ),
      .PSEN ( net_gnd0 ),
      .PSINCDEC ( net_gnd0 ),
      .PSDONE (  ),
      .RST ( sys_rst_s ),
      .LOCKED ( Dcm_all_locked )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_mdm_0_wrapper
    mdm_0 (
      .Interrupt (  ),
      .Debug_SYS_Rst ( Debug_SYS_Rst ),
      .Ext_BRK ( Ext_BRK ),
      .Ext_NM_BRK ( Ext_NM_BRK ),
      .S_AXI_ACLK ( net_gnd0 ),
      .S_AXI_ARESETN ( net_gnd0 ),
      .S_AXI_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_AWVALID ( net_gnd0 ),
      .S_AXI_AWREADY (  ),
      .S_AXI_WDATA ( net_gnd32[0:31] ),
      .S_AXI_WSTRB ( net_gnd4[0:3] ),
      .S_AXI_WVALID ( net_gnd0 ),
      .S_AXI_WREADY (  ),
      .S_AXI_BRESP (  ),
      .S_AXI_BVALID (  ),
      .S_AXI_BREADY ( net_gnd0 ),
      .S_AXI_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_ARVALID ( net_gnd0 ),
      .S_AXI_ARREADY (  ),
      .S_AXI_RDATA (  ),
      .S_AXI_RRESP (  ),
      .S_AXI_RVALID (  ),
      .S_AXI_RREADY ( net_gnd0 ),
      .SPLB_Clk ( clk_62_5000MHzPLL0 ),
      .SPLB_Rst ( mb_plb_SPLB_Rst[2] ),
      .PLB_ABus ( mb_plb_PLB_ABus ),
      .PLB_UABus ( mb_plb_PLB_UABus ),
      .PLB_PAValid ( mb_plb_PLB_PAValid ),
      .PLB_SAValid ( mb_plb_PLB_SAValid ),
      .PLB_rdPrim ( mb_plb_PLB_rdPrim[2] ),
      .PLB_wrPrim ( mb_plb_PLB_wrPrim[2] ),
      .PLB_masterID ( mb_plb_PLB_masterID[0:0] ),
      .PLB_abort ( mb_plb_PLB_abort ),
      .PLB_busLock ( mb_plb_PLB_busLock ),
      .PLB_RNW ( mb_plb_PLB_RNW ),
      .PLB_BE ( mb_plb_PLB_BE ),
      .PLB_MSize ( mb_plb_PLB_MSize ),
      .PLB_size ( mb_plb_PLB_size ),
      .PLB_type ( mb_plb_PLB_type ),
      .PLB_lockErr ( mb_plb_PLB_lockErr ),
      .PLB_wrDBus ( mb_plb_PLB_wrDBus ),
      .PLB_wrBurst ( mb_plb_PLB_wrBurst ),
      .PLB_rdBurst ( mb_plb_PLB_rdBurst ),
      .PLB_wrPendReq ( mb_plb_PLB_wrPendReq ),
      .PLB_rdPendReq ( mb_plb_PLB_rdPendReq ),
      .PLB_wrPendPri ( mb_plb_PLB_wrPendPri ),
      .PLB_rdPendPri ( mb_plb_PLB_rdPendPri ),
      .PLB_reqPri ( mb_plb_PLB_reqPri ),
      .PLB_TAttribute ( mb_plb_PLB_TAttribute ),
      .Sl_addrAck ( mb_plb_Sl_addrAck[2] ),
      .Sl_SSize ( mb_plb_Sl_SSize[4:5] ),
      .Sl_wait ( mb_plb_Sl_wait[2] ),
      .Sl_rearbitrate ( mb_plb_Sl_rearbitrate[2] ),
      .Sl_wrDAck ( mb_plb_Sl_wrDAck[2] ),
      .Sl_wrComp ( mb_plb_Sl_wrComp[2] ),
      .Sl_wrBTerm ( mb_plb_Sl_wrBTerm[2] ),
      .Sl_rdDBus ( mb_plb_Sl_rdDBus[128:191] ),
      .Sl_rdWdAddr ( mb_plb_Sl_rdWdAddr[8:11] ),
      .Sl_rdDAck ( mb_plb_Sl_rdDAck[2] ),
      .Sl_rdComp ( mb_plb_Sl_rdComp[2] ),
      .Sl_rdBTerm ( mb_plb_Sl_rdBTerm[2] ),
      .Sl_MBusy ( mb_plb_Sl_MBusy[4:5] ),
      .Sl_MWrErr ( mb_plb_Sl_MWrErr[4:5] ),
      .Sl_MRdErr ( mb_plb_Sl_MRdErr[4:5] ),
      .Sl_MIRQ ( mb_plb_Sl_MIRQ[4:5] ),
      .Dbg_Clk_0 ( microblaze_0_mdm_bus_Dbg_Clk ),
      .Dbg_TDI_0 ( microblaze_0_mdm_bus_Dbg_TDI ),
      .Dbg_TDO_0 ( microblaze_0_mdm_bus_Dbg_TDO ),
      .Dbg_Reg_En_0 ( microblaze_0_mdm_bus_Dbg_Reg_En ),
      .Dbg_Capture_0 ( microblaze_0_mdm_bus_Dbg_Capture ),
      .Dbg_Shift_0 ( microblaze_0_mdm_bus_Dbg_Shift ),
      .Dbg_Update_0 ( microblaze_0_mdm_bus_Dbg_Update ),
      .Dbg_Rst_0 ( microblaze_0_mdm_bus_Debug_Rst ),
      .Dbg_Clk_1 (  ),
      .Dbg_TDI_1 (  ),
      .Dbg_TDO_1 ( net_gnd0 ),
      .Dbg_Reg_En_1 (  ),
      .Dbg_Capture_1 (  ),
      .Dbg_Shift_1 (  ),
      .Dbg_Update_1 (  ),
      .Dbg_Rst_1 (  ),
      .Dbg_Clk_2 (  ),
      .Dbg_TDI_2 (  ),
      .Dbg_TDO_2 ( net_gnd0 ),
      .Dbg_Reg_En_2 (  ),
      .Dbg_Capture_2 (  ),
      .Dbg_Shift_2 (  ),
      .Dbg_Update_2 (  ),
      .Dbg_Rst_2 (  ),
      .Dbg_Clk_3 (  ),
      .Dbg_TDI_3 (  ),
      .Dbg_TDO_3 ( net_gnd0 ),
      .Dbg_Reg_En_3 (  ),
      .Dbg_Capture_3 (  ),
      .Dbg_Shift_3 (  ),
      .Dbg_Update_3 (  ),
      .Dbg_Rst_3 (  ),
      .Dbg_Clk_4 (  ),
      .Dbg_TDI_4 (  ),
      .Dbg_TDO_4 ( net_gnd0 ),
      .Dbg_Reg_En_4 (  ),
      .Dbg_Capture_4 (  ),
      .Dbg_Shift_4 (  ),
      .Dbg_Update_4 (  ),
      .Dbg_Rst_4 (  ),
      .Dbg_Clk_5 (  ),
      .Dbg_TDI_5 (  ),
      .Dbg_TDO_5 ( net_gnd0 ),
      .Dbg_Reg_En_5 (  ),
      .Dbg_Capture_5 (  ),
      .Dbg_Shift_5 (  ),
      .Dbg_Update_5 (  ),
      .Dbg_Rst_5 (  ),
      .Dbg_Clk_6 (  ),
      .Dbg_TDI_6 (  ),
      .Dbg_TDO_6 ( net_gnd0 ),
      .Dbg_Reg_En_6 (  ),
      .Dbg_Capture_6 (  ),
      .Dbg_Shift_6 (  ),
      .Dbg_Update_6 (  ),
      .Dbg_Rst_6 (  ),
      .Dbg_Clk_7 (  ),
      .Dbg_TDI_7 (  ),
      .Dbg_TDO_7 ( net_gnd0 ),
      .Dbg_Reg_En_7 (  ),
      .Dbg_Capture_7 (  ),
      .Dbg_Shift_7 (  ),
      .Dbg_Update_7 (  ),
      .Dbg_Rst_7 (  ),
      .bscan_tdi (  ),
      .bscan_reset (  ),
      .bscan_shift (  ),
      .bscan_update (  ),
      .bscan_capture (  ),
      .bscan_sel1 (  ),
      .bscan_drck1 (  ),
      .bscan_tdo1 ( net_gnd0 ),
      .Ext_JTAG_DRCK (  ),
      .Ext_JTAG_RESET (  ),
      .Ext_JTAG_SEL (  ),
      .Ext_JTAG_CAPTURE (  ),
      .Ext_JTAG_SHIFT (  ),
      .Ext_JTAG_UPDATE (  ),
      .Ext_JTAG_TDI (  ),
      .Ext_JTAG_TDO ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_proc_sys_reset_0_wrapper
    proc_sys_reset_0 (
      .Slowest_sync_clk ( clk_62_5000MHzPLL0 ),
      .Ext_Reset_In ( sys_rst_s ),
      .Aux_Reset_In ( net_gnd0 ),
      .MB_Debug_Sys_Rst ( Debug_SYS_Rst ),
      .Core_Reset_Req_0 ( net_gnd0 ),
      .Chip_Reset_Req_0 ( net_gnd0 ),
      .System_Reset_Req_0 ( net_gnd0 ),
      .Core_Reset_Req_1 ( net_gnd0 ),
      .Chip_Reset_Req_1 ( net_gnd0 ),
      .System_Reset_Req_1 ( net_gnd0 ),
      .Dcm_locked ( Dcm_all_locked ),
      .RstcPPCresetcore_0 (  ),
      .RstcPPCresetchip_0 (  ),
      .RstcPPCresetsys_0 (  ),
      .RstcPPCresetcore_1 (  ),
      .RstcPPCresetchip_1 (  ),
      .RstcPPCresetsys_1 (  ),
      .MB_Reset ( mb_reset ),
      .Bus_Struct_Reset ( sys_bus_reset[0:0] ),
      .Peripheral_Reset ( sys_periph_reset[0:0] ),
      .Interconnect_aresetn (  ),
      .Peripheral_aresetn (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_readbgcop_0_to_microblaze_0_wrapper
    readbgcop_0_to_microblaze_0 (
      .FSL_Clk ( clk_62_5000MHzPLL0 ),
      .SYS_Rst ( sys_bus_reset[0] ),
      .FSL_Rst ( readbgcop_0_to_microblaze_0_LMB_Rst ),
      .FSL_M_Clk ( clk_125_0000MHzPLL0 ),
      .FSL_M_Data ( readbgcop_0_to_microblaze_0_FSL_M_Data ),
      .FSL_M_Control ( readbgcop_0_to_microblaze_0_FSL_M_Control ),
      .FSL_M_Write ( readbgcop_0_to_microblaze_0_FSL_M_Write ),
      .FSL_M_Full ( readbgcop_0_to_microblaze_0_FSL_M_Full ),
      .FSL_S_Clk ( clk_62_5000MHzPLL0 ),
      .FSL_S_Data ( readbgcop_0_to_microblaze_0_FSL_S_Data ),
      .FSL_S_Control ( readbgcop_0_to_microblaze_0_FSL_S_Control ),
      .FSL_S_Read ( readbgcop_0_to_microblaze_0_FSL_S_Read ),
      .FSL_S_Exists ( readbgcop_0_to_microblaze_0_FSL_S_Exists ),
      .FSL_Full (  ),
      .FSL_Has_Data (  ),
      .FSL_Control_IRQ (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_readbgcop_0_wrapper
    readbgcop_0 (
      .FSL_Clk ( clk_62_5000MHzPLL0 ),
      .FSL_Rst ( readbgcop_0_to_microblaze_0_LMB_Rst ),
      .FSL_S_Clk ( clk_125_0000MHzPLL0 ),
      .FSL_S_Read ( microblaze_0_to_readbgcop_0_FSL_S_Read ),
      .FSL_S_Data ( microblaze_0_to_readbgcop_0_FSL_S_Data ),
      .FSL_S_Control ( microblaze_0_to_readbgcop_0_FSL_S_Control ),
      .FSL_S_Exists ( microblaze_0_to_readbgcop_0_FSL_S_Exists ),
      .FSL_M_Clk ( clk_125_0000MHzPLL0 ),
      .FSL_M_Write ( readbgcop_0_to_microblaze_0_FSL_M_Write ),
      .FSL_M_Data ( readbgcop_0_to_microblaze_0_FSL_M_Data ),
      .FSL_M_Control ( readbgcop_0_to_microblaze_0_FSL_M_Control ),
      .FSL_M_Full ( readbgcop_0_to_microblaze_0_FSL_M_Full ),
      .system_dcm_locked ( Dcm_all_locked ),
      .XIL_NPI_Addr ( readbgcop_0_XIL_NPI_Addr ),
      .XIL_NPI_AddrReq ( readbgcop_0_XIL_NPI_AddrReq ),
      .XIL_NPI_AddrAck ( readbgcop_0_XIL_NPI_AddrAck ),
      .XIL_NPI_RNW ( readbgcop_0_XIL_NPI_RNW ),
      .XIL_NPI_Size ( readbgcop_0_XIL_NPI_Size ),
      .XIL_NPI_WrFIFO_Data ( readbgcop_0_XIL_NPI_WrFIFO_Data ),
      .XIL_NPI_WrFIFO_BE ( readbgcop_0_XIL_NPI_WrFIFO_BE ),
      .XIL_NPI_WrFIFO_Push ( readbgcop_0_XIL_NPI_WrFIFO_Push ),
      .XIL_NPI_RdFIFO_Data ( readbgcop_0_XIL_NPI_RdFIFO_Data ),
      .XIL_NPI_RdFIFO_Pop ( readbgcop_0_XIL_NPI_RdFIFO_Pop ),
      .XIL_NPI_RdFIFO_RdWdAddr ( readbgcop_0_XIL_NPI_RdFIFO_RdWdAddr ),
      .XIL_NPI_WrFIFO_Empty ( readbgcop_0_XIL_NPI_WrFIFO_Empty ),
      .XIL_NPI_WrFIFO_AlmostFull ( readbgcop_0_XIL_NPI_WrFIFO_AlmostFull ),
      .XIL_NPI_WrFIFO_Flush ( readbgcop_0_XIL_NPI_WrFIFO_Flush ),
      .XIL_NPI_RdFIFO_Empty ( readbgcop_0_XIL_NPI_RdFIFO_Empty ),
      .XIL_NPI_RdFIFO_Flush ( readbgcop_0_XIL_NPI_RdFIFO_Flush ),
      .XIL_NPI_RdFIFO_Latency ( readbgcop_0_XIL_NPI_RDFIFO_Latency ),
      .XIL_NPI_RdModWr ( readbgcop_0_XIL_NPI_RdModWr ),
      .XIL_NPI_InitDone ( readbgcop_0_XIL_NPI_InitDone ),
      .OUTBG_Port ( OUTBG_Port_net )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_microblaze_0_to_readbgcop_0_wrapper
    microblaze_0_to_readbgcop_0 (
      .FSL_Clk ( clk_62_5000MHzPLL0 ),
      .SYS_Rst ( sys_bus_reset[0] ),
      .FSL_Rst (  ),
      .FSL_M_Clk ( clk_62_5000MHzPLL0 ),
      .FSL_M_Data ( microblaze_0_to_readbgcop_0_FSL_M_Data ),
      .FSL_M_Control ( microblaze_0_to_readbgcop_0_FSL_M_Control ),
      .FSL_M_Write ( microblaze_0_to_readbgcop_0_FSL_M_Write ),
      .FSL_M_Full ( microblaze_0_to_readbgcop_0_FSL_M_Full ),
      .FSL_S_Clk ( clk_125_0000MHzPLL0 ),
      .FSL_S_Data ( microblaze_0_to_readbgcop_0_FSL_S_Data ),
      .FSL_S_Control ( microblaze_0_to_readbgcop_0_FSL_S_Control ),
      .FSL_S_Read ( microblaze_0_to_readbgcop_0_FSL_S_Read ),
      .FSL_S_Exists ( microblaze_0_to_readbgcop_0_FSL_S_Exists ),
      .FSL_Full (  ),
      .FSL_Has_Data (  ),
      .FSL_Control_IRQ (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_readfgcop_0_to_microblaze_0_wrapper
    readfgcop_0_to_microblaze_0 (
      .FSL_Clk ( clk_62_5000MHzPLL0 ),
      .SYS_Rst ( sys_bus_reset[0] ),
      .FSL_Rst ( readfgcop_0_to_microblaze_0_LMB_Rst ),
      .FSL_M_Clk ( clk_125_0000MHzPLL0 ),
      .FSL_M_Data ( readfgcop_0_to_microblaze_0_FSL_M_Data ),
      .FSL_M_Control ( readfgcop_0_to_microblaze_0_FSL_M_Control ),
      .FSL_M_Write ( readfgcop_0_to_microblaze_0_FSL_M_Write ),
      .FSL_M_Full ( readfgcop_0_to_microblaze_0_FSL_M_Full ),
      .FSL_S_Clk ( clk_62_5000MHzPLL0 ),
      .FSL_S_Data ( readfgcop_0_to_microblaze_0_FSL_S_Data ),
      .FSL_S_Control ( readfgcop_0_to_microblaze_0_FSL_S_Control ),
      .FSL_S_Read ( readfgcop_0_to_microblaze_0_FSL_S_Read ),
      .FSL_S_Exists ( readfgcop_0_to_microblaze_0_FSL_S_Exists ),
      .FSL_Full (  ),
      .FSL_Has_Data (  ),
      .FSL_Control_IRQ (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_readfgcop_0_wrapper
    readfgcop_0 (
      .FSL_Clk ( clk_62_5000MHzPLL0 ),
      .FSL_Rst ( readfgcop_0_to_microblaze_0_LMB_Rst ),
      .FSL_S_Clk ( clk_125_0000MHzPLL0 ),
      .FSL_S_Read ( microblaze_0_to_readfgcop_0_FSL_S_Read ),
      .FSL_S_Data ( microblaze_0_to_readfgcop_0_FSL_S_Data ),
      .FSL_S_Control ( microblaze_0_to_readfgcop_0_FSL_S_Control ),
      .FSL_S_Exists ( microblaze_0_to_readfgcop_0_FSL_S_Exists ),
      .FSL_M_Clk ( clk_125_0000MHzPLL0 ),
      .FSL_M_Write ( readfgcop_0_to_microblaze_0_FSL_M_Write ),
      .FSL_M_Data ( readfgcop_0_to_microblaze_0_FSL_M_Data ),
      .FSL_M_Control ( readfgcop_0_to_microblaze_0_FSL_M_Control ),
      .FSL_M_Full ( readfgcop_0_to_microblaze_0_FSL_M_Full ),
      .system_dcm_locked ( Dcm_all_locked ),
      .XIL_NPI_Addr ( readfgcop_0_XIL_NPI_Addr ),
      .XIL_NPI_AddrReq ( readfgcop_0_XIL_NPI_AddrReq ),
      .XIL_NPI_AddrAck ( readfgcop_0_XIL_NPI_AddrAck ),
      .XIL_NPI_RNW ( readfgcop_0_XIL_NPI_RNW ),
      .XIL_NPI_Size ( readfgcop_0_XIL_NPI_Size ),
      .XIL_NPI_WrFIFO_Data ( readfgcop_0_XIL_NPI_WrFIFO_Data ),
      .XIL_NPI_WrFIFO_BE ( readfgcop_0_XIL_NPI_WrFIFO_BE ),
      .XIL_NPI_WrFIFO_Push ( readfgcop_0_XIL_NPI_WrFIFO_Push ),
      .XIL_NPI_RdFIFO_Data ( readfgcop_0_XIL_NPI_RdFIFO_Data ),
      .XIL_NPI_RdFIFO_Pop ( readfgcop_0_XIL_NPI_RdFIFO_Pop ),
      .XIL_NPI_RdFIFO_RdWdAddr ( readfgcop_0_XIL_NPI_RdFIFO_RdWdAddr ),
      .XIL_NPI_WrFIFO_Empty ( readfgcop_0_XIL_NPI_WrFIFO_Empty ),
      .XIL_NPI_WrFIFO_AlmostFull ( readfgcop_0_XIL_NPI_WrFIFO_AlmostFull ),
      .XIL_NPI_WrFIFO_Flush ( readfgcop_0_XIL_NPI_WrFIFO_Flush ),
      .XIL_NPI_RdFIFO_Empty ( readfgcop_0_XIL_NPI_RdFIFO_Empty ),
      .XIL_NPI_RdFIFO_Flush ( readfgcop_0_XIL_NPI_RdFIFO_Flush ),
      .XIL_NPI_RdFIFO_Latency ( readfgcop_0_XIL_NPI_RDFIFO_Latency ),
      .XIL_NPI_RdModWr ( readfgcop_0_XIL_NPI_RdModWr ),
      .XIL_NPI_InitDone ( readfgcop_0_XIL_NPI_InitDone ),
      .OUTFG_Port ( OUTFG_Port_net )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_microblaze_0_to_readfgcop_0_wrapper
    microblaze_0_to_readfgcop_0 (
      .FSL_Clk ( clk_62_5000MHzPLL0 ),
      .SYS_Rst ( sys_bus_reset[0] ),
      .FSL_Rst (  ),
      .FSL_M_Clk ( clk_62_5000MHzPLL0 ),
      .FSL_M_Data ( microblaze_0_to_readfgcop_0_FSL_M_Data ),
      .FSL_M_Control ( microblaze_0_to_readfgcop_0_FSL_M_Control ),
      .FSL_M_Write ( microblaze_0_to_readfgcop_0_FSL_M_Write ),
      .FSL_M_Full ( microblaze_0_to_readfgcop_0_FSL_M_Full ),
      .FSL_S_Clk ( clk_125_0000MHzPLL0 ),
      .FSL_S_Data ( microblaze_0_to_readfgcop_0_FSL_S_Data ),
      .FSL_S_Control ( microblaze_0_to_readfgcop_0_FSL_S_Control ),
      .FSL_S_Read ( microblaze_0_to_readfgcop_0_FSL_S_Read ),
      .FSL_S_Exists ( microblaze_0_to_readfgcop_0_FSL_S_Exists ),
      .FSL_Full (  ),
      .FSL_Has_Data (  ),
      .FSL_Control_IRQ (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_microblaze_0_to_writecop_0_wrapper
    microblaze_0_to_writecop_0 (
      .FSL_Clk ( clk_62_5000MHzPLL0 ),
      .SYS_Rst ( sys_bus_reset[0] ),
      .FSL_Rst ( microblaze_0_to_writecop_0_LMB_Rst ),
      .FSL_M_Clk ( clk_62_5000MHzPLL0 ),
      .FSL_M_Data ( microblaze_0_to_writecop_0_FSL_M_Data ),
      .FSL_M_Control ( microblaze_0_to_writecop_0_FSL_M_Control ),
      .FSL_M_Write ( microblaze_0_to_writecop_0_FSL_M_Write ),
      .FSL_M_Full ( microblaze_0_to_writecop_0_FSL_M_Full ),
      .FSL_S_Clk ( clk_125_0000MHzPLL0 ),
      .FSL_S_Data ( microblaze_0_to_writecop_0_FSL_S_Data ),
      .FSL_S_Control ( microblaze_0_to_writecop_0_FSL_S_Control ),
      .FSL_S_Read ( microblaze_0_to_writecop_0_FSL_S_Read ),
      .FSL_S_Exists ( microblaze_0_to_writecop_0_FSL_S_Exists ),
      .FSL_Full (  ),
      .FSL_Has_Data (  ),
      .FSL_Control_IRQ (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_writecop_0_wrapper
    writecop_0 (
      .FSL_Clk ( clk_62_5000MHzPLL0 ),
      .FSL_Rst ( microblaze_0_to_writecop_0_LMB_Rst ),
      .FSL_S_Clk ( clk_125_0000MHzPLL0 ),
      .FSL_S_Read ( microblaze_0_to_writecop_0_FSL_S_Read ),
      .FSL_S_Data ( microblaze_0_to_writecop_0_FSL_S_Data ),
      .FSL_S_Control ( microblaze_0_to_writecop_0_FSL_S_Control ),
      .FSL_S_Exists ( microblaze_0_to_writecop_0_FSL_S_Exists ),
      .system_dcm_locked ( Dcm_all_locked ),
      .XIL_NPI_Addr ( writecop_0_XIL_NPI_Addr ),
      .XIL_NPI_AddrReq ( writecop_0_XIL_NPI_AddrReq ),
      .XIL_NPI_AddrAck ( writecop_0_XIL_NPI_AddrAck ),
      .XIL_NPI_RNW ( writecop_0_XIL_NPI_RNW ),
      .XIL_NPI_Size ( writecop_0_XIL_NPI_Size ),
      .XIL_NPI_WrFIFO_Data ( writecop_0_XIL_NPI_WrFIFO_Data ),
      .XIL_NPI_WrFIFO_BE ( writecop_0_XIL_NPI_WrFIFO_BE ),
      .XIL_NPI_WrFIFO_Push ( writecop_0_XIL_NPI_WrFIFO_Push ),
      .XIL_NPI_RdFIFO_Data ( writecop_0_XIL_NPI_RdFIFO_Data ),
      .XIL_NPI_RdFIFO_Pop ( writecop_0_XIL_NPI_RdFIFO_Pop ),
      .XIL_NPI_RdFIFO_RdWdAddr ( writecop_0_XIL_NPI_RdFIFO_RdWdAddr ),
      .XIL_NPI_WrFIFO_Empty ( writecop_0_XIL_NPI_WrFIFO_Empty ),
      .XIL_NPI_WrFIFO_AlmostFull ( writecop_0_XIL_NPI_WrFIFO_AlmostFull ),
      .XIL_NPI_WrFIFO_Flush ( writecop_0_XIL_NPI_WrFIFO_Flush ),
      .XIL_NPI_RdFIFO_Empty ( writecop_0_XIL_NPI_RdFIFO_Empty ),
      .XIL_NPI_RdFIFO_Flush ( writecop_0_XIL_NPI_RdFIFO_Flush ),
      .XIL_NPI_RdFIFO_Latency ( writecop_0_XIL_NPI_RDFIFO_Latency ),
      .XIL_NPI_RdModWr ( writecop_0_XIL_NPI_RdModWr ),
      .XIL_NPI_InitDone ( writecop_0_XIL_NPI_InitDone )
    );

endmodule

module system_microblaze_0_wrapper
  (
    CLK,
    RESET,
    MB_RESET,
    INTERRUPT,
    INTERRUPT_ADDRESS,
    INTERRUPT_ACK,
    EXT_BRK,
    EXT_NM_BRK,
    DBG_STOP,
    MB_Halted,
    MB_Error,
    LOCKSTEP_MASTER_OUT,
    LOCKSTEP_SLAVE_IN,
    LOCKSTEP_OUT,
    INSTR,
    IREADY,
    IWAIT,
    ICE,
    IUE,
    INSTR_ADDR,
    IFETCH,
    I_AS,
    IPLB_M_ABort,
    IPLB_M_ABus,
    IPLB_M_UABus,
    IPLB_M_BE,
    IPLB_M_busLock,
    IPLB_M_lockErr,
    IPLB_M_MSize,
    IPLB_M_priority,
    IPLB_M_rdBurst,
    IPLB_M_request,
    IPLB_M_RNW,
    IPLB_M_size,
    IPLB_M_TAttribute,
    IPLB_M_type,
    IPLB_M_wrBurst,
    IPLB_M_wrDBus,
    IPLB_MBusy,
    IPLB_MRdErr,
    IPLB_MWrErr,
    IPLB_MIRQ,
    IPLB_MWrBTerm,
    IPLB_MWrDAck,
    IPLB_MAddrAck,
    IPLB_MRdBTerm,
    IPLB_MRdDAck,
    IPLB_MRdDBus,
    IPLB_MRdWdAddr,
    IPLB_MRearbitrate,
    IPLB_MSSize,
    IPLB_MTimeout,
    DATA_READ,
    DREADY,
    DWAIT,
    DCE,
    DUE,
    DATA_WRITE,
    DATA_ADDR,
    D_AS,
    READ_STROBE,
    WRITE_STROBE,
    BYTE_ENABLE,
    DPLB_M_ABort,
    DPLB_M_ABus,
    DPLB_M_UABus,
    DPLB_M_BE,
    DPLB_M_busLock,
    DPLB_M_lockErr,
    DPLB_M_MSize,
    DPLB_M_priority,
    DPLB_M_rdBurst,
    DPLB_M_request,
    DPLB_M_RNW,
    DPLB_M_size,
    DPLB_M_TAttribute,
    DPLB_M_type,
    DPLB_M_wrBurst,
    DPLB_M_wrDBus,
    DPLB_MBusy,
    DPLB_MRdErr,
    DPLB_MWrErr,
    DPLB_MIRQ,
    DPLB_MWrBTerm,
    DPLB_MWrDAck,
    DPLB_MAddrAck,
    DPLB_MRdBTerm,
    DPLB_MRdDAck,
    DPLB_MRdDBus,
    DPLB_MRdWdAddr,
    DPLB_MRearbitrate,
    DPLB_MSSize,
    DPLB_MTimeout,
    M_AXI_IP_AWID,
    M_AXI_IP_AWADDR,
    M_AXI_IP_AWLEN,
    M_AXI_IP_AWSIZE,
    M_AXI_IP_AWBURST,
    M_AXI_IP_AWLOCK,
    M_AXI_IP_AWCACHE,
    M_AXI_IP_AWPROT,
    M_AXI_IP_AWQOS,
    M_AXI_IP_AWVALID,
    M_AXI_IP_AWREADY,
    M_AXI_IP_WDATA,
    M_AXI_IP_WSTRB,
    M_AXI_IP_WLAST,
    M_AXI_IP_WVALID,
    M_AXI_IP_WREADY,
    M_AXI_IP_BID,
    M_AXI_IP_BRESP,
    M_AXI_IP_BVALID,
    M_AXI_IP_BREADY,
    M_AXI_IP_ARID,
    M_AXI_IP_ARADDR,
    M_AXI_IP_ARLEN,
    M_AXI_IP_ARSIZE,
    M_AXI_IP_ARBURST,
    M_AXI_IP_ARLOCK,
    M_AXI_IP_ARCACHE,
    M_AXI_IP_ARPROT,
    M_AXI_IP_ARQOS,
    M_AXI_IP_ARVALID,
    M_AXI_IP_ARREADY,
    M_AXI_IP_RID,
    M_AXI_IP_RDATA,
    M_AXI_IP_RRESP,
    M_AXI_IP_RLAST,
    M_AXI_IP_RVALID,
    M_AXI_IP_RREADY,
    M_AXI_DP_AWID,
    M_AXI_DP_AWADDR,
    M_AXI_DP_AWLEN,
    M_AXI_DP_AWSIZE,
    M_AXI_DP_AWBURST,
    M_AXI_DP_AWLOCK,
    M_AXI_DP_AWCACHE,
    M_AXI_DP_AWPROT,
    M_AXI_DP_AWQOS,
    M_AXI_DP_AWVALID,
    M_AXI_DP_AWREADY,
    M_AXI_DP_WDATA,
    M_AXI_DP_WSTRB,
    M_AXI_DP_WLAST,
    M_AXI_DP_WVALID,
    M_AXI_DP_WREADY,
    M_AXI_DP_BID,
    M_AXI_DP_BRESP,
    M_AXI_DP_BVALID,
    M_AXI_DP_BREADY,
    M_AXI_DP_ARID,
    M_AXI_DP_ARADDR,
    M_AXI_DP_ARLEN,
    M_AXI_DP_ARSIZE,
    M_AXI_DP_ARBURST,
    M_AXI_DP_ARLOCK,
    M_AXI_DP_ARCACHE,
    M_AXI_DP_ARPROT,
    M_AXI_DP_ARQOS,
    M_AXI_DP_ARVALID,
    M_AXI_DP_ARREADY,
    M_AXI_DP_RID,
    M_AXI_DP_RDATA,
    M_AXI_DP_RRESP,
    M_AXI_DP_RLAST,
    M_AXI_DP_RVALID,
    M_AXI_DP_RREADY,
    M_AXI_IC_AWID,
    M_AXI_IC_AWADDR,
    M_AXI_IC_AWLEN,
    M_AXI_IC_AWSIZE,
    M_AXI_IC_AWBURST,
    M_AXI_IC_AWLOCK,
    M_AXI_IC_AWCACHE,
    M_AXI_IC_AWPROT,
    M_AXI_IC_AWQOS,
    M_AXI_IC_AWVALID,
    M_AXI_IC_AWREADY,
    M_AXI_IC_AWUSER,
    M_AXI_IC_WDATA,
    M_AXI_IC_WSTRB,
    M_AXI_IC_WLAST,
    M_AXI_IC_WVALID,
    M_AXI_IC_WREADY,
    M_AXI_IC_WUSER,
    M_AXI_IC_BID,
    M_AXI_IC_BRESP,
    M_AXI_IC_BVALID,
    M_AXI_IC_BREADY,
    M_AXI_IC_BUSER,
    M_AXI_IC_ARID,
    M_AXI_IC_ARADDR,
    M_AXI_IC_ARLEN,
    M_AXI_IC_ARSIZE,
    M_AXI_IC_ARBURST,
    M_AXI_IC_ARLOCK,
    M_AXI_IC_ARCACHE,
    M_AXI_IC_ARPROT,
    M_AXI_IC_ARQOS,
    M_AXI_IC_ARVALID,
    M_AXI_IC_ARREADY,
    M_AXI_IC_ARUSER,
    M_AXI_IC_RID,
    M_AXI_IC_RDATA,
    M_AXI_IC_RRESP,
    M_AXI_IC_RLAST,
    M_AXI_IC_RVALID,
    M_AXI_IC_RREADY,
    M_AXI_IC_RUSER,
    M_AXI_DC_AWID,
    M_AXI_DC_AWADDR,
    M_AXI_DC_AWLEN,
    M_AXI_DC_AWSIZE,
    M_AXI_DC_AWBURST,
    M_AXI_DC_AWLOCK,
    M_AXI_DC_AWCACHE,
    M_AXI_DC_AWPROT,
    M_AXI_DC_AWQOS,
    M_AXI_DC_AWVALID,
    M_AXI_DC_AWREADY,
    M_AXI_DC_AWUSER,
    M_AXI_DC_WDATA,
    M_AXI_DC_WSTRB,
    M_AXI_DC_WLAST,
    M_AXI_DC_WVALID,
    M_AXI_DC_WREADY,
    M_AXI_DC_WUSER,
    M_AXI_DC_BID,
    M_AXI_DC_BRESP,
    M_AXI_DC_BVALID,
    M_AXI_DC_BREADY,
    M_AXI_DC_BUSER,
    M_AXI_DC_ARID,
    M_AXI_DC_ARADDR,
    M_AXI_DC_ARLEN,
    M_AXI_DC_ARSIZE,
    M_AXI_DC_ARBURST,
    M_AXI_DC_ARLOCK,
    M_AXI_DC_ARCACHE,
    M_AXI_DC_ARPROT,
    M_AXI_DC_ARQOS,
    M_AXI_DC_ARVALID,
    M_AXI_DC_ARREADY,
    M_AXI_DC_ARUSER,
    M_AXI_DC_RID,
    M_AXI_DC_RDATA,
    M_AXI_DC_RRESP,
    M_AXI_DC_RLAST,
    M_AXI_DC_RVALID,
    M_AXI_DC_RREADY,
    M_AXI_DC_RUSER,
    DBG_CLK,
    DBG_TDI,
    DBG_TDO,
    DBG_REG_EN,
    DBG_SHIFT,
    DBG_CAPTURE,
    DBG_UPDATE,
    DEBUG_RST,
    Trace_Instruction,
    Trace_Valid_Instr,
    Trace_PC,
    Trace_Reg_Write,
    Trace_Reg_Addr,
    Trace_MSR_Reg,
    Trace_PID_Reg,
    Trace_New_Reg_Value,
    Trace_Exception_Taken,
    Trace_Exception_Kind,
    Trace_Jump_Taken,
    Trace_Delay_Slot,
    Trace_Data_Address,
    Trace_Data_Access,
    Trace_Data_Read,
    Trace_Data_Write,
    Trace_Data_Write_Value,
    Trace_Data_Byte_Enable,
    Trace_DCache_Req,
    Trace_DCache_Hit,
    Trace_DCache_Rdy,
    Trace_DCache_Read,
    Trace_ICache_Req,
    Trace_ICache_Hit,
    Trace_ICache_Rdy,
    Trace_OF_PipeRun,
    Trace_EX_PipeRun,
    Trace_MEM_PipeRun,
    Trace_MB_Halted,
    Trace_Jump_Hit,
    FSL0_S_CLK,
    FSL0_S_READ,
    FSL0_S_DATA,
    FSL0_S_CONTROL,
    FSL0_S_EXISTS,
    FSL0_M_CLK,
    FSL0_M_WRITE,
    FSL0_M_DATA,
    FSL0_M_CONTROL,
    FSL0_M_FULL,
    FSL1_S_CLK,
    FSL1_S_READ,
    FSL1_S_DATA,
    FSL1_S_CONTROL,
    FSL1_S_EXISTS,
    FSL1_M_CLK,
    FSL1_M_WRITE,
    FSL1_M_DATA,
    FSL1_M_CONTROL,
    FSL1_M_FULL,
    FSL2_S_CLK,
    FSL2_S_READ,
    FSL2_S_DATA,
    FSL2_S_CONTROL,
    FSL2_S_EXISTS,
    FSL2_M_CLK,
    FSL2_M_WRITE,
    FSL2_M_DATA,
    FSL2_M_CONTROL,
    FSL2_M_FULL,
    FSL3_S_CLK,
    FSL3_S_READ,
    FSL3_S_DATA,
    FSL3_S_CONTROL,
    FSL3_S_EXISTS,
    FSL3_M_CLK,
    FSL3_M_WRITE,
    FSL3_M_DATA,
    FSL3_M_CONTROL,
    FSL3_M_FULL,
    FSL4_S_CLK,
    FSL4_S_READ,
    FSL4_S_DATA,
    FSL4_S_CONTROL,
    FSL4_S_EXISTS,
    FSL4_M_CLK,
    FSL4_M_WRITE,
    FSL4_M_DATA,
    FSL4_M_CONTROL,
    FSL4_M_FULL,
    FSL5_S_CLK,
    FSL5_S_READ,
    FSL5_S_DATA,
    FSL5_S_CONTROL,
    FSL5_S_EXISTS,
    FSL5_M_CLK,
    FSL5_M_WRITE,
    FSL5_M_DATA,
    FSL5_M_CONTROL,
    FSL5_M_FULL,
    FSL6_S_CLK,
    FSL6_S_READ,
    FSL6_S_DATA,
    FSL6_S_CONTROL,
    FSL6_S_EXISTS,
    FSL6_M_CLK,
    FSL6_M_WRITE,
    FSL6_M_DATA,
    FSL6_M_CONTROL,
    FSL6_M_FULL,
    FSL7_S_CLK,
    FSL7_S_READ,
    FSL7_S_DATA,
    FSL7_S_CONTROL,
    FSL7_S_EXISTS,
    FSL7_M_CLK,
    FSL7_M_WRITE,
    FSL7_M_DATA,
    FSL7_M_CONTROL,
    FSL7_M_FULL,
    FSL8_S_CLK,
    FSL8_S_READ,
    FSL8_S_DATA,
    FSL8_S_CONTROL,
    FSL8_S_EXISTS,
    FSL8_M_CLK,
    FSL8_M_WRITE,
    FSL8_M_DATA,
    FSL8_M_CONTROL,
    FSL8_M_FULL,
    FSL9_S_CLK,
    FSL9_S_READ,
    FSL9_S_DATA,
    FSL9_S_CONTROL,
    FSL9_S_EXISTS,
    FSL9_M_CLK,
    FSL9_M_WRITE,
    FSL9_M_DATA,
    FSL9_M_CONTROL,
    FSL9_M_FULL,
    FSL10_S_CLK,
    FSL10_S_READ,
    FSL10_S_DATA,
    FSL10_S_CONTROL,
    FSL10_S_EXISTS,
    FSL10_M_CLK,
    FSL10_M_WRITE,
    FSL10_M_DATA,
    FSL10_M_CONTROL,
    FSL10_M_FULL,
    FSL11_S_CLK,
    FSL11_S_READ,
    FSL11_S_DATA,
    FSL11_S_CONTROL,
    FSL11_S_EXISTS,
    FSL11_M_CLK,
    FSL11_M_WRITE,
    FSL11_M_DATA,
    FSL11_M_CONTROL,
    FSL11_M_FULL,
    FSL12_S_CLK,
    FSL12_S_READ,
    FSL12_S_DATA,
    FSL12_S_CONTROL,
    FSL12_S_EXISTS,
    FSL12_M_CLK,
    FSL12_M_WRITE,
    FSL12_M_DATA,
    FSL12_M_CONTROL,
    FSL12_M_FULL,
    FSL13_S_CLK,
    FSL13_S_READ,
    FSL13_S_DATA,
    FSL13_S_CONTROL,
    FSL13_S_EXISTS,
    FSL13_M_CLK,
    FSL13_M_WRITE,
    FSL13_M_DATA,
    FSL13_M_CONTROL,
    FSL13_M_FULL,
    FSL14_S_CLK,
    FSL14_S_READ,
    FSL14_S_DATA,
    FSL14_S_CONTROL,
    FSL14_S_EXISTS,
    FSL14_M_CLK,
    FSL14_M_WRITE,
    FSL14_M_DATA,
    FSL14_M_CONTROL,
    FSL14_M_FULL,
    FSL15_S_CLK,
    FSL15_S_READ,
    FSL15_S_DATA,
    FSL15_S_CONTROL,
    FSL15_S_EXISTS,
    FSL15_M_CLK,
    FSL15_M_WRITE,
    FSL15_M_DATA,
    FSL15_M_CONTROL,
    FSL15_M_FULL,
    M0_AXIS_TLAST,
    M0_AXIS_TDATA,
    M0_AXIS_TVALID,
    M0_AXIS_TREADY,
    S0_AXIS_TLAST,
    S0_AXIS_TDATA,
    S0_AXIS_TVALID,
    S0_AXIS_TREADY,
    M1_AXIS_TLAST,
    M1_AXIS_TDATA,
    M1_AXIS_TVALID,
    M1_AXIS_TREADY,
    S1_AXIS_TLAST,
    S1_AXIS_TDATA,
    S1_AXIS_TVALID,
    S1_AXIS_TREADY,
    M2_AXIS_TLAST,
    M2_AXIS_TDATA,
    M2_AXIS_TVALID,
    M2_AXIS_TREADY,
    S2_AXIS_TLAST,
    S2_AXIS_TDATA,
    S2_AXIS_TVALID,
    S2_AXIS_TREADY,
    M3_AXIS_TLAST,
    M3_AXIS_TDATA,
    M3_AXIS_TVALID,
    M3_AXIS_TREADY,
    S3_AXIS_TLAST,
    S3_AXIS_TDATA,
    S3_AXIS_TVALID,
    S3_AXIS_TREADY,
    M4_AXIS_TLAST,
    M4_AXIS_TDATA,
    M4_AXIS_TVALID,
    M4_AXIS_TREADY,
    S4_AXIS_TLAST,
    S4_AXIS_TDATA,
    S4_AXIS_TVALID,
    S4_AXIS_TREADY,
    M5_AXIS_TLAST,
    M5_AXIS_TDATA,
    M5_AXIS_TVALID,
    M5_AXIS_TREADY,
    S5_AXIS_TLAST,
    S5_AXIS_TDATA,
    S5_AXIS_TVALID,
    S5_AXIS_TREADY,
    M6_AXIS_TLAST,
    M6_AXIS_TDATA,
    M6_AXIS_TVALID,
    M6_AXIS_TREADY,
    S6_AXIS_TLAST,
    S6_AXIS_TDATA,
    S6_AXIS_TVALID,
    S6_AXIS_TREADY,
    M7_AXIS_TLAST,
    M7_AXIS_TDATA,
    M7_AXIS_TVALID,
    M7_AXIS_TREADY,
    S7_AXIS_TLAST,
    S7_AXIS_TDATA,
    S7_AXIS_TVALID,
    S7_AXIS_TREADY,
    M8_AXIS_TLAST,
    M8_AXIS_TDATA,
    M8_AXIS_TVALID,
    M8_AXIS_TREADY,
    S8_AXIS_TLAST,
    S8_AXIS_TDATA,
    S8_AXIS_TVALID,
    S8_AXIS_TREADY,
    M9_AXIS_TLAST,
    M9_AXIS_TDATA,
    M9_AXIS_TVALID,
    M9_AXIS_TREADY,
    S9_AXIS_TLAST,
    S9_AXIS_TDATA,
    S9_AXIS_TVALID,
    S9_AXIS_TREADY,
    M10_AXIS_TLAST,
    M10_AXIS_TDATA,
    M10_AXIS_TVALID,
    M10_AXIS_TREADY,
    S10_AXIS_TLAST,
    S10_AXIS_TDATA,
    S10_AXIS_TVALID,
    S10_AXIS_TREADY,
    M11_AXIS_TLAST,
    M11_AXIS_TDATA,
    M11_AXIS_TVALID,
    M11_AXIS_TREADY,
    S11_AXIS_TLAST,
    S11_AXIS_TDATA,
    S11_AXIS_TVALID,
    S11_AXIS_TREADY,
    M12_AXIS_TLAST,
    M12_AXIS_TDATA,
    M12_AXIS_TVALID,
    M12_AXIS_TREADY,
    S12_AXIS_TLAST,
    S12_AXIS_TDATA,
    S12_AXIS_TVALID,
    S12_AXIS_TREADY,
    M13_AXIS_TLAST,
    M13_AXIS_TDATA,
    M13_AXIS_TVALID,
    M13_AXIS_TREADY,
    S13_AXIS_TLAST,
    S13_AXIS_TDATA,
    S13_AXIS_TVALID,
    S13_AXIS_TREADY,
    M14_AXIS_TLAST,
    M14_AXIS_TDATA,
    M14_AXIS_TVALID,
    M14_AXIS_TREADY,
    S14_AXIS_TLAST,
    S14_AXIS_TDATA,
    S14_AXIS_TVALID,
    S14_AXIS_TREADY,
    M15_AXIS_TLAST,
    M15_AXIS_TDATA,
    M15_AXIS_TVALID,
    M15_AXIS_TREADY,
    S15_AXIS_TLAST,
    S15_AXIS_TDATA,
    S15_AXIS_TVALID,
    S15_AXIS_TREADY,
    ICACHE_FSL_IN_CLK,
    ICACHE_FSL_IN_READ,
    ICACHE_FSL_IN_DATA,
    ICACHE_FSL_IN_CONTROL,
    ICACHE_FSL_IN_EXISTS,
    ICACHE_FSL_OUT_CLK,
    ICACHE_FSL_OUT_WRITE,
    ICACHE_FSL_OUT_DATA,
    ICACHE_FSL_OUT_CONTROL,
    ICACHE_FSL_OUT_FULL,
    DCACHE_FSL_IN_CLK,
    DCACHE_FSL_IN_READ,
    DCACHE_FSL_IN_DATA,
    DCACHE_FSL_IN_CONTROL,
    DCACHE_FSL_IN_EXISTS,
    DCACHE_FSL_OUT_CLK,
    DCACHE_FSL_OUT_WRITE,
    DCACHE_FSL_OUT_DATA,
    DCACHE_FSL_OUT_CONTROL,
    DCACHE_FSL_OUT_FULL
  );
  input CLK;
  input RESET;
  input MB_RESET;
  input INTERRUPT;
  input [0:31] INTERRUPT_ADDRESS;
  output [0:1] INTERRUPT_ACK;
  input EXT_BRK;
  input EXT_NM_BRK;
  input DBG_STOP;
  output MB_Halted;
  output MB_Error;
  output [0:4095] LOCKSTEP_MASTER_OUT;
  input [0:4095] LOCKSTEP_SLAVE_IN;
  output [0:4095] LOCKSTEP_OUT;
  input [0:31] INSTR;
  input IREADY;
  input IWAIT;
  input ICE;
  input IUE;
  output [0:31] INSTR_ADDR;
  output IFETCH;
  output I_AS;
  output IPLB_M_ABort;
  output [0:31] IPLB_M_ABus;
  output [0:31] IPLB_M_UABus;
  output [0:7] IPLB_M_BE;
  output IPLB_M_busLock;
  output IPLB_M_lockErr;
  output [0:1] IPLB_M_MSize;
  output [0:1] IPLB_M_priority;
  output IPLB_M_rdBurst;
  output IPLB_M_request;
  output IPLB_M_RNW;
  output [0:3] IPLB_M_size;
  output [0:15] IPLB_M_TAttribute;
  output [0:2] IPLB_M_type;
  output IPLB_M_wrBurst;
  output [0:63] IPLB_M_wrDBus;
  input IPLB_MBusy;
  input IPLB_MRdErr;
  input IPLB_MWrErr;
  input IPLB_MIRQ;
  input IPLB_MWrBTerm;
  input IPLB_MWrDAck;
  input IPLB_MAddrAck;
  input IPLB_MRdBTerm;
  input IPLB_MRdDAck;
  input [0:63] IPLB_MRdDBus;
  input [0:3] IPLB_MRdWdAddr;
  input IPLB_MRearbitrate;
  input [0:1] IPLB_MSSize;
  input IPLB_MTimeout;
  input [0:31] DATA_READ;
  input DREADY;
  input DWAIT;
  input DCE;
  input DUE;
  output [0:31] DATA_WRITE;
  output [0:31] DATA_ADDR;
  output D_AS;
  output READ_STROBE;
  output WRITE_STROBE;
  output [0:3] BYTE_ENABLE;
  output DPLB_M_ABort;
  output [0:31] DPLB_M_ABus;
  output [0:31] DPLB_M_UABus;
  output [0:7] DPLB_M_BE;
  output DPLB_M_busLock;
  output DPLB_M_lockErr;
  output [0:1] DPLB_M_MSize;
  output [0:1] DPLB_M_priority;
  output DPLB_M_rdBurst;
  output DPLB_M_request;
  output DPLB_M_RNW;
  output [0:3] DPLB_M_size;
  output [0:15] DPLB_M_TAttribute;
  output [0:2] DPLB_M_type;
  output DPLB_M_wrBurst;
  output [0:63] DPLB_M_wrDBus;
  input DPLB_MBusy;
  input DPLB_MRdErr;
  input DPLB_MWrErr;
  input DPLB_MIRQ;
  input DPLB_MWrBTerm;
  input DPLB_MWrDAck;
  input DPLB_MAddrAck;
  input DPLB_MRdBTerm;
  input DPLB_MRdDAck;
  input [0:63] DPLB_MRdDBus;
  input [0:3] DPLB_MRdWdAddr;
  input DPLB_MRearbitrate;
  input [0:1] DPLB_MSSize;
  input DPLB_MTimeout;
  output [0:0] M_AXI_IP_AWID;
  output [31:0] M_AXI_IP_AWADDR;
  output [7:0] M_AXI_IP_AWLEN;
  output [2:0] M_AXI_IP_AWSIZE;
  output [1:0] M_AXI_IP_AWBURST;
  output M_AXI_IP_AWLOCK;
  output [3:0] M_AXI_IP_AWCACHE;
  output [2:0] M_AXI_IP_AWPROT;
  output [3:0] M_AXI_IP_AWQOS;
  output M_AXI_IP_AWVALID;
  input M_AXI_IP_AWREADY;
  output [31:0] M_AXI_IP_WDATA;
  output [3:0] M_AXI_IP_WSTRB;
  output M_AXI_IP_WLAST;
  output M_AXI_IP_WVALID;
  input M_AXI_IP_WREADY;
  input [0:0] M_AXI_IP_BID;
  input [1:0] M_AXI_IP_BRESP;
  input M_AXI_IP_BVALID;
  output M_AXI_IP_BREADY;
  output [0:0] M_AXI_IP_ARID;
  output [31:0] M_AXI_IP_ARADDR;
  output [7:0] M_AXI_IP_ARLEN;
  output [2:0] M_AXI_IP_ARSIZE;
  output [1:0] M_AXI_IP_ARBURST;
  output M_AXI_IP_ARLOCK;
  output [3:0] M_AXI_IP_ARCACHE;
  output [2:0] M_AXI_IP_ARPROT;
  output [3:0] M_AXI_IP_ARQOS;
  output M_AXI_IP_ARVALID;
  input M_AXI_IP_ARREADY;
  input [0:0] M_AXI_IP_RID;
  input [31:0] M_AXI_IP_RDATA;
  input [1:0] M_AXI_IP_RRESP;
  input M_AXI_IP_RLAST;
  input M_AXI_IP_RVALID;
  output M_AXI_IP_RREADY;
  output [0:0] M_AXI_DP_AWID;
  output [31:0] M_AXI_DP_AWADDR;
  output [7:0] M_AXI_DP_AWLEN;
  output [2:0] M_AXI_DP_AWSIZE;
  output [1:0] M_AXI_DP_AWBURST;
  output M_AXI_DP_AWLOCK;
  output [3:0] M_AXI_DP_AWCACHE;
  output [2:0] M_AXI_DP_AWPROT;
  output [3:0] M_AXI_DP_AWQOS;
  output M_AXI_DP_AWVALID;
  input M_AXI_DP_AWREADY;
  output [31:0] M_AXI_DP_WDATA;
  output [3:0] M_AXI_DP_WSTRB;
  output M_AXI_DP_WLAST;
  output M_AXI_DP_WVALID;
  input M_AXI_DP_WREADY;
  input [0:0] M_AXI_DP_BID;
  input [1:0] M_AXI_DP_BRESP;
  input M_AXI_DP_BVALID;
  output M_AXI_DP_BREADY;
  output [0:0] M_AXI_DP_ARID;
  output [31:0] M_AXI_DP_ARADDR;
  output [7:0] M_AXI_DP_ARLEN;
  output [2:0] M_AXI_DP_ARSIZE;
  output [1:0] M_AXI_DP_ARBURST;
  output M_AXI_DP_ARLOCK;
  output [3:0] M_AXI_DP_ARCACHE;
  output [2:0] M_AXI_DP_ARPROT;
  output [3:0] M_AXI_DP_ARQOS;
  output M_AXI_DP_ARVALID;
  input M_AXI_DP_ARREADY;
  input [0:0] M_AXI_DP_RID;
  input [31:0] M_AXI_DP_RDATA;
  input [1:0] M_AXI_DP_RRESP;
  input M_AXI_DP_RLAST;
  input M_AXI_DP_RVALID;
  output M_AXI_DP_RREADY;
  output [0:0] M_AXI_IC_AWID;
  output [31:0] M_AXI_IC_AWADDR;
  output [7:0] M_AXI_IC_AWLEN;
  output [2:0] M_AXI_IC_AWSIZE;
  output [1:0] M_AXI_IC_AWBURST;
  output M_AXI_IC_AWLOCK;
  output [3:0] M_AXI_IC_AWCACHE;
  output [2:0] M_AXI_IC_AWPROT;
  output [3:0] M_AXI_IC_AWQOS;
  output M_AXI_IC_AWVALID;
  input M_AXI_IC_AWREADY;
  output [4:0] M_AXI_IC_AWUSER;
  output [31:0] M_AXI_IC_WDATA;
  output [3:0] M_AXI_IC_WSTRB;
  output M_AXI_IC_WLAST;
  output M_AXI_IC_WVALID;
  input M_AXI_IC_WREADY;
  output [0:0] M_AXI_IC_WUSER;
  input [0:0] M_AXI_IC_BID;
  input [1:0] M_AXI_IC_BRESP;
  input M_AXI_IC_BVALID;
  output M_AXI_IC_BREADY;
  input [0:0] M_AXI_IC_BUSER;
  output [0:0] M_AXI_IC_ARID;
  output [31:0] M_AXI_IC_ARADDR;
  output [7:0] M_AXI_IC_ARLEN;
  output [2:0] M_AXI_IC_ARSIZE;
  output [1:0] M_AXI_IC_ARBURST;
  output M_AXI_IC_ARLOCK;
  output [3:0] M_AXI_IC_ARCACHE;
  output [2:0] M_AXI_IC_ARPROT;
  output [3:0] M_AXI_IC_ARQOS;
  output M_AXI_IC_ARVALID;
  input M_AXI_IC_ARREADY;
  output [4:0] M_AXI_IC_ARUSER;
  input [0:0] M_AXI_IC_RID;
  input [31:0] M_AXI_IC_RDATA;
  input [1:0] M_AXI_IC_RRESP;
  input M_AXI_IC_RLAST;
  input M_AXI_IC_RVALID;
  output M_AXI_IC_RREADY;
  input [0:0] M_AXI_IC_RUSER;
  output [0:0] M_AXI_DC_AWID;
  output [31:0] M_AXI_DC_AWADDR;
  output [7:0] M_AXI_DC_AWLEN;
  output [2:0] M_AXI_DC_AWSIZE;
  output [1:0] M_AXI_DC_AWBURST;
  output M_AXI_DC_AWLOCK;
  output [3:0] M_AXI_DC_AWCACHE;
  output [2:0] M_AXI_DC_AWPROT;
  output [3:0] M_AXI_DC_AWQOS;
  output M_AXI_DC_AWVALID;
  input M_AXI_DC_AWREADY;
  output [4:0] M_AXI_DC_AWUSER;
  output [31:0] M_AXI_DC_WDATA;
  output [3:0] M_AXI_DC_WSTRB;
  output M_AXI_DC_WLAST;
  output M_AXI_DC_WVALID;
  input M_AXI_DC_WREADY;
  output [0:0] M_AXI_DC_WUSER;
  input [0:0] M_AXI_DC_BID;
  input [1:0] M_AXI_DC_BRESP;
  input M_AXI_DC_BVALID;
  output M_AXI_DC_BREADY;
  input [0:0] M_AXI_DC_BUSER;
  output [0:0] M_AXI_DC_ARID;
  output [31:0] M_AXI_DC_ARADDR;
  output [7:0] M_AXI_DC_ARLEN;
  output [2:0] M_AXI_DC_ARSIZE;
  output [1:0] M_AXI_DC_ARBURST;
  output M_AXI_DC_ARLOCK;
  output [3:0] M_AXI_DC_ARCACHE;
  output [2:0] M_AXI_DC_ARPROT;
  output [3:0] M_AXI_DC_ARQOS;
  output M_AXI_DC_ARVALID;
  input M_AXI_DC_ARREADY;
  output [4:0] M_AXI_DC_ARUSER;
  input [0:0] M_AXI_DC_RID;
  input [31:0] M_AXI_DC_RDATA;
  input [1:0] M_AXI_DC_RRESP;
  input M_AXI_DC_RLAST;
  input M_AXI_DC_RVALID;
  output M_AXI_DC_RREADY;
  input [0:0] M_AXI_DC_RUSER;
  input DBG_CLK;
  input DBG_TDI;
  output DBG_TDO;
  input [0:7] DBG_REG_EN;
  input DBG_SHIFT;
  input DBG_CAPTURE;
  input DBG_UPDATE;
  input DEBUG_RST;
  output [0:31] Trace_Instruction;
  output Trace_Valid_Instr;
  output [0:31] Trace_PC;
  output Trace_Reg_Write;
  output [0:4] Trace_Reg_Addr;
  output [0:14] Trace_MSR_Reg;
  output [0:7] Trace_PID_Reg;
  output [0:31] Trace_New_Reg_Value;
  output Trace_Exception_Taken;
  output [0:4] Trace_Exception_Kind;
  output Trace_Jump_Taken;
  output Trace_Delay_Slot;
  output [0:31] Trace_Data_Address;
  output Trace_Data_Access;
  output Trace_Data_Read;
  output Trace_Data_Write;
  output [0:31] Trace_Data_Write_Value;
  output [0:3] Trace_Data_Byte_Enable;
  output Trace_DCache_Req;
  output Trace_DCache_Hit;
  output Trace_DCache_Rdy;
  output Trace_DCache_Read;
  output Trace_ICache_Req;
  output Trace_ICache_Hit;
  output Trace_ICache_Rdy;
  output Trace_OF_PipeRun;
  output Trace_EX_PipeRun;
  output Trace_MEM_PipeRun;
  output Trace_MB_Halted;
  output Trace_Jump_Hit;
  output FSL0_S_CLK;
  output FSL0_S_READ;
  input [0:31] FSL0_S_DATA;
  input FSL0_S_CONTROL;
  input FSL0_S_EXISTS;
  output FSL0_M_CLK;
  output FSL0_M_WRITE;
  output [0:31] FSL0_M_DATA;
  output FSL0_M_CONTROL;
  input FSL0_M_FULL;
  output FSL1_S_CLK;
  output FSL1_S_READ;
  input [0:31] FSL1_S_DATA;
  input FSL1_S_CONTROL;
  input FSL1_S_EXISTS;
  output FSL1_M_CLK;
  output FSL1_M_WRITE;
  output [0:31] FSL1_M_DATA;
  output FSL1_M_CONTROL;
  input FSL1_M_FULL;
  output FSL2_S_CLK;
  output FSL2_S_READ;
  input [0:31] FSL2_S_DATA;
  input FSL2_S_CONTROL;
  input FSL2_S_EXISTS;
  output FSL2_M_CLK;
  output FSL2_M_WRITE;
  output [0:31] FSL2_M_DATA;
  output FSL2_M_CONTROL;
  input FSL2_M_FULL;
  output FSL3_S_CLK;
  output FSL3_S_READ;
  input [0:31] FSL3_S_DATA;
  input FSL3_S_CONTROL;
  input FSL3_S_EXISTS;
  output FSL3_M_CLK;
  output FSL3_M_WRITE;
  output [0:31] FSL3_M_DATA;
  output FSL3_M_CONTROL;
  input FSL3_M_FULL;
  output FSL4_S_CLK;
  output FSL4_S_READ;
  input [0:31] FSL4_S_DATA;
  input FSL4_S_CONTROL;
  input FSL4_S_EXISTS;
  output FSL4_M_CLK;
  output FSL4_M_WRITE;
  output [0:31] FSL4_M_DATA;
  output FSL4_M_CONTROL;
  input FSL4_M_FULL;
  output FSL5_S_CLK;
  output FSL5_S_READ;
  input [0:31] FSL5_S_DATA;
  input FSL5_S_CONTROL;
  input FSL5_S_EXISTS;
  output FSL5_M_CLK;
  output FSL5_M_WRITE;
  output [0:31] FSL5_M_DATA;
  output FSL5_M_CONTROL;
  input FSL5_M_FULL;
  output FSL6_S_CLK;
  output FSL6_S_READ;
  input [0:31] FSL6_S_DATA;
  input FSL6_S_CONTROL;
  input FSL6_S_EXISTS;
  output FSL6_M_CLK;
  output FSL6_M_WRITE;
  output [0:31] FSL6_M_DATA;
  output FSL6_M_CONTROL;
  input FSL6_M_FULL;
  output FSL7_S_CLK;
  output FSL7_S_READ;
  input [0:31] FSL7_S_DATA;
  input FSL7_S_CONTROL;
  input FSL7_S_EXISTS;
  output FSL7_M_CLK;
  output FSL7_M_WRITE;
  output [0:31] FSL7_M_DATA;
  output FSL7_M_CONTROL;
  input FSL7_M_FULL;
  output FSL8_S_CLK;
  output FSL8_S_READ;
  input [0:31] FSL8_S_DATA;
  input FSL8_S_CONTROL;
  input FSL8_S_EXISTS;
  output FSL8_M_CLK;
  output FSL8_M_WRITE;
  output [0:31] FSL8_M_DATA;
  output FSL8_M_CONTROL;
  input FSL8_M_FULL;
  output FSL9_S_CLK;
  output FSL9_S_READ;
  input [0:31] FSL9_S_DATA;
  input FSL9_S_CONTROL;
  input FSL9_S_EXISTS;
  output FSL9_M_CLK;
  output FSL9_M_WRITE;
  output [0:31] FSL9_M_DATA;
  output FSL9_M_CONTROL;
  input FSL9_M_FULL;
  output FSL10_S_CLK;
  output FSL10_S_READ;
  input [0:31] FSL10_S_DATA;
  input FSL10_S_CONTROL;
  input FSL10_S_EXISTS;
  output FSL10_M_CLK;
  output FSL10_M_WRITE;
  output [0:31] FSL10_M_DATA;
  output FSL10_M_CONTROL;
  input FSL10_M_FULL;
  output FSL11_S_CLK;
  output FSL11_S_READ;
  input [0:31] FSL11_S_DATA;
  input FSL11_S_CONTROL;
  input FSL11_S_EXISTS;
  output FSL11_M_CLK;
  output FSL11_M_WRITE;
  output [0:31] FSL11_M_DATA;
  output FSL11_M_CONTROL;
  input FSL11_M_FULL;
  output FSL12_S_CLK;
  output FSL12_S_READ;
  input [0:31] FSL12_S_DATA;
  input FSL12_S_CONTROL;
  input FSL12_S_EXISTS;
  output FSL12_M_CLK;
  output FSL12_M_WRITE;
  output [0:31] FSL12_M_DATA;
  output FSL12_M_CONTROL;
  input FSL12_M_FULL;
  output FSL13_S_CLK;
  output FSL13_S_READ;
  input [0:31] FSL13_S_DATA;
  input FSL13_S_CONTROL;
  input FSL13_S_EXISTS;
  output FSL13_M_CLK;
  output FSL13_M_WRITE;
  output [0:31] FSL13_M_DATA;
  output FSL13_M_CONTROL;
  input FSL13_M_FULL;
  output FSL14_S_CLK;
  output FSL14_S_READ;
  input [0:31] FSL14_S_DATA;
  input FSL14_S_CONTROL;
  input FSL14_S_EXISTS;
  output FSL14_M_CLK;
  output FSL14_M_WRITE;
  output [0:31] FSL14_M_DATA;
  output FSL14_M_CONTROL;
  input FSL14_M_FULL;
  output FSL15_S_CLK;
  output FSL15_S_READ;
  input [0:31] FSL15_S_DATA;
  input FSL15_S_CONTROL;
  input FSL15_S_EXISTS;
  output FSL15_M_CLK;
  output FSL15_M_WRITE;
  output [0:31] FSL15_M_DATA;
  output FSL15_M_CONTROL;
  input FSL15_M_FULL;
  output M0_AXIS_TLAST;
  output [31:0] M0_AXIS_TDATA;
  output M0_AXIS_TVALID;
  input M0_AXIS_TREADY;
  input S0_AXIS_TLAST;
  input [31:0] S0_AXIS_TDATA;
  input S0_AXIS_TVALID;
  output S0_AXIS_TREADY;
  output M1_AXIS_TLAST;
  output [31:0] M1_AXIS_TDATA;
  output M1_AXIS_TVALID;
  input M1_AXIS_TREADY;
  input S1_AXIS_TLAST;
  input [31:0] S1_AXIS_TDATA;
  input S1_AXIS_TVALID;
  output S1_AXIS_TREADY;
  output M2_AXIS_TLAST;
  output [31:0] M2_AXIS_TDATA;
  output M2_AXIS_TVALID;
  input M2_AXIS_TREADY;
  input S2_AXIS_TLAST;
  input [31:0] S2_AXIS_TDATA;
  input S2_AXIS_TVALID;
  output S2_AXIS_TREADY;
  output M3_AXIS_TLAST;
  output [31:0] M3_AXIS_TDATA;
  output M3_AXIS_TVALID;
  input M3_AXIS_TREADY;
  input S3_AXIS_TLAST;
  input [31:0] S3_AXIS_TDATA;
  input S3_AXIS_TVALID;
  output S3_AXIS_TREADY;
  output M4_AXIS_TLAST;
  output [31:0] M4_AXIS_TDATA;
  output M4_AXIS_TVALID;
  input M4_AXIS_TREADY;
  input S4_AXIS_TLAST;
  input [31:0] S4_AXIS_TDATA;
  input S4_AXIS_TVALID;
  output S4_AXIS_TREADY;
  output M5_AXIS_TLAST;
  output [31:0] M5_AXIS_TDATA;
  output M5_AXIS_TVALID;
  input M5_AXIS_TREADY;
  input S5_AXIS_TLAST;
  input [31:0] S5_AXIS_TDATA;
  input S5_AXIS_TVALID;
  output S5_AXIS_TREADY;
  output M6_AXIS_TLAST;
  output [31:0] M6_AXIS_TDATA;
  output M6_AXIS_TVALID;
  input M6_AXIS_TREADY;
  input S6_AXIS_TLAST;
  input [31:0] S6_AXIS_TDATA;
  input S6_AXIS_TVALID;
  output S6_AXIS_TREADY;
  output M7_AXIS_TLAST;
  output [31:0] M7_AXIS_TDATA;
  output M7_AXIS_TVALID;
  input M7_AXIS_TREADY;
  input S7_AXIS_TLAST;
  input [31:0] S7_AXIS_TDATA;
  input S7_AXIS_TVALID;
  output S7_AXIS_TREADY;
  output M8_AXIS_TLAST;
  output [31:0] M8_AXIS_TDATA;
  output M8_AXIS_TVALID;
  input M8_AXIS_TREADY;
  input S8_AXIS_TLAST;
  input [31:0] S8_AXIS_TDATA;
  input S8_AXIS_TVALID;
  output S8_AXIS_TREADY;
  output M9_AXIS_TLAST;
  output [31:0] M9_AXIS_TDATA;
  output M9_AXIS_TVALID;
  input M9_AXIS_TREADY;
  input S9_AXIS_TLAST;
  input [31:0] S9_AXIS_TDATA;
  input S9_AXIS_TVALID;
  output S9_AXIS_TREADY;
  output M10_AXIS_TLAST;
  output [31:0] M10_AXIS_TDATA;
  output M10_AXIS_TVALID;
  input M10_AXIS_TREADY;
  input S10_AXIS_TLAST;
  input [31:0] S10_AXIS_TDATA;
  input S10_AXIS_TVALID;
  output S10_AXIS_TREADY;
  output M11_AXIS_TLAST;
  output [31:0] M11_AXIS_TDATA;
  output M11_AXIS_TVALID;
  input M11_AXIS_TREADY;
  input S11_AXIS_TLAST;
  input [31:0] S11_AXIS_TDATA;
  input S11_AXIS_TVALID;
  output S11_AXIS_TREADY;
  output M12_AXIS_TLAST;
  output [31:0] M12_AXIS_TDATA;
  output M12_AXIS_TVALID;
  input M12_AXIS_TREADY;
  input S12_AXIS_TLAST;
  input [31:0] S12_AXIS_TDATA;
  input S12_AXIS_TVALID;
  output S12_AXIS_TREADY;
  output M13_AXIS_TLAST;
  output [31:0] M13_AXIS_TDATA;
  output M13_AXIS_TVALID;
  input M13_AXIS_TREADY;
  input S13_AXIS_TLAST;
  input [31:0] S13_AXIS_TDATA;
  input S13_AXIS_TVALID;
  output S13_AXIS_TREADY;
  output M14_AXIS_TLAST;
  output [31:0] M14_AXIS_TDATA;
  output M14_AXIS_TVALID;
  input M14_AXIS_TREADY;
  input S14_AXIS_TLAST;
  input [31:0] S14_AXIS_TDATA;
  input S14_AXIS_TVALID;
  output S14_AXIS_TREADY;
  output M15_AXIS_TLAST;
  output [31:0] M15_AXIS_TDATA;
  output M15_AXIS_TVALID;
  input M15_AXIS_TREADY;
  input S15_AXIS_TLAST;
  input [31:0] S15_AXIS_TDATA;
  input S15_AXIS_TVALID;
  output S15_AXIS_TREADY;
  output ICACHE_FSL_IN_CLK;
  output ICACHE_FSL_IN_READ;
  input [0:31] ICACHE_FSL_IN_DATA;
  input ICACHE_FSL_IN_CONTROL;
  input ICACHE_FSL_IN_EXISTS;
  output ICACHE_FSL_OUT_CLK;
  output ICACHE_FSL_OUT_WRITE;
  output [0:31] ICACHE_FSL_OUT_DATA;
  output ICACHE_FSL_OUT_CONTROL;
  input ICACHE_FSL_OUT_FULL;
  output DCACHE_FSL_IN_CLK;
  output DCACHE_FSL_IN_READ;
  input [0:31] DCACHE_FSL_IN_DATA;
  input DCACHE_FSL_IN_CONTROL;
  input DCACHE_FSL_IN_EXISTS;
  output DCACHE_FSL_OUT_CLK;
  output DCACHE_FSL_OUT_WRITE;
  output [0:31] DCACHE_FSL_OUT_DATA;
  output DCACHE_FSL_OUT_CONTROL;
  input DCACHE_FSL_OUT_FULL;
endmodule

module system_mb_plb_wrapper
  (
    PLB_Clk,
    SYS_Rst,
    PLB_Rst,
    SPLB_Rst,
    MPLB_Rst,
    PLB_dcrAck,
    PLB_dcrDBus,
    DCR_ABus,
    DCR_DBus,
    DCR_Read,
    DCR_Write,
    M_ABus,
    M_UABus,
    M_BE,
    M_RNW,
    M_abort,
    M_busLock,
    M_TAttribute,
    M_lockErr,
    M_MSize,
    M_priority,
    M_rdBurst,
    M_request,
    M_size,
    M_type,
    M_wrBurst,
    M_wrDBus,
    Sl_addrAck,
    Sl_MRdErr,
    Sl_MWrErr,
    Sl_MBusy,
    Sl_rdBTerm,
    Sl_rdComp,
    Sl_rdDAck,
    Sl_rdDBus,
    Sl_rdWdAddr,
    Sl_rearbitrate,
    Sl_SSize,
    Sl_wait,
    Sl_wrBTerm,
    Sl_wrComp,
    Sl_wrDAck,
    Sl_MIRQ,
    PLB_MIRQ,
    PLB_ABus,
    PLB_UABus,
    PLB_BE,
    PLB_MAddrAck,
    PLB_MTimeout,
    PLB_MBusy,
    PLB_MRdErr,
    PLB_MWrErr,
    PLB_MRdBTerm,
    PLB_MRdDAck,
    PLB_MRdDBus,
    PLB_MRdWdAddr,
    PLB_MRearbitrate,
    PLB_MWrBTerm,
    PLB_MWrDAck,
    PLB_MSSize,
    PLB_PAValid,
    PLB_RNW,
    PLB_SAValid,
    PLB_abort,
    PLB_busLock,
    PLB_TAttribute,
    PLB_lockErr,
    PLB_masterID,
    PLB_MSize,
    PLB_rdPendPri,
    PLB_wrPendPri,
    PLB_rdPendReq,
    PLB_wrPendReq,
    PLB_rdBurst,
    PLB_rdPrim,
    PLB_reqPri,
    PLB_size,
    PLB_type,
    PLB_wrBurst,
    PLB_wrDBus,
    PLB_wrPrim,
    PLB_SaddrAck,
    PLB_SMRdErr,
    PLB_SMWrErr,
    PLB_SMBusy,
    PLB_SrdBTerm,
    PLB_SrdComp,
    PLB_SrdDAck,
    PLB_SrdDBus,
    PLB_SrdWdAddr,
    PLB_Srearbitrate,
    PLB_Sssize,
    PLB_Swait,
    PLB_SwrBTerm,
    PLB_SwrComp,
    PLB_SwrDAck,
    Bus_Error_Det
  );
  input PLB_Clk;
  input SYS_Rst;
  output PLB_Rst;
  output [0:2] SPLB_Rst;
  output [0:1] MPLB_Rst;
  output PLB_dcrAck;
  output [0:31] PLB_dcrDBus;
  input [0:9] DCR_ABus;
  input [0:31] DCR_DBus;
  input DCR_Read;
  input DCR_Write;
  input [0:63] M_ABus;
  input [0:63] M_UABus;
  input [0:15] M_BE;
  input [0:1] M_RNW;
  input [0:1] M_abort;
  input [0:1] M_busLock;
  input [0:31] M_TAttribute;
  input [0:1] M_lockErr;
  input [0:3] M_MSize;
  input [0:3] M_priority;
  input [0:1] M_rdBurst;
  input [0:1] M_request;
  input [0:7] M_size;
  input [0:5] M_type;
  input [0:1] M_wrBurst;
  input [0:127] M_wrDBus;
  input [0:2] Sl_addrAck;
  input [0:5] Sl_MRdErr;
  input [0:5] Sl_MWrErr;
  input [0:5] Sl_MBusy;
  input [0:2] Sl_rdBTerm;
  input [0:2] Sl_rdComp;
  input [0:2] Sl_rdDAck;
  input [0:191] Sl_rdDBus;
  input [0:11] Sl_rdWdAddr;
  input [0:2] Sl_rearbitrate;
  input [0:5] Sl_SSize;
  input [0:2] Sl_wait;
  input [0:2] Sl_wrBTerm;
  input [0:2] Sl_wrComp;
  input [0:2] Sl_wrDAck;
  input [0:5] Sl_MIRQ;
  output [0:1] PLB_MIRQ;
  output [0:31] PLB_ABus;
  output [0:31] PLB_UABus;
  output [0:7] PLB_BE;
  output [0:1] PLB_MAddrAck;
  output [0:1] PLB_MTimeout;
  output [0:1] PLB_MBusy;
  output [0:1] PLB_MRdErr;
  output [0:1] PLB_MWrErr;
  output [0:1] PLB_MRdBTerm;
  output [0:1] PLB_MRdDAck;
  output [0:127] PLB_MRdDBus;
  output [0:7] PLB_MRdWdAddr;
  output [0:1] PLB_MRearbitrate;
  output [0:1] PLB_MWrBTerm;
  output [0:1] PLB_MWrDAck;
  output [0:3] PLB_MSSize;
  output PLB_PAValid;
  output PLB_RNW;
  output PLB_SAValid;
  output PLB_abort;
  output PLB_busLock;
  output [0:15] PLB_TAttribute;
  output PLB_lockErr;
  output [0:0] PLB_masterID;
  output [0:1] PLB_MSize;
  output [0:1] PLB_rdPendPri;
  output [0:1] PLB_wrPendPri;
  output PLB_rdPendReq;
  output PLB_wrPendReq;
  output PLB_rdBurst;
  output [0:2] PLB_rdPrim;
  output [0:1] PLB_reqPri;
  output [0:3] PLB_size;
  output [0:2] PLB_type;
  output PLB_wrBurst;
  output [0:63] PLB_wrDBus;
  output [0:2] PLB_wrPrim;
  output PLB_SaddrAck;
  output [0:1] PLB_SMRdErr;
  output [0:1] PLB_SMWrErr;
  output [0:1] PLB_SMBusy;
  output PLB_SrdBTerm;
  output PLB_SrdComp;
  output PLB_SrdDAck;
  output [0:63] PLB_SrdDBus;
  output [0:3] PLB_SrdWdAddr;
  output PLB_Srearbitrate;
  output [0:1] PLB_Sssize;
  output PLB_Swait;
  output PLB_SwrBTerm;
  output PLB_SwrComp;
  output PLB_SwrDAck;
  output Bus_Error_Det;
endmodule

module system_ilmb_wrapper
  (
    LMB_Clk,
    SYS_Rst,
    LMB_Rst,
    M_ABus,
    M_ReadStrobe,
    M_WriteStrobe,
    M_AddrStrobe,
    M_DBus,
    M_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    LMB_ABus,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_AddrStrobe,
    LMB_ReadDBus,
    LMB_WriteDBus,
    LMB_Ready,
    LMB_Wait,
    LMB_UE,
    LMB_CE,
    LMB_BE
  );
  input LMB_Clk;
  input SYS_Rst;
  output LMB_Rst;
  input [0:31] M_ABus;
  input M_ReadStrobe;
  input M_WriteStrobe;
  input M_AddrStrobe;
  input [0:31] M_DBus;
  input [0:3] M_BE;
  input [0:31] Sl_DBus;
  input [0:0] Sl_Ready;
  input [0:0] Sl_Wait;
  input [0:0] Sl_UE;
  input [0:0] Sl_CE;
  output [0:31] LMB_ABus;
  output LMB_ReadStrobe;
  output LMB_WriteStrobe;
  output LMB_AddrStrobe;
  output [0:31] LMB_ReadDBus;
  output [0:31] LMB_WriteDBus;
  output LMB_Ready;
  output LMB_Wait;
  output LMB_UE;
  output LMB_CE;
  output [0:3] LMB_BE;
endmodule

module system_dlmb_wrapper
  (
    LMB_Clk,
    SYS_Rst,
    LMB_Rst,
    M_ABus,
    M_ReadStrobe,
    M_WriteStrobe,
    M_AddrStrobe,
    M_DBus,
    M_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    LMB_ABus,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_AddrStrobe,
    LMB_ReadDBus,
    LMB_WriteDBus,
    LMB_Ready,
    LMB_Wait,
    LMB_UE,
    LMB_CE,
    LMB_BE
  );
  input LMB_Clk;
  input SYS_Rst;
  output LMB_Rst;
  input [0:31] M_ABus;
  input M_ReadStrobe;
  input M_WriteStrobe;
  input M_AddrStrobe;
  input [0:31] M_DBus;
  input [0:3] M_BE;
  input [0:31] Sl_DBus;
  input [0:0] Sl_Ready;
  input [0:0] Sl_Wait;
  input [0:0] Sl_UE;
  input [0:0] Sl_CE;
  output [0:31] LMB_ABus;
  output LMB_ReadStrobe;
  output LMB_WriteStrobe;
  output LMB_AddrStrobe;
  output [0:31] LMB_ReadDBus;
  output [0:31] LMB_WriteDBus;
  output LMB_Ready;
  output LMB_Wait;
  output LMB_UE;
  output LMB_CE;
  output [0:3] LMB_BE;
endmodule

module system_dlmb_cntlr_wrapper
  (
    LMB_Clk,
    LMB_Rst,
    LMB_ABus,
    LMB_WriteDBus,
    LMB_AddrStrobe,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Addr_A,
    BRAM_Din_A,
    BRAM_Dout_A,
    Interrupt,
    SPLB_CTRL_PLB_ABus,
    SPLB_CTRL_PLB_PAValid,
    SPLB_CTRL_PLB_masterID,
    SPLB_CTRL_PLB_RNW,
    SPLB_CTRL_PLB_BE,
    SPLB_CTRL_PLB_size,
    SPLB_CTRL_PLB_type,
    SPLB_CTRL_PLB_wrDBus,
    SPLB_CTRL_Sl_addrAck,
    SPLB_CTRL_Sl_SSize,
    SPLB_CTRL_Sl_wait,
    SPLB_CTRL_Sl_rearbitrate,
    SPLB_CTRL_Sl_wrDAck,
    SPLB_CTRL_Sl_wrComp,
    SPLB_CTRL_Sl_rdDBus,
    SPLB_CTRL_Sl_rdDAck,
    SPLB_CTRL_Sl_rdComp,
    SPLB_CTRL_Sl_MBusy,
    SPLB_CTRL_Sl_MWrErr,
    SPLB_CTRL_Sl_MRdErr,
    SPLB_CTRL_PLB_UABus,
    SPLB_CTRL_PLB_SAValid,
    SPLB_CTRL_PLB_rdPrim,
    SPLB_CTRL_PLB_wrPrim,
    SPLB_CTRL_PLB_abort,
    SPLB_CTRL_PLB_busLock,
    SPLB_CTRL_PLB_MSize,
    SPLB_CTRL_PLB_lockErr,
    SPLB_CTRL_PLB_wrBurst,
    SPLB_CTRL_PLB_rdBurst,
    SPLB_CTRL_PLB_wrPendReq,
    SPLB_CTRL_PLB_rdPendReq,
    SPLB_CTRL_PLB_wrPendPri,
    SPLB_CTRL_PLB_rdPendPri,
    SPLB_CTRL_PLB_reqPri,
    SPLB_CTRL_PLB_TAttribute,
    SPLB_CTRL_Sl_wrBTerm,
    SPLB_CTRL_Sl_rdWdAddr,
    SPLB_CTRL_Sl_rdBTerm,
    SPLB_CTRL_Sl_MIRQ,
    S_AXI_CTRL_ACLK,
    S_AXI_CTRL_ARESETN,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WSTRB,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY
  );
  input LMB_Clk;
  input LMB_Rst;
  input [0:31] LMB_ABus;
  input [0:31] LMB_WriteDBus;
  input LMB_AddrStrobe;
  input LMB_ReadStrobe;
  input LMB_WriteStrobe;
  input [0:3] LMB_BE;
  output [0:31] Sl_DBus;
  output Sl_Ready;
  output Sl_Wait;
  output Sl_UE;
  output Sl_CE;
  output BRAM_Rst_A;
  output BRAM_Clk_A;
  output BRAM_EN_A;
  output [0:3] BRAM_WEN_A;
  output [0:31] BRAM_Addr_A;
  input [0:31] BRAM_Din_A;
  output [0:31] BRAM_Dout_A;
  output Interrupt;
  input [0:31] SPLB_CTRL_PLB_ABus;
  input SPLB_CTRL_PLB_PAValid;
  input [0:0] SPLB_CTRL_PLB_masterID;
  input SPLB_CTRL_PLB_RNW;
  input [0:3] SPLB_CTRL_PLB_BE;
  input [0:3] SPLB_CTRL_PLB_size;
  input [0:2] SPLB_CTRL_PLB_type;
  input [0:31] SPLB_CTRL_PLB_wrDBus;
  output SPLB_CTRL_Sl_addrAck;
  output [0:1] SPLB_CTRL_Sl_SSize;
  output SPLB_CTRL_Sl_wait;
  output SPLB_CTRL_Sl_rearbitrate;
  output SPLB_CTRL_Sl_wrDAck;
  output SPLB_CTRL_Sl_wrComp;
  output [0:31] SPLB_CTRL_Sl_rdDBus;
  output SPLB_CTRL_Sl_rdDAck;
  output SPLB_CTRL_Sl_rdComp;
  output [0:0] SPLB_CTRL_Sl_MBusy;
  output [0:0] SPLB_CTRL_Sl_MWrErr;
  output [0:0] SPLB_CTRL_Sl_MRdErr;
  input [0:31] SPLB_CTRL_PLB_UABus;
  input SPLB_CTRL_PLB_SAValid;
  input SPLB_CTRL_PLB_rdPrim;
  input SPLB_CTRL_PLB_wrPrim;
  input SPLB_CTRL_PLB_abort;
  input SPLB_CTRL_PLB_busLock;
  input [0:1] SPLB_CTRL_PLB_MSize;
  input SPLB_CTRL_PLB_lockErr;
  input SPLB_CTRL_PLB_wrBurst;
  input SPLB_CTRL_PLB_rdBurst;
  input SPLB_CTRL_PLB_wrPendReq;
  input SPLB_CTRL_PLB_rdPendReq;
  input [0:1] SPLB_CTRL_PLB_wrPendPri;
  input [0:1] SPLB_CTRL_PLB_rdPendPri;
  input [0:1] SPLB_CTRL_PLB_reqPri;
  input [0:15] SPLB_CTRL_PLB_TAttribute;
  output SPLB_CTRL_Sl_wrBTerm;
  output [0:3] SPLB_CTRL_Sl_rdWdAddr;
  output SPLB_CTRL_Sl_rdBTerm;
  output [0:0] SPLB_CTRL_Sl_MIRQ;
  input S_AXI_CTRL_ACLK;
  input S_AXI_CTRL_ARESETN;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input [3:0] S_AXI_CTRL_WSTRB;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
endmodule

module system_ilmb_cntlr_wrapper
  (
    LMB_Clk,
    LMB_Rst,
    LMB_ABus,
    LMB_WriteDBus,
    LMB_AddrStrobe,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Addr_A,
    BRAM_Din_A,
    BRAM_Dout_A,
    Interrupt,
    SPLB_CTRL_PLB_ABus,
    SPLB_CTRL_PLB_PAValid,
    SPLB_CTRL_PLB_masterID,
    SPLB_CTRL_PLB_RNW,
    SPLB_CTRL_PLB_BE,
    SPLB_CTRL_PLB_size,
    SPLB_CTRL_PLB_type,
    SPLB_CTRL_PLB_wrDBus,
    SPLB_CTRL_Sl_addrAck,
    SPLB_CTRL_Sl_SSize,
    SPLB_CTRL_Sl_wait,
    SPLB_CTRL_Sl_rearbitrate,
    SPLB_CTRL_Sl_wrDAck,
    SPLB_CTRL_Sl_wrComp,
    SPLB_CTRL_Sl_rdDBus,
    SPLB_CTRL_Sl_rdDAck,
    SPLB_CTRL_Sl_rdComp,
    SPLB_CTRL_Sl_MBusy,
    SPLB_CTRL_Sl_MWrErr,
    SPLB_CTRL_Sl_MRdErr,
    SPLB_CTRL_PLB_UABus,
    SPLB_CTRL_PLB_SAValid,
    SPLB_CTRL_PLB_rdPrim,
    SPLB_CTRL_PLB_wrPrim,
    SPLB_CTRL_PLB_abort,
    SPLB_CTRL_PLB_busLock,
    SPLB_CTRL_PLB_MSize,
    SPLB_CTRL_PLB_lockErr,
    SPLB_CTRL_PLB_wrBurst,
    SPLB_CTRL_PLB_rdBurst,
    SPLB_CTRL_PLB_wrPendReq,
    SPLB_CTRL_PLB_rdPendReq,
    SPLB_CTRL_PLB_wrPendPri,
    SPLB_CTRL_PLB_rdPendPri,
    SPLB_CTRL_PLB_reqPri,
    SPLB_CTRL_PLB_TAttribute,
    SPLB_CTRL_Sl_wrBTerm,
    SPLB_CTRL_Sl_rdWdAddr,
    SPLB_CTRL_Sl_rdBTerm,
    SPLB_CTRL_Sl_MIRQ,
    S_AXI_CTRL_ACLK,
    S_AXI_CTRL_ARESETN,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WSTRB,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY
  );
  input LMB_Clk;
  input LMB_Rst;
  input [0:31] LMB_ABus;
  input [0:31] LMB_WriteDBus;
  input LMB_AddrStrobe;
  input LMB_ReadStrobe;
  input LMB_WriteStrobe;
  input [0:3] LMB_BE;
  output [0:31] Sl_DBus;
  output Sl_Ready;
  output Sl_Wait;
  output Sl_UE;
  output Sl_CE;
  output BRAM_Rst_A;
  output BRAM_Clk_A;
  output BRAM_EN_A;
  output [0:3] BRAM_WEN_A;
  output [0:31] BRAM_Addr_A;
  input [0:31] BRAM_Din_A;
  output [0:31] BRAM_Dout_A;
  output Interrupt;
  input [0:31] SPLB_CTRL_PLB_ABus;
  input SPLB_CTRL_PLB_PAValid;
  input [0:0] SPLB_CTRL_PLB_masterID;
  input SPLB_CTRL_PLB_RNW;
  input [0:3] SPLB_CTRL_PLB_BE;
  input [0:3] SPLB_CTRL_PLB_size;
  input [0:2] SPLB_CTRL_PLB_type;
  input [0:31] SPLB_CTRL_PLB_wrDBus;
  output SPLB_CTRL_Sl_addrAck;
  output [0:1] SPLB_CTRL_Sl_SSize;
  output SPLB_CTRL_Sl_wait;
  output SPLB_CTRL_Sl_rearbitrate;
  output SPLB_CTRL_Sl_wrDAck;
  output SPLB_CTRL_Sl_wrComp;
  output [0:31] SPLB_CTRL_Sl_rdDBus;
  output SPLB_CTRL_Sl_rdDAck;
  output SPLB_CTRL_Sl_rdComp;
  output [0:0] SPLB_CTRL_Sl_MBusy;
  output [0:0] SPLB_CTRL_Sl_MWrErr;
  output [0:0] SPLB_CTRL_Sl_MRdErr;
  input [0:31] SPLB_CTRL_PLB_UABus;
  input SPLB_CTRL_PLB_SAValid;
  input SPLB_CTRL_PLB_rdPrim;
  input SPLB_CTRL_PLB_wrPrim;
  input SPLB_CTRL_PLB_abort;
  input SPLB_CTRL_PLB_busLock;
  input [0:1] SPLB_CTRL_PLB_MSize;
  input SPLB_CTRL_PLB_lockErr;
  input SPLB_CTRL_PLB_wrBurst;
  input SPLB_CTRL_PLB_rdBurst;
  input SPLB_CTRL_PLB_wrPendReq;
  input SPLB_CTRL_PLB_rdPendReq;
  input [0:1] SPLB_CTRL_PLB_wrPendPri;
  input [0:1] SPLB_CTRL_PLB_rdPendPri;
  input [0:1] SPLB_CTRL_PLB_reqPri;
  input [0:15] SPLB_CTRL_PLB_TAttribute;
  output SPLB_CTRL_Sl_wrBTerm;
  output [0:3] SPLB_CTRL_Sl_rdWdAddr;
  output SPLB_CTRL_Sl_rdBTerm;
  output [0:0] SPLB_CTRL_Sl_MIRQ;
  input S_AXI_CTRL_ACLK;
  input S_AXI_CTRL_ARESETN;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input [3:0] S_AXI_CTRL_WSTRB;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
endmodule

module system_lmb_bram_wrapper
  (
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Addr_A,
    BRAM_Din_A,
    BRAM_Dout_A,
    BRAM_Rst_B,
    BRAM_Clk_B,
    BRAM_EN_B,
    BRAM_WEN_B,
    BRAM_Addr_B,
    BRAM_Din_B,
    BRAM_Dout_B
  );
  input BRAM_Rst_A;
  input BRAM_Clk_A;
  input BRAM_EN_A;
  input [0:3] BRAM_WEN_A;
  input [0:31] BRAM_Addr_A;
  output [0:31] BRAM_Din_A;
  input [0:31] BRAM_Dout_A;
  input BRAM_Rst_B;
  input BRAM_Clk_B;
  input BRAM_EN_B;
  input [0:3] BRAM_WEN_B;
  input [0:31] BRAM_Addr_B;
  output [0:31] BRAM_Din_B;
  input [0:31] BRAM_Dout_B;
endmodule

module system_rs232_uart_1_wrapper
  (
    SPLB_Clk,
    SPLB_Rst,
    PLB_ABus,
    PLB_PAValid,
    PLB_masterID,
    PLB_RNW,
    PLB_BE,
    PLB_size,
    PLB_type,
    PLB_wrDBus,
    PLB_UABus,
    PLB_SAValid,
    PLB_rdPrim,
    PLB_wrPrim,
    PLB_abort,
    PLB_busLock,
    PLB_MSize,
    PLB_lockErr,
    PLB_wrBurst,
    PLB_rdBurst,
    PLB_wrPendReq,
    PLB_rdPendReq,
    PLB_wrPendPri,
    PLB_rdPendPri,
    PLB_reqPri,
    PLB_TAttribute,
    Sl_addrAck,
    Sl_SSize,
    Sl_wait,
    Sl_rearbitrate,
    Sl_wrDAck,
    Sl_wrComp,
    Sl_rdDBus,
    Sl_rdDAck,
    Sl_rdComp,
    Sl_MBusy,
    Sl_MWrErr,
    Sl_MRdErr,
    Sl_wrBTerm,
    Sl_rdWdAddr,
    Sl_rdBTerm,
    Sl_MIRQ,
    RX,
    TX,
    Interrupt
  );
  input SPLB_Clk;
  input SPLB_Rst;
  input [0:31] PLB_ABus;
  input PLB_PAValid;
  input [0:0] PLB_masterID;
  input PLB_RNW;
  input [0:7] PLB_BE;
  input [0:3] PLB_size;
  input [0:2] PLB_type;
  input [0:63] PLB_wrDBus;
  input [0:31] PLB_UABus;
  input PLB_SAValid;
  input PLB_rdPrim;
  input PLB_wrPrim;
  input PLB_abort;
  input PLB_busLock;
  input [0:1] PLB_MSize;
  input PLB_lockErr;
  input PLB_wrBurst;
  input PLB_rdBurst;
  input PLB_wrPendReq;
  input PLB_rdPendReq;
  input [0:1] PLB_wrPendPri;
  input [0:1] PLB_rdPendPri;
  input [0:1] PLB_reqPri;
  input [0:15] PLB_TAttribute;
  output Sl_addrAck;
  output [0:1] Sl_SSize;
  output Sl_wait;
  output Sl_rearbitrate;
  output Sl_wrDAck;
  output Sl_wrComp;
  output [0:63] Sl_rdDBus;
  output Sl_rdDAck;
  output Sl_rdComp;
  output [0:1] Sl_MBusy;
  output [0:1] Sl_MWrErr;
  output [0:1] Sl_MRdErr;
  output Sl_wrBTerm;
  output [0:3] Sl_rdWdAddr;
  output Sl_rdBTerm;
  output [0:1] Sl_MIRQ;
  input RX;
  output TX;
  output Interrupt;
endmodule

module system_ddr2_sdram_wrapper
  (
    FSL0_M_Clk,
    FSL0_M_Write,
    FSL0_M_Data,
    FSL0_M_Control,
    FSL0_M_Full,
    FSL0_S_Clk,
    FSL0_S_Read,
    FSL0_S_Data,
    FSL0_S_Control,
    FSL0_S_Exists,
    FSL0_B_M_Clk,
    FSL0_B_M_Write,
    FSL0_B_M_Data,
    FSL0_B_M_Control,
    FSL0_B_M_Full,
    FSL0_B_S_Clk,
    FSL0_B_S_Read,
    FSL0_B_S_Data,
    FSL0_B_S_Control,
    FSL0_B_S_Exists,
    SPLB0_Clk,
    SPLB0_Rst,
    SPLB0_PLB_ABus,
    SPLB0_PLB_PAValid,
    SPLB0_PLB_SAValid,
    SPLB0_PLB_masterID,
    SPLB0_PLB_RNW,
    SPLB0_PLB_BE,
    SPLB0_PLB_UABus,
    SPLB0_PLB_rdPrim,
    SPLB0_PLB_wrPrim,
    SPLB0_PLB_abort,
    SPLB0_PLB_busLock,
    SPLB0_PLB_MSize,
    SPLB0_PLB_size,
    SPLB0_PLB_type,
    SPLB0_PLB_lockErr,
    SPLB0_PLB_wrPendReq,
    SPLB0_PLB_wrPendPri,
    SPLB0_PLB_rdPendReq,
    SPLB0_PLB_rdPendPri,
    SPLB0_PLB_reqPri,
    SPLB0_PLB_TAttribute,
    SPLB0_PLB_rdBurst,
    SPLB0_PLB_wrBurst,
    SPLB0_PLB_wrDBus,
    SPLB0_Sl_addrAck,
    SPLB0_Sl_SSize,
    SPLB0_Sl_wait,
    SPLB0_Sl_rearbitrate,
    SPLB0_Sl_wrDAck,
    SPLB0_Sl_wrComp,
    SPLB0_Sl_wrBTerm,
    SPLB0_Sl_rdDBus,
    SPLB0_Sl_rdWdAddr,
    SPLB0_Sl_rdDAck,
    SPLB0_Sl_rdComp,
    SPLB0_Sl_rdBTerm,
    SPLB0_Sl_MBusy,
    SPLB0_Sl_MRdErr,
    SPLB0_Sl_MWrErr,
    SPLB0_Sl_MIRQ,
    SDMA0_Clk,
    SDMA0_Rx_IntOut,
    SDMA0_Tx_IntOut,
    SDMA0_RstOut,
    SDMA0_TX_D,
    SDMA0_TX_Rem,
    SDMA0_TX_SOF,
    SDMA0_TX_EOF,
    SDMA0_TX_SOP,
    SDMA0_TX_EOP,
    SDMA0_TX_Src_Rdy,
    SDMA0_TX_Dst_Rdy,
    SDMA0_RX_D,
    SDMA0_RX_Rem,
    SDMA0_RX_SOF,
    SDMA0_RX_EOF,
    SDMA0_RX_SOP,
    SDMA0_RX_EOP,
    SDMA0_RX_Src_Rdy,
    SDMA0_RX_Dst_Rdy,
    SDMA_CTRL0_Clk,
    SDMA_CTRL0_Rst,
    SDMA_CTRL0_PLB_ABus,
    SDMA_CTRL0_PLB_PAValid,
    SDMA_CTRL0_PLB_SAValid,
    SDMA_CTRL0_PLB_masterID,
    SDMA_CTRL0_PLB_RNW,
    SDMA_CTRL0_PLB_BE,
    SDMA_CTRL0_PLB_UABus,
    SDMA_CTRL0_PLB_rdPrim,
    SDMA_CTRL0_PLB_wrPrim,
    SDMA_CTRL0_PLB_abort,
    SDMA_CTRL0_PLB_busLock,
    SDMA_CTRL0_PLB_MSize,
    SDMA_CTRL0_PLB_size,
    SDMA_CTRL0_PLB_type,
    SDMA_CTRL0_PLB_lockErr,
    SDMA_CTRL0_PLB_wrPendReq,
    SDMA_CTRL0_PLB_wrPendPri,
    SDMA_CTRL0_PLB_rdPendReq,
    SDMA_CTRL0_PLB_rdPendPri,
    SDMA_CTRL0_PLB_reqPri,
    SDMA_CTRL0_PLB_TAttribute,
    SDMA_CTRL0_PLB_rdBurst,
    SDMA_CTRL0_PLB_wrBurst,
    SDMA_CTRL0_PLB_wrDBus,
    SDMA_CTRL0_Sl_addrAck,
    SDMA_CTRL0_Sl_SSize,
    SDMA_CTRL0_Sl_wait,
    SDMA_CTRL0_Sl_rearbitrate,
    SDMA_CTRL0_Sl_wrDAck,
    SDMA_CTRL0_Sl_wrComp,
    SDMA_CTRL0_Sl_wrBTerm,
    SDMA_CTRL0_Sl_rdDBus,
    SDMA_CTRL0_Sl_rdWdAddr,
    SDMA_CTRL0_Sl_rdDAck,
    SDMA_CTRL0_Sl_rdComp,
    SDMA_CTRL0_Sl_rdBTerm,
    SDMA_CTRL0_Sl_MBusy,
    SDMA_CTRL0_Sl_MRdErr,
    SDMA_CTRL0_Sl_MWrErr,
    SDMA_CTRL0_Sl_MIRQ,
    PIM0_Addr,
    PIM0_AddrReq,
    PIM0_AddrAck,
    PIM0_RNW,
    PIM0_Size,
    PIM0_RdModWr,
    PIM0_WrFIFO_Data,
    PIM0_WrFIFO_BE,
    PIM0_WrFIFO_Push,
    PIM0_RdFIFO_Data,
    PIM0_RdFIFO_Pop,
    PIM0_RdFIFO_RdWdAddr,
    PIM0_WrFIFO_Empty,
    PIM0_WrFIFO_AlmostFull,
    PIM0_WrFIFO_Flush,
    PIM0_RdFIFO_Empty,
    PIM0_RdFIFO_Flush,
    PIM0_RdFIFO_Latency,
    PIM0_InitDone,
    PPC440MC0_MIMCReadNotWrite,
    PPC440MC0_MIMCAddress,
    PPC440MC0_MIMCAddressValid,
    PPC440MC0_MIMCWriteData,
    PPC440MC0_MIMCWriteDataValid,
    PPC440MC0_MIMCByteEnable,
    PPC440MC0_MIMCBankConflict,
    PPC440MC0_MIMCRowConflict,
    PPC440MC0_MCMIReadData,
    PPC440MC0_MCMIReadDataValid,
    PPC440MC0_MCMIReadDataErr,
    PPC440MC0_MCMIAddrReadyToAccept,
    VFBC0_Cmd_Clk,
    VFBC0_Cmd_Reset,
    VFBC0_Cmd_Data,
    VFBC0_Cmd_Write,
    VFBC0_Cmd_End,
    VFBC0_Cmd_Full,
    VFBC0_Cmd_Almost_Full,
    VFBC0_Cmd_Idle,
    VFBC0_Wd_Clk,
    VFBC0_Wd_Reset,
    VFBC0_Wd_Write,
    VFBC0_Wd_End_Burst,
    VFBC0_Wd_Flush,
    VFBC0_Wd_Data,
    VFBC0_Wd_Data_BE,
    VFBC0_Wd_Full,
    VFBC0_Wd_Almost_Full,
    VFBC0_Rd_Clk,
    VFBC0_Rd_Reset,
    VFBC0_Rd_Read,
    VFBC0_Rd_End_Burst,
    VFBC0_Rd_Flush,
    VFBC0_Rd_Data,
    VFBC0_Rd_Empty,
    VFBC0_Rd_Almost_Empty,
    MCB0_cmd_clk,
    MCB0_cmd_en,
    MCB0_cmd_instr,
    MCB0_cmd_bl,
    MCB0_cmd_byte_addr,
    MCB0_cmd_empty,
    MCB0_cmd_full,
    MCB0_wr_clk,
    MCB0_wr_en,
    MCB0_wr_mask,
    MCB0_wr_data,
    MCB0_wr_full,
    MCB0_wr_empty,
    MCB0_wr_count,
    MCB0_wr_underrun,
    MCB0_wr_error,
    MCB0_rd_clk,
    MCB0_rd_en,
    MCB0_rd_data,
    MCB0_rd_full,
    MCB0_rd_empty,
    MCB0_rd_count,
    MCB0_rd_overflow,
    MCB0_rd_error,
    FSL1_M_Clk,
    FSL1_M_Write,
    FSL1_M_Data,
    FSL1_M_Control,
    FSL1_M_Full,
    FSL1_S_Clk,
    FSL1_S_Read,
    FSL1_S_Data,
    FSL1_S_Control,
    FSL1_S_Exists,
    FSL1_B_M_Clk,
    FSL1_B_M_Write,
    FSL1_B_M_Data,
    FSL1_B_M_Control,
    FSL1_B_M_Full,
    FSL1_B_S_Clk,
    FSL1_B_S_Read,
    FSL1_B_S_Data,
    FSL1_B_S_Control,
    FSL1_B_S_Exists,
    SPLB1_Clk,
    SPLB1_Rst,
    SPLB1_PLB_ABus,
    SPLB1_PLB_PAValid,
    SPLB1_PLB_SAValid,
    SPLB1_PLB_masterID,
    SPLB1_PLB_RNW,
    SPLB1_PLB_BE,
    SPLB1_PLB_UABus,
    SPLB1_PLB_rdPrim,
    SPLB1_PLB_wrPrim,
    SPLB1_PLB_abort,
    SPLB1_PLB_busLock,
    SPLB1_PLB_MSize,
    SPLB1_PLB_size,
    SPLB1_PLB_type,
    SPLB1_PLB_lockErr,
    SPLB1_PLB_wrPendReq,
    SPLB1_PLB_wrPendPri,
    SPLB1_PLB_rdPendReq,
    SPLB1_PLB_rdPendPri,
    SPLB1_PLB_reqPri,
    SPLB1_PLB_TAttribute,
    SPLB1_PLB_rdBurst,
    SPLB1_PLB_wrBurst,
    SPLB1_PLB_wrDBus,
    SPLB1_Sl_addrAck,
    SPLB1_Sl_SSize,
    SPLB1_Sl_wait,
    SPLB1_Sl_rearbitrate,
    SPLB1_Sl_wrDAck,
    SPLB1_Sl_wrComp,
    SPLB1_Sl_wrBTerm,
    SPLB1_Sl_rdDBus,
    SPLB1_Sl_rdWdAddr,
    SPLB1_Sl_rdDAck,
    SPLB1_Sl_rdComp,
    SPLB1_Sl_rdBTerm,
    SPLB1_Sl_MBusy,
    SPLB1_Sl_MRdErr,
    SPLB1_Sl_MWrErr,
    SPLB1_Sl_MIRQ,
    SDMA1_Clk,
    SDMA1_Rx_IntOut,
    SDMA1_Tx_IntOut,
    SDMA1_RstOut,
    SDMA1_TX_D,
    SDMA1_TX_Rem,
    SDMA1_TX_SOF,
    SDMA1_TX_EOF,
    SDMA1_TX_SOP,
    SDMA1_TX_EOP,
    SDMA1_TX_Src_Rdy,
    SDMA1_TX_Dst_Rdy,
    SDMA1_RX_D,
    SDMA1_RX_Rem,
    SDMA1_RX_SOF,
    SDMA1_RX_EOF,
    SDMA1_RX_SOP,
    SDMA1_RX_EOP,
    SDMA1_RX_Src_Rdy,
    SDMA1_RX_Dst_Rdy,
    SDMA_CTRL1_Clk,
    SDMA_CTRL1_Rst,
    SDMA_CTRL1_PLB_ABus,
    SDMA_CTRL1_PLB_PAValid,
    SDMA_CTRL1_PLB_SAValid,
    SDMA_CTRL1_PLB_masterID,
    SDMA_CTRL1_PLB_RNW,
    SDMA_CTRL1_PLB_BE,
    SDMA_CTRL1_PLB_UABus,
    SDMA_CTRL1_PLB_rdPrim,
    SDMA_CTRL1_PLB_wrPrim,
    SDMA_CTRL1_PLB_abort,
    SDMA_CTRL1_PLB_busLock,
    SDMA_CTRL1_PLB_MSize,
    SDMA_CTRL1_PLB_size,
    SDMA_CTRL1_PLB_type,
    SDMA_CTRL1_PLB_lockErr,
    SDMA_CTRL1_PLB_wrPendReq,
    SDMA_CTRL1_PLB_wrPendPri,
    SDMA_CTRL1_PLB_rdPendReq,
    SDMA_CTRL1_PLB_rdPendPri,
    SDMA_CTRL1_PLB_reqPri,
    SDMA_CTRL1_PLB_TAttribute,
    SDMA_CTRL1_PLB_rdBurst,
    SDMA_CTRL1_PLB_wrBurst,
    SDMA_CTRL1_PLB_wrDBus,
    SDMA_CTRL1_Sl_addrAck,
    SDMA_CTRL1_Sl_SSize,
    SDMA_CTRL1_Sl_wait,
    SDMA_CTRL1_Sl_rearbitrate,
    SDMA_CTRL1_Sl_wrDAck,
    SDMA_CTRL1_Sl_wrComp,
    SDMA_CTRL1_Sl_wrBTerm,
    SDMA_CTRL1_Sl_rdDBus,
    SDMA_CTRL1_Sl_rdWdAddr,
    SDMA_CTRL1_Sl_rdDAck,
    SDMA_CTRL1_Sl_rdComp,
    SDMA_CTRL1_Sl_rdBTerm,
    SDMA_CTRL1_Sl_MBusy,
    SDMA_CTRL1_Sl_MRdErr,
    SDMA_CTRL1_Sl_MWrErr,
    SDMA_CTRL1_Sl_MIRQ,
    PIM1_Addr,
    PIM1_AddrReq,
    PIM1_AddrAck,
    PIM1_RNW,
    PIM1_Size,
    PIM1_RdModWr,
    PIM1_WrFIFO_Data,
    PIM1_WrFIFO_BE,
    PIM1_WrFIFO_Push,
    PIM1_RdFIFO_Data,
    PIM1_RdFIFO_Pop,
    PIM1_RdFIFO_RdWdAddr,
    PIM1_WrFIFO_Empty,
    PIM1_WrFIFO_AlmostFull,
    PIM1_WrFIFO_Flush,
    PIM1_RdFIFO_Empty,
    PIM1_RdFIFO_Flush,
    PIM1_RdFIFO_Latency,
    PIM1_InitDone,
    PPC440MC1_MIMCReadNotWrite,
    PPC440MC1_MIMCAddress,
    PPC440MC1_MIMCAddressValid,
    PPC440MC1_MIMCWriteData,
    PPC440MC1_MIMCWriteDataValid,
    PPC440MC1_MIMCByteEnable,
    PPC440MC1_MIMCBankConflict,
    PPC440MC1_MIMCRowConflict,
    PPC440MC1_MCMIReadData,
    PPC440MC1_MCMIReadDataValid,
    PPC440MC1_MCMIReadDataErr,
    PPC440MC1_MCMIAddrReadyToAccept,
    VFBC1_Cmd_Clk,
    VFBC1_Cmd_Reset,
    VFBC1_Cmd_Data,
    VFBC1_Cmd_Write,
    VFBC1_Cmd_End,
    VFBC1_Cmd_Full,
    VFBC1_Cmd_Almost_Full,
    VFBC1_Cmd_Idle,
    VFBC1_Wd_Clk,
    VFBC1_Wd_Reset,
    VFBC1_Wd_Write,
    VFBC1_Wd_End_Burst,
    VFBC1_Wd_Flush,
    VFBC1_Wd_Data,
    VFBC1_Wd_Data_BE,
    VFBC1_Wd_Full,
    VFBC1_Wd_Almost_Full,
    VFBC1_Rd_Clk,
    VFBC1_Rd_Reset,
    VFBC1_Rd_Read,
    VFBC1_Rd_End_Burst,
    VFBC1_Rd_Flush,
    VFBC1_Rd_Data,
    VFBC1_Rd_Empty,
    VFBC1_Rd_Almost_Empty,
    MCB1_cmd_clk,
    MCB1_cmd_en,
    MCB1_cmd_instr,
    MCB1_cmd_bl,
    MCB1_cmd_byte_addr,
    MCB1_cmd_empty,
    MCB1_cmd_full,
    MCB1_wr_clk,
    MCB1_wr_en,
    MCB1_wr_mask,
    MCB1_wr_data,
    MCB1_wr_full,
    MCB1_wr_empty,
    MCB1_wr_count,
    MCB1_wr_underrun,
    MCB1_wr_error,
    MCB1_rd_clk,
    MCB1_rd_en,
    MCB1_rd_data,
    MCB1_rd_full,
    MCB1_rd_empty,
    MCB1_rd_count,
    MCB1_rd_overflow,
    MCB1_rd_error,
    FSL2_M_Clk,
    FSL2_M_Write,
    FSL2_M_Data,
    FSL2_M_Control,
    FSL2_M_Full,
    FSL2_S_Clk,
    FSL2_S_Read,
    FSL2_S_Data,
    FSL2_S_Control,
    FSL2_S_Exists,
    FSL2_B_M_Clk,
    FSL2_B_M_Write,
    FSL2_B_M_Data,
    FSL2_B_M_Control,
    FSL2_B_M_Full,
    FSL2_B_S_Clk,
    FSL2_B_S_Read,
    FSL2_B_S_Data,
    FSL2_B_S_Control,
    FSL2_B_S_Exists,
    SPLB2_Clk,
    SPLB2_Rst,
    SPLB2_PLB_ABus,
    SPLB2_PLB_PAValid,
    SPLB2_PLB_SAValid,
    SPLB2_PLB_masterID,
    SPLB2_PLB_RNW,
    SPLB2_PLB_BE,
    SPLB2_PLB_UABus,
    SPLB2_PLB_rdPrim,
    SPLB2_PLB_wrPrim,
    SPLB2_PLB_abort,
    SPLB2_PLB_busLock,
    SPLB2_PLB_MSize,
    SPLB2_PLB_size,
    SPLB2_PLB_type,
    SPLB2_PLB_lockErr,
    SPLB2_PLB_wrPendReq,
    SPLB2_PLB_wrPendPri,
    SPLB2_PLB_rdPendReq,
    SPLB2_PLB_rdPendPri,
    SPLB2_PLB_reqPri,
    SPLB2_PLB_TAttribute,
    SPLB2_PLB_rdBurst,
    SPLB2_PLB_wrBurst,
    SPLB2_PLB_wrDBus,
    SPLB2_Sl_addrAck,
    SPLB2_Sl_SSize,
    SPLB2_Sl_wait,
    SPLB2_Sl_rearbitrate,
    SPLB2_Sl_wrDAck,
    SPLB2_Sl_wrComp,
    SPLB2_Sl_wrBTerm,
    SPLB2_Sl_rdDBus,
    SPLB2_Sl_rdWdAddr,
    SPLB2_Sl_rdDAck,
    SPLB2_Sl_rdComp,
    SPLB2_Sl_rdBTerm,
    SPLB2_Sl_MBusy,
    SPLB2_Sl_MRdErr,
    SPLB2_Sl_MWrErr,
    SPLB2_Sl_MIRQ,
    SDMA2_Clk,
    SDMA2_Rx_IntOut,
    SDMA2_Tx_IntOut,
    SDMA2_RstOut,
    SDMA2_TX_D,
    SDMA2_TX_Rem,
    SDMA2_TX_SOF,
    SDMA2_TX_EOF,
    SDMA2_TX_SOP,
    SDMA2_TX_EOP,
    SDMA2_TX_Src_Rdy,
    SDMA2_TX_Dst_Rdy,
    SDMA2_RX_D,
    SDMA2_RX_Rem,
    SDMA2_RX_SOF,
    SDMA2_RX_EOF,
    SDMA2_RX_SOP,
    SDMA2_RX_EOP,
    SDMA2_RX_Src_Rdy,
    SDMA2_RX_Dst_Rdy,
    SDMA_CTRL2_Clk,
    SDMA_CTRL2_Rst,
    SDMA_CTRL2_PLB_ABus,
    SDMA_CTRL2_PLB_PAValid,
    SDMA_CTRL2_PLB_SAValid,
    SDMA_CTRL2_PLB_masterID,
    SDMA_CTRL2_PLB_RNW,
    SDMA_CTRL2_PLB_BE,
    SDMA_CTRL2_PLB_UABus,
    SDMA_CTRL2_PLB_rdPrim,
    SDMA_CTRL2_PLB_wrPrim,
    SDMA_CTRL2_PLB_abort,
    SDMA_CTRL2_PLB_busLock,
    SDMA_CTRL2_PLB_MSize,
    SDMA_CTRL2_PLB_size,
    SDMA_CTRL2_PLB_type,
    SDMA_CTRL2_PLB_lockErr,
    SDMA_CTRL2_PLB_wrPendReq,
    SDMA_CTRL2_PLB_wrPendPri,
    SDMA_CTRL2_PLB_rdPendReq,
    SDMA_CTRL2_PLB_rdPendPri,
    SDMA_CTRL2_PLB_reqPri,
    SDMA_CTRL2_PLB_TAttribute,
    SDMA_CTRL2_PLB_rdBurst,
    SDMA_CTRL2_PLB_wrBurst,
    SDMA_CTRL2_PLB_wrDBus,
    SDMA_CTRL2_Sl_addrAck,
    SDMA_CTRL2_Sl_SSize,
    SDMA_CTRL2_Sl_wait,
    SDMA_CTRL2_Sl_rearbitrate,
    SDMA_CTRL2_Sl_wrDAck,
    SDMA_CTRL2_Sl_wrComp,
    SDMA_CTRL2_Sl_wrBTerm,
    SDMA_CTRL2_Sl_rdDBus,
    SDMA_CTRL2_Sl_rdWdAddr,
    SDMA_CTRL2_Sl_rdDAck,
    SDMA_CTRL2_Sl_rdComp,
    SDMA_CTRL2_Sl_rdBTerm,
    SDMA_CTRL2_Sl_MBusy,
    SDMA_CTRL2_Sl_MRdErr,
    SDMA_CTRL2_Sl_MWrErr,
    SDMA_CTRL2_Sl_MIRQ,
    PIM2_Addr,
    PIM2_AddrReq,
    PIM2_AddrAck,
    PIM2_RNW,
    PIM2_Size,
    PIM2_RdModWr,
    PIM2_WrFIFO_Data,
    PIM2_WrFIFO_BE,
    PIM2_WrFIFO_Push,
    PIM2_RdFIFO_Data,
    PIM2_RdFIFO_Pop,
    PIM2_RdFIFO_RdWdAddr,
    PIM2_WrFIFO_Empty,
    PIM2_WrFIFO_AlmostFull,
    PIM2_WrFIFO_Flush,
    PIM2_RdFIFO_Empty,
    PIM2_RdFIFO_Flush,
    PIM2_RdFIFO_Latency,
    PIM2_InitDone,
    PPC440MC2_MIMCReadNotWrite,
    PPC440MC2_MIMCAddress,
    PPC440MC2_MIMCAddressValid,
    PPC440MC2_MIMCWriteData,
    PPC440MC2_MIMCWriteDataValid,
    PPC440MC2_MIMCByteEnable,
    PPC440MC2_MIMCBankConflict,
    PPC440MC2_MIMCRowConflict,
    PPC440MC2_MCMIReadData,
    PPC440MC2_MCMIReadDataValid,
    PPC440MC2_MCMIReadDataErr,
    PPC440MC2_MCMIAddrReadyToAccept,
    VFBC2_Cmd_Clk,
    VFBC2_Cmd_Reset,
    VFBC2_Cmd_Data,
    VFBC2_Cmd_Write,
    VFBC2_Cmd_End,
    VFBC2_Cmd_Full,
    VFBC2_Cmd_Almost_Full,
    VFBC2_Cmd_Idle,
    VFBC2_Wd_Clk,
    VFBC2_Wd_Reset,
    VFBC2_Wd_Write,
    VFBC2_Wd_End_Burst,
    VFBC2_Wd_Flush,
    VFBC2_Wd_Data,
    VFBC2_Wd_Data_BE,
    VFBC2_Wd_Full,
    VFBC2_Wd_Almost_Full,
    VFBC2_Rd_Clk,
    VFBC2_Rd_Reset,
    VFBC2_Rd_Read,
    VFBC2_Rd_End_Burst,
    VFBC2_Rd_Flush,
    VFBC2_Rd_Data,
    VFBC2_Rd_Empty,
    VFBC2_Rd_Almost_Empty,
    MCB2_cmd_clk,
    MCB2_cmd_en,
    MCB2_cmd_instr,
    MCB2_cmd_bl,
    MCB2_cmd_byte_addr,
    MCB2_cmd_empty,
    MCB2_cmd_full,
    MCB2_wr_clk,
    MCB2_wr_en,
    MCB2_wr_mask,
    MCB2_wr_data,
    MCB2_wr_full,
    MCB2_wr_empty,
    MCB2_wr_count,
    MCB2_wr_underrun,
    MCB2_wr_error,
    MCB2_rd_clk,
    MCB2_rd_en,
    MCB2_rd_data,
    MCB2_rd_full,
    MCB2_rd_empty,
    MCB2_rd_count,
    MCB2_rd_overflow,
    MCB2_rd_error,
    FSL3_M_Clk,
    FSL3_M_Write,
    FSL3_M_Data,
    FSL3_M_Control,
    FSL3_M_Full,
    FSL3_S_Clk,
    FSL3_S_Read,
    FSL3_S_Data,
    FSL3_S_Control,
    FSL3_S_Exists,
    FSL3_B_M_Clk,
    FSL3_B_M_Write,
    FSL3_B_M_Data,
    FSL3_B_M_Control,
    FSL3_B_M_Full,
    FSL3_B_S_Clk,
    FSL3_B_S_Read,
    FSL3_B_S_Data,
    FSL3_B_S_Control,
    FSL3_B_S_Exists,
    SPLB3_Clk,
    SPLB3_Rst,
    SPLB3_PLB_ABus,
    SPLB3_PLB_PAValid,
    SPLB3_PLB_SAValid,
    SPLB3_PLB_masterID,
    SPLB3_PLB_RNW,
    SPLB3_PLB_BE,
    SPLB3_PLB_UABus,
    SPLB3_PLB_rdPrim,
    SPLB3_PLB_wrPrim,
    SPLB3_PLB_abort,
    SPLB3_PLB_busLock,
    SPLB3_PLB_MSize,
    SPLB3_PLB_size,
    SPLB3_PLB_type,
    SPLB3_PLB_lockErr,
    SPLB3_PLB_wrPendReq,
    SPLB3_PLB_wrPendPri,
    SPLB3_PLB_rdPendReq,
    SPLB3_PLB_rdPendPri,
    SPLB3_PLB_reqPri,
    SPLB3_PLB_TAttribute,
    SPLB3_PLB_rdBurst,
    SPLB3_PLB_wrBurst,
    SPLB3_PLB_wrDBus,
    SPLB3_Sl_addrAck,
    SPLB3_Sl_SSize,
    SPLB3_Sl_wait,
    SPLB3_Sl_rearbitrate,
    SPLB3_Sl_wrDAck,
    SPLB3_Sl_wrComp,
    SPLB3_Sl_wrBTerm,
    SPLB3_Sl_rdDBus,
    SPLB3_Sl_rdWdAddr,
    SPLB3_Sl_rdDAck,
    SPLB3_Sl_rdComp,
    SPLB3_Sl_rdBTerm,
    SPLB3_Sl_MBusy,
    SPLB3_Sl_MRdErr,
    SPLB3_Sl_MWrErr,
    SPLB3_Sl_MIRQ,
    SDMA3_Clk,
    SDMA3_Rx_IntOut,
    SDMA3_Tx_IntOut,
    SDMA3_RstOut,
    SDMA3_TX_D,
    SDMA3_TX_Rem,
    SDMA3_TX_SOF,
    SDMA3_TX_EOF,
    SDMA3_TX_SOP,
    SDMA3_TX_EOP,
    SDMA3_TX_Src_Rdy,
    SDMA3_TX_Dst_Rdy,
    SDMA3_RX_D,
    SDMA3_RX_Rem,
    SDMA3_RX_SOF,
    SDMA3_RX_EOF,
    SDMA3_RX_SOP,
    SDMA3_RX_EOP,
    SDMA3_RX_Src_Rdy,
    SDMA3_RX_Dst_Rdy,
    SDMA_CTRL3_Clk,
    SDMA_CTRL3_Rst,
    SDMA_CTRL3_PLB_ABus,
    SDMA_CTRL3_PLB_PAValid,
    SDMA_CTRL3_PLB_SAValid,
    SDMA_CTRL3_PLB_masterID,
    SDMA_CTRL3_PLB_RNW,
    SDMA_CTRL3_PLB_BE,
    SDMA_CTRL3_PLB_UABus,
    SDMA_CTRL3_PLB_rdPrim,
    SDMA_CTRL3_PLB_wrPrim,
    SDMA_CTRL3_PLB_abort,
    SDMA_CTRL3_PLB_busLock,
    SDMA_CTRL3_PLB_MSize,
    SDMA_CTRL3_PLB_size,
    SDMA_CTRL3_PLB_type,
    SDMA_CTRL3_PLB_lockErr,
    SDMA_CTRL3_PLB_wrPendReq,
    SDMA_CTRL3_PLB_wrPendPri,
    SDMA_CTRL3_PLB_rdPendReq,
    SDMA_CTRL3_PLB_rdPendPri,
    SDMA_CTRL3_PLB_reqPri,
    SDMA_CTRL3_PLB_TAttribute,
    SDMA_CTRL3_PLB_rdBurst,
    SDMA_CTRL3_PLB_wrBurst,
    SDMA_CTRL3_PLB_wrDBus,
    SDMA_CTRL3_Sl_addrAck,
    SDMA_CTRL3_Sl_SSize,
    SDMA_CTRL3_Sl_wait,
    SDMA_CTRL3_Sl_rearbitrate,
    SDMA_CTRL3_Sl_wrDAck,
    SDMA_CTRL3_Sl_wrComp,
    SDMA_CTRL3_Sl_wrBTerm,
    SDMA_CTRL3_Sl_rdDBus,
    SDMA_CTRL3_Sl_rdWdAddr,
    SDMA_CTRL3_Sl_rdDAck,
    SDMA_CTRL3_Sl_rdComp,
    SDMA_CTRL3_Sl_rdBTerm,
    SDMA_CTRL3_Sl_MBusy,
    SDMA_CTRL3_Sl_MRdErr,
    SDMA_CTRL3_Sl_MWrErr,
    SDMA_CTRL3_Sl_MIRQ,
    PIM3_Addr,
    PIM3_AddrReq,
    PIM3_AddrAck,
    PIM3_RNW,
    PIM3_Size,
    PIM3_RdModWr,
    PIM3_WrFIFO_Data,
    PIM3_WrFIFO_BE,
    PIM3_WrFIFO_Push,
    PIM3_RdFIFO_Data,
    PIM3_RdFIFO_Pop,
    PIM3_RdFIFO_RdWdAddr,
    PIM3_WrFIFO_Empty,
    PIM3_WrFIFO_AlmostFull,
    PIM3_WrFIFO_Flush,
    PIM3_RdFIFO_Empty,
    PIM3_RdFIFO_Flush,
    PIM3_RdFIFO_Latency,
    PIM3_InitDone,
    PPC440MC3_MIMCReadNotWrite,
    PPC440MC3_MIMCAddress,
    PPC440MC3_MIMCAddressValid,
    PPC440MC3_MIMCWriteData,
    PPC440MC3_MIMCWriteDataValid,
    PPC440MC3_MIMCByteEnable,
    PPC440MC3_MIMCBankConflict,
    PPC440MC3_MIMCRowConflict,
    PPC440MC3_MCMIReadData,
    PPC440MC3_MCMIReadDataValid,
    PPC440MC3_MCMIReadDataErr,
    PPC440MC3_MCMIAddrReadyToAccept,
    VFBC3_Cmd_Clk,
    VFBC3_Cmd_Reset,
    VFBC3_Cmd_Data,
    VFBC3_Cmd_Write,
    VFBC3_Cmd_End,
    VFBC3_Cmd_Full,
    VFBC3_Cmd_Almost_Full,
    VFBC3_Cmd_Idle,
    VFBC3_Wd_Clk,
    VFBC3_Wd_Reset,
    VFBC3_Wd_Write,
    VFBC3_Wd_End_Burst,
    VFBC3_Wd_Flush,
    VFBC3_Wd_Data,
    VFBC3_Wd_Data_BE,
    VFBC3_Wd_Full,
    VFBC3_Wd_Almost_Full,
    VFBC3_Rd_Clk,
    VFBC3_Rd_Reset,
    VFBC3_Rd_Read,
    VFBC3_Rd_End_Burst,
    VFBC3_Rd_Flush,
    VFBC3_Rd_Data,
    VFBC3_Rd_Empty,
    VFBC3_Rd_Almost_Empty,
    MCB3_cmd_clk,
    MCB3_cmd_en,
    MCB3_cmd_instr,
    MCB3_cmd_bl,
    MCB3_cmd_byte_addr,
    MCB3_cmd_empty,
    MCB3_cmd_full,
    MCB3_wr_clk,
    MCB3_wr_en,
    MCB3_wr_mask,
    MCB3_wr_data,
    MCB3_wr_full,
    MCB3_wr_empty,
    MCB3_wr_count,
    MCB3_wr_underrun,
    MCB3_wr_error,
    MCB3_rd_clk,
    MCB3_rd_en,
    MCB3_rd_data,
    MCB3_rd_full,
    MCB3_rd_empty,
    MCB3_rd_count,
    MCB3_rd_overflow,
    MCB3_rd_error,
    FSL4_M_Clk,
    FSL4_M_Write,
    FSL4_M_Data,
    FSL4_M_Control,
    FSL4_M_Full,
    FSL4_S_Clk,
    FSL4_S_Read,
    FSL4_S_Data,
    FSL4_S_Control,
    FSL4_S_Exists,
    FSL4_B_M_Clk,
    FSL4_B_M_Write,
    FSL4_B_M_Data,
    FSL4_B_M_Control,
    FSL4_B_M_Full,
    FSL4_B_S_Clk,
    FSL4_B_S_Read,
    FSL4_B_S_Data,
    FSL4_B_S_Control,
    FSL4_B_S_Exists,
    SPLB4_Clk,
    SPLB4_Rst,
    SPLB4_PLB_ABus,
    SPLB4_PLB_PAValid,
    SPLB4_PLB_SAValid,
    SPLB4_PLB_masterID,
    SPLB4_PLB_RNW,
    SPLB4_PLB_BE,
    SPLB4_PLB_UABus,
    SPLB4_PLB_rdPrim,
    SPLB4_PLB_wrPrim,
    SPLB4_PLB_abort,
    SPLB4_PLB_busLock,
    SPLB4_PLB_MSize,
    SPLB4_PLB_size,
    SPLB4_PLB_type,
    SPLB4_PLB_lockErr,
    SPLB4_PLB_wrPendReq,
    SPLB4_PLB_wrPendPri,
    SPLB4_PLB_rdPendReq,
    SPLB4_PLB_rdPendPri,
    SPLB4_PLB_reqPri,
    SPLB4_PLB_TAttribute,
    SPLB4_PLB_rdBurst,
    SPLB4_PLB_wrBurst,
    SPLB4_PLB_wrDBus,
    SPLB4_Sl_addrAck,
    SPLB4_Sl_SSize,
    SPLB4_Sl_wait,
    SPLB4_Sl_rearbitrate,
    SPLB4_Sl_wrDAck,
    SPLB4_Sl_wrComp,
    SPLB4_Sl_wrBTerm,
    SPLB4_Sl_rdDBus,
    SPLB4_Sl_rdWdAddr,
    SPLB4_Sl_rdDAck,
    SPLB4_Sl_rdComp,
    SPLB4_Sl_rdBTerm,
    SPLB4_Sl_MBusy,
    SPLB4_Sl_MRdErr,
    SPLB4_Sl_MWrErr,
    SPLB4_Sl_MIRQ,
    SDMA4_Clk,
    SDMA4_Rx_IntOut,
    SDMA4_Tx_IntOut,
    SDMA4_RstOut,
    SDMA4_TX_D,
    SDMA4_TX_Rem,
    SDMA4_TX_SOF,
    SDMA4_TX_EOF,
    SDMA4_TX_SOP,
    SDMA4_TX_EOP,
    SDMA4_TX_Src_Rdy,
    SDMA4_TX_Dst_Rdy,
    SDMA4_RX_D,
    SDMA4_RX_Rem,
    SDMA4_RX_SOF,
    SDMA4_RX_EOF,
    SDMA4_RX_SOP,
    SDMA4_RX_EOP,
    SDMA4_RX_Src_Rdy,
    SDMA4_RX_Dst_Rdy,
    SDMA_CTRL4_Clk,
    SDMA_CTRL4_Rst,
    SDMA_CTRL4_PLB_ABus,
    SDMA_CTRL4_PLB_PAValid,
    SDMA_CTRL4_PLB_SAValid,
    SDMA_CTRL4_PLB_masterID,
    SDMA_CTRL4_PLB_RNW,
    SDMA_CTRL4_PLB_BE,
    SDMA_CTRL4_PLB_UABus,
    SDMA_CTRL4_PLB_rdPrim,
    SDMA_CTRL4_PLB_wrPrim,
    SDMA_CTRL4_PLB_abort,
    SDMA_CTRL4_PLB_busLock,
    SDMA_CTRL4_PLB_MSize,
    SDMA_CTRL4_PLB_size,
    SDMA_CTRL4_PLB_type,
    SDMA_CTRL4_PLB_lockErr,
    SDMA_CTRL4_PLB_wrPendReq,
    SDMA_CTRL4_PLB_wrPendPri,
    SDMA_CTRL4_PLB_rdPendReq,
    SDMA_CTRL4_PLB_rdPendPri,
    SDMA_CTRL4_PLB_reqPri,
    SDMA_CTRL4_PLB_TAttribute,
    SDMA_CTRL4_PLB_rdBurst,
    SDMA_CTRL4_PLB_wrBurst,
    SDMA_CTRL4_PLB_wrDBus,
    SDMA_CTRL4_Sl_addrAck,
    SDMA_CTRL4_Sl_SSize,
    SDMA_CTRL4_Sl_wait,
    SDMA_CTRL4_Sl_rearbitrate,
    SDMA_CTRL4_Sl_wrDAck,
    SDMA_CTRL4_Sl_wrComp,
    SDMA_CTRL4_Sl_wrBTerm,
    SDMA_CTRL4_Sl_rdDBus,
    SDMA_CTRL4_Sl_rdWdAddr,
    SDMA_CTRL4_Sl_rdDAck,
    SDMA_CTRL4_Sl_rdComp,
    SDMA_CTRL4_Sl_rdBTerm,
    SDMA_CTRL4_Sl_MBusy,
    SDMA_CTRL4_Sl_MRdErr,
    SDMA_CTRL4_Sl_MWrErr,
    SDMA_CTRL4_Sl_MIRQ,
    PIM4_Addr,
    PIM4_AddrReq,
    PIM4_AddrAck,
    PIM4_RNW,
    PIM4_Size,
    PIM4_RdModWr,
    PIM4_WrFIFO_Data,
    PIM4_WrFIFO_BE,
    PIM4_WrFIFO_Push,
    PIM4_RdFIFO_Data,
    PIM4_RdFIFO_Pop,
    PIM4_RdFIFO_RdWdAddr,
    PIM4_WrFIFO_Empty,
    PIM4_WrFIFO_AlmostFull,
    PIM4_WrFIFO_Flush,
    PIM4_RdFIFO_Empty,
    PIM4_RdFIFO_Flush,
    PIM4_RdFIFO_Latency,
    PIM4_InitDone,
    PPC440MC4_MIMCReadNotWrite,
    PPC440MC4_MIMCAddress,
    PPC440MC4_MIMCAddressValid,
    PPC440MC4_MIMCWriteData,
    PPC440MC4_MIMCWriteDataValid,
    PPC440MC4_MIMCByteEnable,
    PPC440MC4_MIMCBankConflict,
    PPC440MC4_MIMCRowConflict,
    PPC440MC4_MCMIReadData,
    PPC440MC4_MCMIReadDataValid,
    PPC440MC4_MCMIReadDataErr,
    PPC440MC4_MCMIAddrReadyToAccept,
    VFBC4_Cmd_Clk,
    VFBC4_Cmd_Reset,
    VFBC4_Cmd_Data,
    VFBC4_Cmd_Write,
    VFBC4_Cmd_End,
    VFBC4_Cmd_Full,
    VFBC4_Cmd_Almost_Full,
    VFBC4_Cmd_Idle,
    VFBC4_Wd_Clk,
    VFBC4_Wd_Reset,
    VFBC4_Wd_Write,
    VFBC4_Wd_End_Burst,
    VFBC4_Wd_Flush,
    VFBC4_Wd_Data,
    VFBC4_Wd_Data_BE,
    VFBC4_Wd_Full,
    VFBC4_Wd_Almost_Full,
    VFBC4_Rd_Clk,
    VFBC4_Rd_Reset,
    VFBC4_Rd_Read,
    VFBC4_Rd_End_Burst,
    VFBC4_Rd_Flush,
    VFBC4_Rd_Data,
    VFBC4_Rd_Empty,
    VFBC4_Rd_Almost_Empty,
    MCB4_cmd_clk,
    MCB4_cmd_en,
    MCB4_cmd_instr,
    MCB4_cmd_bl,
    MCB4_cmd_byte_addr,
    MCB4_cmd_empty,
    MCB4_cmd_full,
    MCB4_wr_clk,
    MCB4_wr_en,
    MCB4_wr_mask,
    MCB4_wr_data,
    MCB4_wr_full,
    MCB4_wr_empty,
    MCB4_wr_count,
    MCB4_wr_underrun,
    MCB4_wr_error,
    MCB4_rd_clk,
    MCB4_rd_en,
    MCB4_rd_data,
    MCB4_rd_full,
    MCB4_rd_empty,
    MCB4_rd_count,
    MCB4_rd_overflow,
    MCB4_rd_error,
    FSL5_M_Clk,
    FSL5_M_Write,
    FSL5_M_Data,
    FSL5_M_Control,
    FSL5_M_Full,
    FSL5_S_Clk,
    FSL5_S_Read,
    FSL5_S_Data,
    FSL5_S_Control,
    FSL5_S_Exists,
    FSL5_B_M_Clk,
    FSL5_B_M_Write,
    FSL5_B_M_Data,
    FSL5_B_M_Control,
    FSL5_B_M_Full,
    FSL5_B_S_Clk,
    FSL5_B_S_Read,
    FSL5_B_S_Data,
    FSL5_B_S_Control,
    FSL5_B_S_Exists,
    SPLB5_Clk,
    SPLB5_Rst,
    SPLB5_PLB_ABus,
    SPLB5_PLB_PAValid,
    SPLB5_PLB_SAValid,
    SPLB5_PLB_masterID,
    SPLB5_PLB_RNW,
    SPLB5_PLB_BE,
    SPLB5_PLB_UABus,
    SPLB5_PLB_rdPrim,
    SPLB5_PLB_wrPrim,
    SPLB5_PLB_abort,
    SPLB5_PLB_busLock,
    SPLB5_PLB_MSize,
    SPLB5_PLB_size,
    SPLB5_PLB_type,
    SPLB5_PLB_lockErr,
    SPLB5_PLB_wrPendReq,
    SPLB5_PLB_wrPendPri,
    SPLB5_PLB_rdPendReq,
    SPLB5_PLB_rdPendPri,
    SPLB5_PLB_reqPri,
    SPLB5_PLB_TAttribute,
    SPLB5_PLB_rdBurst,
    SPLB5_PLB_wrBurst,
    SPLB5_PLB_wrDBus,
    SPLB5_Sl_addrAck,
    SPLB5_Sl_SSize,
    SPLB5_Sl_wait,
    SPLB5_Sl_rearbitrate,
    SPLB5_Sl_wrDAck,
    SPLB5_Sl_wrComp,
    SPLB5_Sl_wrBTerm,
    SPLB5_Sl_rdDBus,
    SPLB5_Sl_rdWdAddr,
    SPLB5_Sl_rdDAck,
    SPLB5_Sl_rdComp,
    SPLB5_Sl_rdBTerm,
    SPLB5_Sl_MBusy,
    SPLB5_Sl_MRdErr,
    SPLB5_Sl_MWrErr,
    SPLB5_Sl_MIRQ,
    SDMA5_Clk,
    SDMA5_Rx_IntOut,
    SDMA5_Tx_IntOut,
    SDMA5_RstOut,
    SDMA5_TX_D,
    SDMA5_TX_Rem,
    SDMA5_TX_SOF,
    SDMA5_TX_EOF,
    SDMA5_TX_SOP,
    SDMA5_TX_EOP,
    SDMA5_TX_Src_Rdy,
    SDMA5_TX_Dst_Rdy,
    SDMA5_RX_D,
    SDMA5_RX_Rem,
    SDMA5_RX_SOF,
    SDMA5_RX_EOF,
    SDMA5_RX_SOP,
    SDMA5_RX_EOP,
    SDMA5_RX_Src_Rdy,
    SDMA5_RX_Dst_Rdy,
    SDMA_CTRL5_Clk,
    SDMA_CTRL5_Rst,
    SDMA_CTRL5_PLB_ABus,
    SDMA_CTRL5_PLB_PAValid,
    SDMA_CTRL5_PLB_SAValid,
    SDMA_CTRL5_PLB_masterID,
    SDMA_CTRL5_PLB_RNW,
    SDMA_CTRL5_PLB_BE,
    SDMA_CTRL5_PLB_UABus,
    SDMA_CTRL5_PLB_rdPrim,
    SDMA_CTRL5_PLB_wrPrim,
    SDMA_CTRL5_PLB_abort,
    SDMA_CTRL5_PLB_busLock,
    SDMA_CTRL5_PLB_MSize,
    SDMA_CTRL5_PLB_size,
    SDMA_CTRL5_PLB_type,
    SDMA_CTRL5_PLB_lockErr,
    SDMA_CTRL5_PLB_wrPendReq,
    SDMA_CTRL5_PLB_wrPendPri,
    SDMA_CTRL5_PLB_rdPendReq,
    SDMA_CTRL5_PLB_rdPendPri,
    SDMA_CTRL5_PLB_reqPri,
    SDMA_CTRL5_PLB_TAttribute,
    SDMA_CTRL5_PLB_rdBurst,
    SDMA_CTRL5_PLB_wrBurst,
    SDMA_CTRL5_PLB_wrDBus,
    SDMA_CTRL5_Sl_addrAck,
    SDMA_CTRL5_Sl_SSize,
    SDMA_CTRL5_Sl_wait,
    SDMA_CTRL5_Sl_rearbitrate,
    SDMA_CTRL5_Sl_wrDAck,
    SDMA_CTRL5_Sl_wrComp,
    SDMA_CTRL5_Sl_wrBTerm,
    SDMA_CTRL5_Sl_rdDBus,
    SDMA_CTRL5_Sl_rdWdAddr,
    SDMA_CTRL5_Sl_rdDAck,
    SDMA_CTRL5_Sl_rdComp,
    SDMA_CTRL5_Sl_rdBTerm,
    SDMA_CTRL5_Sl_MBusy,
    SDMA_CTRL5_Sl_MRdErr,
    SDMA_CTRL5_Sl_MWrErr,
    SDMA_CTRL5_Sl_MIRQ,
    PIM5_Addr,
    PIM5_AddrReq,
    PIM5_AddrAck,
    PIM5_RNW,
    PIM5_Size,
    PIM5_RdModWr,
    PIM5_WrFIFO_Data,
    PIM5_WrFIFO_BE,
    PIM5_WrFIFO_Push,
    PIM5_RdFIFO_Data,
    PIM5_RdFIFO_Pop,
    PIM5_RdFIFO_RdWdAddr,
    PIM5_WrFIFO_Empty,
    PIM5_WrFIFO_AlmostFull,
    PIM5_WrFIFO_Flush,
    PIM5_RdFIFO_Empty,
    PIM5_RdFIFO_Flush,
    PIM5_RdFIFO_Latency,
    PIM5_InitDone,
    PPC440MC5_MIMCReadNotWrite,
    PPC440MC5_MIMCAddress,
    PPC440MC5_MIMCAddressValid,
    PPC440MC5_MIMCWriteData,
    PPC440MC5_MIMCWriteDataValid,
    PPC440MC5_MIMCByteEnable,
    PPC440MC5_MIMCBankConflict,
    PPC440MC5_MIMCRowConflict,
    PPC440MC5_MCMIReadData,
    PPC440MC5_MCMIReadDataValid,
    PPC440MC5_MCMIReadDataErr,
    PPC440MC5_MCMIAddrReadyToAccept,
    VFBC5_Cmd_Clk,
    VFBC5_Cmd_Reset,
    VFBC5_Cmd_Data,
    VFBC5_Cmd_Write,
    VFBC5_Cmd_End,
    VFBC5_Cmd_Full,
    VFBC5_Cmd_Almost_Full,
    VFBC5_Cmd_Idle,
    VFBC5_Wd_Clk,
    VFBC5_Wd_Reset,
    VFBC5_Wd_Write,
    VFBC5_Wd_End_Burst,
    VFBC5_Wd_Flush,
    VFBC5_Wd_Data,
    VFBC5_Wd_Data_BE,
    VFBC5_Wd_Full,
    VFBC5_Wd_Almost_Full,
    VFBC5_Rd_Clk,
    VFBC5_Rd_Reset,
    VFBC5_Rd_Read,
    VFBC5_Rd_End_Burst,
    VFBC5_Rd_Flush,
    VFBC5_Rd_Data,
    VFBC5_Rd_Empty,
    VFBC5_Rd_Almost_Empty,
    MCB5_cmd_clk,
    MCB5_cmd_en,
    MCB5_cmd_instr,
    MCB5_cmd_bl,
    MCB5_cmd_byte_addr,
    MCB5_cmd_empty,
    MCB5_cmd_full,
    MCB5_wr_clk,
    MCB5_wr_en,
    MCB5_wr_mask,
    MCB5_wr_data,
    MCB5_wr_full,
    MCB5_wr_empty,
    MCB5_wr_count,
    MCB5_wr_underrun,
    MCB5_wr_error,
    MCB5_rd_clk,
    MCB5_rd_en,
    MCB5_rd_data,
    MCB5_rd_full,
    MCB5_rd_empty,
    MCB5_rd_count,
    MCB5_rd_overflow,
    MCB5_rd_error,
    FSL6_M_Clk,
    FSL6_M_Write,
    FSL6_M_Data,
    FSL6_M_Control,
    FSL6_M_Full,
    FSL6_S_Clk,
    FSL6_S_Read,
    FSL6_S_Data,
    FSL6_S_Control,
    FSL6_S_Exists,
    FSL6_B_M_Clk,
    FSL6_B_M_Write,
    FSL6_B_M_Data,
    FSL6_B_M_Control,
    FSL6_B_M_Full,
    FSL6_B_S_Clk,
    FSL6_B_S_Read,
    FSL6_B_S_Data,
    FSL6_B_S_Control,
    FSL6_B_S_Exists,
    SPLB6_Clk,
    SPLB6_Rst,
    SPLB6_PLB_ABus,
    SPLB6_PLB_PAValid,
    SPLB6_PLB_SAValid,
    SPLB6_PLB_masterID,
    SPLB6_PLB_RNW,
    SPLB6_PLB_BE,
    SPLB6_PLB_UABus,
    SPLB6_PLB_rdPrim,
    SPLB6_PLB_wrPrim,
    SPLB6_PLB_abort,
    SPLB6_PLB_busLock,
    SPLB6_PLB_MSize,
    SPLB6_PLB_size,
    SPLB6_PLB_type,
    SPLB6_PLB_lockErr,
    SPLB6_PLB_wrPendReq,
    SPLB6_PLB_wrPendPri,
    SPLB6_PLB_rdPendReq,
    SPLB6_PLB_rdPendPri,
    SPLB6_PLB_reqPri,
    SPLB6_PLB_TAttribute,
    SPLB6_PLB_rdBurst,
    SPLB6_PLB_wrBurst,
    SPLB6_PLB_wrDBus,
    SPLB6_Sl_addrAck,
    SPLB6_Sl_SSize,
    SPLB6_Sl_wait,
    SPLB6_Sl_rearbitrate,
    SPLB6_Sl_wrDAck,
    SPLB6_Sl_wrComp,
    SPLB6_Sl_wrBTerm,
    SPLB6_Sl_rdDBus,
    SPLB6_Sl_rdWdAddr,
    SPLB6_Sl_rdDAck,
    SPLB6_Sl_rdComp,
    SPLB6_Sl_rdBTerm,
    SPLB6_Sl_MBusy,
    SPLB6_Sl_MRdErr,
    SPLB6_Sl_MWrErr,
    SPLB6_Sl_MIRQ,
    SDMA6_Clk,
    SDMA6_Rx_IntOut,
    SDMA6_Tx_IntOut,
    SDMA6_RstOut,
    SDMA6_TX_D,
    SDMA6_TX_Rem,
    SDMA6_TX_SOF,
    SDMA6_TX_EOF,
    SDMA6_TX_SOP,
    SDMA6_TX_EOP,
    SDMA6_TX_Src_Rdy,
    SDMA6_TX_Dst_Rdy,
    SDMA6_RX_D,
    SDMA6_RX_Rem,
    SDMA6_RX_SOF,
    SDMA6_RX_EOF,
    SDMA6_RX_SOP,
    SDMA6_RX_EOP,
    SDMA6_RX_Src_Rdy,
    SDMA6_RX_Dst_Rdy,
    SDMA_CTRL6_Clk,
    SDMA_CTRL6_Rst,
    SDMA_CTRL6_PLB_ABus,
    SDMA_CTRL6_PLB_PAValid,
    SDMA_CTRL6_PLB_SAValid,
    SDMA_CTRL6_PLB_masterID,
    SDMA_CTRL6_PLB_RNW,
    SDMA_CTRL6_PLB_BE,
    SDMA_CTRL6_PLB_UABus,
    SDMA_CTRL6_PLB_rdPrim,
    SDMA_CTRL6_PLB_wrPrim,
    SDMA_CTRL6_PLB_abort,
    SDMA_CTRL6_PLB_busLock,
    SDMA_CTRL6_PLB_MSize,
    SDMA_CTRL6_PLB_size,
    SDMA_CTRL6_PLB_type,
    SDMA_CTRL6_PLB_lockErr,
    SDMA_CTRL6_PLB_wrPendReq,
    SDMA_CTRL6_PLB_wrPendPri,
    SDMA_CTRL6_PLB_rdPendReq,
    SDMA_CTRL6_PLB_rdPendPri,
    SDMA_CTRL6_PLB_reqPri,
    SDMA_CTRL6_PLB_TAttribute,
    SDMA_CTRL6_PLB_rdBurst,
    SDMA_CTRL6_PLB_wrBurst,
    SDMA_CTRL6_PLB_wrDBus,
    SDMA_CTRL6_Sl_addrAck,
    SDMA_CTRL6_Sl_SSize,
    SDMA_CTRL6_Sl_wait,
    SDMA_CTRL6_Sl_rearbitrate,
    SDMA_CTRL6_Sl_wrDAck,
    SDMA_CTRL6_Sl_wrComp,
    SDMA_CTRL6_Sl_wrBTerm,
    SDMA_CTRL6_Sl_rdDBus,
    SDMA_CTRL6_Sl_rdWdAddr,
    SDMA_CTRL6_Sl_rdDAck,
    SDMA_CTRL6_Sl_rdComp,
    SDMA_CTRL6_Sl_rdBTerm,
    SDMA_CTRL6_Sl_MBusy,
    SDMA_CTRL6_Sl_MRdErr,
    SDMA_CTRL6_Sl_MWrErr,
    SDMA_CTRL6_Sl_MIRQ,
    PIM6_Addr,
    PIM6_AddrReq,
    PIM6_AddrAck,
    PIM6_RNW,
    PIM6_Size,
    PIM6_RdModWr,
    PIM6_WrFIFO_Data,
    PIM6_WrFIFO_BE,
    PIM6_WrFIFO_Push,
    PIM6_RdFIFO_Data,
    PIM6_RdFIFO_Pop,
    PIM6_RdFIFO_RdWdAddr,
    PIM6_WrFIFO_Empty,
    PIM6_WrFIFO_AlmostFull,
    PIM6_WrFIFO_Flush,
    PIM6_RdFIFO_Empty,
    PIM6_RdFIFO_Flush,
    PIM6_RdFIFO_Latency,
    PIM6_InitDone,
    PPC440MC6_MIMCReadNotWrite,
    PPC440MC6_MIMCAddress,
    PPC440MC6_MIMCAddressValid,
    PPC440MC6_MIMCWriteData,
    PPC440MC6_MIMCWriteDataValid,
    PPC440MC6_MIMCByteEnable,
    PPC440MC6_MIMCBankConflict,
    PPC440MC6_MIMCRowConflict,
    PPC440MC6_MCMIReadData,
    PPC440MC6_MCMIReadDataValid,
    PPC440MC6_MCMIReadDataErr,
    PPC440MC6_MCMIAddrReadyToAccept,
    VFBC6_Cmd_Clk,
    VFBC6_Cmd_Reset,
    VFBC6_Cmd_Data,
    VFBC6_Cmd_Write,
    VFBC6_Cmd_End,
    VFBC6_Cmd_Full,
    VFBC6_Cmd_Almost_Full,
    VFBC6_Cmd_Idle,
    VFBC6_Wd_Clk,
    VFBC6_Wd_Reset,
    VFBC6_Wd_Write,
    VFBC6_Wd_End_Burst,
    VFBC6_Wd_Flush,
    VFBC6_Wd_Data,
    VFBC6_Wd_Data_BE,
    VFBC6_Wd_Full,
    VFBC6_Wd_Almost_Full,
    VFBC6_Rd_Clk,
    VFBC6_Rd_Reset,
    VFBC6_Rd_Read,
    VFBC6_Rd_End_Burst,
    VFBC6_Rd_Flush,
    VFBC6_Rd_Data,
    VFBC6_Rd_Empty,
    VFBC6_Rd_Almost_Empty,
    MCB6_cmd_clk,
    MCB6_cmd_en,
    MCB6_cmd_instr,
    MCB6_cmd_bl,
    MCB6_cmd_byte_addr,
    MCB6_cmd_empty,
    MCB6_cmd_full,
    MCB6_wr_clk,
    MCB6_wr_en,
    MCB6_wr_mask,
    MCB6_wr_data,
    MCB6_wr_full,
    MCB6_wr_empty,
    MCB6_wr_count,
    MCB6_wr_underrun,
    MCB6_wr_error,
    MCB6_rd_clk,
    MCB6_rd_en,
    MCB6_rd_data,
    MCB6_rd_full,
    MCB6_rd_empty,
    MCB6_rd_count,
    MCB6_rd_overflow,
    MCB6_rd_error,
    FSL7_M_Clk,
    FSL7_M_Write,
    FSL7_M_Data,
    FSL7_M_Control,
    FSL7_M_Full,
    FSL7_S_Clk,
    FSL7_S_Read,
    FSL7_S_Data,
    FSL7_S_Control,
    FSL7_S_Exists,
    FSL7_B_M_Clk,
    FSL7_B_M_Write,
    FSL7_B_M_Data,
    FSL7_B_M_Control,
    FSL7_B_M_Full,
    FSL7_B_S_Clk,
    FSL7_B_S_Read,
    FSL7_B_S_Data,
    FSL7_B_S_Control,
    FSL7_B_S_Exists,
    SPLB7_Clk,
    SPLB7_Rst,
    SPLB7_PLB_ABus,
    SPLB7_PLB_PAValid,
    SPLB7_PLB_SAValid,
    SPLB7_PLB_masterID,
    SPLB7_PLB_RNW,
    SPLB7_PLB_BE,
    SPLB7_PLB_UABus,
    SPLB7_PLB_rdPrim,
    SPLB7_PLB_wrPrim,
    SPLB7_PLB_abort,
    SPLB7_PLB_busLock,
    SPLB7_PLB_MSize,
    SPLB7_PLB_size,
    SPLB7_PLB_type,
    SPLB7_PLB_lockErr,
    SPLB7_PLB_wrPendReq,
    SPLB7_PLB_wrPendPri,
    SPLB7_PLB_rdPendReq,
    SPLB7_PLB_rdPendPri,
    SPLB7_PLB_reqPri,
    SPLB7_PLB_TAttribute,
    SPLB7_PLB_rdBurst,
    SPLB7_PLB_wrBurst,
    SPLB7_PLB_wrDBus,
    SPLB7_Sl_addrAck,
    SPLB7_Sl_SSize,
    SPLB7_Sl_wait,
    SPLB7_Sl_rearbitrate,
    SPLB7_Sl_wrDAck,
    SPLB7_Sl_wrComp,
    SPLB7_Sl_wrBTerm,
    SPLB7_Sl_rdDBus,
    SPLB7_Sl_rdWdAddr,
    SPLB7_Sl_rdDAck,
    SPLB7_Sl_rdComp,
    SPLB7_Sl_rdBTerm,
    SPLB7_Sl_MBusy,
    SPLB7_Sl_MRdErr,
    SPLB7_Sl_MWrErr,
    SPLB7_Sl_MIRQ,
    SDMA7_Clk,
    SDMA7_Rx_IntOut,
    SDMA7_Tx_IntOut,
    SDMA7_RstOut,
    SDMA7_TX_D,
    SDMA7_TX_Rem,
    SDMA7_TX_SOF,
    SDMA7_TX_EOF,
    SDMA7_TX_SOP,
    SDMA7_TX_EOP,
    SDMA7_TX_Src_Rdy,
    SDMA7_TX_Dst_Rdy,
    SDMA7_RX_D,
    SDMA7_RX_Rem,
    SDMA7_RX_SOF,
    SDMA7_RX_EOF,
    SDMA7_RX_SOP,
    SDMA7_RX_EOP,
    SDMA7_RX_Src_Rdy,
    SDMA7_RX_Dst_Rdy,
    SDMA_CTRL7_Clk,
    SDMA_CTRL7_Rst,
    SDMA_CTRL7_PLB_ABus,
    SDMA_CTRL7_PLB_PAValid,
    SDMA_CTRL7_PLB_SAValid,
    SDMA_CTRL7_PLB_masterID,
    SDMA_CTRL7_PLB_RNW,
    SDMA_CTRL7_PLB_BE,
    SDMA_CTRL7_PLB_UABus,
    SDMA_CTRL7_PLB_rdPrim,
    SDMA_CTRL7_PLB_wrPrim,
    SDMA_CTRL7_PLB_abort,
    SDMA_CTRL7_PLB_busLock,
    SDMA_CTRL7_PLB_MSize,
    SDMA_CTRL7_PLB_size,
    SDMA_CTRL7_PLB_type,
    SDMA_CTRL7_PLB_lockErr,
    SDMA_CTRL7_PLB_wrPendReq,
    SDMA_CTRL7_PLB_wrPendPri,
    SDMA_CTRL7_PLB_rdPendReq,
    SDMA_CTRL7_PLB_rdPendPri,
    SDMA_CTRL7_PLB_reqPri,
    SDMA_CTRL7_PLB_TAttribute,
    SDMA_CTRL7_PLB_rdBurst,
    SDMA_CTRL7_PLB_wrBurst,
    SDMA_CTRL7_PLB_wrDBus,
    SDMA_CTRL7_Sl_addrAck,
    SDMA_CTRL7_Sl_SSize,
    SDMA_CTRL7_Sl_wait,
    SDMA_CTRL7_Sl_rearbitrate,
    SDMA_CTRL7_Sl_wrDAck,
    SDMA_CTRL7_Sl_wrComp,
    SDMA_CTRL7_Sl_wrBTerm,
    SDMA_CTRL7_Sl_rdDBus,
    SDMA_CTRL7_Sl_rdWdAddr,
    SDMA_CTRL7_Sl_rdDAck,
    SDMA_CTRL7_Sl_rdComp,
    SDMA_CTRL7_Sl_rdBTerm,
    SDMA_CTRL7_Sl_MBusy,
    SDMA_CTRL7_Sl_MRdErr,
    SDMA_CTRL7_Sl_MWrErr,
    SDMA_CTRL7_Sl_MIRQ,
    PIM7_Addr,
    PIM7_AddrReq,
    PIM7_AddrAck,
    PIM7_RNW,
    PIM7_Size,
    PIM7_RdModWr,
    PIM7_WrFIFO_Data,
    PIM7_WrFIFO_BE,
    PIM7_WrFIFO_Push,
    PIM7_RdFIFO_Data,
    PIM7_RdFIFO_Pop,
    PIM7_RdFIFO_RdWdAddr,
    PIM7_WrFIFO_Empty,
    PIM7_WrFIFO_AlmostFull,
    PIM7_WrFIFO_Flush,
    PIM7_RdFIFO_Empty,
    PIM7_RdFIFO_Flush,
    PIM7_RdFIFO_Latency,
    PIM7_InitDone,
    PPC440MC7_MIMCReadNotWrite,
    PPC440MC7_MIMCAddress,
    PPC440MC7_MIMCAddressValid,
    PPC440MC7_MIMCWriteData,
    PPC440MC7_MIMCWriteDataValid,
    PPC440MC7_MIMCByteEnable,
    PPC440MC7_MIMCBankConflict,
    PPC440MC7_MIMCRowConflict,
    PPC440MC7_MCMIReadData,
    PPC440MC7_MCMIReadDataValid,
    PPC440MC7_MCMIReadDataErr,
    PPC440MC7_MCMIAddrReadyToAccept,
    VFBC7_Cmd_Clk,
    VFBC7_Cmd_Reset,
    VFBC7_Cmd_Data,
    VFBC7_Cmd_Write,
    VFBC7_Cmd_End,
    VFBC7_Cmd_Full,
    VFBC7_Cmd_Almost_Full,
    VFBC7_Cmd_Idle,
    VFBC7_Wd_Clk,
    VFBC7_Wd_Reset,
    VFBC7_Wd_Write,
    VFBC7_Wd_End_Burst,
    VFBC7_Wd_Flush,
    VFBC7_Wd_Data,
    VFBC7_Wd_Data_BE,
    VFBC7_Wd_Full,
    VFBC7_Wd_Almost_Full,
    VFBC7_Rd_Clk,
    VFBC7_Rd_Reset,
    VFBC7_Rd_Read,
    VFBC7_Rd_End_Burst,
    VFBC7_Rd_Flush,
    VFBC7_Rd_Data,
    VFBC7_Rd_Empty,
    VFBC7_Rd_Almost_Empty,
    MCB7_cmd_clk,
    MCB7_cmd_en,
    MCB7_cmd_instr,
    MCB7_cmd_bl,
    MCB7_cmd_byte_addr,
    MCB7_cmd_empty,
    MCB7_cmd_full,
    MCB7_wr_clk,
    MCB7_wr_en,
    MCB7_wr_mask,
    MCB7_wr_data,
    MCB7_wr_full,
    MCB7_wr_empty,
    MCB7_wr_count,
    MCB7_wr_underrun,
    MCB7_wr_error,
    MCB7_rd_clk,
    MCB7_rd_en,
    MCB7_rd_data,
    MCB7_rd_full,
    MCB7_rd_empty,
    MCB7_rd_count,
    MCB7_rd_overflow,
    MCB7_rd_error,
    MPMC_CTRL_Clk,
    MPMC_CTRL_Rst,
    MPMC_CTRL_PLB_ABus,
    MPMC_CTRL_PLB_PAValid,
    MPMC_CTRL_PLB_SAValid,
    MPMC_CTRL_PLB_masterID,
    MPMC_CTRL_PLB_RNW,
    MPMC_CTRL_PLB_BE,
    MPMC_CTRL_PLB_UABus,
    MPMC_CTRL_PLB_rdPrim,
    MPMC_CTRL_PLB_wrPrim,
    MPMC_CTRL_PLB_abort,
    MPMC_CTRL_PLB_busLock,
    MPMC_CTRL_PLB_MSize,
    MPMC_CTRL_PLB_size,
    MPMC_CTRL_PLB_type,
    MPMC_CTRL_PLB_lockErr,
    MPMC_CTRL_PLB_wrPendReq,
    MPMC_CTRL_PLB_wrPendPri,
    MPMC_CTRL_PLB_rdPendReq,
    MPMC_CTRL_PLB_rdPendPri,
    MPMC_CTRL_PLB_reqPri,
    MPMC_CTRL_PLB_TAttribute,
    MPMC_CTRL_PLB_rdBurst,
    MPMC_CTRL_PLB_wrBurst,
    MPMC_CTRL_PLB_wrDBus,
    MPMC_CTRL_Sl_addrAck,
    MPMC_CTRL_Sl_SSize,
    MPMC_CTRL_Sl_wait,
    MPMC_CTRL_Sl_rearbitrate,
    MPMC_CTRL_Sl_wrDAck,
    MPMC_CTRL_Sl_wrComp,
    MPMC_CTRL_Sl_wrBTerm,
    MPMC_CTRL_Sl_rdDBus,
    MPMC_CTRL_Sl_rdWdAddr,
    MPMC_CTRL_Sl_rdDAck,
    MPMC_CTRL_Sl_rdComp,
    MPMC_CTRL_Sl_rdBTerm,
    MPMC_CTRL_Sl_MBusy,
    MPMC_CTRL_Sl_MRdErr,
    MPMC_CTRL_Sl_MWrErr,
    MPMC_CTRL_Sl_MIRQ,
    MPMC_Clk0,
    MPMC_Clk0_DIV2,
    MPMC_Clk90,
    MPMC_Clk_200MHz,
    MPMC_Rst,
    MPMC_Clk_Mem,
    MPMC_Clk_Mem_2x,
    MPMC_Clk_Mem_2x_180,
    MPMC_Clk_Mem_2x_CE0,
    MPMC_Clk_Mem_2x_CE90,
    MPMC_Clk_Rd_Base,
    MPMC_Clk_Mem_2x_bufpll_o,
    MPMC_Clk_Mem_2x_180_bufpll_o,
    MPMC_Clk_Mem_2x_CE0_bufpll_o,
    MPMC_Clk_Mem_2x_CE90_bufpll_o,
    MPMC_PLL_Lock_bufpll_o,
    MPMC_PLL_Lock,
    MPMC_Idelayctrl_Rdy_I,
    MPMC_Idelayctrl_Rdy_O,
    MPMC_InitDone,
    MPMC_ECC_Intr,
    MPMC_DCM_PSEN,
    MPMC_DCM_PSINCDEC,
    MPMC_DCM_PSDONE,
    MPMC_MCB_DRP_Clk,
    SDRAM_Clk,
    SDRAM_CE,
    SDRAM_CS_n,
    SDRAM_RAS_n,
    SDRAM_CAS_n,
    SDRAM_WE_n,
    SDRAM_BankAddr,
    SDRAM_Addr,
    SDRAM_DQ,
    SDRAM_DM,
    DDR_Clk,
    DDR_Clk_n,
    DDR_CE,
    DDR_CS_n,
    DDR_RAS_n,
    DDR_CAS_n,
    DDR_WE_n,
    DDR_BankAddr,
    DDR_Addr,
    DDR_DQ,
    DDR_DM,
    DDR_DQS,
    DDR_DQS_Div_O,
    DDR_DQS_Div_I,
    DDR2_Clk,
    DDR2_Clk_n,
    DDR2_CE,
    DDR2_CS_n,
    DDR2_ODT,
    DDR2_RAS_n,
    DDR2_CAS_n,
    DDR2_WE_n,
    DDR2_BankAddr,
    DDR2_Addr,
    DDR2_DQ,
    DDR2_DM,
    DDR2_DQS,
    DDR2_DQS_n,
    DDR2_DQS_Div_O,
    DDR2_DQS_Div_I,
    DDR3_Clk,
    DDR3_Clk_n,
    DDR3_CE,
    DDR3_CS_n,
    DDR3_ODT,
    DDR3_RAS_n,
    DDR3_CAS_n,
    DDR3_WE_n,
    DDR3_BankAddr,
    DDR3_Addr,
    DDR3_DQ,
    DDR3_DM,
    DDR3_Reset_n,
    DDR3_DQS,
    DDR3_DQS_n,
    mcbx_dram_addr,
    mcbx_dram_ba,
    mcbx_dram_ras_n,
    mcbx_dram_cas_n,
    mcbx_dram_we_n,
    mcbx_dram_cke,
    mcbx_dram_clk,
    mcbx_dram_clk_n,
    mcbx_dram_dq,
    mcbx_dram_dqs,
    mcbx_dram_dqs_n,
    mcbx_dram_udqs,
    mcbx_dram_udqs_n,
    mcbx_dram_udm,
    mcbx_dram_ldm,
    mcbx_dram_odt,
    mcbx_dram_ddr3_rst,
    selfrefresh_enter,
    selfrefresh_mode,
    calib_recal,
    rzq,
    zio
  );
  input FSL0_M_Clk;
  input FSL0_M_Write;
  input [0:31] FSL0_M_Data;
  input FSL0_M_Control;
  output FSL0_M_Full;
  input FSL0_S_Clk;
  input FSL0_S_Read;
  output [0:31] FSL0_S_Data;
  output FSL0_S_Control;
  output FSL0_S_Exists;
  input FSL0_B_M_Clk;
  input FSL0_B_M_Write;
  input [0:31] FSL0_B_M_Data;
  input FSL0_B_M_Control;
  output FSL0_B_M_Full;
  input FSL0_B_S_Clk;
  input FSL0_B_S_Read;
  output [0:31] FSL0_B_S_Data;
  output FSL0_B_S_Control;
  output FSL0_B_S_Exists;
  input SPLB0_Clk;
  input SPLB0_Rst;
  input [0:31] SPLB0_PLB_ABus;
  input SPLB0_PLB_PAValid;
  input SPLB0_PLB_SAValid;
  input [0:0] SPLB0_PLB_masterID;
  input SPLB0_PLB_RNW;
  input [0:7] SPLB0_PLB_BE;
  input [0:31] SPLB0_PLB_UABus;
  input SPLB0_PLB_rdPrim;
  input SPLB0_PLB_wrPrim;
  input SPLB0_PLB_abort;
  input SPLB0_PLB_busLock;
  input [0:1] SPLB0_PLB_MSize;
  input [0:3] SPLB0_PLB_size;
  input [0:2] SPLB0_PLB_type;
  input SPLB0_PLB_lockErr;
  input SPLB0_PLB_wrPendReq;
  input [0:1] SPLB0_PLB_wrPendPri;
  input SPLB0_PLB_rdPendReq;
  input [0:1] SPLB0_PLB_rdPendPri;
  input [0:1] SPLB0_PLB_reqPri;
  input [0:15] SPLB0_PLB_TAttribute;
  input SPLB0_PLB_rdBurst;
  input SPLB0_PLB_wrBurst;
  input [0:63] SPLB0_PLB_wrDBus;
  output SPLB0_Sl_addrAck;
  output [0:1] SPLB0_Sl_SSize;
  output SPLB0_Sl_wait;
  output SPLB0_Sl_rearbitrate;
  output SPLB0_Sl_wrDAck;
  output SPLB0_Sl_wrComp;
  output SPLB0_Sl_wrBTerm;
  output [0:63] SPLB0_Sl_rdDBus;
  output [0:3] SPLB0_Sl_rdWdAddr;
  output SPLB0_Sl_rdDAck;
  output SPLB0_Sl_rdComp;
  output SPLB0_Sl_rdBTerm;
  output [0:1] SPLB0_Sl_MBusy;
  output [0:1] SPLB0_Sl_MRdErr;
  output [0:1] SPLB0_Sl_MWrErr;
  output [0:1] SPLB0_Sl_MIRQ;
  input SDMA0_Clk;
  output SDMA0_Rx_IntOut;
  output SDMA0_Tx_IntOut;
  output SDMA0_RstOut;
  output [0:31] SDMA0_TX_D;
  output [0:3] SDMA0_TX_Rem;
  output SDMA0_TX_SOF;
  output SDMA0_TX_EOF;
  output SDMA0_TX_SOP;
  output SDMA0_TX_EOP;
  output SDMA0_TX_Src_Rdy;
  input SDMA0_TX_Dst_Rdy;
  input [0:31] SDMA0_RX_D;
  input [0:3] SDMA0_RX_Rem;
  input SDMA0_RX_SOF;
  input SDMA0_RX_EOF;
  input SDMA0_RX_SOP;
  input SDMA0_RX_EOP;
  input SDMA0_RX_Src_Rdy;
  output SDMA0_RX_Dst_Rdy;
  input SDMA_CTRL0_Clk;
  input SDMA_CTRL0_Rst;
  input [0:31] SDMA_CTRL0_PLB_ABus;
  input SDMA_CTRL0_PLB_PAValid;
  input SDMA_CTRL0_PLB_SAValid;
  input [0:0] SDMA_CTRL0_PLB_masterID;
  input SDMA_CTRL0_PLB_RNW;
  input [0:7] SDMA_CTRL0_PLB_BE;
  input [0:31] SDMA_CTRL0_PLB_UABus;
  input SDMA_CTRL0_PLB_rdPrim;
  input SDMA_CTRL0_PLB_wrPrim;
  input SDMA_CTRL0_PLB_abort;
  input SDMA_CTRL0_PLB_busLock;
  input [0:1] SDMA_CTRL0_PLB_MSize;
  input [0:3] SDMA_CTRL0_PLB_size;
  input [0:2] SDMA_CTRL0_PLB_type;
  input SDMA_CTRL0_PLB_lockErr;
  input SDMA_CTRL0_PLB_wrPendReq;
  input [0:1] SDMA_CTRL0_PLB_wrPendPri;
  input SDMA_CTRL0_PLB_rdPendReq;
  input [0:1] SDMA_CTRL0_PLB_rdPendPri;
  input [0:1] SDMA_CTRL0_PLB_reqPri;
  input [0:15] SDMA_CTRL0_PLB_TAttribute;
  input SDMA_CTRL0_PLB_rdBurst;
  input SDMA_CTRL0_PLB_wrBurst;
  input [0:63] SDMA_CTRL0_PLB_wrDBus;
  output SDMA_CTRL0_Sl_addrAck;
  output [0:1] SDMA_CTRL0_Sl_SSize;
  output SDMA_CTRL0_Sl_wait;
  output SDMA_CTRL0_Sl_rearbitrate;
  output SDMA_CTRL0_Sl_wrDAck;
  output SDMA_CTRL0_Sl_wrComp;
  output SDMA_CTRL0_Sl_wrBTerm;
  output [0:63] SDMA_CTRL0_Sl_rdDBus;
  output [0:3] SDMA_CTRL0_Sl_rdWdAddr;
  output SDMA_CTRL0_Sl_rdDAck;
  output SDMA_CTRL0_Sl_rdComp;
  output SDMA_CTRL0_Sl_rdBTerm;
  output [0:0] SDMA_CTRL0_Sl_MBusy;
  output [0:0] SDMA_CTRL0_Sl_MRdErr;
  output [0:0] SDMA_CTRL0_Sl_MWrErr;
  output [0:0] SDMA_CTRL0_Sl_MIRQ;
  input [31:0] PIM0_Addr;
  input PIM0_AddrReq;
  output PIM0_AddrAck;
  input PIM0_RNW;
  input [3:0] PIM0_Size;
  input PIM0_RdModWr;
  input [63:0] PIM0_WrFIFO_Data;
  input [7:0] PIM0_WrFIFO_BE;
  input PIM0_WrFIFO_Push;
  output [63:0] PIM0_RdFIFO_Data;
  input PIM0_RdFIFO_Pop;
  output [3:0] PIM0_RdFIFO_RdWdAddr;
  output PIM0_WrFIFO_Empty;
  output PIM0_WrFIFO_AlmostFull;
  input PIM0_WrFIFO_Flush;
  output PIM0_RdFIFO_Empty;
  input PIM0_RdFIFO_Flush;
  output [1:0] PIM0_RdFIFO_Latency;
  output PIM0_InitDone;
  input PPC440MC0_MIMCReadNotWrite;
  input [0:35] PPC440MC0_MIMCAddress;
  input PPC440MC0_MIMCAddressValid;
  input [0:127] PPC440MC0_MIMCWriteData;
  input PPC440MC0_MIMCWriteDataValid;
  input [0:15] PPC440MC0_MIMCByteEnable;
  input PPC440MC0_MIMCBankConflict;
  input PPC440MC0_MIMCRowConflict;
  output [0:127] PPC440MC0_MCMIReadData;
  output PPC440MC0_MCMIReadDataValid;
  output PPC440MC0_MCMIReadDataErr;
  output PPC440MC0_MCMIAddrReadyToAccept;
  input VFBC0_Cmd_Clk;
  input VFBC0_Cmd_Reset;
  input [31:0] VFBC0_Cmd_Data;
  input VFBC0_Cmd_Write;
  input VFBC0_Cmd_End;
  output VFBC0_Cmd_Full;
  output VFBC0_Cmd_Almost_Full;
  output VFBC0_Cmd_Idle;
  input VFBC0_Wd_Clk;
  input VFBC0_Wd_Reset;
  input VFBC0_Wd_Write;
  input VFBC0_Wd_End_Burst;
  input VFBC0_Wd_Flush;
  input [31:0] VFBC0_Wd_Data;
  input [3:0] VFBC0_Wd_Data_BE;
  output VFBC0_Wd_Full;
  output VFBC0_Wd_Almost_Full;
  input VFBC0_Rd_Clk;
  input VFBC0_Rd_Reset;
  input VFBC0_Rd_Read;
  input VFBC0_Rd_End_Burst;
  input VFBC0_Rd_Flush;
  output [31:0] VFBC0_Rd_Data;
  output VFBC0_Rd_Empty;
  output VFBC0_Rd_Almost_Empty;
  input MCB0_cmd_clk;
  input MCB0_cmd_en;
  input [2:0] MCB0_cmd_instr;
  input [5:0] MCB0_cmd_bl;
  input [29:0] MCB0_cmd_byte_addr;
  output MCB0_cmd_empty;
  output MCB0_cmd_full;
  input MCB0_wr_clk;
  input MCB0_wr_en;
  input [7:0] MCB0_wr_mask;
  input [63:0] MCB0_wr_data;
  output MCB0_wr_full;
  output MCB0_wr_empty;
  output [6:0] MCB0_wr_count;
  output MCB0_wr_underrun;
  output MCB0_wr_error;
  input MCB0_rd_clk;
  input MCB0_rd_en;
  output [63:0] MCB0_rd_data;
  output MCB0_rd_full;
  output MCB0_rd_empty;
  output [6:0] MCB0_rd_count;
  output MCB0_rd_overflow;
  output MCB0_rd_error;
  input FSL1_M_Clk;
  input FSL1_M_Write;
  input [0:31] FSL1_M_Data;
  input FSL1_M_Control;
  output FSL1_M_Full;
  input FSL1_S_Clk;
  input FSL1_S_Read;
  output [0:31] FSL1_S_Data;
  output FSL1_S_Control;
  output FSL1_S_Exists;
  input FSL1_B_M_Clk;
  input FSL1_B_M_Write;
  input [0:31] FSL1_B_M_Data;
  input FSL1_B_M_Control;
  output FSL1_B_M_Full;
  input FSL1_B_S_Clk;
  input FSL1_B_S_Read;
  output [0:31] FSL1_B_S_Data;
  output FSL1_B_S_Control;
  output FSL1_B_S_Exists;
  input SPLB1_Clk;
  input SPLB1_Rst;
  input [0:31] SPLB1_PLB_ABus;
  input SPLB1_PLB_PAValid;
  input SPLB1_PLB_SAValid;
  input [0:0] SPLB1_PLB_masterID;
  input SPLB1_PLB_RNW;
  input [0:7] SPLB1_PLB_BE;
  input [0:31] SPLB1_PLB_UABus;
  input SPLB1_PLB_rdPrim;
  input SPLB1_PLB_wrPrim;
  input SPLB1_PLB_abort;
  input SPLB1_PLB_busLock;
  input [0:1] SPLB1_PLB_MSize;
  input [0:3] SPLB1_PLB_size;
  input [0:2] SPLB1_PLB_type;
  input SPLB1_PLB_lockErr;
  input SPLB1_PLB_wrPendReq;
  input [0:1] SPLB1_PLB_wrPendPri;
  input SPLB1_PLB_rdPendReq;
  input [0:1] SPLB1_PLB_rdPendPri;
  input [0:1] SPLB1_PLB_reqPri;
  input [0:15] SPLB1_PLB_TAttribute;
  input SPLB1_PLB_rdBurst;
  input SPLB1_PLB_wrBurst;
  input [0:63] SPLB1_PLB_wrDBus;
  output SPLB1_Sl_addrAck;
  output [0:1] SPLB1_Sl_SSize;
  output SPLB1_Sl_wait;
  output SPLB1_Sl_rearbitrate;
  output SPLB1_Sl_wrDAck;
  output SPLB1_Sl_wrComp;
  output SPLB1_Sl_wrBTerm;
  output [0:63] SPLB1_Sl_rdDBus;
  output [0:3] SPLB1_Sl_rdWdAddr;
  output SPLB1_Sl_rdDAck;
  output SPLB1_Sl_rdComp;
  output SPLB1_Sl_rdBTerm;
  output [0:0] SPLB1_Sl_MBusy;
  output [0:0] SPLB1_Sl_MRdErr;
  output [0:0] SPLB1_Sl_MWrErr;
  output [0:0] SPLB1_Sl_MIRQ;
  input SDMA1_Clk;
  output SDMA1_Rx_IntOut;
  output SDMA1_Tx_IntOut;
  output SDMA1_RstOut;
  output [0:31] SDMA1_TX_D;
  output [0:3] SDMA1_TX_Rem;
  output SDMA1_TX_SOF;
  output SDMA1_TX_EOF;
  output SDMA1_TX_SOP;
  output SDMA1_TX_EOP;
  output SDMA1_TX_Src_Rdy;
  input SDMA1_TX_Dst_Rdy;
  input [0:31] SDMA1_RX_D;
  input [0:3] SDMA1_RX_Rem;
  input SDMA1_RX_SOF;
  input SDMA1_RX_EOF;
  input SDMA1_RX_SOP;
  input SDMA1_RX_EOP;
  input SDMA1_RX_Src_Rdy;
  output SDMA1_RX_Dst_Rdy;
  input SDMA_CTRL1_Clk;
  input SDMA_CTRL1_Rst;
  input [0:31] SDMA_CTRL1_PLB_ABus;
  input SDMA_CTRL1_PLB_PAValid;
  input SDMA_CTRL1_PLB_SAValid;
  input [0:0] SDMA_CTRL1_PLB_masterID;
  input SDMA_CTRL1_PLB_RNW;
  input [0:7] SDMA_CTRL1_PLB_BE;
  input [0:31] SDMA_CTRL1_PLB_UABus;
  input SDMA_CTRL1_PLB_rdPrim;
  input SDMA_CTRL1_PLB_wrPrim;
  input SDMA_CTRL1_PLB_abort;
  input SDMA_CTRL1_PLB_busLock;
  input [0:1] SDMA_CTRL1_PLB_MSize;
  input [0:3] SDMA_CTRL1_PLB_size;
  input [0:2] SDMA_CTRL1_PLB_type;
  input SDMA_CTRL1_PLB_lockErr;
  input SDMA_CTRL1_PLB_wrPendReq;
  input [0:1] SDMA_CTRL1_PLB_wrPendPri;
  input SDMA_CTRL1_PLB_rdPendReq;
  input [0:1] SDMA_CTRL1_PLB_rdPendPri;
  input [0:1] SDMA_CTRL1_PLB_reqPri;
  input [0:15] SDMA_CTRL1_PLB_TAttribute;
  input SDMA_CTRL1_PLB_rdBurst;
  input SDMA_CTRL1_PLB_wrBurst;
  input [0:63] SDMA_CTRL1_PLB_wrDBus;
  output SDMA_CTRL1_Sl_addrAck;
  output [0:1] SDMA_CTRL1_Sl_SSize;
  output SDMA_CTRL1_Sl_wait;
  output SDMA_CTRL1_Sl_rearbitrate;
  output SDMA_CTRL1_Sl_wrDAck;
  output SDMA_CTRL1_Sl_wrComp;
  output SDMA_CTRL1_Sl_wrBTerm;
  output [0:63] SDMA_CTRL1_Sl_rdDBus;
  output [0:3] SDMA_CTRL1_Sl_rdWdAddr;
  output SDMA_CTRL1_Sl_rdDAck;
  output SDMA_CTRL1_Sl_rdComp;
  output SDMA_CTRL1_Sl_rdBTerm;
  output [0:0] SDMA_CTRL1_Sl_MBusy;
  output [0:0] SDMA_CTRL1_Sl_MRdErr;
  output [0:0] SDMA_CTRL1_Sl_MWrErr;
  output [0:0] SDMA_CTRL1_Sl_MIRQ;
  input [31:0] PIM1_Addr;
  input PIM1_AddrReq;
  output PIM1_AddrAck;
  input PIM1_RNW;
  input [3:0] PIM1_Size;
  input PIM1_RdModWr;
  input [63:0] PIM1_WrFIFO_Data;
  input [7:0] PIM1_WrFIFO_BE;
  input PIM1_WrFIFO_Push;
  output [63:0] PIM1_RdFIFO_Data;
  input PIM1_RdFIFO_Pop;
  output [3:0] PIM1_RdFIFO_RdWdAddr;
  output PIM1_WrFIFO_Empty;
  output PIM1_WrFIFO_AlmostFull;
  input PIM1_WrFIFO_Flush;
  output PIM1_RdFIFO_Empty;
  input PIM1_RdFIFO_Flush;
  output [1:0] PIM1_RdFIFO_Latency;
  output PIM1_InitDone;
  input PPC440MC1_MIMCReadNotWrite;
  input [0:35] PPC440MC1_MIMCAddress;
  input PPC440MC1_MIMCAddressValid;
  input [0:127] PPC440MC1_MIMCWriteData;
  input PPC440MC1_MIMCWriteDataValid;
  input [0:15] PPC440MC1_MIMCByteEnable;
  input PPC440MC1_MIMCBankConflict;
  input PPC440MC1_MIMCRowConflict;
  output [0:127] PPC440MC1_MCMIReadData;
  output PPC440MC1_MCMIReadDataValid;
  output PPC440MC1_MCMIReadDataErr;
  output PPC440MC1_MCMIAddrReadyToAccept;
  input VFBC1_Cmd_Clk;
  input VFBC1_Cmd_Reset;
  input [31:0] VFBC1_Cmd_Data;
  input VFBC1_Cmd_Write;
  input VFBC1_Cmd_End;
  output VFBC1_Cmd_Full;
  output VFBC1_Cmd_Almost_Full;
  output VFBC1_Cmd_Idle;
  input VFBC1_Wd_Clk;
  input VFBC1_Wd_Reset;
  input VFBC1_Wd_Write;
  input VFBC1_Wd_End_Burst;
  input VFBC1_Wd_Flush;
  input [31:0] VFBC1_Wd_Data;
  input [3:0] VFBC1_Wd_Data_BE;
  output VFBC1_Wd_Full;
  output VFBC1_Wd_Almost_Full;
  input VFBC1_Rd_Clk;
  input VFBC1_Rd_Reset;
  input VFBC1_Rd_Read;
  input VFBC1_Rd_End_Burst;
  input VFBC1_Rd_Flush;
  output [31:0] VFBC1_Rd_Data;
  output VFBC1_Rd_Empty;
  output VFBC1_Rd_Almost_Empty;
  input MCB1_cmd_clk;
  input MCB1_cmd_en;
  input [2:0] MCB1_cmd_instr;
  input [5:0] MCB1_cmd_bl;
  input [29:0] MCB1_cmd_byte_addr;
  output MCB1_cmd_empty;
  output MCB1_cmd_full;
  input MCB1_wr_clk;
  input MCB1_wr_en;
  input [7:0] MCB1_wr_mask;
  input [63:0] MCB1_wr_data;
  output MCB1_wr_full;
  output MCB1_wr_empty;
  output [6:0] MCB1_wr_count;
  output MCB1_wr_underrun;
  output MCB1_wr_error;
  input MCB1_rd_clk;
  input MCB1_rd_en;
  output [63:0] MCB1_rd_data;
  output MCB1_rd_full;
  output MCB1_rd_empty;
  output [6:0] MCB1_rd_count;
  output MCB1_rd_overflow;
  output MCB1_rd_error;
  input FSL2_M_Clk;
  input FSL2_M_Write;
  input [0:31] FSL2_M_Data;
  input FSL2_M_Control;
  output FSL2_M_Full;
  input FSL2_S_Clk;
  input FSL2_S_Read;
  output [0:31] FSL2_S_Data;
  output FSL2_S_Control;
  output FSL2_S_Exists;
  input FSL2_B_M_Clk;
  input FSL2_B_M_Write;
  input [0:31] FSL2_B_M_Data;
  input FSL2_B_M_Control;
  output FSL2_B_M_Full;
  input FSL2_B_S_Clk;
  input FSL2_B_S_Read;
  output [0:31] FSL2_B_S_Data;
  output FSL2_B_S_Control;
  output FSL2_B_S_Exists;
  input SPLB2_Clk;
  input SPLB2_Rst;
  input [0:31] SPLB2_PLB_ABus;
  input SPLB2_PLB_PAValid;
  input SPLB2_PLB_SAValid;
  input [0:0] SPLB2_PLB_masterID;
  input SPLB2_PLB_RNW;
  input [0:7] SPLB2_PLB_BE;
  input [0:31] SPLB2_PLB_UABus;
  input SPLB2_PLB_rdPrim;
  input SPLB2_PLB_wrPrim;
  input SPLB2_PLB_abort;
  input SPLB2_PLB_busLock;
  input [0:1] SPLB2_PLB_MSize;
  input [0:3] SPLB2_PLB_size;
  input [0:2] SPLB2_PLB_type;
  input SPLB2_PLB_lockErr;
  input SPLB2_PLB_wrPendReq;
  input [0:1] SPLB2_PLB_wrPendPri;
  input SPLB2_PLB_rdPendReq;
  input [0:1] SPLB2_PLB_rdPendPri;
  input [0:1] SPLB2_PLB_reqPri;
  input [0:15] SPLB2_PLB_TAttribute;
  input SPLB2_PLB_rdBurst;
  input SPLB2_PLB_wrBurst;
  input [0:63] SPLB2_PLB_wrDBus;
  output SPLB2_Sl_addrAck;
  output [0:1] SPLB2_Sl_SSize;
  output SPLB2_Sl_wait;
  output SPLB2_Sl_rearbitrate;
  output SPLB2_Sl_wrDAck;
  output SPLB2_Sl_wrComp;
  output SPLB2_Sl_wrBTerm;
  output [0:63] SPLB2_Sl_rdDBus;
  output [0:3] SPLB2_Sl_rdWdAddr;
  output SPLB2_Sl_rdDAck;
  output SPLB2_Sl_rdComp;
  output SPLB2_Sl_rdBTerm;
  output [0:0] SPLB2_Sl_MBusy;
  output [0:0] SPLB2_Sl_MRdErr;
  output [0:0] SPLB2_Sl_MWrErr;
  output [0:0] SPLB2_Sl_MIRQ;
  input SDMA2_Clk;
  output SDMA2_Rx_IntOut;
  output SDMA2_Tx_IntOut;
  output SDMA2_RstOut;
  output [0:31] SDMA2_TX_D;
  output [0:3] SDMA2_TX_Rem;
  output SDMA2_TX_SOF;
  output SDMA2_TX_EOF;
  output SDMA2_TX_SOP;
  output SDMA2_TX_EOP;
  output SDMA2_TX_Src_Rdy;
  input SDMA2_TX_Dst_Rdy;
  input [0:31] SDMA2_RX_D;
  input [0:3] SDMA2_RX_Rem;
  input SDMA2_RX_SOF;
  input SDMA2_RX_EOF;
  input SDMA2_RX_SOP;
  input SDMA2_RX_EOP;
  input SDMA2_RX_Src_Rdy;
  output SDMA2_RX_Dst_Rdy;
  input SDMA_CTRL2_Clk;
  input SDMA_CTRL2_Rst;
  input [0:31] SDMA_CTRL2_PLB_ABus;
  input SDMA_CTRL2_PLB_PAValid;
  input SDMA_CTRL2_PLB_SAValid;
  input [0:0] SDMA_CTRL2_PLB_masterID;
  input SDMA_CTRL2_PLB_RNW;
  input [0:7] SDMA_CTRL2_PLB_BE;
  input [0:31] SDMA_CTRL2_PLB_UABus;
  input SDMA_CTRL2_PLB_rdPrim;
  input SDMA_CTRL2_PLB_wrPrim;
  input SDMA_CTRL2_PLB_abort;
  input SDMA_CTRL2_PLB_busLock;
  input [0:1] SDMA_CTRL2_PLB_MSize;
  input [0:3] SDMA_CTRL2_PLB_size;
  input [0:2] SDMA_CTRL2_PLB_type;
  input SDMA_CTRL2_PLB_lockErr;
  input SDMA_CTRL2_PLB_wrPendReq;
  input [0:1] SDMA_CTRL2_PLB_wrPendPri;
  input SDMA_CTRL2_PLB_rdPendReq;
  input [0:1] SDMA_CTRL2_PLB_rdPendPri;
  input [0:1] SDMA_CTRL2_PLB_reqPri;
  input [0:15] SDMA_CTRL2_PLB_TAttribute;
  input SDMA_CTRL2_PLB_rdBurst;
  input SDMA_CTRL2_PLB_wrBurst;
  input [0:63] SDMA_CTRL2_PLB_wrDBus;
  output SDMA_CTRL2_Sl_addrAck;
  output [0:1] SDMA_CTRL2_Sl_SSize;
  output SDMA_CTRL2_Sl_wait;
  output SDMA_CTRL2_Sl_rearbitrate;
  output SDMA_CTRL2_Sl_wrDAck;
  output SDMA_CTRL2_Sl_wrComp;
  output SDMA_CTRL2_Sl_wrBTerm;
  output [0:63] SDMA_CTRL2_Sl_rdDBus;
  output [0:3] SDMA_CTRL2_Sl_rdWdAddr;
  output SDMA_CTRL2_Sl_rdDAck;
  output SDMA_CTRL2_Sl_rdComp;
  output SDMA_CTRL2_Sl_rdBTerm;
  output [0:0] SDMA_CTRL2_Sl_MBusy;
  output [0:0] SDMA_CTRL2_Sl_MRdErr;
  output [0:0] SDMA_CTRL2_Sl_MWrErr;
  output [0:0] SDMA_CTRL2_Sl_MIRQ;
  input [31:0] PIM2_Addr;
  input PIM2_AddrReq;
  output PIM2_AddrAck;
  input PIM2_RNW;
  input [3:0] PIM2_Size;
  input PIM2_RdModWr;
  input [63:0] PIM2_WrFIFO_Data;
  input [7:0] PIM2_WrFIFO_BE;
  input PIM2_WrFIFO_Push;
  output [63:0] PIM2_RdFIFO_Data;
  input PIM2_RdFIFO_Pop;
  output [3:0] PIM2_RdFIFO_RdWdAddr;
  output PIM2_WrFIFO_Empty;
  output PIM2_WrFIFO_AlmostFull;
  input PIM2_WrFIFO_Flush;
  output PIM2_RdFIFO_Empty;
  input PIM2_RdFIFO_Flush;
  output [1:0] PIM2_RdFIFO_Latency;
  output PIM2_InitDone;
  input PPC440MC2_MIMCReadNotWrite;
  input [0:35] PPC440MC2_MIMCAddress;
  input PPC440MC2_MIMCAddressValid;
  input [0:127] PPC440MC2_MIMCWriteData;
  input PPC440MC2_MIMCWriteDataValid;
  input [0:15] PPC440MC2_MIMCByteEnable;
  input PPC440MC2_MIMCBankConflict;
  input PPC440MC2_MIMCRowConflict;
  output [0:127] PPC440MC2_MCMIReadData;
  output PPC440MC2_MCMIReadDataValid;
  output PPC440MC2_MCMIReadDataErr;
  output PPC440MC2_MCMIAddrReadyToAccept;
  input VFBC2_Cmd_Clk;
  input VFBC2_Cmd_Reset;
  input [31:0] VFBC2_Cmd_Data;
  input VFBC2_Cmd_Write;
  input VFBC2_Cmd_End;
  output VFBC2_Cmd_Full;
  output VFBC2_Cmd_Almost_Full;
  output VFBC2_Cmd_Idle;
  input VFBC2_Wd_Clk;
  input VFBC2_Wd_Reset;
  input VFBC2_Wd_Write;
  input VFBC2_Wd_End_Burst;
  input VFBC2_Wd_Flush;
  input [31:0] VFBC2_Wd_Data;
  input [3:0] VFBC2_Wd_Data_BE;
  output VFBC2_Wd_Full;
  output VFBC2_Wd_Almost_Full;
  input VFBC2_Rd_Clk;
  input VFBC2_Rd_Reset;
  input VFBC2_Rd_Read;
  input VFBC2_Rd_End_Burst;
  input VFBC2_Rd_Flush;
  output [31:0] VFBC2_Rd_Data;
  output VFBC2_Rd_Empty;
  output VFBC2_Rd_Almost_Empty;
  input MCB2_cmd_clk;
  input MCB2_cmd_en;
  input [2:0] MCB2_cmd_instr;
  input [5:0] MCB2_cmd_bl;
  input [29:0] MCB2_cmd_byte_addr;
  output MCB2_cmd_empty;
  output MCB2_cmd_full;
  input MCB2_wr_clk;
  input MCB2_wr_en;
  input [7:0] MCB2_wr_mask;
  input [63:0] MCB2_wr_data;
  output MCB2_wr_full;
  output MCB2_wr_empty;
  output [6:0] MCB2_wr_count;
  output MCB2_wr_underrun;
  output MCB2_wr_error;
  input MCB2_rd_clk;
  input MCB2_rd_en;
  output [63:0] MCB2_rd_data;
  output MCB2_rd_full;
  output MCB2_rd_empty;
  output [6:0] MCB2_rd_count;
  output MCB2_rd_overflow;
  output MCB2_rd_error;
  input FSL3_M_Clk;
  input FSL3_M_Write;
  input [0:31] FSL3_M_Data;
  input FSL3_M_Control;
  output FSL3_M_Full;
  input FSL3_S_Clk;
  input FSL3_S_Read;
  output [0:31] FSL3_S_Data;
  output FSL3_S_Control;
  output FSL3_S_Exists;
  input FSL3_B_M_Clk;
  input FSL3_B_M_Write;
  input [0:31] FSL3_B_M_Data;
  input FSL3_B_M_Control;
  output FSL3_B_M_Full;
  input FSL3_B_S_Clk;
  input FSL3_B_S_Read;
  output [0:31] FSL3_B_S_Data;
  output FSL3_B_S_Control;
  output FSL3_B_S_Exists;
  input SPLB3_Clk;
  input SPLB3_Rst;
  input [0:31] SPLB3_PLB_ABus;
  input SPLB3_PLB_PAValid;
  input SPLB3_PLB_SAValid;
  input [0:0] SPLB3_PLB_masterID;
  input SPLB3_PLB_RNW;
  input [0:7] SPLB3_PLB_BE;
  input [0:31] SPLB3_PLB_UABus;
  input SPLB3_PLB_rdPrim;
  input SPLB3_PLB_wrPrim;
  input SPLB3_PLB_abort;
  input SPLB3_PLB_busLock;
  input [0:1] SPLB3_PLB_MSize;
  input [0:3] SPLB3_PLB_size;
  input [0:2] SPLB3_PLB_type;
  input SPLB3_PLB_lockErr;
  input SPLB3_PLB_wrPendReq;
  input [0:1] SPLB3_PLB_wrPendPri;
  input SPLB3_PLB_rdPendReq;
  input [0:1] SPLB3_PLB_rdPendPri;
  input [0:1] SPLB3_PLB_reqPri;
  input [0:15] SPLB3_PLB_TAttribute;
  input SPLB3_PLB_rdBurst;
  input SPLB3_PLB_wrBurst;
  input [0:63] SPLB3_PLB_wrDBus;
  output SPLB3_Sl_addrAck;
  output [0:1] SPLB3_Sl_SSize;
  output SPLB3_Sl_wait;
  output SPLB3_Sl_rearbitrate;
  output SPLB3_Sl_wrDAck;
  output SPLB3_Sl_wrComp;
  output SPLB3_Sl_wrBTerm;
  output [0:63] SPLB3_Sl_rdDBus;
  output [0:3] SPLB3_Sl_rdWdAddr;
  output SPLB3_Sl_rdDAck;
  output SPLB3_Sl_rdComp;
  output SPLB3_Sl_rdBTerm;
  output [0:0] SPLB3_Sl_MBusy;
  output [0:0] SPLB3_Sl_MRdErr;
  output [0:0] SPLB3_Sl_MWrErr;
  output [0:0] SPLB3_Sl_MIRQ;
  input SDMA3_Clk;
  output SDMA3_Rx_IntOut;
  output SDMA3_Tx_IntOut;
  output SDMA3_RstOut;
  output [0:31] SDMA3_TX_D;
  output [0:3] SDMA3_TX_Rem;
  output SDMA3_TX_SOF;
  output SDMA3_TX_EOF;
  output SDMA3_TX_SOP;
  output SDMA3_TX_EOP;
  output SDMA3_TX_Src_Rdy;
  input SDMA3_TX_Dst_Rdy;
  input [0:31] SDMA3_RX_D;
  input [0:3] SDMA3_RX_Rem;
  input SDMA3_RX_SOF;
  input SDMA3_RX_EOF;
  input SDMA3_RX_SOP;
  input SDMA3_RX_EOP;
  input SDMA3_RX_Src_Rdy;
  output SDMA3_RX_Dst_Rdy;
  input SDMA_CTRL3_Clk;
  input SDMA_CTRL3_Rst;
  input [0:31] SDMA_CTRL3_PLB_ABus;
  input SDMA_CTRL3_PLB_PAValid;
  input SDMA_CTRL3_PLB_SAValid;
  input [0:0] SDMA_CTRL3_PLB_masterID;
  input SDMA_CTRL3_PLB_RNW;
  input [0:7] SDMA_CTRL3_PLB_BE;
  input [0:31] SDMA_CTRL3_PLB_UABus;
  input SDMA_CTRL3_PLB_rdPrim;
  input SDMA_CTRL3_PLB_wrPrim;
  input SDMA_CTRL3_PLB_abort;
  input SDMA_CTRL3_PLB_busLock;
  input [0:1] SDMA_CTRL3_PLB_MSize;
  input [0:3] SDMA_CTRL3_PLB_size;
  input [0:2] SDMA_CTRL3_PLB_type;
  input SDMA_CTRL3_PLB_lockErr;
  input SDMA_CTRL3_PLB_wrPendReq;
  input [0:1] SDMA_CTRL3_PLB_wrPendPri;
  input SDMA_CTRL3_PLB_rdPendReq;
  input [0:1] SDMA_CTRL3_PLB_rdPendPri;
  input [0:1] SDMA_CTRL3_PLB_reqPri;
  input [0:15] SDMA_CTRL3_PLB_TAttribute;
  input SDMA_CTRL3_PLB_rdBurst;
  input SDMA_CTRL3_PLB_wrBurst;
  input [0:63] SDMA_CTRL3_PLB_wrDBus;
  output SDMA_CTRL3_Sl_addrAck;
  output [0:1] SDMA_CTRL3_Sl_SSize;
  output SDMA_CTRL3_Sl_wait;
  output SDMA_CTRL3_Sl_rearbitrate;
  output SDMA_CTRL3_Sl_wrDAck;
  output SDMA_CTRL3_Sl_wrComp;
  output SDMA_CTRL3_Sl_wrBTerm;
  output [0:63] SDMA_CTRL3_Sl_rdDBus;
  output [0:3] SDMA_CTRL3_Sl_rdWdAddr;
  output SDMA_CTRL3_Sl_rdDAck;
  output SDMA_CTRL3_Sl_rdComp;
  output SDMA_CTRL3_Sl_rdBTerm;
  output [0:0] SDMA_CTRL3_Sl_MBusy;
  output [0:0] SDMA_CTRL3_Sl_MRdErr;
  output [0:0] SDMA_CTRL3_Sl_MWrErr;
  output [0:0] SDMA_CTRL3_Sl_MIRQ;
  input [31:0] PIM3_Addr;
  input PIM3_AddrReq;
  output PIM3_AddrAck;
  input PIM3_RNW;
  input [3:0] PIM3_Size;
  input PIM3_RdModWr;
  input [63:0] PIM3_WrFIFO_Data;
  input [7:0] PIM3_WrFIFO_BE;
  input PIM3_WrFIFO_Push;
  output [63:0] PIM3_RdFIFO_Data;
  input PIM3_RdFIFO_Pop;
  output [3:0] PIM3_RdFIFO_RdWdAddr;
  output PIM3_WrFIFO_Empty;
  output PIM3_WrFIFO_AlmostFull;
  input PIM3_WrFIFO_Flush;
  output PIM3_RdFIFO_Empty;
  input PIM3_RdFIFO_Flush;
  output [1:0] PIM3_RdFIFO_Latency;
  output PIM3_InitDone;
  input PPC440MC3_MIMCReadNotWrite;
  input [0:35] PPC440MC3_MIMCAddress;
  input PPC440MC3_MIMCAddressValid;
  input [0:127] PPC440MC3_MIMCWriteData;
  input PPC440MC3_MIMCWriteDataValid;
  input [0:15] PPC440MC3_MIMCByteEnable;
  input PPC440MC3_MIMCBankConflict;
  input PPC440MC3_MIMCRowConflict;
  output [0:127] PPC440MC3_MCMIReadData;
  output PPC440MC3_MCMIReadDataValid;
  output PPC440MC3_MCMIReadDataErr;
  output PPC440MC3_MCMIAddrReadyToAccept;
  input VFBC3_Cmd_Clk;
  input VFBC3_Cmd_Reset;
  input [31:0] VFBC3_Cmd_Data;
  input VFBC3_Cmd_Write;
  input VFBC3_Cmd_End;
  output VFBC3_Cmd_Full;
  output VFBC3_Cmd_Almost_Full;
  output VFBC3_Cmd_Idle;
  input VFBC3_Wd_Clk;
  input VFBC3_Wd_Reset;
  input VFBC3_Wd_Write;
  input VFBC3_Wd_End_Burst;
  input VFBC3_Wd_Flush;
  input [31:0] VFBC3_Wd_Data;
  input [3:0] VFBC3_Wd_Data_BE;
  output VFBC3_Wd_Full;
  output VFBC3_Wd_Almost_Full;
  input VFBC3_Rd_Clk;
  input VFBC3_Rd_Reset;
  input VFBC3_Rd_Read;
  input VFBC3_Rd_End_Burst;
  input VFBC3_Rd_Flush;
  output [31:0] VFBC3_Rd_Data;
  output VFBC3_Rd_Empty;
  output VFBC3_Rd_Almost_Empty;
  input MCB3_cmd_clk;
  input MCB3_cmd_en;
  input [2:0] MCB3_cmd_instr;
  input [5:0] MCB3_cmd_bl;
  input [29:0] MCB3_cmd_byte_addr;
  output MCB3_cmd_empty;
  output MCB3_cmd_full;
  input MCB3_wr_clk;
  input MCB3_wr_en;
  input [7:0] MCB3_wr_mask;
  input [63:0] MCB3_wr_data;
  output MCB3_wr_full;
  output MCB3_wr_empty;
  output [6:0] MCB3_wr_count;
  output MCB3_wr_underrun;
  output MCB3_wr_error;
  input MCB3_rd_clk;
  input MCB3_rd_en;
  output [63:0] MCB3_rd_data;
  output MCB3_rd_full;
  output MCB3_rd_empty;
  output [6:0] MCB3_rd_count;
  output MCB3_rd_overflow;
  output MCB3_rd_error;
  input FSL4_M_Clk;
  input FSL4_M_Write;
  input [0:31] FSL4_M_Data;
  input FSL4_M_Control;
  output FSL4_M_Full;
  input FSL4_S_Clk;
  input FSL4_S_Read;
  output [0:31] FSL4_S_Data;
  output FSL4_S_Control;
  output FSL4_S_Exists;
  input FSL4_B_M_Clk;
  input FSL4_B_M_Write;
  input [0:31] FSL4_B_M_Data;
  input FSL4_B_M_Control;
  output FSL4_B_M_Full;
  input FSL4_B_S_Clk;
  input FSL4_B_S_Read;
  output [0:31] FSL4_B_S_Data;
  output FSL4_B_S_Control;
  output FSL4_B_S_Exists;
  input SPLB4_Clk;
  input SPLB4_Rst;
  input [0:31] SPLB4_PLB_ABus;
  input SPLB4_PLB_PAValid;
  input SPLB4_PLB_SAValid;
  input [0:0] SPLB4_PLB_masterID;
  input SPLB4_PLB_RNW;
  input [0:7] SPLB4_PLB_BE;
  input [0:31] SPLB4_PLB_UABus;
  input SPLB4_PLB_rdPrim;
  input SPLB4_PLB_wrPrim;
  input SPLB4_PLB_abort;
  input SPLB4_PLB_busLock;
  input [0:1] SPLB4_PLB_MSize;
  input [0:3] SPLB4_PLB_size;
  input [0:2] SPLB4_PLB_type;
  input SPLB4_PLB_lockErr;
  input SPLB4_PLB_wrPendReq;
  input [0:1] SPLB4_PLB_wrPendPri;
  input SPLB4_PLB_rdPendReq;
  input [0:1] SPLB4_PLB_rdPendPri;
  input [0:1] SPLB4_PLB_reqPri;
  input [0:15] SPLB4_PLB_TAttribute;
  input SPLB4_PLB_rdBurst;
  input SPLB4_PLB_wrBurst;
  input [0:63] SPLB4_PLB_wrDBus;
  output SPLB4_Sl_addrAck;
  output [0:1] SPLB4_Sl_SSize;
  output SPLB4_Sl_wait;
  output SPLB4_Sl_rearbitrate;
  output SPLB4_Sl_wrDAck;
  output SPLB4_Sl_wrComp;
  output SPLB4_Sl_wrBTerm;
  output [0:63] SPLB4_Sl_rdDBus;
  output [0:3] SPLB4_Sl_rdWdAddr;
  output SPLB4_Sl_rdDAck;
  output SPLB4_Sl_rdComp;
  output SPLB4_Sl_rdBTerm;
  output [0:0] SPLB4_Sl_MBusy;
  output [0:0] SPLB4_Sl_MRdErr;
  output [0:0] SPLB4_Sl_MWrErr;
  output [0:0] SPLB4_Sl_MIRQ;
  input SDMA4_Clk;
  output SDMA4_Rx_IntOut;
  output SDMA4_Tx_IntOut;
  output SDMA4_RstOut;
  output [0:31] SDMA4_TX_D;
  output [0:3] SDMA4_TX_Rem;
  output SDMA4_TX_SOF;
  output SDMA4_TX_EOF;
  output SDMA4_TX_SOP;
  output SDMA4_TX_EOP;
  output SDMA4_TX_Src_Rdy;
  input SDMA4_TX_Dst_Rdy;
  input [0:31] SDMA4_RX_D;
  input [0:3] SDMA4_RX_Rem;
  input SDMA4_RX_SOF;
  input SDMA4_RX_EOF;
  input SDMA4_RX_SOP;
  input SDMA4_RX_EOP;
  input SDMA4_RX_Src_Rdy;
  output SDMA4_RX_Dst_Rdy;
  input SDMA_CTRL4_Clk;
  input SDMA_CTRL4_Rst;
  input [0:31] SDMA_CTRL4_PLB_ABus;
  input SDMA_CTRL4_PLB_PAValid;
  input SDMA_CTRL4_PLB_SAValid;
  input [0:0] SDMA_CTRL4_PLB_masterID;
  input SDMA_CTRL4_PLB_RNW;
  input [0:7] SDMA_CTRL4_PLB_BE;
  input [0:31] SDMA_CTRL4_PLB_UABus;
  input SDMA_CTRL4_PLB_rdPrim;
  input SDMA_CTRL4_PLB_wrPrim;
  input SDMA_CTRL4_PLB_abort;
  input SDMA_CTRL4_PLB_busLock;
  input [0:1] SDMA_CTRL4_PLB_MSize;
  input [0:3] SDMA_CTRL4_PLB_size;
  input [0:2] SDMA_CTRL4_PLB_type;
  input SDMA_CTRL4_PLB_lockErr;
  input SDMA_CTRL4_PLB_wrPendReq;
  input [0:1] SDMA_CTRL4_PLB_wrPendPri;
  input SDMA_CTRL4_PLB_rdPendReq;
  input [0:1] SDMA_CTRL4_PLB_rdPendPri;
  input [0:1] SDMA_CTRL4_PLB_reqPri;
  input [0:15] SDMA_CTRL4_PLB_TAttribute;
  input SDMA_CTRL4_PLB_rdBurst;
  input SDMA_CTRL4_PLB_wrBurst;
  input [0:63] SDMA_CTRL4_PLB_wrDBus;
  output SDMA_CTRL4_Sl_addrAck;
  output [0:1] SDMA_CTRL4_Sl_SSize;
  output SDMA_CTRL4_Sl_wait;
  output SDMA_CTRL4_Sl_rearbitrate;
  output SDMA_CTRL4_Sl_wrDAck;
  output SDMA_CTRL4_Sl_wrComp;
  output SDMA_CTRL4_Sl_wrBTerm;
  output [0:63] SDMA_CTRL4_Sl_rdDBus;
  output [0:3] SDMA_CTRL4_Sl_rdWdAddr;
  output SDMA_CTRL4_Sl_rdDAck;
  output SDMA_CTRL4_Sl_rdComp;
  output SDMA_CTRL4_Sl_rdBTerm;
  output [0:0] SDMA_CTRL4_Sl_MBusy;
  output [0:0] SDMA_CTRL4_Sl_MRdErr;
  output [0:0] SDMA_CTRL4_Sl_MWrErr;
  output [0:0] SDMA_CTRL4_Sl_MIRQ;
  input [31:0] PIM4_Addr;
  input PIM4_AddrReq;
  output PIM4_AddrAck;
  input PIM4_RNW;
  input [3:0] PIM4_Size;
  input PIM4_RdModWr;
  input [63:0] PIM4_WrFIFO_Data;
  input [7:0] PIM4_WrFIFO_BE;
  input PIM4_WrFIFO_Push;
  output [63:0] PIM4_RdFIFO_Data;
  input PIM4_RdFIFO_Pop;
  output [3:0] PIM4_RdFIFO_RdWdAddr;
  output PIM4_WrFIFO_Empty;
  output PIM4_WrFIFO_AlmostFull;
  input PIM4_WrFIFO_Flush;
  output PIM4_RdFIFO_Empty;
  input PIM4_RdFIFO_Flush;
  output [1:0] PIM4_RdFIFO_Latency;
  output PIM4_InitDone;
  input PPC440MC4_MIMCReadNotWrite;
  input [0:35] PPC440MC4_MIMCAddress;
  input PPC440MC4_MIMCAddressValid;
  input [0:127] PPC440MC4_MIMCWriteData;
  input PPC440MC4_MIMCWriteDataValid;
  input [0:15] PPC440MC4_MIMCByteEnable;
  input PPC440MC4_MIMCBankConflict;
  input PPC440MC4_MIMCRowConflict;
  output [0:127] PPC440MC4_MCMIReadData;
  output PPC440MC4_MCMIReadDataValid;
  output PPC440MC4_MCMIReadDataErr;
  output PPC440MC4_MCMIAddrReadyToAccept;
  input VFBC4_Cmd_Clk;
  input VFBC4_Cmd_Reset;
  input [31:0] VFBC4_Cmd_Data;
  input VFBC4_Cmd_Write;
  input VFBC4_Cmd_End;
  output VFBC4_Cmd_Full;
  output VFBC4_Cmd_Almost_Full;
  output VFBC4_Cmd_Idle;
  input VFBC4_Wd_Clk;
  input VFBC4_Wd_Reset;
  input VFBC4_Wd_Write;
  input VFBC4_Wd_End_Burst;
  input VFBC4_Wd_Flush;
  input [31:0] VFBC4_Wd_Data;
  input [3:0] VFBC4_Wd_Data_BE;
  output VFBC4_Wd_Full;
  output VFBC4_Wd_Almost_Full;
  input VFBC4_Rd_Clk;
  input VFBC4_Rd_Reset;
  input VFBC4_Rd_Read;
  input VFBC4_Rd_End_Burst;
  input VFBC4_Rd_Flush;
  output [31:0] VFBC4_Rd_Data;
  output VFBC4_Rd_Empty;
  output VFBC4_Rd_Almost_Empty;
  input MCB4_cmd_clk;
  input MCB4_cmd_en;
  input [2:0] MCB4_cmd_instr;
  input [5:0] MCB4_cmd_bl;
  input [29:0] MCB4_cmd_byte_addr;
  output MCB4_cmd_empty;
  output MCB4_cmd_full;
  input MCB4_wr_clk;
  input MCB4_wr_en;
  input [7:0] MCB4_wr_mask;
  input [63:0] MCB4_wr_data;
  output MCB4_wr_full;
  output MCB4_wr_empty;
  output [6:0] MCB4_wr_count;
  output MCB4_wr_underrun;
  output MCB4_wr_error;
  input MCB4_rd_clk;
  input MCB4_rd_en;
  output [63:0] MCB4_rd_data;
  output MCB4_rd_full;
  output MCB4_rd_empty;
  output [6:0] MCB4_rd_count;
  output MCB4_rd_overflow;
  output MCB4_rd_error;
  input FSL5_M_Clk;
  input FSL5_M_Write;
  input [0:31] FSL5_M_Data;
  input FSL5_M_Control;
  output FSL5_M_Full;
  input FSL5_S_Clk;
  input FSL5_S_Read;
  output [0:31] FSL5_S_Data;
  output FSL5_S_Control;
  output FSL5_S_Exists;
  input FSL5_B_M_Clk;
  input FSL5_B_M_Write;
  input [0:31] FSL5_B_M_Data;
  input FSL5_B_M_Control;
  output FSL5_B_M_Full;
  input FSL5_B_S_Clk;
  input FSL5_B_S_Read;
  output [0:31] FSL5_B_S_Data;
  output FSL5_B_S_Control;
  output FSL5_B_S_Exists;
  input SPLB5_Clk;
  input SPLB5_Rst;
  input [0:31] SPLB5_PLB_ABus;
  input SPLB5_PLB_PAValid;
  input SPLB5_PLB_SAValid;
  input [0:0] SPLB5_PLB_masterID;
  input SPLB5_PLB_RNW;
  input [0:7] SPLB5_PLB_BE;
  input [0:31] SPLB5_PLB_UABus;
  input SPLB5_PLB_rdPrim;
  input SPLB5_PLB_wrPrim;
  input SPLB5_PLB_abort;
  input SPLB5_PLB_busLock;
  input [0:1] SPLB5_PLB_MSize;
  input [0:3] SPLB5_PLB_size;
  input [0:2] SPLB5_PLB_type;
  input SPLB5_PLB_lockErr;
  input SPLB5_PLB_wrPendReq;
  input [0:1] SPLB5_PLB_wrPendPri;
  input SPLB5_PLB_rdPendReq;
  input [0:1] SPLB5_PLB_rdPendPri;
  input [0:1] SPLB5_PLB_reqPri;
  input [0:15] SPLB5_PLB_TAttribute;
  input SPLB5_PLB_rdBurst;
  input SPLB5_PLB_wrBurst;
  input [0:63] SPLB5_PLB_wrDBus;
  output SPLB5_Sl_addrAck;
  output [0:1] SPLB5_Sl_SSize;
  output SPLB5_Sl_wait;
  output SPLB5_Sl_rearbitrate;
  output SPLB5_Sl_wrDAck;
  output SPLB5_Sl_wrComp;
  output SPLB5_Sl_wrBTerm;
  output [0:63] SPLB5_Sl_rdDBus;
  output [0:3] SPLB5_Sl_rdWdAddr;
  output SPLB5_Sl_rdDAck;
  output SPLB5_Sl_rdComp;
  output SPLB5_Sl_rdBTerm;
  output [0:0] SPLB5_Sl_MBusy;
  output [0:0] SPLB5_Sl_MRdErr;
  output [0:0] SPLB5_Sl_MWrErr;
  output [0:0] SPLB5_Sl_MIRQ;
  input SDMA5_Clk;
  output SDMA5_Rx_IntOut;
  output SDMA5_Tx_IntOut;
  output SDMA5_RstOut;
  output [0:31] SDMA5_TX_D;
  output [0:3] SDMA5_TX_Rem;
  output SDMA5_TX_SOF;
  output SDMA5_TX_EOF;
  output SDMA5_TX_SOP;
  output SDMA5_TX_EOP;
  output SDMA5_TX_Src_Rdy;
  input SDMA5_TX_Dst_Rdy;
  input [0:31] SDMA5_RX_D;
  input [0:3] SDMA5_RX_Rem;
  input SDMA5_RX_SOF;
  input SDMA5_RX_EOF;
  input SDMA5_RX_SOP;
  input SDMA5_RX_EOP;
  input SDMA5_RX_Src_Rdy;
  output SDMA5_RX_Dst_Rdy;
  input SDMA_CTRL5_Clk;
  input SDMA_CTRL5_Rst;
  input [0:31] SDMA_CTRL5_PLB_ABus;
  input SDMA_CTRL5_PLB_PAValid;
  input SDMA_CTRL5_PLB_SAValid;
  input [0:0] SDMA_CTRL5_PLB_masterID;
  input SDMA_CTRL5_PLB_RNW;
  input [0:7] SDMA_CTRL5_PLB_BE;
  input [0:31] SDMA_CTRL5_PLB_UABus;
  input SDMA_CTRL5_PLB_rdPrim;
  input SDMA_CTRL5_PLB_wrPrim;
  input SDMA_CTRL5_PLB_abort;
  input SDMA_CTRL5_PLB_busLock;
  input [0:1] SDMA_CTRL5_PLB_MSize;
  input [0:3] SDMA_CTRL5_PLB_size;
  input [0:2] SDMA_CTRL5_PLB_type;
  input SDMA_CTRL5_PLB_lockErr;
  input SDMA_CTRL5_PLB_wrPendReq;
  input [0:1] SDMA_CTRL5_PLB_wrPendPri;
  input SDMA_CTRL5_PLB_rdPendReq;
  input [0:1] SDMA_CTRL5_PLB_rdPendPri;
  input [0:1] SDMA_CTRL5_PLB_reqPri;
  input [0:15] SDMA_CTRL5_PLB_TAttribute;
  input SDMA_CTRL5_PLB_rdBurst;
  input SDMA_CTRL5_PLB_wrBurst;
  input [0:63] SDMA_CTRL5_PLB_wrDBus;
  output SDMA_CTRL5_Sl_addrAck;
  output [0:1] SDMA_CTRL5_Sl_SSize;
  output SDMA_CTRL5_Sl_wait;
  output SDMA_CTRL5_Sl_rearbitrate;
  output SDMA_CTRL5_Sl_wrDAck;
  output SDMA_CTRL5_Sl_wrComp;
  output SDMA_CTRL5_Sl_wrBTerm;
  output [0:63] SDMA_CTRL5_Sl_rdDBus;
  output [0:3] SDMA_CTRL5_Sl_rdWdAddr;
  output SDMA_CTRL5_Sl_rdDAck;
  output SDMA_CTRL5_Sl_rdComp;
  output SDMA_CTRL5_Sl_rdBTerm;
  output [0:0] SDMA_CTRL5_Sl_MBusy;
  output [0:0] SDMA_CTRL5_Sl_MRdErr;
  output [0:0] SDMA_CTRL5_Sl_MWrErr;
  output [0:0] SDMA_CTRL5_Sl_MIRQ;
  input [31:0] PIM5_Addr;
  input PIM5_AddrReq;
  output PIM5_AddrAck;
  input PIM5_RNW;
  input [3:0] PIM5_Size;
  input PIM5_RdModWr;
  input [63:0] PIM5_WrFIFO_Data;
  input [7:0] PIM5_WrFIFO_BE;
  input PIM5_WrFIFO_Push;
  output [63:0] PIM5_RdFIFO_Data;
  input PIM5_RdFIFO_Pop;
  output [3:0] PIM5_RdFIFO_RdWdAddr;
  output PIM5_WrFIFO_Empty;
  output PIM5_WrFIFO_AlmostFull;
  input PIM5_WrFIFO_Flush;
  output PIM5_RdFIFO_Empty;
  input PIM5_RdFIFO_Flush;
  output [1:0] PIM5_RdFIFO_Latency;
  output PIM5_InitDone;
  input PPC440MC5_MIMCReadNotWrite;
  input [0:35] PPC440MC5_MIMCAddress;
  input PPC440MC5_MIMCAddressValid;
  input [0:127] PPC440MC5_MIMCWriteData;
  input PPC440MC5_MIMCWriteDataValid;
  input [0:15] PPC440MC5_MIMCByteEnable;
  input PPC440MC5_MIMCBankConflict;
  input PPC440MC5_MIMCRowConflict;
  output [0:127] PPC440MC5_MCMIReadData;
  output PPC440MC5_MCMIReadDataValid;
  output PPC440MC5_MCMIReadDataErr;
  output PPC440MC5_MCMIAddrReadyToAccept;
  input VFBC5_Cmd_Clk;
  input VFBC5_Cmd_Reset;
  input [31:0] VFBC5_Cmd_Data;
  input VFBC5_Cmd_Write;
  input VFBC5_Cmd_End;
  output VFBC5_Cmd_Full;
  output VFBC5_Cmd_Almost_Full;
  output VFBC5_Cmd_Idle;
  input VFBC5_Wd_Clk;
  input VFBC5_Wd_Reset;
  input VFBC5_Wd_Write;
  input VFBC5_Wd_End_Burst;
  input VFBC5_Wd_Flush;
  input [31:0] VFBC5_Wd_Data;
  input [3:0] VFBC5_Wd_Data_BE;
  output VFBC5_Wd_Full;
  output VFBC5_Wd_Almost_Full;
  input VFBC5_Rd_Clk;
  input VFBC5_Rd_Reset;
  input VFBC5_Rd_Read;
  input VFBC5_Rd_End_Burst;
  input VFBC5_Rd_Flush;
  output [31:0] VFBC5_Rd_Data;
  output VFBC5_Rd_Empty;
  output VFBC5_Rd_Almost_Empty;
  input MCB5_cmd_clk;
  input MCB5_cmd_en;
  input [2:0] MCB5_cmd_instr;
  input [5:0] MCB5_cmd_bl;
  input [29:0] MCB5_cmd_byte_addr;
  output MCB5_cmd_empty;
  output MCB5_cmd_full;
  input MCB5_wr_clk;
  input MCB5_wr_en;
  input [7:0] MCB5_wr_mask;
  input [63:0] MCB5_wr_data;
  output MCB5_wr_full;
  output MCB5_wr_empty;
  output [6:0] MCB5_wr_count;
  output MCB5_wr_underrun;
  output MCB5_wr_error;
  input MCB5_rd_clk;
  input MCB5_rd_en;
  output [63:0] MCB5_rd_data;
  output MCB5_rd_full;
  output MCB5_rd_empty;
  output [6:0] MCB5_rd_count;
  output MCB5_rd_overflow;
  output MCB5_rd_error;
  input FSL6_M_Clk;
  input FSL6_M_Write;
  input [0:31] FSL6_M_Data;
  input FSL6_M_Control;
  output FSL6_M_Full;
  input FSL6_S_Clk;
  input FSL6_S_Read;
  output [0:31] FSL6_S_Data;
  output FSL6_S_Control;
  output FSL6_S_Exists;
  input FSL6_B_M_Clk;
  input FSL6_B_M_Write;
  input [0:31] FSL6_B_M_Data;
  input FSL6_B_M_Control;
  output FSL6_B_M_Full;
  input FSL6_B_S_Clk;
  input FSL6_B_S_Read;
  output [0:31] FSL6_B_S_Data;
  output FSL6_B_S_Control;
  output FSL6_B_S_Exists;
  input SPLB6_Clk;
  input SPLB6_Rst;
  input [0:31] SPLB6_PLB_ABus;
  input SPLB6_PLB_PAValid;
  input SPLB6_PLB_SAValid;
  input [0:0] SPLB6_PLB_masterID;
  input SPLB6_PLB_RNW;
  input [0:7] SPLB6_PLB_BE;
  input [0:31] SPLB6_PLB_UABus;
  input SPLB6_PLB_rdPrim;
  input SPLB6_PLB_wrPrim;
  input SPLB6_PLB_abort;
  input SPLB6_PLB_busLock;
  input [0:1] SPLB6_PLB_MSize;
  input [0:3] SPLB6_PLB_size;
  input [0:2] SPLB6_PLB_type;
  input SPLB6_PLB_lockErr;
  input SPLB6_PLB_wrPendReq;
  input [0:1] SPLB6_PLB_wrPendPri;
  input SPLB6_PLB_rdPendReq;
  input [0:1] SPLB6_PLB_rdPendPri;
  input [0:1] SPLB6_PLB_reqPri;
  input [0:15] SPLB6_PLB_TAttribute;
  input SPLB6_PLB_rdBurst;
  input SPLB6_PLB_wrBurst;
  input [0:63] SPLB6_PLB_wrDBus;
  output SPLB6_Sl_addrAck;
  output [0:1] SPLB6_Sl_SSize;
  output SPLB6_Sl_wait;
  output SPLB6_Sl_rearbitrate;
  output SPLB6_Sl_wrDAck;
  output SPLB6_Sl_wrComp;
  output SPLB6_Sl_wrBTerm;
  output [0:63] SPLB6_Sl_rdDBus;
  output [0:3] SPLB6_Sl_rdWdAddr;
  output SPLB6_Sl_rdDAck;
  output SPLB6_Sl_rdComp;
  output SPLB6_Sl_rdBTerm;
  output [0:0] SPLB6_Sl_MBusy;
  output [0:0] SPLB6_Sl_MRdErr;
  output [0:0] SPLB6_Sl_MWrErr;
  output [0:0] SPLB6_Sl_MIRQ;
  input SDMA6_Clk;
  output SDMA6_Rx_IntOut;
  output SDMA6_Tx_IntOut;
  output SDMA6_RstOut;
  output [0:31] SDMA6_TX_D;
  output [0:3] SDMA6_TX_Rem;
  output SDMA6_TX_SOF;
  output SDMA6_TX_EOF;
  output SDMA6_TX_SOP;
  output SDMA6_TX_EOP;
  output SDMA6_TX_Src_Rdy;
  input SDMA6_TX_Dst_Rdy;
  input [0:31] SDMA6_RX_D;
  input [0:3] SDMA6_RX_Rem;
  input SDMA6_RX_SOF;
  input SDMA6_RX_EOF;
  input SDMA6_RX_SOP;
  input SDMA6_RX_EOP;
  input SDMA6_RX_Src_Rdy;
  output SDMA6_RX_Dst_Rdy;
  input SDMA_CTRL6_Clk;
  input SDMA_CTRL6_Rst;
  input [0:31] SDMA_CTRL6_PLB_ABus;
  input SDMA_CTRL6_PLB_PAValid;
  input SDMA_CTRL6_PLB_SAValid;
  input [0:0] SDMA_CTRL6_PLB_masterID;
  input SDMA_CTRL6_PLB_RNW;
  input [0:7] SDMA_CTRL6_PLB_BE;
  input [0:31] SDMA_CTRL6_PLB_UABus;
  input SDMA_CTRL6_PLB_rdPrim;
  input SDMA_CTRL6_PLB_wrPrim;
  input SDMA_CTRL6_PLB_abort;
  input SDMA_CTRL6_PLB_busLock;
  input [0:1] SDMA_CTRL6_PLB_MSize;
  input [0:3] SDMA_CTRL6_PLB_size;
  input [0:2] SDMA_CTRL6_PLB_type;
  input SDMA_CTRL6_PLB_lockErr;
  input SDMA_CTRL6_PLB_wrPendReq;
  input [0:1] SDMA_CTRL6_PLB_wrPendPri;
  input SDMA_CTRL6_PLB_rdPendReq;
  input [0:1] SDMA_CTRL6_PLB_rdPendPri;
  input [0:1] SDMA_CTRL6_PLB_reqPri;
  input [0:15] SDMA_CTRL6_PLB_TAttribute;
  input SDMA_CTRL6_PLB_rdBurst;
  input SDMA_CTRL6_PLB_wrBurst;
  input [0:63] SDMA_CTRL6_PLB_wrDBus;
  output SDMA_CTRL6_Sl_addrAck;
  output [0:1] SDMA_CTRL6_Sl_SSize;
  output SDMA_CTRL6_Sl_wait;
  output SDMA_CTRL6_Sl_rearbitrate;
  output SDMA_CTRL6_Sl_wrDAck;
  output SDMA_CTRL6_Sl_wrComp;
  output SDMA_CTRL6_Sl_wrBTerm;
  output [0:63] SDMA_CTRL6_Sl_rdDBus;
  output [0:3] SDMA_CTRL6_Sl_rdWdAddr;
  output SDMA_CTRL6_Sl_rdDAck;
  output SDMA_CTRL6_Sl_rdComp;
  output SDMA_CTRL6_Sl_rdBTerm;
  output [0:0] SDMA_CTRL6_Sl_MBusy;
  output [0:0] SDMA_CTRL6_Sl_MRdErr;
  output [0:0] SDMA_CTRL6_Sl_MWrErr;
  output [0:0] SDMA_CTRL6_Sl_MIRQ;
  input [31:0] PIM6_Addr;
  input PIM6_AddrReq;
  output PIM6_AddrAck;
  input PIM6_RNW;
  input [3:0] PIM6_Size;
  input PIM6_RdModWr;
  input [63:0] PIM6_WrFIFO_Data;
  input [7:0] PIM6_WrFIFO_BE;
  input PIM6_WrFIFO_Push;
  output [63:0] PIM6_RdFIFO_Data;
  input PIM6_RdFIFO_Pop;
  output [3:0] PIM6_RdFIFO_RdWdAddr;
  output PIM6_WrFIFO_Empty;
  output PIM6_WrFIFO_AlmostFull;
  input PIM6_WrFIFO_Flush;
  output PIM6_RdFIFO_Empty;
  input PIM6_RdFIFO_Flush;
  output [1:0] PIM6_RdFIFO_Latency;
  output PIM6_InitDone;
  input PPC440MC6_MIMCReadNotWrite;
  input [0:35] PPC440MC6_MIMCAddress;
  input PPC440MC6_MIMCAddressValid;
  input [0:127] PPC440MC6_MIMCWriteData;
  input PPC440MC6_MIMCWriteDataValid;
  input [0:15] PPC440MC6_MIMCByteEnable;
  input PPC440MC6_MIMCBankConflict;
  input PPC440MC6_MIMCRowConflict;
  output [0:127] PPC440MC6_MCMIReadData;
  output PPC440MC6_MCMIReadDataValid;
  output PPC440MC6_MCMIReadDataErr;
  output PPC440MC6_MCMIAddrReadyToAccept;
  input VFBC6_Cmd_Clk;
  input VFBC6_Cmd_Reset;
  input [31:0] VFBC6_Cmd_Data;
  input VFBC6_Cmd_Write;
  input VFBC6_Cmd_End;
  output VFBC6_Cmd_Full;
  output VFBC6_Cmd_Almost_Full;
  output VFBC6_Cmd_Idle;
  input VFBC6_Wd_Clk;
  input VFBC6_Wd_Reset;
  input VFBC6_Wd_Write;
  input VFBC6_Wd_End_Burst;
  input VFBC6_Wd_Flush;
  input [31:0] VFBC6_Wd_Data;
  input [3:0] VFBC6_Wd_Data_BE;
  output VFBC6_Wd_Full;
  output VFBC6_Wd_Almost_Full;
  input VFBC6_Rd_Clk;
  input VFBC6_Rd_Reset;
  input VFBC6_Rd_Read;
  input VFBC6_Rd_End_Burst;
  input VFBC6_Rd_Flush;
  output [31:0] VFBC6_Rd_Data;
  output VFBC6_Rd_Empty;
  output VFBC6_Rd_Almost_Empty;
  input MCB6_cmd_clk;
  input MCB6_cmd_en;
  input [2:0] MCB6_cmd_instr;
  input [5:0] MCB6_cmd_bl;
  input [29:0] MCB6_cmd_byte_addr;
  output MCB6_cmd_empty;
  output MCB6_cmd_full;
  input MCB6_wr_clk;
  input MCB6_wr_en;
  input [7:0] MCB6_wr_mask;
  input [63:0] MCB6_wr_data;
  output MCB6_wr_full;
  output MCB6_wr_empty;
  output [6:0] MCB6_wr_count;
  output MCB6_wr_underrun;
  output MCB6_wr_error;
  input MCB6_rd_clk;
  input MCB6_rd_en;
  output [63:0] MCB6_rd_data;
  output MCB6_rd_full;
  output MCB6_rd_empty;
  output [6:0] MCB6_rd_count;
  output MCB6_rd_overflow;
  output MCB6_rd_error;
  input FSL7_M_Clk;
  input FSL7_M_Write;
  input [0:31] FSL7_M_Data;
  input FSL7_M_Control;
  output FSL7_M_Full;
  input FSL7_S_Clk;
  input FSL7_S_Read;
  output [0:31] FSL7_S_Data;
  output FSL7_S_Control;
  output FSL7_S_Exists;
  input FSL7_B_M_Clk;
  input FSL7_B_M_Write;
  input [0:31] FSL7_B_M_Data;
  input FSL7_B_M_Control;
  output FSL7_B_M_Full;
  input FSL7_B_S_Clk;
  input FSL7_B_S_Read;
  output [0:31] FSL7_B_S_Data;
  output FSL7_B_S_Control;
  output FSL7_B_S_Exists;
  input SPLB7_Clk;
  input SPLB7_Rst;
  input [0:31] SPLB7_PLB_ABus;
  input SPLB7_PLB_PAValid;
  input SPLB7_PLB_SAValid;
  input [0:0] SPLB7_PLB_masterID;
  input SPLB7_PLB_RNW;
  input [0:7] SPLB7_PLB_BE;
  input [0:31] SPLB7_PLB_UABus;
  input SPLB7_PLB_rdPrim;
  input SPLB7_PLB_wrPrim;
  input SPLB7_PLB_abort;
  input SPLB7_PLB_busLock;
  input [0:1] SPLB7_PLB_MSize;
  input [0:3] SPLB7_PLB_size;
  input [0:2] SPLB7_PLB_type;
  input SPLB7_PLB_lockErr;
  input SPLB7_PLB_wrPendReq;
  input [0:1] SPLB7_PLB_wrPendPri;
  input SPLB7_PLB_rdPendReq;
  input [0:1] SPLB7_PLB_rdPendPri;
  input [0:1] SPLB7_PLB_reqPri;
  input [0:15] SPLB7_PLB_TAttribute;
  input SPLB7_PLB_rdBurst;
  input SPLB7_PLB_wrBurst;
  input [0:63] SPLB7_PLB_wrDBus;
  output SPLB7_Sl_addrAck;
  output [0:1] SPLB7_Sl_SSize;
  output SPLB7_Sl_wait;
  output SPLB7_Sl_rearbitrate;
  output SPLB7_Sl_wrDAck;
  output SPLB7_Sl_wrComp;
  output SPLB7_Sl_wrBTerm;
  output [0:63] SPLB7_Sl_rdDBus;
  output [0:3] SPLB7_Sl_rdWdAddr;
  output SPLB7_Sl_rdDAck;
  output SPLB7_Sl_rdComp;
  output SPLB7_Sl_rdBTerm;
  output [0:0] SPLB7_Sl_MBusy;
  output [0:0] SPLB7_Sl_MRdErr;
  output [0:0] SPLB7_Sl_MWrErr;
  output [0:0] SPLB7_Sl_MIRQ;
  input SDMA7_Clk;
  output SDMA7_Rx_IntOut;
  output SDMA7_Tx_IntOut;
  output SDMA7_RstOut;
  output [0:31] SDMA7_TX_D;
  output [0:3] SDMA7_TX_Rem;
  output SDMA7_TX_SOF;
  output SDMA7_TX_EOF;
  output SDMA7_TX_SOP;
  output SDMA7_TX_EOP;
  output SDMA7_TX_Src_Rdy;
  input SDMA7_TX_Dst_Rdy;
  input [0:31] SDMA7_RX_D;
  input [0:3] SDMA7_RX_Rem;
  input SDMA7_RX_SOF;
  input SDMA7_RX_EOF;
  input SDMA7_RX_SOP;
  input SDMA7_RX_EOP;
  input SDMA7_RX_Src_Rdy;
  output SDMA7_RX_Dst_Rdy;
  input SDMA_CTRL7_Clk;
  input SDMA_CTRL7_Rst;
  input [0:31] SDMA_CTRL7_PLB_ABus;
  input SDMA_CTRL7_PLB_PAValid;
  input SDMA_CTRL7_PLB_SAValid;
  input [0:0] SDMA_CTRL7_PLB_masterID;
  input SDMA_CTRL7_PLB_RNW;
  input [0:7] SDMA_CTRL7_PLB_BE;
  input [0:31] SDMA_CTRL7_PLB_UABus;
  input SDMA_CTRL7_PLB_rdPrim;
  input SDMA_CTRL7_PLB_wrPrim;
  input SDMA_CTRL7_PLB_abort;
  input SDMA_CTRL7_PLB_busLock;
  input [0:1] SDMA_CTRL7_PLB_MSize;
  input [0:3] SDMA_CTRL7_PLB_size;
  input [0:2] SDMA_CTRL7_PLB_type;
  input SDMA_CTRL7_PLB_lockErr;
  input SDMA_CTRL7_PLB_wrPendReq;
  input [0:1] SDMA_CTRL7_PLB_wrPendPri;
  input SDMA_CTRL7_PLB_rdPendReq;
  input [0:1] SDMA_CTRL7_PLB_rdPendPri;
  input [0:1] SDMA_CTRL7_PLB_reqPri;
  input [0:15] SDMA_CTRL7_PLB_TAttribute;
  input SDMA_CTRL7_PLB_rdBurst;
  input SDMA_CTRL7_PLB_wrBurst;
  input [0:63] SDMA_CTRL7_PLB_wrDBus;
  output SDMA_CTRL7_Sl_addrAck;
  output [0:1] SDMA_CTRL7_Sl_SSize;
  output SDMA_CTRL7_Sl_wait;
  output SDMA_CTRL7_Sl_rearbitrate;
  output SDMA_CTRL7_Sl_wrDAck;
  output SDMA_CTRL7_Sl_wrComp;
  output SDMA_CTRL7_Sl_wrBTerm;
  output [0:63] SDMA_CTRL7_Sl_rdDBus;
  output [0:3] SDMA_CTRL7_Sl_rdWdAddr;
  output SDMA_CTRL7_Sl_rdDAck;
  output SDMA_CTRL7_Sl_rdComp;
  output SDMA_CTRL7_Sl_rdBTerm;
  output [0:0] SDMA_CTRL7_Sl_MBusy;
  output [0:0] SDMA_CTRL7_Sl_MRdErr;
  output [0:0] SDMA_CTRL7_Sl_MWrErr;
  output [0:0] SDMA_CTRL7_Sl_MIRQ;
  input [31:0] PIM7_Addr;
  input PIM7_AddrReq;
  output PIM7_AddrAck;
  input PIM7_RNW;
  input [3:0] PIM7_Size;
  input PIM7_RdModWr;
  input [63:0] PIM7_WrFIFO_Data;
  input [7:0] PIM7_WrFIFO_BE;
  input PIM7_WrFIFO_Push;
  output [63:0] PIM7_RdFIFO_Data;
  input PIM7_RdFIFO_Pop;
  output [3:0] PIM7_RdFIFO_RdWdAddr;
  output PIM7_WrFIFO_Empty;
  output PIM7_WrFIFO_AlmostFull;
  input PIM7_WrFIFO_Flush;
  output PIM7_RdFIFO_Empty;
  input PIM7_RdFIFO_Flush;
  output [1:0] PIM7_RdFIFO_Latency;
  output PIM7_InitDone;
  input PPC440MC7_MIMCReadNotWrite;
  input [0:35] PPC440MC7_MIMCAddress;
  input PPC440MC7_MIMCAddressValid;
  input [0:127] PPC440MC7_MIMCWriteData;
  input PPC440MC7_MIMCWriteDataValid;
  input [0:15] PPC440MC7_MIMCByteEnable;
  input PPC440MC7_MIMCBankConflict;
  input PPC440MC7_MIMCRowConflict;
  output [0:127] PPC440MC7_MCMIReadData;
  output PPC440MC7_MCMIReadDataValid;
  output PPC440MC7_MCMIReadDataErr;
  output PPC440MC7_MCMIAddrReadyToAccept;
  input VFBC7_Cmd_Clk;
  input VFBC7_Cmd_Reset;
  input [31:0] VFBC7_Cmd_Data;
  input VFBC7_Cmd_Write;
  input VFBC7_Cmd_End;
  output VFBC7_Cmd_Full;
  output VFBC7_Cmd_Almost_Full;
  output VFBC7_Cmd_Idle;
  input VFBC7_Wd_Clk;
  input VFBC7_Wd_Reset;
  input VFBC7_Wd_Write;
  input VFBC7_Wd_End_Burst;
  input VFBC7_Wd_Flush;
  input [31:0] VFBC7_Wd_Data;
  input [3:0] VFBC7_Wd_Data_BE;
  output VFBC7_Wd_Full;
  output VFBC7_Wd_Almost_Full;
  input VFBC7_Rd_Clk;
  input VFBC7_Rd_Reset;
  input VFBC7_Rd_Read;
  input VFBC7_Rd_End_Burst;
  input VFBC7_Rd_Flush;
  output [31:0] VFBC7_Rd_Data;
  output VFBC7_Rd_Empty;
  output VFBC7_Rd_Almost_Empty;
  input MCB7_cmd_clk;
  input MCB7_cmd_en;
  input [2:0] MCB7_cmd_instr;
  input [5:0] MCB7_cmd_bl;
  input [29:0] MCB7_cmd_byte_addr;
  output MCB7_cmd_empty;
  output MCB7_cmd_full;
  input MCB7_wr_clk;
  input MCB7_wr_en;
  input [7:0] MCB7_wr_mask;
  input [63:0] MCB7_wr_data;
  output MCB7_wr_full;
  output MCB7_wr_empty;
  output [6:0] MCB7_wr_count;
  output MCB7_wr_underrun;
  output MCB7_wr_error;
  input MCB7_rd_clk;
  input MCB7_rd_en;
  output [63:0] MCB7_rd_data;
  output MCB7_rd_full;
  output MCB7_rd_empty;
  output [6:0] MCB7_rd_count;
  output MCB7_rd_overflow;
  output MCB7_rd_error;
  input MPMC_CTRL_Clk;
  input MPMC_CTRL_Rst;
  input [0:31] MPMC_CTRL_PLB_ABus;
  input MPMC_CTRL_PLB_PAValid;
  input MPMC_CTRL_PLB_SAValid;
  input [0:0] MPMC_CTRL_PLB_masterID;
  input MPMC_CTRL_PLB_RNW;
  input [0:7] MPMC_CTRL_PLB_BE;
  input [0:31] MPMC_CTRL_PLB_UABus;
  input MPMC_CTRL_PLB_rdPrim;
  input MPMC_CTRL_PLB_wrPrim;
  input MPMC_CTRL_PLB_abort;
  input MPMC_CTRL_PLB_busLock;
  input [0:1] MPMC_CTRL_PLB_MSize;
  input [0:3] MPMC_CTRL_PLB_size;
  input [0:2] MPMC_CTRL_PLB_type;
  input MPMC_CTRL_PLB_lockErr;
  input MPMC_CTRL_PLB_wrPendReq;
  input [0:1] MPMC_CTRL_PLB_wrPendPri;
  input MPMC_CTRL_PLB_rdPendReq;
  input [0:1] MPMC_CTRL_PLB_rdPendPri;
  input [0:1] MPMC_CTRL_PLB_reqPri;
  input [0:15] MPMC_CTRL_PLB_TAttribute;
  input MPMC_CTRL_PLB_rdBurst;
  input MPMC_CTRL_PLB_wrBurst;
  input [0:63] MPMC_CTRL_PLB_wrDBus;
  output MPMC_CTRL_Sl_addrAck;
  output [0:1] MPMC_CTRL_Sl_SSize;
  output MPMC_CTRL_Sl_wait;
  output MPMC_CTRL_Sl_rearbitrate;
  output MPMC_CTRL_Sl_wrDAck;
  output MPMC_CTRL_Sl_wrComp;
  output MPMC_CTRL_Sl_wrBTerm;
  output [0:63] MPMC_CTRL_Sl_rdDBus;
  output [0:3] MPMC_CTRL_Sl_rdWdAddr;
  output MPMC_CTRL_Sl_rdDAck;
  output MPMC_CTRL_Sl_rdComp;
  output MPMC_CTRL_Sl_rdBTerm;
  output [0:0] MPMC_CTRL_Sl_MBusy;
  output [0:0] MPMC_CTRL_Sl_MRdErr;
  output [0:0] MPMC_CTRL_Sl_MWrErr;
  output [0:0] MPMC_CTRL_Sl_MIRQ;
  input MPMC_Clk0;
  input MPMC_Clk0_DIV2;
  input MPMC_Clk90;
  input MPMC_Clk_200MHz;
  input MPMC_Rst;
  input MPMC_Clk_Mem;
  input MPMC_Clk_Mem_2x;
  input MPMC_Clk_Mem_2x_180;
  input MPMC_Clk_Mem_2x_CE0;
  input MPMC_Clk_Mem_2x_CE90;
  input MPMC_Clk_Rd_Base;
  output MPMC_Clk_Mem_2x_bufpll_o;
  output MPMC_Clk_Mem_2x_180_bufpll_o;
  output MPMC_Clk_Mem_2x_CE0_bufpll_o;
  output MPMC_Clk_Mem_2x_CE90_bufpll_o;
  output MPMC_PLL_Lock_bufpll_o;
  input MPMC_PLL_Lock;
  input MPMC_Idelayctrl_Rdy_I;
  output MPMC_Idelayctrl_Rdy_O;
  output MPMC_InitDone;
  output MPMC_ECC_Intr;
  output MPMC_DCM_PSEN;
  output MPMC_DCM_PSINCDEC;
  input MPMC_DCM_PSDONE;
  input MPMC_MCB_DRP_Clk;
  output [1:0] SDRAM_Clk;
  output [1:0] SDRAM_CE;
  output [1:0] SDRAM_CS_n;
  output SDRAM_RAS_n;
  output SDRAM_CAS_n;
  output SDRAM_WE_n;
  output [1:0] SDRAM_BankAddr;
  output [12:0] SDRAM_Addr;
  inout [63:0] SDRAM_DQ;
  output [7:0] SDRAM_DM;
  output [1:0] DDR_Clk;
  output [1:0] DDR_Clk_n;
  output [1:0] DDR_CE;
  output [1:0] DDR_CS_n;
  output DDR_RAS_n;
  output DDR_CAS_n;
  output DDR_WE_n;
  output [1:0] DDR_BankAddr;
  output [12:0] DDR_Addr;
  inout [63:0] DDR_DQ;
  output [7:0] DDR_DM;
  inout [7:0] DDR_DQS;
  output DDR_DQS_Div_O;
  input DDR_DQS_Div_I;
  output [1:0] DDR2_Clk;
  output [1:0] DDR2_Clk_n;
  output [1:0] DDR2_CE;
  output [1:0] DDR2_CS_n;
  output [1:0] DDR2_ODT;
  output DDR2_RAS_n;
  output DDR2_CAS_n;
  output DDR2_WE_n;
  output [1:0] DDR2_BankAddr;
  output [12:0] DDR2_Addr;
  inout [63:0] DDR2_DQ;
  output [7:0] DDR2_DM;
  inout [7:0] DDR2_DQS;
  inout [7:0] DDR2_DQS_n;
  output DDR2_DQS_Div_O;
  input DDR2_DQS_Div_I;
  output [1:0] DDR3_Clk;
  output [1:0] DDR3_Clk_n;
  output [1:0] DDR3_CE;
  output [1:0] DDR3_CS_n;
  output [1:0] DDR3_ODT;
  output DDR3_RAS_n;
  output DDR3_CAS_n;
  output DDR3_WE_n;
  output [1:0] DDR3_BankAddr;
  output [12:0] DDR3_Addr;
  inout [63:0] DDR3_DQ;
  output [7:0] DDR3_DM;
  output DDR3_Reset_n;
  inout [7:0] DDR3_DQS;
  inout [7:0] DDR3_DQS_n;
  output [12:0] mcbx_dram_addr;
  output [1:0] mcbx_dram_ba;
  output mcbx_dram_ras_n;
  output mcbx_dram_cas_n;
  output mcbx_dram_we_n;
  output mcbx_dram_cke;
  output mcbx_dram_clk;
  output mcbx_dram_clk_n;
  inout [63:0] mcbx_dram_dq;
  inout mcbx_dram_dqs;
  inout mcbx_dram_dqs_n;
  inout mcbx_dram_udqs;
  inout mcbx_dram_udqs_n;
  output mcbx_dram_udm;
  output mcbx_dram_ldm;
  output mcbx_dram_odt;
  output mcbx_dram_ddr3_rst;
  input selfrefresh_enter;
  output selfrefresh_mode;
  input calib_recal;
  inout rzq;
  inout zio;
endmodule

module system_clock_generator_0_wrapper
  (
    CLKIN,
    CLKOUT0,
    CLKOUT1,
    CLKOUT2,
    CLKOUT3,
    CLKOUT4,
    CLKOUT5,
    CLKOUT6,
    CLKOUT7,
    CLKOUT8,
    CLKOUT9,
    CLKOUT10,
    CLKOUT11,
    CLKOUT12,
    CLKOUT13,
    CLKOUT14,
    CLKOUT15,
    CLKFBIN,
    CLKFBOUT,
    PSCLK,
    PSEN,
    PSINCDEC,
    PSDONE,
    RST,
    LOCKED
  );
  input CLKIN;
  output CLKOUT0;
  output CLKOUT1;
  output CLKOUT2;
  output CLKOUT3;
  output CLKOUT4;
  output CLKOUT5;
  output CLKOUT6;
  output CLKOUT7;
  output CLKOUT8;
  output CLKOUT9;
  output CLKOUT10;
  output CLKOUT11;
  output CLKOUT12;
  output CLKOUT13;
  output CLKOUT14;
  output CLKOUT15;
  input CLKFBIN;
  output CLKFBOUT;
  input PSCLK;
  input PSEN;
  input PSINCDEC;
  output PSDONE;
  input RST;
  output LOCKED;
endmodule

module system_mdm_0_wrapper
  (
    Interrupt,
    Debug_SYS_Rst,
    Ext_BRK,
    Ext_NM_BRK,
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY,
    SPLB_Clk,
    SPLB_Rst,
    PLB_ABus,
    PLB_UABus,
    PLB_PAValid,
    PLB_SAValid,
    PLB_rdPrim,
    PLB_wrPrim,
    PLB_masterID,
    PLB_abort,
    PLB_busLock,
    PLB_RNW,
    PLB_BE,
    PLB_MSize,
    PLB_size,
    PLB_type,
    PLB_lockErr,
    PLB_wrDBus,
    PLB_wrBurst,
    PLB_rdBurst,
    PLB_wrPendReq,
    PLB_rdPendReq,
    PLB_wrPendPri,
    PLB_rdPendPri,
    PLB_reqPri,
    PLB_TAttribute,
    Sl_addrAck,
    Sl_SSize,
    Sl_wait,
    Sl_rearbitrate,
    Sl_wrDAck,
    Sl_wrComp,
    Sl_wrBTerm,
    Sl_rdDBus,
    Sl_rdWdAddr,
    Sl_rdDAck,
    Sl_rdComp,
    Sl_rdBTerm,
    Sl_MBusy,
    Sl_MWrErr,
    Sl_MRdErr,
    Sl_MIRQ,
    Dbg_Clk_0,
    Dbg_TDI_0,
    Dbg_TDO_0,
    Dbg_Reg_En_0,
    Dbg_Capture_0,
    Dbg_Shift_0,
    Dbg_Update_0,
    Dbg_Rst_0,
    Dbg_Clk_1,
    Dbg_TDI_1,
    Dbg_TDO_1,
    Dbg_Reg_En_1,
    Dbg_Capture_1,
    Dbg_Shift_1,
    Dbg_Update_1,
    Dbg_Rst_1,
    Dbg_Clk_2,
    Dbg_TDI_2,
    Dbg_TDO_2,
    Dbg_Reg_En_2,
    Dbg_Capture_2,
    Dbg_Shift_2,
    Dbg_Update_2,
    Dbg_Rst_2,
    Dbg_Clk_3,
    Dbg_TDI_3,
    Dbg_TDO_3,
    Dbg_Reg_En_3,
    Dbg_Capture_3,
    Dbg_Shift_3,
    Dbg_Update_3,
    Dbg_Rst_3,
    Dbg_Clk_4,
    Dbg_TDI_4,
    Dbg_TDO_4,
    Dbg_Reg_En_4,
    Dbg_Capture_4,
    Dbg_Shift_4,
    Dbg_Update_4,
    Dbg_Rst_4,
    Dbg_Clk_5,
    Dbg_TDI_5,
    Dbg_TDO_5,
    Dbg_Reg_En_5,
    Dbg_Capture_5,
    Dbg_Shift_5,
    Dbg_Update_5,
    Dbg_Rst_5,
    Dbg_Clk_6,
    Dbg_TDI_6,
    Dbg_TDO_6,
    Dbg_Reg_En_6,
    Dbg_Capture_6,
    Dbg_Shift_6,
    Dbg_Update_6,
    Dbg_Rst_6,
    Dbg_Clk_7,
    Dbg_TDI_7,
    Dbg_TDO_7,
    Dbg_Reg_En_7,
    Dbg_Capture_7,
    Dbg_Shift_7,
    Dbg_Update_7,
    Dbg_Rst_7,
    bscan_tdi,
    bscan_reset,
    bscan_shift,
    bscan_update,
    bscan_capture,
    bscan_sel1,
    bscan_drck1,
    bscan_tdo1,
    Ext_JTAG_DRCK,
    Ext_JTAG_RESET,
    Ext_JTAG_SEL,
    Ext_JTAG_CAPTURE,
    Ext_JTAG_SHIFT,
    Ext_JTAG_UPDATE,
    Ext_JTAG_TDI,
    Ext_JTAG_TDO
  );
  output Interrupt;
  output Debug_SYS_Rst;
  output Ext_BRK;
  output Ext_NM_BRK;
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  input SPLB_Clk;
  input SPLB_Rst;
  input [0:31] PLB_ABus;
  input [0:31] PLB_UABus;
  input PLB_PAValid;
  input PLB_SAValid;
  input PLB_rdPrim;
  input PLB_wrPrim;
  input [0:0] PLB_masterID;
  input PLB_abort;
  input PLB_busLock;
  input PLB_RNW;
  input [0:7] PLB_BE;
  input [0:1] PLB_MSize;
  input [0:3] PLB_size;
  input [0:2] PLB_type;
  input PLB_lockErr;
  input [0:63] PLB_wrDBus;
  input PLB_wrBurst;
  input PLB_rdBurst;
  input PLB_wrPendReq;
  input PLB_rdPendReq;
  input [0:1] PLB_wrPendPri;
  input [0:1] PLB_rdPendPri;
  input [0:1] PLB_reqPri;
  input [0:15] PLB_TAttribute;
  output Sl_addrAck;
  output [0:1] Sl_SSize;
  output Sl_wait;
  output Sl_rearbitrate;
  output Sl_wrDAck;
  output Sl_wrComp;
  output Sl_wrBTerm;
  output [0:63] Sl_rdDBus;
  output [0:3] Sl_rdWdAddr;
  output Sl_rdDAck;
  output Sl_rdComp;
  output Sl_rdBTerm;
  output [0:1] Sl_MBusy;
  output [0:1] Sl_MWrErr;
  output [0:1] Sl_MRdErr;
  output [0:1] Sl_MIRQ;
  output Dbg_Clk_0;
  output Dbg_TDI_0;
  input Dbg_TDO_0;
  output [0:7] Dbg_Reg_En_0;
  output Dbg_Capture_0;
  output Dbg_Shift_0;
  output Dbg_Update_0;
  output Dbg_Rst_0;
  output Dbg_Clk_1;
  output Dbg_TDI_1;
  input Dbg_TDO_1;
  output [0:7] Dbg_Reg_En_1;
  output Dbg_Capture_1;
  output Dbg_Shift_1;
  output Dbg_Update_1;
  output Dbg_Rst_1;
  output Dbg_Clk_2;
  output Dbg_TDI_2;
  input Dbg_TDO_2;
  output [0:7] Dbg_Reg_En_2;
  output Dbg_Capture_2;
  output Dbg_Shift_2;
  output Dbg_Update_2;
  output Dbg_Rst_2;
  output Dbg_Clk_3;
  output Dbg_TDI_3;
  input Dbg_TDO_3;
  output [0:7] Dbg_Reg_En_3;
  output Dbg_Capture_3;
  output Dbg_Shift_3;
  output Dbg_Update_3;
  output Dbg_Rst_3;
  output Dbg_Clk_4;
  output Dbg_TDI_4;
  input Dbg_TDO_4;
  output [0:7] Dbg_Reg_En_4;
  output Dbg_Capture_4;
  output Dbg_Shift_4;
  output Dbg_Update_4;
  output Dbg_Rst_4;
  output Dbg_Clk_5;
  output Dbg_TDI_5;
  input Dbg_TDO_5;
  output [0:7] Dbg_Reg_En_5;
  output Dbg_Capture_5;
  output Dbg_Shift_5;
  output Dbg_Update_5;
  output Dbg_Rst_5;
  output Dbg_Clk_6;
  output Dbg_TDI_6;
  input Dbg_TDO_6;
  output [0:7] Dbg_Reg_En_6;
  output Dbg_Capture_6;
  output Dbg_Shift_6;
  output Dbg_Update_6;
  output Dbg_Rst_6;
  output Dbg_Clk_7;
  output Dbg_TDI_7;
  input Dbg_TDO_7;
  output [0:7] Dbg_Reg_En_7;
  output Dbg_Capture_7;
  output Dbg_Shift_7;
  output Dbg_Update_7;
  output Dbg_Rst_7;
  output bscan_tdi;
  output bscan_reset;
  output bscan_shift;
  output bscan_update;
  output bscan_capture;
  output bscan_sel1;
  output bscan_drck1;
  input bscan_tdo1;
  output Ext_JTAG_DRCK;
  output Ext_JTAG_RESET;
  output Ext_JTAG_SEL;
  output Ext_JTAG_CAPTURE;
  output Ext_JTAG_SHIFT;
  output Ext_JTAG_UPDATE;
  output Ext_JTAG_TDI;
  input Ext_JTAG_TDO;
endmodule

module system_proc_sys_reset_0_wrapper
  (
    Slowest_sync_clk,
    Ext_Reset_In,
    Aux_Reset_In,
    MB_Debug_Sys_Rst,
    Core_Reset_Req_0,
    Chip_Reset_Req_0,
    System_Reset_Req_0,
    Core_Reset_Req_1,
    Chip_Reset_Req_1,
    System_Reset_Req_1,
    Dcm_locked,
    RstcPPCresetcore_0,
    RstcPPCresetchip_0,
    RstcPPCresetsys_0,
    RstcPPCresetcore_1,
    RstcPPCresetchip_1,
    RstcPPCresetsys_1,
    MB_Reset,
    Bus_Struct_Reset,
    Peripheral_Reset,
    Interconnect_aresetn,
    Peripheral_aresetn
  );
  input Slowest_sync_clk;
  input Ext_Reset_In;
  input Aux_Reset_In;
  input MB_Debug_Sys_Rst;
  input Core_Reset_Req_0;
  input Chip_Reset_Req_0;
  input System_Reset_Req_0;
  input Core_Reset_Req_1;
  input Chip_Reset_Req_1;
  input System_Reset_Req_1;
  input Dcm_locked;
  output RstcPPCresetcore_0;
  output RstcPPCresetchip_0;
  output RstcPPCresetsys_0;
  output RstcPPCresetcore_1;
  output RstcPPCresetchip_1;
  output RstcPPCresetsys_1;
  output MB_Reset;
  output [0:0] Bus_Struct_Reset;
  output [0:0] Peripheral_Reset;
  output [0:0] Interconnect_aresetn;
  output [0:0] Peripheral_aresetn;
endmodule

module system_readbgcop_0_to_microblaze_0_wrapper
  (
    FSL_Clk,
    SYS_Rst,
    FSL_Rst,
    FSL_M_Clk,
    FSL_M_Data,
    FSL_M_Control,
    FSL_M_Write,
    FSL_M_Full,
    FSL_S_Clk,
    FSL_S_Data,
    FSL_S_Control,
    FSL_S_Read,
    FSL_S_Exists,
    FSL_Full,
    FSL_Has_Data,
    FSL_Control_IRQ
  );
  input FSL_Clk;
  input SYS_Rst;
  output FSL_Rst;
  input FSL_M_Clk;
  input [0:31] FSL_M_Data;
  input FSL_M_Control;
  input FSL_M_Write;
  output FSL_M_Full;
  input FSL_S_Clk;
  output [0:31] FSL_S_Data;
  output FSL_S_Control;
  input FSL_S_Read;
  output FSL_S_Exists;
  output FSL_Full;
  output FSL_Has_Data;
  output FSL_Control_IRQ;
endmodule

module system_readbgcop_0_wrapper
  (
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
    FSL_M_Full,
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
    XIL_NPI_RdFIFO_Empty,
    XIL_NPI_RdFIFO_Flush,
    XIL_NPI_RdFIFO_Latency,
    XIL_NPI_RdModWr,
    XIL_NPI_InitDone,
    OUTBG_Port
  );
  input FSL_Clk;
  input FSL_Rst;
  input FSL_S_Clk;
  output FSL_S_Read;
  input [0:31] FSL_S_Data;
  input FSL_S_Control;
  input FSL_S_Exists;
  input FSL_M_Clk;
  output FSL_M_Write;
  output [0:31] FSL_M_Data;
  output FSL_M_Control;
  input FSL_M_Full;
  input system_dcm_locked;
  output [31:0] XIL_NPI_Addr;
  output XIL_NPI_AddrReq;
  input XIL_NPI_AddrAck;
  output XIL_NPI_RNW;
  output [3:0] XIL_NPI_Size;
  output [63:0] XIL_NPI_WrFIFO_Data;
  output [7:0] XIL_NPI_WrFIFO_BE;
  output XIL_NPI_WrFIFO_Push;
  input [63:0] XIL_NPI_RdFIFO_Data;
  output XIL_NPI_RdFIFO_Pop;
  input [3:0] XIL_NPI_RdFIFO_RdWdAddr;
  input XIL_NPI_WrFIFO_Empty;
  input XIL_NPI_WrFIFO_AlmostFull;
  output XIL_NPI_WrFIFO_Flush;
  input XIL_NPI_RdFIFO_Empty;
  output XIL_NPI_RdFIFO_Flush;
  input [1:0] XIL_NPI_RdFIFO_Latency;
  output XIL_NPI_RdModWr;
  input XIL_NPI_InitDone;
  output [0:31] OUTBG_Port;
endmodule

module system_microblaze_0_to_readbgcop_0_wrapper
  (
    FSL_Clk,
    SYS_Rst,
    FSL_Rst,
    FSL_M_Clk,
    FSL_M_Data,
    FSL_M_Control,
    FSL_M_Write,
    FSL_M_Full,
    FSL_S_Clk,
    FSL_S_Data,
    FSL_S_Control,
    FSL_S_Read,
    FSL_S_Exists,
    FSL_Full,
    FSL_Has_Data,
    FSL_Control_IRQ
  );
  input FSL_Clk;
  input SYS_Rst;
  output FSL_Rst;
  input FSL_M_Clk;
  input [0:31] FSL_M_Data;
  input FSL_M_Control;
  input FSL_M_Write;
  output FSL_M_Full;
  input FSL_S_Clk;
  output [0:31] FSL_S_Data;
  output FSL_S_Control;
  input FSL_S_Read;
  output FSL_S_Exists;
  output FSL_Full;
  output FSL_Has_Data;
  output FSL_Control_IRQ;
endmodule

module system_readfgcop_0_to_microblaze_0_wrapper
  (
    FSL_Clk,
    SYS_Rst,
    FSL_Rst,
    FSL_M_Clk,
    FSL_M_Data,
    FSL_M_Control,
    FSL_M_Write,
    FSL_M_Full,
    FSL_S_Clk,
    FSL_S_Data,
    FSL_S_Control,
    FSL_S_Read,
    FSL_S_Exists,
    FSL_Full,
    FSL_Has_Data,
    FSL_Control_IRQ
  );
  input FSL_Clk;
  input SYS_Rst;
  output FSL_Rst;
  input FSL_M_Clk;
  input [0:31] FSL_M_Data;
  input FSL_M_Control;
  input FSL_M_Write;
  output FSL_M_Full;
  input FSL_S_Clk;
  output [0:31] FSL_S_Data;
  output FSL_S_Control;
  input FSL_S_Read;
  output FSL_S_Exists;
  output FSL_Full;
  output FSL_Has_Data;
  output FSL_Control_IRQ;
endmodule

module system_readfgcop_0_wrapper
  (
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
    FSL_M_Full,
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
    XIL_NPI_RdFIFO_Empty,
    XIL_NPI_RdFIFO_Flush,
    XIL_NPI_RdFIFO_Latency,
    XIL_NPI_RdModWr,
    XIL_NPI_InitDone,
    OUTFG_Port
  );
  input FSL_Clk;
  input FSL_Rst;
  input FSL_S_Clk;
  output FSL_S_Read;
  input [0:31] FSL_S_Data;
  input FSL_S_Control;
  input FSL_S_Exists;
  input FSL_M_Clk;
  output FSL_M_Write;
  output [0:31] FSL_M_Data;
  output FSL_M_Control;
  input FSL_M_Full;
  input system_dcm_locked;
  output [31:0] XIL_NPI_Addr;
  output XIL_NPI_AddrReq;
  input XIL_NPI_AddrAck;
  output XIL_NPI_RNW;
  output [3:0] XIL_NPI_Size;
  output [63:0] XIL_NPI_WrFIFO_Data;
  output [7:0] XIL_NPI_WrFIFO_BE;
  output XIL_NPI_WrFIFO_Push;
  input [63:0] XIL_NPI_RdFIFO_Data;
  output XIL_NPI_RdFIFO_Pop;
  input [3:0] XIL_NPI_RdFIFO_RdWdAddr;
  input XIL_NPI_WrFIFO_Empty;
  input XIL_NPI_WrFIFO_AlmostFull;
  output XIL_NPI_WrFIFO_Flush;
  input XIL_NPI_RdFIFO_Empty;
  output XIL_NPI_RdFIFO_Flush;
  input [1:0] XIL_NPI_RdFIFO_Latency;
  output XIL_NPI_RdModWr;
  input XIL_NPI_InitDone;
  output [0:31] OUTFG_Port;
endmodule

module system_microblaze_0_to_readfgcop_0_wrapper
  (
    FSL_Clk,
    SYS_Rst,
    FSL_Rst,
    FSL_M_Clk,
    FSL_M_Data,
    FSL_M_Control,
    FSL_M_Write,
    FSL_M_Full,
    FSL_S_Clk,
    FSL_S_Data,
    FSL_S_Control,
    FSL_S_Read,
    FSL_S_Exists,
    FSL_Full,
    FSL_Has_Data,
    FSL_Control_IRQ
  );
  input FSL_Clk;
  input SYS_Rst;
  output FSL_Rst;
  input FSL_M_Clk;
  input [0:31] FSL_M_Data;
  input FSL_M_Control;
  input FSL_M_Write;
  output FSL_M_Full;
  input FSL_S_Clk;
  output [0:31] FSL_S_Data;
  output FSL_S_Control;
  input FSL_S_Read;
  output FSL_S_Exists;
  output FSL_Full;
  output FSL_Has_Data;
  output FSL_Control_IRQ;
endmodule

module system_microblaze_0_to_writecop_0_wrapper
  (
    FSL_Clk,
    SYS_Rst,
    FSL_Rst,
    FSL_M_Clk,
    FSL_M_Data,
    FSL_M_Control,
    FSL_M_Write,
    FSL_M_Full,
    FSL_S_Clk,
    FSL_S_Data,
    FSL_S_Control,
    FSL_S_Read,
    FSL_S_Exists,
    FSL_Full,
    FSL_Has_Data,
    FSL_Control_IRQ
  );
  input FSL_Clk;
  input SYS_Rst;
  output FSL_Rst;
  input FSL_M_Clk;
  input [0:31] FSL_M_Data;
  input FSL_M_Control;
  input FSL_M_Write;
  output FSL_M_Full;
  input FSL_S_Clk;
  output [0:31] FSL_S_Data;
  output FSL_S_Control;
  input FSL_S_Read;
  output FSL_S_Exists;
  output FSL_Full;
  output FSL_Has_Data;
  output FSL_Control_IRQ;
endmodule

module system_writecop_0_wrapper
  (
    FSL_Clk,
    FSL_Rst,
    FSL_S_Clk,
    FSL_S_Read,
    FSL_S_Data,
    FSL_S_Control,
    FSL_S_Exists,
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
    XIL_NPI_RdFIFO_Empty,
    XIL_NPI_RdFIFO_Flush,
    XIL_NPI_RdFIFO_Latency,
    XIL_NPI_RdModWr,
    XIL_NPI_InitDone
  );
  input FSL_Clk;
  input FSL_Rst;
  input FSL_S_Clk;
  output FSL_S_Read;
  input [0:31] FSL_S_Data;
  input FSL_S_Control;
  input FSL_S_Exists;
  input system_dcm_locked;
  output [31:0] XIL_NPI_Addr;
  output XIL_NPI_AddrReq;
  input XIL_NPI_AddrAck;
  output XIL_NPI_RNW;
  output [3:0] XIL_NPI_Size;
  output [63:0] XIL_NPI_WrFIFO_Data;
  output [7:0] XIL_NPI_WrFIFO_BE;
  output XIL_NPI_WrFIFO_Push;
  input [63:0] XIL_NPI_RdFIFO_Data;
  output XIL_NPI_RdFIFO_Pop;
  input [3:0] XIL_NPI_RdFIFO_RdWdAddr;
  input XIL_NPI_WrFIFO_Empty;
  input XIL_NPI_WrFIFO_AlmostFull;
  output XIL_NPI_WrFIFO_Flush;
  input XIL_NPI_RdFIFO_Empty;
  output XIL_NPI_RdFIFO_Flush;
  input [1:0] XIL_NPI_RdFIFO_Latency;
  output XIL_NPI_RdModWr;
  input XIL_NPI_InitDone;
endmodule

