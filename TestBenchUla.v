module TestBenchUla;
reg [3:0]Sel;
reg [1:0]A;
reg B;
wire [2:0]Saida;

ula u1(.Sel(Sel), .A(A), .B(B), .Saida(Saida), .clk());

initial begin
//Sel = 0000 -> Soma
		A = 2'b10; B = 1'b1; Sel = 4'b0000; #10; //2'b10 + 1'b1 = 3'b011 
		if(Saida != 3'b011) $display("Erro: Falha na soma de 2'b10 + 1'b1");
		A = 2'b11; B = 1'b1; Sel = 4'b0000; #10; //2'b11 + 1'b1 = 3'b100
		if(Saida != 3'b100) $display("Erro: Falha na soma de 2'b11 + 1'b1");
//Sel = 0001 -> Subtração
		A = 2'b01; B = 1'b1; Sel = 4'b0001; #10; 
		if(Saida != 3'b000) $display("Erro: Falha na Subtracao");
//Sel = 0010 -> Multiplicação
		A = 2'b11; B = 1'b0; Sel = 4'b0010; #10;
		if(Saida != 3'b000) $display("Erro: Falha na Multiplicacao de 2'b11 * 1'b0");
		A = 2'b11; B = 1'b1; Sel = 4'b0010; #10;
		if(Saida != 3'd011) $display("Erro: Falha na Multiplicacao de 2'b11 * 1'b1");
//Sel = 0011 -> Divisão
		A = 2'b00; B = 1'b1; Sel = 4'b0011; #10; 
		if(Saida != 3'b000) $display("Erro: Falha na Divisao de 2'b00/1'b1");
		A = 2'b10; B = 1'b1; Sel = 4'b0011; #10;  
		if(Saida != 3'b001) $display("Erro: Falha na Divisao de 2'b10/1'b1");
//Sel = 0100 -> Deslocamento pra esquerda
		A = 2'b01; Sel = 4'b0100; #10;
		if(Saida != 3'b010) $display("Erro: Deslocamento pela esquerda");
//Sel = 0101 -> Deslocamento pra direita
		A = 2'b10; Sel = 4'b0101; #10;
		if(Saida != 3'b001) $display("Erro: Deslocamento pela direita");
//Sel = 0110 -> Rotacionamento pra direita
		A = 2'b01; Sel = 4'b0110; #10;
		if(Saida != 3'b010) $display("Erro: Rotacionamento pela direita");
//Sel = 0111 -> Rotacionamento pra esquerda
		A = 2'b10; Sel = 4'b0111; #10;
		if(Saida != 3'b001) $display("Erro: Rotacionamento pela esquerda");
//Sel = 1000 -> And
		A = 2'b00; B = 1'b1; Sel = 4'b1000; #10; 
		if(Saida != 0) $display("Erro: And de 2'b00 & 1'b1");
		A = 2'b11; B = 1'b1; Sel = 4'b1000; #10; 
		if(Saida != 1) $display("Erro: And de 2'b11 & 1'b1");
//Sel = 1001 -> Or
		A = 2'b00; B = 1'b0; Sel = 4'b1001; #10; 
		if(Saida != 1) $display("Erro: Or de 2'b00 & 1'b0");
		A = 2'b11; B = 1'b0; Sel = 4'b1001; #10;
		if(Saida != 1) $display("Erro: Or de 2'b11 & 1'b0");
//Sel = 1010 -> Xor
		A = 2'b00; B = 1'b0; Sel = 4'b1010; #10; 
		A = 2'b00; B = 1'b1; Sel = 4'b1010; #10; 
		A = 2'b01; B = 1'b0; Sel = 4'b1010; #10;
		A = 2'b01; B = 1'b1; Sel = 4'b1010; #10; 
		A = 2'b10; B = 1'b0; Sel = 4'b1010; #10;
		A = 2'b10; B = 1'b1; Sel = 4'b1010; #10; 
		A = 2'b11; B = 1'b0; Sel = 4'b1010; #10;
		A = 2'b11; B = 1'b1; Sel = 4'b1010; #10; 
//Sel = 1011 -> Nand
		A = 2'b00; B = 1'b0; Sel = 4'b1011; #10; 
		A = 2'b00; B = 1'b1; Sel = 4'b1011; #10; 
		A = 2'b01; B = 1'b0; Sel = 4'b1011; #10;
		A = 2'b01; B = 1'b1; Sel = 4'b1011; #10; 
		A = 2'b10; B = 1'b0; Sel = 4'b1011; #10;
		A = 2'b10; B = 1'b1; Sel = 4'b1011; #10; 
		A = 2'b11; B = 1'b0; Sel = 4'b1011; #10;
		A = 2'b11; B = 1'b1; Sel = 4'b1011; #10; 
//Sel = 1100 -> Nor
		A = 2'b00; B = 1'b0; Sel = 4'b1100; #10; 
		A = 2'b00; B = 1'b1; Sel = 4'b1100; #10; 
		A = 2'b01; B = 1'b0; Sel = 4'b1100; #10;
		A = 2'b01; B = 1'b1; Sel = 4'b1100; #10; 
		A = 2'b10; B = 1'b0; Sel = 4'b1100; #10;
		A = 2'b10; B = 1'b1; Sel = 4'b1100; #10; 
		A = 2'b11; B = 1'b0; Sel = 4'b1100; #10;
		A = 2'b11; B = 1'b1; Sel = 4'b1100; #10; 
//Sel = 1101 -> XNor
		A = 2'b00; B = 1'b0; Sel = 4'b1101; #10; 
		A = 2'b00; B = 1'b1; Sel = 4'b1101; #10; 
		A = 2'b01; B = 1'b0; Sel = 4'b1101; #10;
		A = 2'b01; B = 1'b1; Sel = 4'b1101; #10; 
		A = 2'b10; B = 1'b0; Sel = 4'b1101; #10;
		A = 2'b10; B = 1'b1; Sel = 4'b1101; #10; 
		A = 2'b11; B = 1'b0; Sel = 4'b1101; #10;
		A = 2'b11; B = 1'b1; Sel = 4'b1101; #10; 
//Sel = 1110 -> A>B (B precisa de 2 bits aqui)
		A = 2'b00; B = 2'b00; Sel = 4'b1110; #10; 
		A = 2'b00; B = 2'b01; Sel = 4'b1110; #10; 
		A = 2'b00; B = 2'b10; Sel = 4'b1110; #10; 
		A = 2'b00; B = 2'b11; Sel = 4'b1110; #10;
		A = 2'b01; B = 2'b00; Sel = 4'b1110; #10;
		A = 2'b01; B = 2'b01; Sel = 4'b1110; #10; 
		A = 2'b01; B = 2'b10; Sel = 4'b1110; #10; 
		A = 2'b01; B = 2'b11; Sel = 4'b1110; #10; 
		A = 2'b10; B = 2'b00; Sel = 4'b1110; #10;
		A = 2'b10; B = 2'b01; Sel = 4'b1110; #10; 
		A = 2'b10; B = 2'b10; Sel = 4'b1110; #10; 
		A = 2'b10; B = 2'b11; Sel = 4'b1110; #10; 
		A = 2'b11; B = 2'b00; Sel = 4'b1110; #10;
		A = 2'b11; B = 2'b01; Sel = 4'b1110; #10; 
		A = 2'b11; B = 2'b10; Sel = 4'b1110; #10; 
		A = 2'b11; B = 2'b11; Sel = 4'b1110; #10;
//Sel = 1111 -> A==B (B precisa de 2 bits aqui)
		A = 2'b00; B = 2'b00; Sel = 4'b1111; #10; 
		A = 2'b00; B = 2'b01; Sel = 4'b1111; #10; 
		A = 2'b00; B = 2'b10; Sel = 4'b1111; #10; 
		A = 2'b00; B = 2'b11; Sel = 4'b1111; #10;
		A = 2'b01; B = 2'b00; Sel = 4'b1111; #10;
		A = 2'b01; B = 2'b01; Sel = 4'b1111; #10; 
		A = 2'b01; B = 2'b10; Sel = 4'b1111; #10; 
		A = 2'b01; B = 2'b11; Sel = 4'b1111; #10; 
		A = 2'b10; B = 2'b00; Sel = 4'b1111; #10;
		A = 2'b10; B = 2'b01; Sel = 4'b1111; #10; 
		A = 2'b10; B = 2'b10; Sel = 4'b1111; #10; 
		A = 2'b10; B = 2'b11; Sel = 4'b1111; #10; 
		A = 2'b11; B = 2'b00; Sel = 4'b1111; #10;
		A = 2'b11; B = 2'b01; Sel = 4'b1111; #10; 
		A = 2'b11; B = 2'b10; Sel = 4'b1111; #10; 
		A = 2'b11; B = 2'b11; Sel = 4'b1111; #10;
	end
endmodule