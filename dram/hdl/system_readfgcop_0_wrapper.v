//-----------------------------------------------------------------------------
// system_readfgcop_0_wrapper.v
//-----------------------------------------------------------------------------

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
  output OUTFG_Port;

  readfgcop
    #(
      .C_PI_ADDR_WIDTH ( 'h00000020 ),
      .C_PI_DATA_WIDTH ( 'h00000040 ),
      .C_PI_BE_WIDTH ( 'h00000008 ),
      .C_PI_RDWDADDR_WIDTH ( 'h00000004 )
    )
    readfgcop_0 (
      .FSL_Clk ( FSL_Clk ),
      .FSL_Rst ( FSL_Rst ),
      .FSL_S_Clk ( FSL_S_Clk ),
      .FSL_S_Read ( FSL_S_Read ),
      .FSL_S_Data ( FSL_S_Data ),
      .FSL_S_Control ( FSL_S_Control ),
      .FSL_S_Exists ( FSL_S_Exists ),
      .FSL_M_Clk ( FSL_M_Clk ),
      .FSL_M_Write ( FSL_M_Write ),
      .FSL_M_Data ( FSL_M_Data ),
      .FSL_M_Control ( FSL_M_Control ),
      .FSL_M_Full ( FSL_M_Full ),
      .system_dcm_locked ( system_dcm_locked ),
      .XIL_NPI_Addr ( XIL_NPI_Addr ),
      .XIL_NPI_AddrReq ( XIL_NPI_AddrReq ),
      .XIL_NPI_AddrAck ( XIL_NPI_AddrAck ),
      .XIL_NPI_RNW ( XIL_NPI_RNW ),
      .XIL_NPI_Size ( XIL_NPI_Size ),
      .XIL_NPI_WrFIFO_Data ( XIL_NPI_WrFIFO_Data ),
      .XIL_NPI_WrFIFO_BE ( XIL_NPI_WrFIFO_BE ),
      .XIL_NPI_WrFIFO_Push ( XIL_NPI_WrFIFO_Push ),
      .XIL_NPI_RdFIFO_Data ( XIL_NPI_RdFIFO_Data ),
      .XIL_NPI_RdFIFO_Pop ( XIL_NPI_RdFIFO_Pop ),
      .XIL_NPI_RdFIFO_RdWdAddr ( XIL_NPI_RdFIFO_RdWdAddr ),
      .XIL_NPI_WrFIFO_Empty ( XIL_NPI_WrFIFO_Empty ),
      .XIL_NPI_WrFIFO_AlmostFull ( XIL_NPI_WrFIFO_AlmostFull ),
      .XIL_NPI_WrFIFO_Flush ( XIL_NPI_WrFIFO_Flush ),
      .XIL_NPI_RdFIFO_Empty ( XIL_NPI_RdFIFO_Empty ),
      .XIL_NPI_RdFIFO_Flush ( XIL_NPI_RdFIFO_Flush ),
      .XIL_NPI_RdFIFO_Latency ( XIL_NPI_RdFIFO_Latency ),
      .XIL_NPI_RdModWr ( XIL_NPI_RdModWr ),
      .XIL_NPI_InitDone ( XIL_NPI_InitDone ),
      .OUTFG_Port ( OUTFG_Port )
    );

endmodule

