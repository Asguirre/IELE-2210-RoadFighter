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
module SC_Comparator_obj #(parameter Comparator_DATAWIDTH=4)
(
/////////OUTPUTS/////////
    SC_Comparator_Obj_OutLow,
/////////INPUTS//////////
	 SC_Comparator_obj_data_InBUS1,
    SC_Comparator_obj_data_InBUS2

);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input	[Comparator_DATAWIDTH-1:0] SC_Comparator_obj_data_InBUS1;
input [Comparator_DATAWIDTH-1:0] SC_Comparator_obj_data_InBUS2;
output reg SC_Comparator_Obj_OutLow;
	 
always @(*)
begin
    if (SC_Comparator_obj_data_InBUS1 & SC_Comparator_obj_data_InBUS2) 
        SC_Comparator_Obj_OutLow = 1'b0;
    else 
        SC_Comparator_Obj_OutLow = 1'b1;
end
endmodule
