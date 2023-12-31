/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2024.
//######################################################################
//# Copyright (C) 224. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
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
//########################################sim:/TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINEPOINT_u0/SC_STATEMACHINEPOINT_load_OutLow############################*/
//=======================================================
//  MODULE Definition
//=======================================================
module CC_SIDECOMPARATOR #(parameter SIDECOMPARATOR_DATAWIDTH=4)(
//////////// OUTPUTS //////////
	CC_SIDECOMPARATOR_side_R_OutLow,
	CC_SIDECOMPARATOR_side_L_OutLow,
	CC_SIDECOMPARATOR2_side_R_OutLow,
	CC_SIDECOMPARATOR2_side_L_OutLow,
//////////// INPUTS //////////
	CC_SIDECOMPARATOR2_data_InBUS,
	CC_SIDECOMPARATOR_data_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg CC_SIDECOMPARATOR_side_R_OutLow;
output	reg CC_SIDECOMPARATOR_side_L_OutLow;
output	reg CC_SIDECOMPARATOR2_side_R_OutLow;
output	reg CC_SIDECOMPARATOR2_side_L_OutLow;
input 	[SIDECOMPARATOR_DATAWIDTH-1:0] CC_SIDECOMPARATOR_data_InBUS;
input 	[SIDECOMPARATOR_DATAWIDTH-1:0] CC_SIDECOMPARATOR2_data_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
    if (CC_SIDECOMPARATOR_data_InBUS == 4'b0001)
	 begin
	 
		  CC_SIDECOMPARATOR_side_R_OutLow = 1'b0;
		  CC_SIDECOMPARATOR_side_L_OutLow = 1'b1;
		  end
		  
		  
    else if (CC_SIDECOMPARATOR_data_InBUS == 4'b1000)
	 begin
		  CC_SIDECOMPARATOR_side_L_OutLow = 1'b0;
		  CC_SIDECOMPARATOR_side_R_OutLow = 1'b1;
		  end
    else begin 
	 
        CC_SIDECOMPARATOR_side_R_OutLow = 1'b1;
		  CC_SIDECOMPARATOR_side_L_OutLow = 1'b1;
		end  
		  
end
	
always @(*)
begin	
		  
    if (CC_SIDECOMPARATOR2_data_InBUS == 4'b0001)
	 begin
	 
		  CC_SIDECOMPARATOR2_side_R_OutLow = 1'b0;
		  CC_SIDECOMPARATOR2_side_L_OutLow = 1'b1;
		  end
		  
		  
    else if (CC_SIDECOMPARATOR2_data_InBUS == 4'b1000)
	 begin
		  CC_SIDECOMPARATOR2_side_L_OutLow = 1'b0;
		  CC_SIDECOMPARATOR2_side_R_OutLow = 1'b1;
		  end
    else begin 
	 
        CC_SIDECOMPARATOR2_side_R_OutLow = 1'b1;
		  CC_SIDECOMPARATOR2_side_L_OutLow = 1'b1;
		end  
		  
		  
end

endmodule
