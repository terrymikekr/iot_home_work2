#include<stdio.h>
#define map_max_size 10
#define kernel_max_size 5

int main(){

	
	int  map_size=0;
	int  kernel_size=0;
	int  result_size=0;
	int  map_data[map_max_size +1][map_max_size +1];
	int  kernel_data[kernel_max_size +1][kernel_max_size +1];
	int  result[(map_max_size)-(kernel_max_size)+1][(map_max_size)-(kernel_max_size)+1];
	int  i = 0 ;
	int  j = 0 ;
	int  k = 0 ;
	int  l = 0 ;
	
	for(i=1; i<=((map_max_size)-(kernel_max_size)+1); i++){
		for(j=1; j<=((map_max_size)-(kernel_max_size)+1); j++){
			result[i][j] = 0;
		}
	}


	printf("input Feature Map Size, max is %d \n",map_max_size);
	scanf("%d", &map_size);
	printf("input Weight Kernel Size, max is %d \n",kernel_max_size);
	scanf("%d", &kernel_size);	

	result_size = map_size - kernel_size+1;

	printf("Map Size : %d , Kernel Size : %d , Result Size : %d \n", map_size, kernel_size, result_size);
	printf("input done... wait\n");


	FILE *map_pointer;
	FILE *kernel_pointer;

	map_pointer=fopen("map.txt","r");
	kernel_pointer=fopen("kernel.txt","r");

	if((map_pointer  == NULL)||(kernel_pointer==NULL)){
	printf("no data file");
	}
	
	for(i=1 ; i<=map_size; i++){ 
		for(j=1 ; j<=map_size; j++){
		fscanf(map_pointer,"%d", &map_data[i][j]);
		}
	}

	for(i=1 ; i<=kernel_size; i++){ 
		for(j=1 ; j<=kernel_size; j++){
		fscanf(kernel_pointer,"%d", &kernel_data[i][j]);
		}
	}


	for(i=1 ; i<=map_size; i++){ 
		for(j=1 ; j<=map_size; j++){
		printf("%d ", map_data[i][j]);
		if(j==map_size){
		printf("\n");
		}else{}
		}
	}

	printf("\n");

	for(i=1 ; i<=kernel_size; i++){ 
		for(j=1 ; j<=kernel_size; j++){
		printf("%d ", kernel_data[i][j]);
		if(j==kernel_size){
		printf("\n");
		}else{}
		}
	}

printf("...ing \n");

for(i=1 ; i<=(result_size) ; i++){
	for(j=1 ; j<=(result_size) ; j++){
		for(k=1; k<=kernel_size ; k++){ 				
			for(l=1 ; l<=kernel_size ; l++){
			result[i][j] += (map_data[i+k-1][j+l-1])*(kernel_data[k][l]); 	
			printf("%d(%d,%d) =%d(%d,%d)  * %d(%d,%d) \n ",result[i][j],i,j,map_data[i+k-1][j+l-1],i+k-1,j+l-1,kernel_data[k][l],k,l);
			}

			
		}
		
	}
}

printf("result \n");
	for(i=1; i<=(result_size); i++){ 
		for(j=1 ; j<=(result_size); j++){
		printf("%d ", result[i][j]);
		if(j==(result_size)){
		printf("\n");
		}else{}
		}
	}




	fclose(map_pointer);
	fclose(kernel_pointer);


return 0; 
}
