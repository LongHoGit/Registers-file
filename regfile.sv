module regfile (
  //input	
  input logic        rst_ni,
  input logic        clk_i, 
  input logic [4:0]  rs1_addr_i, 
  input logic [4:0]  rs2_addr_i, 
  input logic [4:0]  rd_addr_i, 
  input logic [31:0] rd_data_i, 
  input logic        rd_wren_i,

  //output
  output logic [31:0] rs1_data_o, 
  output logic [31:0] rs2_data_o
);

logic [31:0][31:0] r; //32 registers
//logic r0 = 0;

always_ff @(rs1_addr_i or rs2_addr_i or rst_ni)
	begin
	r[0] = 0;
		if (rst_ni)
		  begin
	       rs1_data_o = r[rs1_addr_i];
	       rs2_data_o = r[rs2_addr_i];
		  end
		else
		  begin
		    rs1_data_o = 32'd0;
	      rs2_data_o = 32'd0;
		  end
	end		
			
always_ff @(posedge clk_i) 
  begin
		if (rd_wren_i)
			r[rd_addr_i] = rd_data_i;
	end		
		
endmodule: regfile