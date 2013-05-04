//-----------------------------------------------------------------------------
// system_stub.v
//-----------------------------------------------------------------------------

module system_stub
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
      .readfgcop_0_OUTFG_Port_pin ( readfgcop_0_OUTFG_Port_pin ),
      .readbgcop_0_OUTBG_Port_pin ( readbgcop_0_OUTBG_Port_pin ),
      .clock_generator_0_CLKOUT4_pin ( clock_generator_0_CLKOUT4_pin ),
      .clock_generator_0_CLKOUT5_pin ( clock_generator_0_CLKOUT5_pin ),
      .clock_generator_0_CLKOUT6_pin ( clock_generator_0_CLKOUT6_pin ),
      .readbgcop_0_system_dcm_locked_pin ( readbgcop_0_system_dcm_locked_pin ),
      .readbgcop_0_FSL_M_Write_pin ( readbgcop_0_FSL_M_Write_pin ),
      .readfgcop_0_FSL_M_Write_pin ( readfgcop_0_FSL_M_Write_pin ),
      .readfgcop_0_FSL_S_Read_pin ( readfgcop_0_FSL_S_Read_pin ),
      .readbgcop_0_FSL_S_Read_pin ( readbgcop_0_FSL_S_Read_pin ),
      .readbgcop_0_XIL_NPI_Addr_pin ( readbgcop_0_XIL_NPI_Addr_pin ),
      .readfgcop_0_XIL_NPI_Addr_pin ( readfgcop_0_XIL_NPI_Addr_pin )
    );

endmodule

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
endmodule

