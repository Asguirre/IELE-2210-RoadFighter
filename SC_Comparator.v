


module SC_comparator  #(parameter comparator_DATAWIDTH=4)(
    input [3:0] data_in,  // Entrada de datos de 4 bits
    output reg data_out,  // Salida de datos
    output reg Load_outLow  // Señal de salida
);

    // Variable para almacenar la suma de los bits
    reg [3:0] bit_sum;

    // Lógica combinacional para sumar los bits
    always @(*) begin
        bit_sum = data_in[0] + data_in[1] + data_in[2] + data_in[3];
    end

    // Lógica secuencial para evaluar la suma de los bits
    always @(bit_sum) 
	 
	 begin
        if (bit_sum == 1) 
		  begin
            data_out = data_in;
            Load_outLow = 1;
        end 
		  else 
		  begin
            Load_outLow = 0;
        end
    end

endmodule
