#include<stdio.h>

int main(){

	FILE *vp;

	vp = fopen("verilogfile_out.v","w");
	
	int i = 0;
	int j = 0;
	int k = 0;
	int h = 0 ;
	int map_size = 0;
	int kernel_size = 0;
	int result_size = 0;

	printf("input Feature MapSize.\n");
	scanf("%d",&map_size);
	printf("input Weight Size.\n");
	scanf("%d",&kernel_size);
	
	result_size = map_size - kernel_size +1;
	
	printf("map_size: %d, kernel_size: %d, result_size: %d", map_size,kernel_size,result_size);
	
fprintf(vp,"module convol(\ninput clk,\ninput rst,\ninput [7:0]input_map_data,\ninput [7:0]input_kernel_data,\noutput [7:0]output_convol_data,\noutput valid,\noutput [%d:0]output_convol_index\n);\n",result_size * result_size -1);

fprintf(vp," reg [7:0]line_buffer[%d:0][%d:0];\n reg [7:0]kernel_reg[%d:0][%d:0];\n reg index[%d:0][%d:0]; // map 3*3 인덱스를 나타내는 2차원 배열\n reg kernel_index[%d:0][%d:0]; // kernel의 2*2 인데스를 나타내는 2차원 배열\n reg convol_index[%d:0][%d:0];\n reg [2:0]add_count_4; // convol 합 4개가 충족되는지 확인 하고 출력;\n reg [%d:0]convol_index_out;\nreg [7:0]convol_data;\nwire map_full;\nwire kernel_full;\n",map_size-1,map_size-1,kernel_size-1,kernel_size-1,map_size-1,map_size-1,kernel_size-1,kernel_size-1,result_size-1,result_size-1,result_size*result_size-1);


for(i=1 ; i<= result_size ; i++){
	for(j=1; j<= result_size ; j++){
fprintf(vp,"wire complete_%d_%d_%d_%d",i,j,i+result_size-1,j+result_size-1);	
}
}

fputs("\nassign map_full = ",vp);

for(i=0 ; i<map_size ; i++){

	for(j=0 ; j<map_size ; j++){ 
		fprintf(vp,"index[%d][%d]",i,j);
	if((i+j!=(map_size-1)*(map_size-1))){
		fputs("&",vp);		
	}
	if((i+j==(map_size-1)*(map_size-1))){
	fputs(";",vp);		
	}
	
	}
}

fputs("\nassign kernel_full = ",vp);

for(i=0 ; i<kernel_size ; i++){

	for(j=0 ; j<kernel_size ; j++){ 
		fprintf(vp,"kernel_index[%d][%d]",i,j);
	if((i+j!=(kernel_size-1)*(kernel_size-1))){
		fputs("&",vp);		
	}
	if((i+j==(kernel_size-1)*(kernel_size-1))){
	fputs(";",vp);		
	}
	
	}
}

for(i=1 ; i<= result_size ; i++){
	for(j=1; j<= result_size ; j++){
fprintf(vp,"\nassign complete_%d_%d_%d_%d",i,j,i+result_size-1,j+result_size-1);
fprintf(vp,"= convol_index[%d][%d] & map_full & kernel_full;",i-1,j-1);
}
}


fputs("\nassign output_convol_index = convol_index_out;\n assign output_convol_data = convol_data;\n always@(posedge clk) begin  // 맵데이터 받아 주는 부분\n if(rst==1)begin\n",vp);

for(i=0 ; i<map_size ; i++){

	for(j=0 ; j<map_size ; j++){ 
		fprintf(vp,"line_buffer[%d][%d]<=8'b00000000;\n",i,j);
	}
}

for(i=0 ; i<map_size ; i++){

	for(j=0 ; j<map_size ; j++){ 
		fprintf(vp,"index[%d][%d]<=1'b0;\n",i,j);
	}
}
									
for(i=0 ; i<map_size ; i++){

	for(j=0 ; j<map_size ; j++){ 
		fprintf(vp,"convol_index[%d][%d]<=1'b1;\n",i,j);
	}
}

for(i=0 ; i<kernel_size ; i++){
	
	for(j=0 ; j<kernel_size ; j++){ 
		fprintf(vp,"kernel_index[%d][%d]<=1'b0;\n",i,j);
	}
}
	
fputs(" add_count_4 <= 0;\n end\n ", vp);
for(i=0 ; i<map_size ; i++){

	for(j=0 ; j<map_size ; j++){ 
		if ((i==0)&(j==0)){
		fprintf(vp,"if(!index[%d][%d]) begin\n line_buffer[%d][%d] <= input_map_data;\n index[%d][%d] <= 1'b1;\n end\n",i,j,i,j,i,j);
		}
		else{
		fprintf(vp,"else if (!index[%d][%d]) begin\n line_buffer[%d][%d] <= input_map_data;\n index[%d][%d] <= 1'b1;\n end\n",i,j,i,j,i,j);
		}
	}
}

																																				
for(i=0 ; i<kernel_size ; i++){

	for(j=0 ; j<kernel_size ; j++){ 
		if ((i==0)&(j==0)){
		fprintf(vp,"if(!kernel_index[%d][%d]) begin\n kernel_reg[%d][%d] <= input_kernel_data;\n kernel_index[%d][%d] <= 1'b1;\n end\n",i,j,i,j,i,j);
		}
		else{
		fprintf(vp,"else if (!kernel_index[%d][%d]) begin\n kernel_reg[%d][%d] <= input_kernel_data;\n kernel_index[%d][%d] <= 1'b1;\n end\n",i,j,i,j,i,j);
		}
	}
}



for(i=1 ; i<= result_size ; i++){
	for(j=1; j<= result_size ; j++){
	if ((i==0)&(j==0)){
		fprintf(vp,"if(complete_%d_%d_%d_%d) begin\n convol_data <=" ,i,j,i+result_size-1,j+result_size-1);
		for(k=0; k<kernel_size; k++){
			for(h=0; h<kernel_size; h++){
			if((k!=kernel_size-1)&(h!=kernel_size-1))
			{
			fputs(" line_buffer[%d][%d]*kernel_reg[%d][%d] + ",vp);
			}
			else{
			fputs(" line_buffer[%d][%d]*kernel_reg[%d][%d];\n ",vp);
			}
			}
		}
		fputs("index[0][0] <= 1'b0;\n convol_index[0][0] <= 1'b0;\n end\n",vp);
		}
	else{fprintf(vp,"if(complete_%d_%d_%d_%d) begin\n convol_data <=" ,i,j,i+result_size-1,j+result_size-1);
		for(k=0; k<kernel_size; k++){
			for(h=0; h<kernel_size; h++){
			if((k!=kernel_size-1)&(h!=kernel_size-1))
			{
			fputs(" line_buffer[%d][%d]*kernel_reg[%d][%d] + ", vp );
			}
			else{
			fputs(" line_buffer[%d][%d]*kernel_reg[%d][%d]; \n ", vp );
			}
			}
		}
		fputs(" index[0][0] <= 1'b0;\n convol_index[0][0] <= 1'b0; \n end \n" , vp);
		}
	}

}

fputs(" end\n endmodule\n ",vp);

}
