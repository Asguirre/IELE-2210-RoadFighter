//######################################################################
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
module SC_PseuRANDOM #(parameter PseuRANDOM_DATAWIDTH=4)(
	//////////// OUTPUTS //////////
	SC_PseuRANDOM_data_OutBUS,
	//////////// INPUTS //////////
   SC_PseuRANDOM_CLOCK_50,
   SC_PseuRANDOM_RESET_InHigh
);

//======================================================
//PARAMETER DECLRATIONS
//

parameter DATAWIDTH_BUS = 4;

//  PORT declarations
//=======================================================
output [PseuRANDOM_DATAWIDTH - 1:0] SC_PseuRANDOM_data_OutBUS;
input			SC_PseuRANDOM_CLOCK_50;
input 			SC_PseuRANDOM_RESET_InHigh;

//=======================================================
//  REG/WIRE declarations
//=======================================================

reg [PseuRANDOM_DATAWIDTH - 1:0] PseuRANDOM_Register;
reg [PseuRANDOM_DATAWIDTH - 1:0] PseuRANDOM_Signal;
wire feedback;


// INPUT LOGIC : COMBINATIONAL
always @ (*)
begin
	PseuRANDOM_Signal = { PseuRANDOM_Register [2:0] , feedback };

end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_PseuRANDOM_CLOCK_50 , posedge SC_PseuRANDOM_RESET_InHigh )
begin
	if ( SC_PseuRANDOM_RESET_InHigh == 1'b1 )
		PseuRANDOM_Register <= 4'b0001 ;
	else
		PseuRANDOM_Register <= PseuRANDOM_Signal ;
end
// =======================================================
// Outputs
// =======================================================
// OUTPUT LOGIC : COMBINATIONAL
assign feedback = PseuRANDOM_Register [3]^ PseuRANDOM_Register [2];
assign SC_PseuRANDOM_data_OutBUS = PseuRANDOM_Register;

endmodule
