/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2024.
//######################################################################
//# Copyright (C) 2024. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
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
module BB_SYSTEM (
//////////// OUTPUTS //////////
	BB_SYSTEM_display_OutBUS,
	BB_SYSTEM_max7219DIN_Out,
	BB_SYSTEM_max7219NCS_Out,
	BB_SYSTEM_max7219CLK_Out,

//////////// INPUTS //////////
	BB_SYSTEM_CLOCK_50,
	BB_SYSTEM_RESET_InHigh,
	BB_SYSTEM_startButton_InLow, 
	BB_SYSTEM_clear_InLow, 
	BB_SYSTEM_leftButton_InLow,
	BB_SYSTEM_rightButton_InLow,
	BB_SYSTEM_left2Button_InLow,
	BB_SYSTEM_right2Button_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================
 parameter DATAWIDTH_BUS = 4;
 parameter Two_DATAWIDTH_BUS = 8;
 parameter PRESCALER_DATAWIDTH = 23;
 parameter DISPLAY_DATAWIDTH_BUS = 12;
 parameter DATA_FIXED_INITREGPOINT_0 = 4'b0100;
 parameter DATA_FIXED_INITREGPOINT_1 = 4'b0010;
  
//=======================================================
//  PORT declarations
//=======================================================
output		[DISPLAY_DATAWIDTH_BUS-1:0] BB_SYSTEM_display_OutBUS;

output		BB_SYSTEM_max7219DIN_Out;
output		BB_SYSTEM_max7219NCS_Out;
output		BB_SYSTEM_max7219CLK_Out;

input		BB_SYSTEM_CLOCK_50;
input		BB_SYSTEM_RESET_InHigh;
input		BB_SYSTEM_startButton_InLow;
input		BB_SYSTEM_leftButton_InLow;
input		BB_SYSTEM_rightButton_InLow;
input		BB_SYSTEM_left2Button_InLow;
input 	BB_SYSTEM_right2Button_InLow;
input		BB_SYSTEM_clear_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
// BUTTONs
wire 	BB_SYSTEM_startButton_InLow_cwire;
wire 	BB_SYSTEM_leftButton_InLow_cwire;
wire 	BB_SYSTEM_rightButton_InLow_cwire;
wire 	BB_SYSTEM_left2Button_InLow_cwire;
wire 	BB_SYSTEM_right2Button_InLow_cwire;

//POINT

wire	STATEMACHINEPOINT_clear_cwire;
wire	STATEMACHINEPOINT_load_cwire;
wire	STATEMACHINEPOINT2_clear_cwire;
wire	STATEMACHINEPOINT2_load_cwire;
wire	[0:3] STATEMACHINEPOINT_shiftselection_cwire;
wire	[0:3] STATEMACHINEPOINT2_shiftselection_cwire;


wire [0:3] RegPOINTTYPE_2_POINTMATRIX_data0_Out;
wire [0:3] RegPOINTTYPE2_2_POINTMATRIX_data0_Out;

//OBSTACULOS

wire [PRESCALER_DATAWIDTH-1:0] upSPEEDCOUNTER_data_BUS_wire;
wire SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire;
wire STATEMACHINEBACKG_upcount_cwire;

wire	STATEMACHINE_clear_cwire;
wire	STATEMACHINE_load_cwire;
wire 	BB_SYSTEM_clear_InLow_cwire;
wire  [DATAWIDTH_BUS-1:0] SC_PseuRANDOM_feedback_cwire;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX1_data0_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data1_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data2_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data3_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data4_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data5_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data6_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX_data7_Out;

wire	STATEMACHINE2_clear_cwire;
wire	STATEMACHINE2_load_cwire;
wire  [DATAWIDTH_BUS-1:0] SC_PseuRANDOM_feedback2_cwire;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX2_data0_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX2_data1_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX2_data2_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX2_data3_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX2_data4_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX2_data5_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX2_data6_Out;
wire  [DATAWIDTH_BUS-1:0] RegPOINTTYPE_2_POINTMATRIX2_data7_Out;



// LEVELS
//wire [2:0]SC_STATEMACHINE_LEVEL_load_cwire;
//wire  SC_STATEMACHINE_LEVEL_load_OutLow_cwire;
//wire  SC_STATEMACHINE_LOAD_LEVEL_UP_count_cwire;
//wire regGAME_death_wire;
//wire [1:0]SC_STATEMACHINE_LEVEL_ARRIVE_cwire;
//wire  [2:0]SC_upSPEEDCOUNTER_data_OutBUS_cwire;
//wire	no_time_to_live_cwire;


//SIDE COMPARATOR

wire [0:1]SIDECOMPARATOR_2_STATEMACHINEBACKG_side_L_cwire;
wire [0:1]SIDECOMPARATOR_2_STATEMACHINEBACKG_side_R_cwire;
wire [0:1]SIDECOMPARATOR2_2_STATEMACHINEBACKG_side_L_cwire;
wire [0:1]SIDECOMPARATOR2_2_STATEMACHINEBACKG_side_R_cwire;

// GAME VISUALIZATION
wire [Two_DATAWIDTH_BUS-1:0] regGAME_data7_wire;
wire [Two_DATAWIDTH_BUS-1:0] regGAME_data6_wire;
wire [Two_DATAWIDTH_BUS-1:0] regGAME_data5_wire;
wire [Two_DATAWIDTH_BUS-1:0] regGAME_data4_wire;
wire [Two_DATAWIDTH_BUS-1:0] regGAME_data3_wire;
wire [Two_DATAWIDTH_BUS-1:0] regGAME_data2_wire;
wire [Two_DATAWIDTH_BUS-1:0] regGAME_data1_wire;
wire [Two_DATAWIDTH_BUS-1:0] regGAME_data0_wire;

// To Matrix
wire 	[7:0] data_max;
wire 	[2:0] add;

wire [Two_DATAWIDTH_BUS-1:0] upCOUNTER_2_BIN2BCD1_data_BUS_wire;
wire [DISPLAY_DATAWIDTH_BUS-1:0] BIN2BCD1_2_SEVENSEG1_data_BUS_wire;

//=======================================================
//  Structural coding
//=======================================================

//######################################################################
//#	INPUTS
//######################################################################
SC_DEBOUNCE1 SC_DEBOUNCE1_u0 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_startButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_startButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u1 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_leftButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_leftButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u2 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rightButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_rightButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u8 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_left2Button_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_left2Button_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u9 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_right2Button_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_right2Button_InLow)
);


//######################################################################
//#	POINT
//######################################################################
SC_RegSHIFTER #(.RegSHIFTER_DATAWIDTH(4)) SC_RegPOINTTYPE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegSHIFTER_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	.SC_RegSHIFTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegSHIFTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegSHIFTER_clear_InLow(STATEMACHINEPOINT_clear_cwire),
	.SC_RegSHIFTER_load_InLow(STATEMACHINEPOINT_load_cwire),
	.SC_RegSHIFTER_shiftselection_In(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_RegSHIFTER_data_InBUS(DATA_FIXED_INITREGPOINT_0)

);

SC_RegSHIFTER #(.RegSHIFTER_DATAWIDTH(4)) SC_RegPOINTTYPE_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegSHIFTER_data_OutBUS(RegPOINTTYPE2_2_POINTMATRIX_data0_Out),
	.SC_RegSHIFTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegSHIFTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegSHIFTER_clear_InLow(STATEMACHINEPOINT2_clear_cwire),
	.SC_RegSHIFTER_load_InLow(STATEMACHINEPOINT2_load_cwire),
	.SC_RegSHIFTER_shiftselection_In(STATEMACHINEPOINT2_shiftselection_cwire),
	.SC_RegSHIFTER_data_InBUS(DATA_FIXED_INITREGPOINT_1)

);

SC_STATEMACHINEPOINT SC_STATEMACHINEPOINT_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEPOINT_clear_OutLow(STATEMACHINEPOINT_clear_cwire), 
	.SC_STATEMACHINEPOINT_load_OutLow(STATEMACHINEPOINT_load_cwire), 
	.SC_STATEMACHINEPOINT_shiftselection_Out(STATEMACHINEPOINT_shiftselection_cwire),
	.SC_STATEMACHINEPOINT_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEPOINT_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEPOINT_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_leftButton_InLow(BB_SYSTEM_leftButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_rightButton_InLow(BB_SYSTEM_rightButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_sidecomparator_L_InLow(SIDECOMPARATOR_2_STATEMACHINEBACKG_side_L_cwire),
	.SC_STATEMACHINEPOINT_sidecomparator_R_InLow(SIDECOMPARATOR_2_STATEMACHINEBACKG_side_R_cwire)
);

SC_STATEMACHINEPOINT SC_STATEMACHINEPOINT_u1 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEPOINT_clear_OutLow(STATEMACHINEPOINT2_clear_cwire), 
	.SC_STATEMACHINEPOINT_load_OutLow(STATEMACHINEPOINT2_load_cwire), 
	.SC_STATEMACHINEPOINT_shiftselection_Out(STATEMACHINEPOINT2_shiftselection_cwire),
	.SC_STATEMACHINEPOINT_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEPOINT_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEPOINT_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire), 
	.SC_STATEMACHINEPOINT_leftButton_InLow(BB_SYSTEM_left2Button_InLow_cwire), 
	.SC_STATEMACHINEPOINT_rightButton_InLow(BB_SYSTEM_right2Button_InLow_cwire), 
	.SC_STATEMACHINEPOINT_sidecomparator_L_InLow(SIDECOMPARATOR2_2_STATEMACHINEBACKG_side_L_cwire),
	.SC_STATEMACHINEPOINT_sidecomparator_R_InLow(SIDECOMPARATOR2_2_STATEMACHINEBACKG_side_R_cwire)
);

//######################################################################
//#	COMPARATOR END OF MATRIX (BOTTON SIDE)
//######################################################################
CC_SIDECOMPARATOR #(.SIDECOMPARATOR_DATAWIDTH(4)) CC_SIDECOMPARATOR_u0 (
	.CC_SIDECOMPARATOR_side_L_OutLow(SIDECOMPARATOR_2_STATEMACHINEBACKG_side_L_cwire),
	.CC_SIDECOMPARATOR_side_R_OutLow(SIDECOMPARATOR_2_STATEMACHINEBACKG_side_R_cwire),
	.CC_SIDECOMPARATOR_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data0_Out),
	.CC_SIDECOMPARATOR2_side_L_OutLow(SIDECOMPARATOR2_2_STATEMACHINEBACKG_side_L_cwire),
	.CC_SIDECOMPARATOR2_side_R_OutLow(SIDECOMPARATOR2_2_STATEMACHINEBACKG_side_R_cwire),
	.CC_SIDECOMPARATOR2_data_InBUS(RegPOINTTYPE2_2_POINTMATRIX_data0_Out)
);


//######################################################################
//#	OBSTACULOS
//######################################################################

SC_DEBOUNCE1 SC_DEBOUNCE1_u3 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_clear_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(BB_SYSTEM_clear_InLow)
);

SC_PseuRANDOM SC_PseuRANDOM_u0 (
// port map - connection between master ports and signals/registers   
	.SC_PseuRANDOM_data_OutBUS(SC_PseuRANDOM_feedback_cwire),
	.SC_PseuRANDOM_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_PseuRANDOM_RESET_InHigh(BB_SYSTEM_RESET_InHigh)
);



SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u16 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX1_data0_Out),
	.SC_RegGENERAL_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SC_STATEMACHINE_LEVEL_load_OutLow_cwire),
	.SC_RegGENERAL_data_InBUS(SC_PseuRANDOM_feedback_cwire)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX1_data0_Out)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u1 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data1_Out)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u2 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data2_Out)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u3 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data3_Out)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u4 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data4_Out)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u5 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data5_Out)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u6 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data6_Out)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u7 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(BB_SYSTEM_data_OutBUS),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX_data7_Out)
);

//====================================================================================================
// Objetos J2
//====================================================================================================



SC_PseuRANDOM SC_PseuRANDOM_u1 (
// port map - connection between master ports and signals/registers   
	.SC_PseuRANDOM_data_OutBUS(SC_PseuRANDOM_feedback2_cwire),
	.SC_PseuRANDOM_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_PseuRANDOM_RESET_InHigh(BB_SYSTEM_RESET_InHigh)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u8 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX2_data1_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(SC_PseuRANDOM_feedback2_cwire)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u9 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX2_data2_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX2_data1_Out)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u10 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX2_data3_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX2_data2_Out)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u11 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX2_data4_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX2_data3_Out)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u12 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX2_data5_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX2_data4_Out)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u13 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX2_data6_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX2_data5_Out)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u14 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(RegPOINTTYPE_2_POINTMATRIX2_data7_Out),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX2_data6_Out)
);

SC_RegGENERAL #(.RegGENERAL_DATAWIDTH(DATAWIDTH_BUS)) SC_RegGENERAL_u15 (
// port map - connection between master ports and signals/registers   
	.SC_RegGENERAL_data_OutBUS(BB_SYSTEM_data2_OutBUS),
	.SC_RegGENERAL_CLOCK_50(STATEMACHINEBACKG_upcount_cwire),
	.SC_RegGENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegGENERAL_clear_InLow(STATEMACHINE_clear_cwire),
	.SC_RegGENERAL_load_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.SC_RegGENERAL_data_InBUS(RegPOINTTYPE_2_POINTMATRIX2_data7_Out)
);


//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


//SC_STATEMACHINE_LEVELS SC_STATEMACHINE_LEVELS_u0 (
	//.SC_STATEMACHINE_LOAD_LEVEL_DeadFlag_In,
	//.SC_STATEMACHINE_LOAD_LEVEL_load,
	//.SC_STATEMACHINE_LEVELS_clear_OutLow,
	
	//.SC_STATEMACHINE_LEVELS_CLOCK_50,
	//.SC_STATEMACHINE_LEVELS_RESET_InHigh,
	//.SC_STATEMACHINE_LEVELS_startButton_InLow,
	//.SC_STATEMACHINE_LEVELS_Level(SC_STATEMACHINE_LEVEL_ARRIVE_cwire),
	//.SC_STATEMACHINE_LEVELS_DeadFlag(no_time_to_live_cwire),
	//.SC_STATEMACHINE_LEVELS_DeadComparator,
	//.SC_STATEMACHINE_LEVELS_ObjCount,
	//.SC_STATEMACHINE_LEVELS_load
//);
//SC_upCOUNTER_2 #(.upconunter_tam(DATAWIDTH_BUS)) SC_upCOUNTER_2_u0 (
// port map - connection between master ports and signals/registers   
	//.SC_upCOUNTER_data_OutBUS(upCOUNTER_2_BIN2BCD1_data_BUS_wire),
	//.SC_upCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	//.SC_upCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	//.SC_upCOUNTER_upcount_InLow(STATEMACHINEPOINT_shiftselection_cwire[1])
//);



//====================================================================================================
// Clock objetos
//====================================================================================================


SC_upSPEEDCOUNTER #(.upSPEEDCOUNTER_DATAWIDTH(PRESCALER_DATAWIDTH)) SC_upSPEEDCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upSPEEDCOUNTER_data_OutBUS(upSPEEDCOUNTER_data_BUS_wire),
	.SC_upSPEEDCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upSPEEDCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upSPEEDCOUNTER_upcount_InLow(STATEMACHINEBACKG_upcount_cwire)
);

CC_SPEEDCOMPARATOR #(.SPEEDCOMPARATOR_DATAWIDTH(PRESCALER_DATAWIDTH)) CC_SPEEDCOMPARATOR_u0 (
	.CC_SPEEDCOMPARATOR_T0_OutLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire),
	.CC_SPEEDCOMPARATOR_data_InBUS(upSPEEDCOUNTER_data_BUS_wire)
);
SC_STATEMACHINEBACKG SC_STATEMACHINEBACKG_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINEBACKG_clear_OutLow(STATEMACHINE_clear_cwire), 
	.SC_STATEMACHINEBACKG_load_OutLow(STATEMACHINE_load_cwire), 
	.SC_STATEMACHINEBACKG_upcount_out(STATEMACHINEBACKG_upcount_cwire),
	.SC_STATEMACHINEBACKG_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINEBACKG_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINEBACKG_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINEBACKG_T0_InLow(SPEEDCOMPARATOR_2_STATEMACHINEBACKG_T0_cwire)
);




//######################################################################
//#	TO LED MATRIZ: VISUALIZATION
//######################################################################
assign regGAME_data0_wire = {(RegPOINTTYPE_2_POINTMATRIX_data0_Out|BB_SYSTEM_data_OutBUS), (RegPOINTTYPE2_2_POINTMATRIX_data0_Out | BB_SYSTEM_data2_OutBUS)};
assign regGAME_data1_wire = {RegPOINTTYPE_2_POINTMATRIX_data7_Out, RegPOINTTYPE_2_POINTMATRIX2_data7_Out};
assign regGAME_data2_wire = {RegPOINTTYPE_2_POINTMATRIX_data6_Out, RegPOINTTYPE_2_POINTMATRIX2_data6_Out};
assign regGAME_data3_wire = {RegPOINTTYPE_2_POINTMATRIX_data5_Out, RegPOINTTYPE_2_POINTMATRIX2_data5_Out};
assign regGAME_data4_wire = {RegPOINTTYPE_2_POINTMATRIX_data4_Out, RegPOINTTYPE_2_POINTMATRIX2_data4_Out};
assign regGAME_data5_wire = {RegPOINTTYPE_2_POINTMATRIX_data3_Out, RegPOINTTYPE_2_POINTMATRIX2_data3_Out};
assign regGAME_data6_wire = {RegPOINTTYPE_2_POINTMATRIX_data2_Out, RegPOINTTYPE_2_POINTMATRIX2_data2_Out};
assign regGAME_data7_wire = {RegPOINTTYPE_2_POINTMATRIX_data1_Out, RegPOINTTYPE_2_POINTMATRIX2_data1_Out};

assign data_max =(add==3'b000)?{regGAME_data0_wire[7],regGAME_data1_wire[7],regGAME_data2_wire[7],regGAME_data3_wire[7],regGAME_data4_wire[7],regGAME_data5_wire[7],regGAME_data6_wire[7],regGAME_data7_wire[7]}:
	       (add==3'b001)?{regGAME_data0_wire[6],regGAME_data1_wire[6],regGAME_data2_wire[6],regGAME_data3_wire[6],regGAME_data4_wire[6],regGAME_data5_wire[6],regGAME_data6_wire[6],regGAME_data7_wire[6]}:
	       (add==3'b010)?{regGAME_data0_wire[5],regGAME_data1_wire[5],regGAME_data2_wire[5],regGAME_data3_wire[5],regGAME_data4_wire[5],regGAME_data5_wire[5],regGAME_data6_wire[5],regGAME_data7_wire[5]}:
	       (add==3'b011)?{regGAME_data0_wire[4],regGAME_data1_wire[4],regGAME_data2_wire[4],regGAME_data3_wire[4],regGAME_data4_wire[4],regGAME_data5_wire[4],regGAME_data6_wire[4],regGAME_data7_wire[4]}:
	       (add==3'b100)?{regGAME_data0_wire[3],regGAME_data1_wire[3],regGAME_data2_wire[3],regGAME_data3_wire[3],regGAME_data4_wire[3],regGAME_data5_wire[3],regGAME_data6_wire[3],regGAME_data7_wire[3]}:
	       (add==3'b101)?{regGAME_data0_wire[2],regGAME_data1_wire[2],regGAME_data2_wire[2],regGAME_data3_wire[2],regGAME_data4_wire[2],regGAME_data5_wire[2],regGAME_data6_wire[2],regGAME_data7_wire[2]}:
	       (add==3'b110)?{regGAME_data0_wire[1],regGAME_data1_wire[1],regGAME_data2_wire[1],regGAME_data3_wire[1],regGAME_data4_wire[1],regGAME_data5_wire[1],regGAME_data6_wire[1],regGAME_data7_wire[1]}:
						{regGAME_data0_wire[0],regGAME_data1_wire[0],regGAME_data2_wire[0],regGAME_data3_wire[0],regGAME_data4_wire[0],regGAME_data5_wire[0],regGAME_data6_wire[0],regGAME_data7_wire[0]};							 
									 
matrix_ctrl matrix_ctrl_unit_0( 
.max7219_din(BB_SYSTEM_max7219DIN_Out),//max7219_din 
.max7219_ncs(BB_SYSTEM_max7219NCS_Out),//max7219_ncs 
.max7219_clk(BB_SYSTEM_max7219CLK_Out),//max7219_clk
.disp_data(data_max), 
.disp_addr(add),
.intensity(4'hA),
.clk(BB_SYSTEM_CLOCK_50),
.reset(BB_SYSTEM_RESET_InHigh) //~lowRst_System
 ); 
 
//~ imagen img1(
//~ .act_add(add), 
//~ .max_in(data_max) );

//~ SC_CTRLMATRIX SC_CTRLMATRIX_u0( 
//~ .SC_CTRLMATRIX_max7219DIN_Out(BB_SYSTEM_max7219DIN_Out),	//max7219_din 
//~ .SC_CTRLMATRIX_max7219NCS_out(BB_SYSTEM_max7219NCS_Out),	//max7219_ncs 
//~ .SC_CTRLMATRIX_max7219CLK_Out(BB_SYSTEM_max7219CLK_Out),	//max7219_clk
//~ .SC_CTRLMATRIX_dispdata(data_max), 
//~ .SC_CTRLMATRIX_dispaddr(add),
//~ .SC_CTRLMATRIX_intensity(4'hA),
//~ .SC_CTRLMATRIX_CLOCK_50(BB_SYSTEM_CLOCK_50),
//~ .SC_CTRLMATRIX_RESET_InHigh(BB_SYSTEM_RESET_InHigh) 		//~lowRst_System
 //~ ); 
 
//~ SC_IMAGE SC_IMAGE_u0(
//~ .SC_IMAGE_actadd(add), 
//~ .SC_IMAGE_maxin(data_max) );

//######################################################################
//#	TO TEST
//######################################################################


//######################################################################
//#	TO 7SEG
//######################################################################
CC_BIN2BCD1 CC_BIN2BCD1_u0 (
// port map - connection between master ports and signals/registers   
	.CC_BIN2BCD_bcd_OutBUS(BIN2BCD1_2_SEVENSEG1_data_BUS_wire),
	.CC_BIN2BCD_bin_InBUS(upCOUNTER_2_BIN2BCD1_data_BUS_wire)
);

CC_SEVENSEG1 CC_SEVENSEG1_u0 (
// port map - connection between master ports and signals/registers   
	.CC_SEVENSEG1_an(BB_SYSTEM_display_OutBUS[11:8]),
	.CC_SEVENSEG1_a(BB_SYSTEM_display_OutBUS[0]),
	.CC_SEVENSEG1_b(BB_SYSTEM_display_OutBUS[1]),
	.CC_SEVENSEG1_c(BB_SYSTEM_display_OutBUS[2]),
	.CC_SEVENSEG1_d(BB_SYSTEM_display_OutBUS[3]),
	.CC_SEVENSEG1_e(BB_SYSTEM_display_OutBUS[4]),
	.CC_SEVENSEG1_f(BB_SYSTEM_display_OutBUS[5]),
	.CC_SEVENSEG1_g(BB_SYSTEM_display_OutBUS[6]),
	.CC_SEVENSEG1_dp(BB_SYSTEM_display_OutBUS[7]),
	.CC_SEVENSEG1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.CC_SEVENSEG1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.CC_SEVENSEG1_in0(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[3:0]),
	.CC_SEVENSEG1_in1(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[7:4]),
	.CC_SEVENSEG1_in2(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[11:8]),
	.CC_SEVENSEG1_in3(BIN2BCD1_2_SEVENSEG1_data_BUS_wire[11:8])
);

SC_upCOUNTER #(.upCOUNTER_DATAWIDTH(DATAWIDTH_BUS)) SC_upCOUNTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_upCOUNTER_data_OutBUS(upCOUNTER_2_BIN2BCD1_data_BUS_wire),
	.SC_upCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_upCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_upCOUNTER_upcount_InLow(STATEMACHINEPOINT_shiftselection_cwire[1])
);

endmodule
