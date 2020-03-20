module ula(Sel, A, B, Saida);
input [1:0]A; //Para que haja deslocamento de bits e rotacionamento, o A precisa ter mais que 1 bit
input B; 
output reg [2:0]Saida; //O maior número que a saída irá assumir será 2'b11, resultante da expressão "2'b11 * 1'b1"
input [3:0]Sel;
reg [1:0]auxiliar;

wire And1, Xor1, Or1;

and (And1, A, B); xor (Xor1, A, B); or (Or1, A, B);

always@(*)begin
	case (Sel)
		4'b0000:Saida <= (A + B); //Soma
		
		4'b0001:Saida <= (A - B);//Subtração

		4'b0010:Saida <= (A * B);//Multiplicação
		
		4'b0011:Saida <= (A / B);//Divisão
		
		4'b0100:Saida <= (A << 1);//Deslocamento pra esquerda
		
		4'b0101:Saida <= (A >> 1);//Deslocamento pra direita
		
		4'b0110:begin
			auxiliar = {A[0], A[1]};//Rotacionamento pra direita, é igual pq tem so 2 bits
			Saida <= auxiliar;
			end
		
		4'b0111:begin
			auxiliar = {A[0], A[1]};//Rotacionamento pra esquerda
			Saida <= auxiliar;
			end
		
		4'b1000:Saida <= And1;//And

		4'b1001:Saida <= Or1;//Or

		4'b1010:Saida <= Xor1;//Xor
			
		4'b1011:Saida <= ~And1;//Nand
			
		4'b1100:Saida <= ~Or1;//Nor
			
		4'b1101:Saida <= ~Xor1;//NXor
			
		4'b1110: 
			begin
				if(A > B) begin
					Saida <= 1;
				end
				else begin
					Saida <= 0;
				end
			end
		4'b1111: 
			begin
				if(A == B) begin
					Saida <= 1;
				end
				else begin
					Saida <= 0;
				end
			end
		
	endcase
end
endmodule