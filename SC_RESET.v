
//=======================================================
//  MODULE Definition
//=======================================================
module SC_RESET(
	//////////// OUTPUTS //////////
	SC_RESET_SIGNAL_OUT,
	//////////// INPUTS //////////
	SC_RESET_CLOCK_50,
	SC_RESET_RESET_InHigh,
	SC_RESET_STATEMACHINEGENERAL_InHigh
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	SC_RESET_SIGNAL_OUT;
input	SC_RESET_CLOCK_50;
input	SC_RESET_RESET_InHigh;
input	SC_RESET_STATEMACHINEGENERAL_InHigh;


assign SC_RESET_SIGNAL_OUT = SC_RESET_RESET_InHigh | SC_RESET_STATEMACHINEGENERAL_InHigh;

endmodule
