//-----------------------------------------------------------------------------
// system_top.v
//-----------------------------------------------------------------------------

module system_top
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
    readbgcop_0_OUTBG_Port_pin,
    readfgcop_0_OUTFG_Port_pin,
    readbgcop_0_DUMMY_Port_pin,
    clock_generator_0_CLKOUT4_pin,
    clock_generator_0_CLKOUT5_pin,
    clockgoing_pin,
    proc_sys_reset_0_Interconnect_aresetn_pin,
    proc_sys_reset_0_Ext_Reset_In_pin
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
  output readbgcop_0_OUTBG_Port_pin;
  output readfgcop_0_OUTFG_Port_pin;
  output readbgcop_0_DUMMY_Port_pin;
  output clock_generator_0_CLKOUT4_pin;
  output clock_generator_0_CLKOUT5_pin;
  output clockgoing_pin;
  output proc_sys_reset_0_Interconnect_aresetn_pin;
  input proc_sys_reset_0_Ext_Reset_In_pin;

  (* BOX_TYPE = "user_black_box" *)
  system
    system_i (
      .fpga_0_RS232_Uart_1_RX_pin ( fpga_0_RS232_Uart_1_RX_pin ),
      .fpga_0_RS232_Uart_1_TX_pin ( fpga_0_RS232_Uart_1_TX_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_Clk_pin ( fpga_0_DDR2_SDRAM_DDR2_Clk_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin ( fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_CE_pin ( fpga_0_DDR2_SDRAM_DDR2_CE_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_CS_n_pin ( fpga_0_DDR2_SDRAM_DDR2_CS_n_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_ODT_pin ( fpga_0_DDR2_SDRAM_DDR2_ODT_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin ( fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin ( fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_WE_n_pin ( fpga_0_DDR2_SDRAM_DDR2_WE_n_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin ( fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_Addr_pin ( fpga_0_DDR2_SDRAM_DDR2_Addr_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_DQ_pin ( fpga_0_DDR2_SDRAM_DDR2_DQ_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_DM_pin ( fpga_0_DDR2_SDRAM_DDR2_DM_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_DQS_pin ( fpga_0_DDR2_SDRAM_DDR2_DQS_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin ( fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin ),
      .fpga_0_clk_1_sys_clk_pin ( fpga_0_clk_1_sys_clk_pin ),
      .fpga_0_rst_1_sys_rst_pin ( fpga_0_rst_1_sys_rst_pin ),
      .readbgcop_0_OUTBG_Port_pin ( readbgcop_0_OUTBG_Port_pin ),
      .readfgcop_0_OUTFG_Port_pin ( readfgcop_0_OUTFG_Port_pin ),
      .readbgcop_0_DUMMY_Port_pin ( readbgcop_0_DUMMY_Port_pin ),
      .clock_generator_0_CLKOUT4_pin ( clock_generator_0_CLKOUT4_pin ),
      .clock_generator_0_CLKOUT5_pin ( clock_generator_0_CLKOUT5_pin ),
      .clockgoing_pin ( clockgoing_pin ),
      .proc_sys_reset_0_Interconnect_aresetn_pin ( proc_sys_reset_0_Interconnect_aresetn_pin ),
      .proc_sys_reset_0_Ext_Reset_In_pin ( proc_sys_reset_0_Ext_Reset_In_pin )
    );
	 
//	 wire [31:0] in;
//	 assign in = readbgcop_0_OUTBG_Port_pin;
//	 wire rst;
//	 assign rst = ~proc_sys_reset_0_Ext_Reset_In_pin;
//	 wire clk;
//	 assign clk = clockgoing_pin;
//	 
//    wire [35:0] chipscope_control;
//    chipscope_icon icon(
//    .CONTROL0(chipscope_control)
//    ) /* synthesis syn_noprune = 1 */;
//    chipscope_ila ila(
//    .CONTROL(chipscope_control),
//    .CLK(clk),
//    .DATA({rst, clk,clock_generator_0_CLKOUT4_pin , 25'b0, in}),
//    .TRIG0(rst)
//    ) /* synthesis syn_noprune = 1 */;	 

endmodule

