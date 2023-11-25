//=======================================================
//  MODULE Definition
//=======================================================
module SC_STATEMACHINE_LEVELS(
	//////////// OUTPUTS //////////
	SC_STATEMACHINE_LOAD_LEVEL_DeadFlag_In,
	SC_STATEMACHINE_LOAD_LEVEL_load,
	SC_STATEMACHINE_LEVELS_clear_OutLow,
	//////////// INPUTS //////////
	SC_STATEMACHINE_LEVELS_CLOCK_50,
	SC_STATEMACHINE_LEVELS_RESET_InHigh,
	SC_STATEMACHINE_LEVELS_startButton_InLow,
	SC_STATEMACHINE_LEVELS_Level,
	SC_STATEMACHINE_LEVELS_DeadFlag,
	SC_STATEMACHINE_LEVELS_DeadComparator,
	SC_STATEMACHINE_LEVELS_ObjCount,
	SC_STATEMACHINE_LEVELS_load
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam STATE_CHECK_0									= 2;
localparam STATE_INIT_0										= 3;
localparam STATE_INIT_1										= 4;
localparam STATE_LEVEL_1									= 5;
localparam STATE_LEVEL_2									= 6;
localparam STATE_LEVEL_3									= 7;
localparam STATE_LOAD										= 8;
localparam STATE_DEAD										= 9;



//=======================================================
//  PORT declarations
//=======================================================
output reg		SC_STATEMACHINE_LOAD_LEVEL_DeadFlag;
output reg		SC_STATEMACHINE_LOAD_LEVEL_load;
output reg		SC_STATEMACHINE_LEVELS_clear_OutLow;
input					SC_STATEMACHINE_LEVELS_CLOCK_50;
input 				SC_STATEMACHINE_LEVELS_RESET_InHigh;
input					SC_STATEMACHINE_LEVELS_startButton_InLow;
input					SC_STATEMACHINE_LEVELS_Level;
input					SC_STATEMACHINE_LEVELS_DeadFlag;
input					SC_STATEMACHINE_LEVELS_DeadComparator;
input					SC_STATEMACHINE_LEVELS_ObjCount;
input					SC_STATEMACHINE_LEVELS_load;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] STATE_Register;
reg [3:0] STATE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*)
begin
	case (STATE_Register)
		STATE_RESET_0: STATE_Signal = STATE_START_0;
		STATE_START_0: STATE_Signal = STATE_CHECK_0;
		STATE_CHECK_0: if (SC_STATEMACHINE_LEVELS_startButton_InLow == 1'b0) STATE_Signal = STATE_INIT_0;
						else if ((SC_STATEMACHINE_LEVELS_DeadComparator == 1'b0) | (SC_STATEMACHINE_LEVELS_DeadFlag)) STATE_Signal = STATE_DEAD;
						else if (SC_STATEMACHINE_LEVELS_load == 1'b0) STATE_LOAD
						else if (SC_STATEMACHINE_LEVELS_Level == 2'b01) STATE_Signal = STATE_LEVEL_1;
						else if (SC_STATEMACHINE_LEVELS_Level == 2'b10) STATE_Signal = STATE_LEVEL_2;
						else STATE_Signal = STATE_COUNT_0;
		STATE_INIT_0:	STATE_Signal = STATE_CHECK_1;
		STATE_SHIFT_0: 	STATE_Signal = STATE_COUNT_0;
		STATE_COUNT_0: 	STATE_Signal = STATE_CHECK_0;
		
		STATE_CHECK_1: if (SC_STATEMACHINEBACKG_startButton_InLow == 1'b0) STATE_Signal = STATE_CHECK_1;
						else STATE_Signal = STATE_CHECK_0;

		default : 		STATE_Signal = STATE_CHECK_0;
	endcase
end

// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINE_LEVELS_CLOCK_50 , posedge SC_STATEMACHINE_LEVELS_RESET_InHigh)
begin
	if (SC_STATEMACHINE_LEVELS_RESET_InHigh == 1'b1)
		STATE_Register <= STATE_RESET_0;
	else
		STATE_Register <= STATE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
always @ (*)
begin
	case (STATE_Register)
//=========================================================
// STATE_RESET
//=========================================================
	STATE_RESET_0 :	
		begin
			SC_STATEMACHINE_LEVELS_clear_OutLow = 1'b1;
			SC_STATEMACHINE_LOAD_LEVEL_load = 1'b1;
		end
//=========================================================
// STATE_START
//=========================================================
	STATE_START_0 :	
		begin
			SC_STATEMACHINE_LEVELS_clear_OutLow = 1'b1;
			SC_STATEMACHINE_LOAD_LEVEL_load = 1'b1;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_0 :
		begin
			SC_STATEMACHINE_LEVELS_clear_OutLow = 1'b1;
			SC_STATEMACHINE_LOAD_LEVEL_load = 1'b1;
		end
//=========================================================
// STATE_INIT_0
//=========================================================
	STATE_INIT_0 :	
		begin
			SC_STATEMACHINE_LEVELS_clear_OutLow = 1'b0;
			SC_STATEMACHINE_LOAD_LEVEL_load = 1'b1;
		end
//=========================================================
// STATE_INIT_1
//=========================================================
	STATE_INIT_1 :	
		begin
			SC_STATEMACHINE_LEVELS_clear_OutLow = 1'b1;
			SC_STATEMACHINE_LOAD_LEVEL_load = 1'b0;; 
		end

//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
			SC_STATEMACHINE_LEVELS_clear_OutLow = 1'b1;
			SC_STATEMACHINE_LOAD_LEVEL_load = 1'b1;
		end
	endcase
end
endmodule

