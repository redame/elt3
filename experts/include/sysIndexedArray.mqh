	/**
		\version	3.1.0.5
		\date		2014.02.25
		\author		Morochin <artamir> Artiom
		\details	������ � ��������������� ��������.
		\internal
			>Hist:					
					 @3.1.0.5@2014.02.25@artamir	[+]	AId_Compare
					 @3.1.0.4@2014.02.25@artamir	[+]	AId_QuickSort2
					 @3.1.0.3@2014.02.25@artamir	[+]	AId_get2
					 @3.1.0.2@2014.02.25@artamir	[+]	AI_Swap
					 @3.1.0.1@2014.02.25@artamir	[+]	AI_setInterval
			>Rev:0
	*/
	
void AId_Init2(double &a[][], int &aI[]){
	/**
		\version	0.0.0.1
		\date		2013.11.06
		\author		Morochin <artamir> Artiom
		\details	������������� ������� ��������.
		\internal
			>Hist:	
					 @0.0.0.1@2013.11.06@artamir	[+]	
			>Rev:0
	*/

	ArrayResize(aI,ArrayRange(a,0));
	for(int i=0; i<ArrayRange(a,0);i++){
		aI[i]=i;
	}
}

double AId_get2(double &a[][], int &aI[], int idx=0, int col=0){
	/**
		\version	0.0.0.1
		\date		2014.02.25
		\author		Morochin <artamir> Artiom
		\details	���������� �������� �������� ��������� ������� ����� ������
		\internal
			>Hist:	
					 @0.0.0.1@2014.02.25@artamir	[+]	
			>Rev:0
	*/

	string fn="AId_get2";
	return(a[aI[idx]][col]);
}

#define AI_EQ 0
#define AI_GREAT 1
#define AI_LESS

double AId_Compare(double v1, double v2){
	/**
		\version	0.0.0.1
		\date		2014.02.25
		\author		Morochin <artamir> Artiom
		\details	���������� ��������� ��������� ���� ������������ ����������.
		\internal
			>Hist:	
					 @0.0.0.1@2014.02.25@artamir	[+]	AId_Compare
			>Rev:0
	*/
	
	string fn="AId_Compare";
	if(MathAbs(v1-v2)<=0.00001)return(AI+EQ);
	
	if(v1>v2)return(AI_GREAT);
	
	return(AI_LESS);

}

#define AI_WHOLEARRAY -256
#define AI_EMPTY -1024
int AI_setInterval(int &aI[], int start_idx=0, int end_idx=-256){
	/**
		\version	0.0.0.1
		\date		2014.02.25
		\author		Morochin <artamir> Artiom
		\details	�������� ������ �� ���������.
		\internal
			>Hist:	
					 @0.0.0.1@2014.02.25@artamir	[+]	AI_setInterval
			>Rev:0
	*/

	string fn="AI_setInterval";
	int aT[];
	ArrayResize(aT,0);
	
	if(start_idx==AI_EMPTY || end_idx==AI_EMPTY){
		ArrayResize(aI,0);
		return(0);	//������ �������� ����������
	}
	
	int s=0,e=0,t=0;
	if(start_idx==AI_WHOLEARRAY){
		return(ArrayRange(aI,0)); //������ �������� �� ����������. 
	}
	
	if(end_idx==AI_WHOLEARRAY){
		e=ArrayRange(aI,0)-1;//����� ������� ������
	}
	
	int range=e-s+1;//���������� ��������� �����
	ArrayResize(aT,range);
	
	for(int i=0; i<range; i++){
		aT[i]=aI[s+i];
	}
	
	ArrayResize(aI,range);
	ArrayCopy(aI,aT,0,0,WHOLE_ARRAY);
	return(range);
}

int AI_Swap(int &aI, int i=0, int j=0){
	/**
		\version	0.0.0.1
		\date		2014.02.25
		\author		Morochin <artamir> Artiom
		\details	������ ������� ��� �������
		\internal
			>Hist:	
					 @0.0.0.1@2014.02.25@artamir	[+]	AI_Swap
			>Rev:307
	*/
	string fn="AI_Swap";
	int t=aI[i];
	aI[i]=aI[j];
	aI[j]=t;
}

bool isNewQS=true;
void AId_QuickSort2(double &a[][], int &aI[], int idx_min=-1, int idx_max=-1, int col=0, int mode=0){
	/**
		\version	0.0.0.1
		\date		2014.02.25
		\author		Morochin <artamir> Artiom
		\details	�������� ���������� "������� ����������". �� ��������� ����������� 0-� �������
		�� �����������.
		\internal
			>Hist:		
					 @0.0.0.1@2014.02.25@artamir	[+]	AId_QuickSort2
	*/
	static int count;
	if(isNewQS)count=0;
	count++;
	maxQScount=MathMax(maxQScount,count);
	string fn="Ad_QuickSort2";
	
	if(ArrayRange(aI,0)<2){
		return;
	}
	
	if(idx_min<0){idx_min=0;}
	if(idx_max<0){idx_max=ArrayRange(aI,0)-1;}
	
	int i=idx_min, j=idx_max;
	int idx_pivot = MathRound((i+j)/2);
	double pivot_value = (AId_get2(a,aI,i,col)+AId_get2(a,aI,j,col)+AId_get2(a,aI,idx_pivot,col))/3; //����������� �������� �������, ���������� � �������� �������� �������. 
	while(i<j){
		if(mode == A_MODE_ASC){
			while(AId_get2(a,aI,i,col)<pivot_value){i++;}
			while(AId_get2(a,aI,j,col)>pivot_value){j--;}
		}
		if(mode == A_MODE_DESC){
			while(AId_get2(a,aI,i,col)>pivot_value){i++;}
			while(AId_get2(a,aI,j,col)<pivot_value){j--;}
		}
		if(i<j){
			AId_Swap(aI, i,j);i++;j--;
		}
	}
	isNewQS=false;
	if(i<idx_max){AId_QuickSort2(a,aI,i,idx_max,col, mode);}
	isNewQS=true;
	isNewQS=false;
	if(idx_min<j){AId_QuickSort2(a,aI,idx_min,j,col, mode);}
	isNewQS=true;
	
	
}

