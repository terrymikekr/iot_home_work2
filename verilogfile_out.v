module convol(
input clk,
input rst,
input [7:0]input_map_data,
input [7:0]input_kernel_data,
output [7:0]output_convol_data,
output valid,
output [8:0]output_convol_index
);
 reg [7:0]line_buffer[4:0][4:0];
 reg [7:0]kernel_reg[2:0][2:0];
 reg index[4:0][4:0]; // map 3*3 인덱스를 나타내는 2차원 배열
 reg kernel_index[2:0][2:0]; // kernel의 2*2 인데스를 나타내는 2차원 배열
 reg convol_index[2:0][2:0];
 reg [2:0]add_count_4; // convol 합 4개가 충족되는지 확인 하고 출력;
 reg [8:0]convol_index_out;
reg [7:0]convol_data;
wire map_full;
wire kernel_full;
wire complete_1_1_3_3wire complete_1_2_3_4wire complete_1_3_3_5wire complete_2_1_4_3wire complete_2_2_4_4wire complete_2_3_4_5wire complete_3_1_5_3wire complete_3_2_5_4wire complete_3_3_5_5
assign map_full = index[0][0]&index[0][1]&index[0][2]&index[0][3]&index[0][4]&index[1][0]&index[1][1]&index[1][2]&index[1][3]&index[1][4]&index[2][0]&index[2][1]&index[2][2]&index[2][3]&index[2][4]&index[3][0]&index[3][1]&index[3][2]&index[3][3]&index[3][4]&index[4][0]&index[4][1]&index[4][2]&index[4][3]&index[4][4]&
assign kernel_full = kernel_index[0][0]&kernel_index[0][1]&kernel_index[0][2]&kernel_index[1][0]&kernel_index[1][1]&kernel_index[1][2]&kernel_index[2][0]&kernel_index[2][1]&kernel_index[2][2];
assign complete_1_1_3_3= convol_index[0][0] & map_full & kernel_full;
assign complete_1_2_3_4= convol_index[0][1] & map_full & kernel_full;
assign complete_1_3_3_5= convol_index[0][2] & map_full & kernel_full;
assign complete_2_1_4_3= convol_index[1][0] & map_full & kernel_full;
assign complete_2_2_4_4= convol_index[1][1] & map_full & kernel_full;
assign complete_2_3_4_5= convol_index[1][2] & map_full & kernel_full;
assign complete_3_1_5_3= convol_index[2][0] & map_full & kernel_full;
assign complete_3_2_5_4= convol_index[2][1] & map_full & kernel_full;
assign complete_3_3_5_5= convol_index[2][2] & map_full & kernel_full;
assign output_convol_index = convol_index_out;
 assign output_convol_data = convol_data;
 always@(posedge clk) begin  // 맵데이터 받아 주는 부분
 if(rst==1)begin
line_buffer[0][0]<=8'b00000000;
line_buffer[0][1]<=8'b00000000;
line_buffer[0][2]<=8'b00000000;
line_buffer[0][3]<=8'b00000000;
line_buffer[0][4]<=8'b00000000;
line_buffer[1][0]<=8'b00000000;
line_buffer[1][1]<=8'b00000000;
line_buffer[1][2]<=8'b00000000;
line_buffer[1][3]<=8'b00000000;
line_buffer[1][4]<=8'b00000000;
line_buffer[2][0]<=8'b00000000;
line_buffer[2][1]<=8'b00000000;
line_buffer[2][2]<=8'b00000000;
line_buffer[2][3]<=8'b00000000;
line_buffer[2][4]<=8'b00000000;
line_buffer[3][0]<=8'b00000000;
line_buffer[3][1]<=8'b00000000;
line_buffer[3][2]<=8'b00000000;
line_buffer[3][3]<=8'b00000000;
line_buffer[3][4]<=8'b00000000;
line_buffer[4][0]<=8'b00000000;
line_buffer[4][1]<=8'b00000000;
line_buffer[4][2]<=8'b00000000;
line_buffer[4][3]<=8'b00000000;
line_buffer[4][4]<=8'b00000000;
index[0][0]<=1'b0;
index[0][1]<=1'b0;
index[0][2]<=1'b0;
index[0][3]<=1'b0;
index[0][4]<=1'b0;
index[1][0]<=1'b0;
index[1][1]<=1'b0;
index[1][2]<=1'b0;
index[1][3]<=1'b0;
index[1][4]<=1'b0;
index[2][0]<=1'b0;
index[2][1]<=1'b0;
index[2][2]<=1'b0;
index[2][3]<=1'b0;
index[2][4]<=1'b0;
index[3][0]<=1'b0;
index[3][1]<=1'b0;
index[3][2]<=1'b0;
index[3][3]<=1'b0;
index[3][4]<=1'b0;
index[4][0]<=1'b0;
index[4][1]<=1'b0;
index[4][2]<=1'b0;
index[4][3]<=1'b0;
index[4][4]<=1'b0;
convol_index[0][0]<=1'b1;
convol_index[0][1]<=1'b1;
convol_index[0][2]<=1'b1;
convol_index[0][3]<=1'b1;
convol_index[0][4]<=1'b1;
convol_index[1][0]<=1'b1;
convol_index[1][1]<=1'b1;
convol_index[1][2]<=1'b1;
convol_index[1][3]<=1'b1;
convol_index[1][4]<=1'b1;
convol_index[2][0]<=1'b1;
convol_index[2][1]<=1'b1;
convol_index[2][2]<=1'b1;
convol_index[2][3]<=1'b1;
convol_index[2][4]<=1'b1;
convol_index[3][0]<=1'b1;
convol_index[3][1]<=1'b1;
convol_index[3][2]<=1'b1;
convol_index[3][3]<=1'b1;
convol_index[3][4]<=1'b1;
convol_index[4][0]<=1'b1;
convol_index[4][1]<=1'b1;
convol_index[4][2]<=1'b1;
convol_index[4][3]<=1'b1;
convol_index[4][4]<=1'b1;
kernel_index[0][0]<=1'b0;
kernel_index[0][1]<=1'b0;
kernel_index[0][2]<=1'b0;
kernel_index[1][0]<=1'b0;
kernel_index[1][1]<=1'b0;
kernel_index[1][2]<=1'b0;
kernel_index[2][0]<=1'b0;
kernel_index[2][1]<=1'b0;
kernel_index[2][2]<=1'b0;
 add_count_4 <= 0;
 end
 if(!index[0][0]) begin
 line_buffer[0][0] <= input_map_data;
 index[0][0] <= 1'b1;
 end
else if (!index[0][1]) begin
 line_buffer[0][1] <= input_map_data;
 index[0][1] <= 1'b1;
 end
else if (!index[0][2]) begin
 line_buffer[0][2] <= input_map_data;
 index[0][2] <= 1'b1;
 end
else if (!index[0][3]) begin
 line_buffer[0][3] <= input_map_data;
 index[0][3] <= 1'b1;
 end
else if (!index[0][4]) begin
 line_buffer[0][4] <= input_map_data;
 index[0][4] <= 1'b1;
 end
else if (!index[1][0]) begin
 line_buffer[1][0] <= input_map_data;
 index[1][0] <= 1'b1;
 end
else if (!index[1][1]) begin
 line_buffer[1][1] <= input_map_data;
 index[1][1] <= 1'b1;
 end
else if (!index[1][2]) begin
 line_buffer[1][2] <= input_map_data;
 index[1][2] <= 1'b1;
 end
else if (!index[1][3]) begin
 line_buffer[1][3] <= input_map_data;
 index[1][3] <= 1'b1;
 end
else if (!index[1][4]) begin
 line_buffer[1][4] <= input_map_data;
 index[1][4] <= 1'b1;
 end
else if (!index[2][0]) begin
 line_buffer[2][0] <= input_map_data;
 index[2][0] <= 1'b1;
 end
else if (!index[2][1]) begin
 line_buffer[2][1] <= input_map_data;
 index[2][1] <= 1'b1;
 end
else if (!index[2][2]) begin
 line_buffer[2][2] <= input_map_data;
 index[2][2] <= 1'b1;
 end
else if (!index[2][3]) begin
 line_buffer[2][3] <= input_map_data;
 index[2][3] <= 1'b1;
 end
else if (!index[2][4]) begin
 line_buffer[2][4] <= input_map_data;
 index[2][4] <= 1'b1;
 end
else if (!index[3][0]) begin
 line_buffer[3][0] <= input_map_data;
 index[3][0] <= 1'b1;
 end
else if (!index[3][1]) begin
 line_buffer[3][1] <= input_map_data;
 index[3][1] <= 1'b1;
 end
else if (!index[3][2]) begin
 line_buffer[3][2] <= input_map_data;
 index[3][2] <= 1'b1;
 end
else if (!index[3][3]) begin
 line_buffer[3][3] <= input_map_data;
 index[3][3] <= 1'b1;
 end
else if (!index[3][4]) begin
 line_buffer[3][4] <= input_map_data;
 index[3][4] <= 1'b1;
 end
else if (!index[4][0]) begin
 line_buffer[4][0] <= input_map_data;
 index[4][0] <= 1'b1;
 end
else if (!index[4][1]) begin
 line_buffer[4][1] <= input_map_data;
 index[4][1] <= 1'b1;
 end
else if (!index[4][2]) begin
 line_buffer[4][2] <= input_map_data;
 index[4][2] <= 1'b1;
 end
else if (!index[4][3]) begin
 line_buffer[4][3] <= input_map_data;
 index[4][3] <= 1'b1;
 end
else if (!index[4][4]) begin
 line_buffer[4][4] <= input_map_data;
 index[4][4] <= 1'b1;
 end
if(!kernel_index[0][0]) begin
 kernel_reg[0][0] <= input_kernel_data;
 kernel_index[0][0] <= 1'b1;
 end
else if (!kernel_index[0][1]) begin
 kernel_reg[0][1] <= input_kernel_data;
 kernel_index[0][1] <= 1'b1;
 end
else if (!kernel_index[0][2]) begin
 kernel_reg[0][2] <= input_kernel_data;
 kernel_index[0][2] <= 1'b1;
 end
else if (!kernel_index[1][0]) begin
 kernel_reg[1][0] <= input_kernel_data;
 kernel_index[1][0] <= 1'b1;
 end
else if (!kernel_index[1][1]) begin
 kernel_reg[1][1] <= input_kernel_data;
 kernel_index[1][1] <= 1'b1;
 end
else if (!kernel_index[1][2]) begin
 kernel_reg[1][2] <= input_kernel_data;
 kernel_index[1][2] <= 1'b1;
 end
else if (!kernel_index[2][0]) begin
 kernel_reg[2][0] <= input_kernel_data;
 kernel_index[2][0] <= 1'b1;
 end
else if (!kernel_index[2][1]) begin
 kernel_reg[2][1] <= input_kernel_data;
 kernel_index[2][1] <= 1'b1;
 end
else if (!kernel_index[2][2]) begin
 kernel_reg[2][2] <= input_kernel_data;
 kernel_index[2][2] <= 1'b1;
 end
if(complete_1_1_3_3) begin
 convol_data <= line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  index[0][0] <= 1'b0;
 convol_index[0][0] <= 1'b0; 
 end 
if(complete_1_2_3_4) begin
 convol_data <= line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  index[0][0] <= 1'b0;
 convol_index[0][0] <= 1'b0; 
 end 
if(complete_1_3_3_5) begin
 convol_data <= line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  index[0][0] <= 1'b0;
 convol_index[0][0] <= 1'b0; 
 end 
if(complete_2_1_4_3) begin
 convol_data <= line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  index[0][0] <= 1'b0;
 convol_index[0][0] <= 1'b0; 
 end 
if(complete_2_2_4_4) begin
 convol_data <= line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  index[0][0] <= 1'b0;
 convol_index[0][0] <= 1'b0; 
 end 
if(complete_2_3_4_5) begin
 convol_data <= line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  index[0][0] <= 1'b0;
 convol_index[0][0] <= 1'b0; 
 end 
if(complete_3_1_5_3) begin
 convol_data <= line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  index[0][0] <= 1'b0;
 convol_index[0][0] <= 1'b0; 
 end 
if(complete_3_2_5_4) begin
 convol_data <= line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  index[0][0] <= 1'b0;
 convol_index[0][0] <= 1'b0; 
 end 
if(complete_3_3_5_5) begin
 convol_data <= line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d] +  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  line_buffer[%d][%d]*kernel_reg[%d][%d]; 
  index[0][0] <= 1'b0;
 convol_index[0][0] <= 1'b0; 
 end 
 end
 endmodule
 