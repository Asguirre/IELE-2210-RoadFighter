/*######################################################################
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
///Q=======================================================
//  MODULE Definition
//=======================================================
module SC_FullADDER #(parameter FullADDER_DATAWIDTH=4)(
//////////// OUTPUTS //////////
	SC_FullADDER_sum_Out,
//////////// INPUTS //////////
	SC_FullADDER_In
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter DATAWIDTH_BUS = 4;
//=======================================================
//  PORT declarations
//=======================================================

output 	[FullADDER_DATAWIDTH - 1:0] SC_FullADDER_sum_Out;
input 	[FullADDER_DATAWIDTH - 1:0] SC_FullADDER_In;

//=======================================================Q/
///A=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
//SIMPLIFIED EQUATIONS
assign {SC_FullADDER_sum_Out} = SC_FullADDER_In[3]+SC_FullADDER_In[2]+SC_FullADDER_In[1]+SC_FullADDER_In[0];
endmodule
//=======================================================A/