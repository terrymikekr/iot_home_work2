#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <sstream>
using namespace std;

int main()
{
	char inter_ch[30];
	char inter_ch2[30];
	int inter_ch2_index = 0;
	int inter_ch_index = 0;
	int inter_ch_counter = 0;
	
	string real[60];
	string line[60];
	int i = 0;
	int j = 0;
	int k = 0;
	int w = 0;
	int e = 0;
	int real_num = 0;
	
	
    string real_2[30][2];
    int real_2_index1 = 0;
    int real_2_index2 = 0;
    
	ifstream in("test.txt");
	ofstream out("result1.txt");
	
	if(in.is_open()){
		
		for(i=0; i<55 && !cin.eof(); i++){
		in >> line[i];
		}
		// line 배열에 test.txt 내용을 입력
		 
		for(i=0; i<55; i++){
		
		//cout << "line["<<i<<"] :" << line[i]<< endl;
		
		if(line[i]=="push"){
			real[real_num] = line[i];
			cout << "real["<<real_num<<"] : " << real[real_num]<< endl;
			real_num++;
			
			real[real_num] = line[i+1];
			cout << "real["<<real_num<<"] : " << real[real_num]<< endl;
			real_num++;
		}
		
		else if(line[i]=="mov"){
			real[real_num] = line[i];
			cout << "real["<<real_num<<"] : " << real[real_num]<< endl;
			real_num++;
			
			real[real_num] = line[i+1];
			cout << "real["<<real_num<<"] : " << real[real_num]<< endl;
			real_num++;
				
		}
		else if(line[i]=="movl"){
			real[real_num] = line[i];
			cout << "real["<<real_num<<"] : " << real[real_num]<< endl;
			real_num++;
			
			real[real_num] = line[i+1];
			cout << "real["<<real_num<<"] : " << real[real_num]<< endl;
			real_num++;
				
		}
		
			else if(line[i]=="add"){
			real[real_num] = line[i];
			cout << "real["<<real_num<<"] : " << real[real_num]<< endl;
			real_num++;
			
			real[real_num] = line[i+1];
			cout << "real["<<real_num<<"] : " << real[real_num]<< endl;
			real_num++;
				
		}
			else if(line[i]=="pop"){
			real[real_num] = line[i];
			cout << "real["<<real_num<<"] : " << real[real_num]<< endl;
			real_num++;
			
			real[real_num] = line[i+1];
			cout << "real["<<real_num<<"] : " << real[real_num]<< endl;
			real_num++;
				
		}
			else if(line[i]=="retq"){
			real[real_num] = line[i];
			cout << "real["<<real_num<<"] : " << real[real_num]<< endl;
				
		}
		} // for 
	}
	
	
	for (i = 0 ; i <23 ; i++){
		if(real[i]=="\0"){
			break;
		}
	
		if (real[i] == "push"){
	
			real_2[real_2_index1][real_2_index2] = real[i];
			cout << "real_2["<< real_2_index1<<"][" << real_2_index2 <<"]:"<<real_2[real_2_index1][real_2_index2 ]<<endl;
			out << real_2[real_2_index1][real_2_index2 ] <<endl;
			real_2_index2 ++ ;
			
			real_2[real_2_index1][real_2_index2] = real[i+1];
			cout << "real_2["<< real_2_index1<<"][" << real_2_index2 <<"]:"<<real_2[real_2_index1][real_2_index2 ]<<endl;
			out << real_2[real_2_index1][real_2_index2 ]<<endl;
			real_2_index1 ++ ;
			
			real_2_index2 =0 ;
		}
	
		 if(real[i]=="mov"){
			 
			real_2[real_2_index1][real_2_index2] = real[i];
			cout << "real_2["<< real_2_index1<<"][" << real_2_index2 <<"]:"<<real_2[real_2_index1][real_2_index2 ]<<endl;
			out << real_2[real_2_index1][real_2_index2 ] << endl;
			real_2_index2 ++ ;
			 
			inter_ch_counter = real[i+1].size();
			cout << "inter_ch_counter :" << inter_ch_counter << endl;
			
			strcpy(inter_ch,real[i+1].c_str());
	
		
			for(j=0 ; j<inter_ch_counter ; j++){
				
				if(inter_ch[j]!=','){
					inter_ch2[inter_ch2_index] = inter_ch[j];
					cout << "inter_ch["<<j<<"]"<<inter_ch[j]<<endl;
					out << inter_ch[j];													
				}
				else { // ','를 만나면
					out << endl;
				}
				
				if(j== inter_ch_counter-1){
					out << endl;
				}
			}

	
	
		}
		
		
		
	}
			
return 0;
}


