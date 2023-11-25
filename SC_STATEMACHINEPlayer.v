///*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module SC_STATEMACHINEPlayer (
	//////////// OUTPUTS //////////
	SC_STATEMACHINEPlayer_DeadFlag_OutLow,
	SC_STATEMACHINEPlayer_Load_OutLow,
	SC_STATEMACHINEPlayer_STATEMACHINEChangeLevel_OutLow,
	SC_STATEMACHINEPlayer_Cont_num_clear_OutLow,
	//////////// INPUTS //////////
	SC_STATEMACHINEPlayer_CLOCK_50,//
	SC_STATEMACHINEPlayer_RESET_InHigh,//
	SC_STATEMACHINEPlayer_startButton_InLow,//
	SC_STATEMACHINEPlayer_DeadFlag,//
	SC_STATEMACHINEPlayer_DeadComparator,//
	SC_STATEMACHINEPlayer_Count_num,//
	SC_STATEMACHINEPlayer_Count
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_START_0									= 1;
localparam STATE_CHECK_0									= 2;
localparam STATE_LOAD_0										= 3; 
localparam STATE_LOAD_1										= 4; 
localparam STATE_DEATH										= 5;
localparam STATE_LEVEL1_0									= 6;
localparam STATE_LEVEL1_1 									= 7;
localparam STATE_LEVEL2_0									= 8;
localparam STATE_LEVEL2_1 									= 9;
localparam STATE_LEVEL3_0									= 10;
localparam STATE_LEVEL3_1 									= 11;
//=======================================================
//  PORT declarations
//=======================================================

output reg 	SC_STATEMACHINEPlayer_DeadFlag_OutLow;
output reg	SC_STATEMACHINEPlayer_Load_OutLow;
output reg	SC_STATEMACHINEPlayer_STATEMACHINEChangeLevel_OutLow;
output reg  SC_STATEMACHINEPlayer_Cont_num_clear_OutLow;

input SC_STATEMACHINEPlayer_CLOCK_50;
input SC_STATEMACHINEPlayer_RESET_InHigh;
input SC_STATEMACHINEPlayer_startButton_InLow;
input SC_STATEMACHINEPlayer_DeadFlag;
input SC_STATEMACHINEPlayer_DeadComparator;
input SC_STATEMACHINEPlayer_Count_num;
input SC_STATEMACHINEPlayer_Count;
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
		STATE_CHECK_0: if (SC_STATEMACHINEPlayer_DeadComparator ==1'b0) STATE_Signal = STATE_DEATH;
							else if (SC_STATEMACHINEPlayer_DeadFlag == 1'b0) STATE_Signal = STATE_DEATH;
							else if (SC_STATEMACHINEPlayer_Count == 1'b0) STATE_Signal = STATE_LOAD_0;
							else if (SC_STATEMACHINEPlayer_Count_num == 6'b101000) STATE_Signal = STATE_LEVEL3_0;
							else if (SC_STATEMACHINEPlayer_Count_num == 6'b101101) STATE_Signal = STATE_LEVEL2_0;
							else if (SC_STATEMACHINEPlayer_Count_num == 6'b101000) STATE_Signal = STATE_LEVEL1_0;
							else STATE_Signal = STATE_CHECK_0;
		STATE_LEVEL1_0 : STATE_Signal = STATE_LEVEL1_1;
		STATE_LEVEL1_1 : if (SC_STATEMACHINEPlayer_Count == 1'b0) STATE_Signal = STATE_LOAD_0;
						  	  else STATE_Signal = STATE_LEVEL1_1;
		STATE_LEVEL2_0 : STATE_Signal = STATE_LEVEL2_1;
		STATE_LEVEL2_1 : if (SC_STATEMACHINEPlayer_Count == 1'b0) STATE_Signal = STATE_LOAD_0;
						  	  else STATE_Signal = STATE_LEVEL2_1;
		STATE_LEVEL3_0 : STATE_Signal = STATE_LEVEL3_1;
		STATE_LEVEL3_1 : if (SC_STATEMACHINEPlayer_Count == 1'b0) STATE_Signal = STATE_LOAD_0;
						  	  else STATE_Signal = STATE_LEVEL3_1;
		STATE_DEATH: STATE_Signal = STATE_CHECK_0;	
		default : 		STATE_Signal = STATE_CHECK_0;
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINEPlayer_CLOCK_50 , posedge SC_STATEMACHINEPlayer_RESET_InHigh)
begin
	if (SC_STATEMACHINEPlayer_RESET_InHigh == 1'b1)
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
			SC_STATEMACHINEPlayer_DeadFlag_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Load_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_STATEMACHINEChangeLevel_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Cont_num_clear_OutLow = 1'b1;
		end
//=========================================================
// STATE_START
//=========================================================
	STATE_START_0 :	
		begin
			SC_STATEMACHINEPlayer_DeadFlag_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Load_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_STATEMACHINEChangeLevel_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Cont_num_clear_OutLow = 1'b1;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_0 :
		begin
			SC_STATEMACHINEPlayer_DeadFlag_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Load_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_STATEMACHINEChangeLevel_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Cont_num_clear_OutLow = 1'b1;
		end
//=========================================================
// STATE_DEATH
//=========================================================
	STATE_DEATH :
		begin
			SC_STATEMACHINEPlayer_DeadFlag_OutLow = 1'b0;
			SC_STATEMACHINEPlayer_Load_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_STATEMACHINEChangeLevel_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Cont_num_clear_OutLow = 1'b1;
		end
//=========================================================
// STATE_LEVEL1
//=========================================================
	STATE_LEVEL1_0 :
		begin
			SC_STATEMACHINEPlayer_DeadFlag_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Load_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_STATEMACHINEChangeLevel_OutLow = 1'b0;
			SC_STATEMACHINEPlayer_Cont_num_clear_OutLow = 1'b1;
		end
	STATE_LEVEL1_1 :
		begin
			SC_STATEMACHINEPlayer_DeadFlag_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Load_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_STATEMACHINEChangeLevel_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Cont_num_clear_OutLow = 1'b1;
		end

//=========================================================
// STATE_LEVEL2
//=========================================================
	STATE_LEVEL2_0 :
		begin
			SC_STATEMACHINEPlayer_DeadFlag_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Load_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_STATEMACHINEChangeLevel_OutLow = 1'b0;
			SC_STATEMACHINEPlayer_Cont_num_clear_OutLow = 1'b1;
		end
	STATE_LEVEL2_1 :
		begin
			SC_STATEMACHINEPlayer_DeadFlag_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Load_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_STATEMACHINEChangeLevel_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Cont_num_clear_OutLow = 1'b1;
		end		

//=========================================================
// STATE_LEVEL3
//=========================================================
	STATE_LEVEL3_0 :
		begin
			SC_STATEMACHINEPlayer_DeadFlag_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Load_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_STATEMACHINEChangeLevel_OutLow = 1'b0;
			SC_STATEMACHINEPlayer_Cont_num_clear_OutLow = 1'b1;
		end
	STATE_LEVEL3_1 :
		begin
			SC_STATEMACHINEPlayer_DeadFlag_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Load_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_STATEMACHINEChangeLevel_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Cont_num_clear_OutLow = 1'b1;
		end		

//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
			SC_STATEMACHINEPlayer_DeadFlag_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_Load_OutLow = 1'b1;
			SC_STATEMACHINEPlayer_STATEMACHINEChangeLevel_OutLow = 1'b1;
		end
	endcase
end
endmodule
