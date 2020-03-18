module ula(Entrada, A, B, Saida);
input [3:0]A;
input [3:0]B;
output reg [3:0]Saida;
input [3:0]Entrada;
reg [3:0]auxiliar;
always@(*)begin
	case (Entrada)
		4'b0000:begin
			Saida <= (A + B);
			end
		4'b0001:begin
			Saida <= (A - B);
			end
		4'b0010:begin
			Saida <= (A * B);
			end
		4'b0011:begin
			Saida <= (A / B);
			end
		4'b0100:begin
			Saida <= (A << 1);
			end
		4'b0101:begin
			Saida <= (A >> 1);
			end
		4'b0110:begin
			auxiliar = {A[2:0], A[3]};
			Saida <= auxiliar;
			end
		4'b0111:begin
			auxiliar = {A[0], A[3:1]};
			Saida <= auxiliar;
			end
		4'b1000:begin
			Saida <= (A & B);
			end
		4'b1001:begin
			Saida <= (A | B);
			end
		4'b1010:begin
			Saida <= (A ^ B);
			end
		4'b1011: begin
			Saida <= ~(A | B);
			end
		4'b1100: begin
			Saida <= ~(A & B);
			end
		4'b1101: begin
			Saida <= ~(A ^ B);
			end
		4'b1110: begin
				if(A < B) begin
					Saida <= 1;
				end
				else begin
					Saida <= 0;
				end
			end
		4'b1111: begin
				if(A == B) begin
					Saida <= 1;
				end
				else begin
					Saida <= 0;
				end
			end
		default: Saida <= 0;
	endcase
end
endmodule