/**
	\version	3.0.1.54
	\date		2013.11.08
	\author		Morochin <artamir> Artiom
	\details	����� ���������� ��������� �� ���� ���������� eLT 3.0.1
				Orders in window.
	\internal
		������ ������ �� ���������� �������� ������������ ����� �� �������� ������.
		>Hist:																																																					
				 @3.0.1.54@2013.11.08@artamir	[]	SelectExpertTickets
				 @3.0.1.53@2013.10.25@artamir	[+]	TralTP
				 @3.0.1.52@2013.10.25@artamir	[+]	SelectTIInWindowTP
				 @3.0.1.51@2013.10.23@artamir	[*]	getTPNet
				 @3.0.1.50@2013.10.23@artamir	[*]	SelectPositions
				 @3.0.1.49@2013.10.23@artamir	[*]	SelectTINearPrice
				 @3.0.1.48@2013.10.23@artamir	[*]	SelectTIBySID
				 @3.0.1.47@2013.10.23@artamir	[*]	SelectPosBySID
				 @3.0.1.46@2013.10.23@artamir	[*]	SelectExpertTickets
				 @3.0.1.45@2013.10.22@artamir	[*]	SendParent
				 @3.0.1.44@2013.10.22@artamir	[*]	SendParent
				 @3.0.1.43@2013.10.12@artamir	[*] ������� Quicksort �� ������� ���������� ���������, ���� ���������� �� ��������.	
				 @3.0.1.40@2013.10.12@artamir	[*]	SendLikeOrder
				 @3.0.1.38@2013.10.12@artamir	[!] ����������� �� �������� �������.	
				 @3.0.1.37@2013.10.10@artamir	[+]	sendLikeOrder, �������� ��������������� ������� ��� ��.
				 @3.0.1.36@2013.10.10@artamir	[!]	������ ������ ������� ����������.
				 @3.0.1.35@2013.10.10@artamir	[]	
				 @3.0.1.34@2013.10.06@artamir	[!]	������� �������� stacksize
				 @3.0.1.33@2013.10.04@artamir	[+] Tral	
				 @3.0.1.31@2013.10.03@artamir	[]	isChildNearPrice
				 @3.0.1.30@2013.10.03@artamir	[]	SendChild
				 @3.0.1.29@2013.09.30@artamir	[!]	getNextLot
				 @3.0.1.28@2013.09.30@artamir	[*]	SendSTOPNet
				 @3.0.1.27@2013.09.30@artamir	[*]	FixProfit
				 @3.0.1.26@2013.09.30@artamir	[*]	startext
				 @3.0.1.25@2013.09.30@artamir	[*]	SendChild
				 @3.0.1.24@2013.09.30@artamir	[*]	getNextLot
				 @3.0.1.23@2013.09.30@artamir	[+]	SelectPosBySID
				 @3.0.1.22@2013.09.19@artamir	[+]	getNextLot
				 @3.0.1.21@2013.09.19@artamir	[*]	Autoopen
				 @3.0.1.20@2013.09.13@artamir	[]	startext
				 @3.0.1.19@2013.09.13@artamir	[]	startext
				 @3.0.1.18@2013.09.13@artamir	[+] ��������� ���������� libCloseOrders.	
				 @3.0.1.17@2013.09.12@artamir	[+]	CheckNets
				 @3.0.1.16@2013.09.12@artamir	[*]	SendChild
				 @3.0.1.15@2013.09.11@artamir	[]	Convoy
				 @3.0.1.14@2013.09.11@artamir	[]	SendChild
				 @3.0.1.13@2013.09.11@artamir	[]	SendChild
				 @3.0.1.12@2013.09.10@artamir	[*]	SendChild ��������� ����������� �����, ���� ��� ������� ������� �����������.
				 @3.0.1.11@2013.09.06@artamir	[]	SelectExpertTickets
				 @3.0.1.10@2013.09.06@artamir	[+]	SelectTINearPrice
				 @3.0.1.9@2013.09.05@artamir	[+]	getMaxGL
				 @3.0.1.8@2013.09.05@artamir	[+]	Convoy
				 @3.0.1.7@2013.09.05@artamir	[+]	SelectPositions
				 @3.0.1.6@2013.09.05@artamir	[+]	SendSTOPNet
				 @3.0.1.5@2013.09.05@artamir	[+]	CalcLevels
				 @3.0.1.4@2013.09.04@artamir	[+]	Autoopen
				 @3.0.1.3@2013.09.04@artamir	[+]	SelectExpertTickets
				 @3.0.1.2@2013.09.04@artamir	[+]	isExpertsTickets
				 @3.0.1.1@2013.08.28@artamir	[+]	startext
		>Rev:0
*/
	
//{ === DEFINES
#define EXP	"eOIW"	/** ��� �������� */
#define VER	"3.0.1.54_2013.11.08"
#define DATE "2013.09.05"	/** extert date */	
//}

//{ === expert DEFINES
//}

//{ === EXTERN VARIABLES
extern	string	s1="==== MAIN ====="; //{
extern	int			Step=20;	//��� ����� �������� � �������.	
extern	int			TP=150;		//���������� ����� � �������.
extern	double		Lot=0.1;	//��� ������������� ������.
extern	double		Multy=0.6;	//����. ��� ���������� ���������� ����. ��������� �����.	
extern	double		Fix=200;	//������������� ������ �� ������� ������.
extern	bool		useCloseRevers=false; //�������� ��������� ����� ������� � ������� � ��������������� � ������ �� ������ ����.
extern	bool		useCloseReversTP=false; //����� ������������ �� ����� ��������� ��������������� ������� �� �������� ���������� �������.
extern	bool		TRAL_Use=false;
extern	int			TRAL_Begin_pip=0;
extern	int			TRAL_DeltaPips=10;
extern	int			TRAL_Step_pip=5;
extern	string	e1="==== EXPERT END =====";//}
//}

//{ === INCLUDES
#include <sysELT3.mqh>
#include <libCloseOrders.mqh>
//}

//{ === Expert VARS
bool isFixProfit=false;
bool isStarted=true;
//}

int init(){
	/**
		\version	0.0.0.0
		\date		2013.08.20
		\author		Morochin <artamir> Artiom
		\details	������� ������������� ���������.
		\internal
			>Hist:			
					 @3.0.1.40@2013.10.12@artamir	[]	
					 @3.0.1.42@2013.10.12@artamir	[]	
					 @3.0.1.18@2013.09.13@artamir	[]	
			>Rev:0
	*/

	ELT_init();
	
	//-------------------------------------
	return(0);
}

int deinit(){
	/**
		\version	0.0.0.0
		\date		2013.08.20
		\author		Morochin <artamir> Artiom
		\details	������� ��������������� ���������
		\internal
			>Hist:
			>Rev:0
	*/

	ELT_deinit();
	//-------------------------------------
	return(0);
}

int start(){
	/**
		\version	0.0.0.0
		\date		2013.08.20
		\author		Morochin <artamir> Artiom
		\details	������� ����������� � ���������� ������ ����
		\internal
			>Hist:
			>Rev:0
	*/
	
	startext();
	string comm=StringConcatenate( 	"ver: ",VER,"\n",
									"date: ",DATE,"\n",
									"aOE: ",ArrayRange(aOE,0),"\n",
									"maxQScount= "+maxQScount);
	Comment(comm);	
	//-------------------------------------
	return(0);
}

int startext(){
	/**
		\version	0.0.0.4
		\date		2013.09.30
		\author		Morochin <artamir> Artiom
		\details	���������� ������� start()
					����� �������� ��� ����������� ������-������ �������.
		\internal
			>Hist:				
					 @0.0.0.4@2013.09.30@artamir	[*]	��������� �������� �������� ������� ����� ���� �������.
					 @0.0.0.3@2013.09.13@artamir	[*]	���� �� ���� �������, �� ������� �� �������
					 @0.0.0.2@2013.09.13@artamir	[*]	���� ������������ � ��� �������, �� ������� ������ �������.
					 @0.0.0.1@2013.08.28@artamir	[]	startext
			>Rev:0
	*/
	string fn="startext";
	if(isFixProfit){
		isFixProfit=false;
		A_d_eraseArray2(aOldOrders);
		A_d_eraseArray2(aCurOrders);
		return(0);
	}
	
	OE_eraseArray();
	
	int ticks=GetTickCount();
	ELT_start();
	//-------------------------------------
	
	//{		=== ���� �������� �������
		ticks=GetTickCount();
		if(isExpertsTickets()){
			if(FixProfit()){
				isFixProfit=true;
				OE_eraseArray();
				return(0);
			}
			
			Tral();
			
			CloseRevers();
		}
		//Print(fn+".FixProfit ms="+(GetTickCount()-ticks));
	//..	=== ���� ������������� �������
		
		/*	�������� ���� ���������.
			��������: ��� ������ ����� ������� �� ���������� ���� ������ ���������� 
			��������������� ����� � ������ ��������������� �����.
		*/
		if(ArrayRange(aEvents,0)<=0 && !isStarted){isStarted=0; return(0);}
		ticks=GetTickCount();
		CheckNets();
		Convoy();
		//Print(fn+".CheckNets+Convoy="+(GetTickCount()-ticks));
	//..	=== ���� ����� �����������
		//TralTP();
	//..	=== ���� �������� �������
		ticks=GetTickCount();
		Autoopen();
		//Print(fn+".Autoopen ms="+(GetTickCount()-ticks));
	//}
	
	
	//-------------------------------------
	return(0);
}

//{ === FixProfit
bool FixProfit(){
	/**
		\version	0.0.0.1
		\date		2013.09.30
		\author		Morochin <artamir> Artiom
		\details	�������� ������������� ������ �� ��������.
		\internal
			>Hist:	
					 @0.0.0.1@2013.09.30@artamir	[]	FixProfit
			>Rev:0
	*/
	string fn="FixProfit";
	bool res=false;
	int sid = getMaxSID();
	double aT[][OE_MAX];
	
	SelectPosBySID(aT, sid);
	double sum = Ad_Sum2(aT, OE_OPR);
	
	if(sum >= Fix){
		TR_CloseAll(TR_MN);
		return(true);
	}
	
	ArrayResize(aT,0);
	return(res);
}
//}

//{ === autoopen
void Autoopen(){
	/**
		\version	0.0.0.2
		\date		2013.09.19
		\author		Morochin <artamir> Artiom
		\details	���������� ���������� �������� ������ �� ���������� ��� �� ����.
					�������: ���� ��� ����� �������� ���������.
		\internal
			>Hist:		
					 @0.0.0.2@2013.09.19@artamir	[*]	�������� ��� ������������� ������.
					 @0.0.0.1@2013.09.04@artamir	[+]	Autoopen
			>Rev:0
	*/

	if(!isExpertsTickets()){
		SendParent(OP_BUYSTOP, Lot,true);
		SendParent(OP_SELLSTOP, Lot, false);
	}
}	

void SendSTOPNet(int ti){
	/**
		\version	0.0.0.2
		\date		2013.09.30
		\author		Morochin <artamir> Artiom
		\details	���������� ����� ������� �� ��������.
		\internal
			>Hist:		
					 @0.0.0.2@2013.09.30@artamir	[*]	��������� ��������� SID
					 @0.0.0.1@2013.09.05@artamir	[+]	SendSTOPNet
			>Rev:0
	*/

	T_SelOrderByTicket(ti);		//������� ������������ �����.
	int levels = CalcLevels();
	double start_price = OrderOpenPrice();
	double parent_tp = OrderTakeProfit();
	int parent_ty = OrderType();
	double parent_lot=OrderLots();
	int sid=getMaxSID();
	
	for(int i=1; i<=levels; i++){
		double level_price_pip = Step*i;
		int level_ti = -1;
		if(parent_ty==OP_BUY || parent_ty==OP_BUYSTOP){
			level_ti=TR_SendBUYSTOP(start_price, level_price_pip, parent_lot);
		}

		if(parent_ty==OP_SELL || parent_ty==OP_SELLSTOP){
			level_ti=TR_SendSELLSTOP(start_price, level_price_pip, parent_lot);
		}	
		
		TR_ModifyTP(level_ti,parent_tp);
		OE_setGLByTicket(level_ti,i+1);
		OE_setMPByTicket(level_ti,ti);
		OE_setSIDByTicket(level_ti,sid);
	}
	
}

//}

//{ === convoy
void Convoy(){
	/**
		\version	0.0.0.2
		\date		2013.09.11
		\author		Morochin <artamir> Artiom
		\details	������������� �������.
		\internal
			>Hist:		
					 @0.0.0.2@2013.09.11@artamir	[]	Convoy
					 @0.0.0.1@2013.09.05@artamir	[+]	Convoy
			>Rev:0
	*/
	
	double aPos[][OE_MAX];
	
	int pos_rows=SelectPositions(aPos);
	
	if(pos_rows<=0){return;} //������ � ��� ��� �������.
	
	for(int pos_i=0;pos_i<pos_rows;pos_i++){
		int parent_ti=aPos[pos_i][OE_TI];
		int parent_ty=aPos[pos_i][OE_TY];
		double parent_op=aPos[pos_i][OE_OP];
		
		double child_op = 0.00;
		if(parent_ty==OP_BUY||parent_ty==OP_BUYSTOP){
			child_op=parent_op-Step*Point;
		}
		
		if(parent_ty==OP_SELL||parent_ty==OP_SELLSTOP){
			child_op=parent_op+Step*Point;
		}
		
		child_op=Norm_symb(child_op);
		
		double aT[][OE_MAX];
		int t_rows=SelectExpertTickets(aT);
		
		double aNP[][OE_MAX];
		int np_rows=ELT_SelectNearPrice_d2(aT, aNP, child_op);
		
		bool isChild = false;
		for(int np_i=0; np_i<np_rows;np_i++){
			int ty = aNP[np_i][OE_TY];
			if(parent_ty==OP_BUY || parent_ty==OP_BUYSTOP){
				if(ty==OP_SELL || ty==OP_SELLSTOP || ty==OP_SELLLIMIT){
					isChild=true;
					break;
				}
			}
			if(parent_ty==OP_SELL || parent_ty==OP_SELLSTOP){
				if(ty==OP_BUY || ty==OP_BUYSTOP || ty==OP_BUYLIMIT){
					isChild=true;
					break;
				}
			}
		}
		
		if(!isChild){SendChild(parent_ti);}
	}
}
//}

//{ === checkNets
//��������� �����, ���� ��� ������������.
//���� �����-�� ����� �� ����������, ����� ���������� �����.
//�� ��� �������, ��� ���� ����� ������ ��������.
void CheckNets(){
	/**
		\version	0.0.0.1
		\date		2013.09.12
		\author		Morochin <artamir> Artiom
		\details	���������, ���� ���������� �����.
		\internal
			>Hist:	
					 @0.0.0.1@2013.09.12@artamir	[]	CheckNets
			>Rev:0
	*/
	string fn="CheckNets";
	double a[][OE_MAX];
	if(SelectExpertTickets(a)>0){
		int close_ty=-1;
		double aB[][OE_MAX];
		double _lot=-1;
		bool new_sid_false=false;
		bool sendRevers_true=true;
		int step_count=0;
		int parent_ty=-1, revers_foty=-1;
		double start_pr=0.00;
		
		int ticks=GetTickCount();
		if(ELT_SelectByFOTY_d2(a,aB,OP_BUYSTOP)<=0){
			parent_ty=OP_BUYSTOP;
			revers_foty=OP_SELLSTOP;
			close_ty=OP_SELL;
		}
		//Print(fn+".ELT_SelectByFOTY_d2 ms="+(GetTickCount()-ticks));
		
		ticks=GetTickCount();
		if(ELT_SelectByFOTY_d2(a,aB,OP_SELLSTOP)<=0){
			parent_ty=OP_SELLSTOP;
			revers_foty=OP_BUYSTOP;
			close_ty=OP_BUY;
		}
		//Print(fn+".ELT_SelectByFOTY_d2 ms="+(GetTickCount()-ticks));
		
		if(parent_ty>=0){
			_lot=getNextLot(parent_ty);
			start_pr=CalcStartPr(revers_foty, step_count);
			SendParent(parent_ty,_lot,new_sid_false,sendRevers_true, step_count,start_pr);
		}
		
		if(close_ty>-1){
			//Print(fn);
			CloseReversTP(close_ty);
		}	
	}
}
//}

//{ === �������� ������� ��������������� ������� �� �������� ������� �� ��.
void CloseReversTP(int close_ty){
	/**
		\version	0.0.0.0
		\date		2013.10.10
		\author		Morochin <artamir> Artiom
		\details	�������� ������� ��������������� ������� �� �������� ������� �� ��.
		\internal
			>Hist:
			>Rev:0
	*/
	
	if(!useCloseReversTP){return;}
	
	int sid = getMaxSID();
	double aSID[][OE_MAX];
	
	int rows_sid=SelectPosBySID(aSID, sid);
	
	double aCL[][OE_MAX];
	int rows_cl=ELT_SelectClosedPos_d2(aSID, aCL);
	
	double sum = Ad_Sum2(aCL, OE_OPR);
	
	if(sum>0){
		double aPOS[][OE_MAX];
		int rows_pos=ELT_SelectPosByTY_d2(aSID,aPOS,close_ty);
		bool stop=false;
		if(rows_pos>0){
			//Ad_QuickSort2(aPOS,-1,-1,OE_CP2OP);	//����� ������� ��������������� ����� ����� ����� ������� ������.
			A_d_Sort2(aPOS, ""+OE_CP2OP+" <;");
			int i=-1;
			while(sum>0 && i<rows_pos){
				i++;
				double profit=aPOS[i][OE_OPR];
				if(profit>0){continue;}
				
				profit = MathAbs(profit);
				int ti=aPOS[i][OE_TI];
				if(sum>=profit){
					sum=sum-profit;
					TR_CloseByTicket(ti);
					SendLikeOrder(ti);
				}
				
			}
		}
	}
}	

void CloseRevers(){
	/**
		\version	0.0.0.2
		\date		2013.10.10
		\author		Morochin <artamir> Artiom
		\details	Detailed description
		\internal
			>Hist:
			>Rev:0
	*/
	string fn="CloseRevers";
	if(!useCloseRevers){return;}
	
	double aPOS[][OE_MAX];
	int rows_pos=SelectPositions(aPOS);
	
	double aOPR[][OE_MAX];
	int rows_opr=ELT_SelectInProfit_d2(aPOS,aOPR);
	
	if(rows_opr<0){return;}
	
	for(int i=0; i<rows_opr; i++){
		int parent_ti=aOPR[i][OE_TI];
		int parent_ty=aOPR[i][OE_TY];
		double parent_pr=aOPR[i][OE_OOP];
		double profit=aOPR[i][OE_OPR];
		
		int child_ty=-1;
		if(parent_ty==OP_BUY){child_ty=OP_SELL;}
		if(parent_ty==OP_SELL){child_ty=OP_BUY;}
		
		rows_pos=SelectPositions(aPOS, child_ty);
		if(rows_pos<=0){break;}
		
		double aMIN[][OE_MAX];
		int rows_min=ELT_SelectInLoss_d2(aPOS,aMIN);
		
		if(rows_min<=0){break;}
		for(int m=0; m<rows_min;m++){
			double loss=aMIN[m][OE_OPR];
			int child_ti=aMIN[m][OE_TI];
			double child_pr=aMIN[m][OE_OOP];
			
			if(parent_ty==OP_BUY){
				if(child_pr>parent_pr){continue;}
			}
			
			if(parent_ty==OP_SELL){
				if(child_pr<parent_pr){continue;}
			}
			
			if(MathAbs(profit)>MathAbs(loss)){
				//��������� ������������ �����.
				//� ������ �� ����������, �.�. �������� ��������� �� �����.
				TR_CloseByTicket(parent_ti);
				
				//��������� �������� ����� � ������������ ���������.
				TR_CloseByTicket(child_ti);
				SendLikeOrder(child_ti);
			}
		}
	}
	
}
//}

//{ === �������� �����������.
void TralTP(){
	/**
		\version	0.0.0.1
		\date		2013.10.25
		\author		Morochin <artamir> Artiom
		\details	Detailed description
		\internal
			>Hist:	
					 @0.0.0.1@2013.10.25@artamir	[+]	
			>Rev:0
	*/
	string fn="TralTP";
	//Print(fn);
	double a[][OE_MAX];
	double oop;
	
	//{ === ������� ������� ��� � �������� �����
	
	//�������� ����� ������ �������
	double aB[][OE_MAX];
	A_eraseFilter();
	A_FilterAdd_AND(OE_MN	, TR_MN		, -1, AS_OP_EQ);	//� ������� ���������
	A_FilterAdd_AND(OE_IT	, 1			, -1, AS_OP_EQ);	//�����
	A_FilterAdd_AND(OE_FOTY	, OP_BUYSTOP, -1, AS_OP_EQ);	//�������
	A_d_Select(aOE, aB);
	A_d_Sort2(aB, ""+OE_OOP+" <;"); //���������� �� �����������, �.�. ����� ������ ��� ����� ������
	
	//�� ������� ������� ������� ��� ������ � ����� ��� � �������.
	oop = aB[0][OE_OOP];
	A_eraseFilter();
	A_FilterAdd_AND(OE_OOP, oop, -1, AS_OP_EQ);
	A_d_Select(aB, a);
	
	//�������� ����� ������� ��������
	double aS[][OE_MAX];
	A_eraseFilter();
	A_FilterAdd_AND(OE_MN	, TR_MN		 , -1, AS_OP_EQ);	//� ������� ���������
	A_FilterAdd_AND(OE_IT	, 1			 , -1, AS_OP_EQ);	//�����
	A_FilterAdd_AND(OE_FOTY	, OP_SELLSTOP, -1, AS_OP_EQ);	//��������
	A_d_Select(aOE, aS);
	A_d_Sort2(aS, ""+OE_OOP+" >;"); //���������� �� ��������, �.�. ����� ������� ���� ����� ������
	
	//�� ������� ������� ������� ��� ������ � ����� ��� � �������.
	oop = aS[0][OE_OOP];
	A_eraseFilter();
	A_FilterAdd_AND(OE_OOP, oop, -1, AS_OP_EQ);
	A_d_Select(aS, a, true);
	
	//}
	
	//�� ���� ����� � ��� ������� ������� ������.
	int rows_a = ArrayRange(a, 0);
	for(int i=0; i<rows_a; i++){
		int ti = a[i][OE_TI];
		TR_ModifyTP(ti, TP, TR_MODE_PIP);
		OE_setStandartDataByTicket(ti);
		double aOIW[][OE_MAX];
		SelectTIInWindowTP(aOIW, ti);
		int rows_oiw = ArrayRange(aOIW,0);
		for(int j=0; j<rows_oiw; j++){
			TR_ModifyTPByTicket(ti, aOIW[j][OE_TI]);
		}
	}
}
//}

//{ === expert additional fincrions
bool isExpertsTickets(){
	/**
		\version	0.0.0.1
		\date		2013.09.04
		\author		Morochin <artamir> Artiom
		\details	���������, ���� ���������� ���� ���� ����� �����, ������� ����������� ���������.
		\internal
			>Hist:	
					 @0.0.0.1@2013.09.04@artamir	[+]	isExpertsTickets
			>Rev:0
	*/

	double a[][OE_MAX];
	if(SelectExpertTickets(a)>0){return(true);}
	
	return(false);
}

bool isChildNearPrice(double child_op, int parent_ty){
	/**
		\version	0.0.0.1
		\date		2013.10.03
		\author		Morochin <artamir> Artiom
		\details	��������� ���� �� ������ � �������� �������� �� ������� ������.
		\internal
			>Hist:	
					 @0.0.0.1@2013.10.03@artamir	[+]	isChildNearPrice
			>Rev:0
	*/
	string fn="isTINearPrice";
	double aT[][OE_MAX];
	int t_rows=SelectExpertTickets(aT);
	
	double aNP[][OE_MAX];
	int np_rows=ELT_SelectNearPrice_d2(aT, aNP, child_op);
	
	bool isChild = false;
	for(int np_i=0; np_i<np_rows;np_i++){
		int ty = aNP[np_i][OE_TY];
		if(parent_ty==OP_BUY || parent_ty==OP_BUYSTOP){
			if(ty==OP_SELL || ty==OP_SELLSTOP || ty==OP_SELLLIMIT){
				isChild=true;
				break;
			}
		}
		if(parent_ty==OP_SELL || parent_ty==OP_SELLSTOP){
			if(ty==OP_BUY || ty==OP_BUYSTOP || ty==OP_BUYLIMIT){
				isChild=true;
				break;
			}
		}
	}
	
	return(isChild);
}

int SelectExpertTickets(double &aT[][]){
	/**
		\version	0.0.0.4
		\date		2013.11.08
		\author		Morochin <artamir> Artiom
		\details	���������� ���������� ������� �������� ��������.
		\internal
			>Hist:				
					 @0.0.0.4@2013.11.08@artamir	[]	�������� ������� �� ���������
					 @0.0.0.3@2013.10.23@artamir	[*]	����������� �� ������� �� �������.
					 @0.0.0.2@2013.09.06@artamir	[*]	SelectExpertTickets ��������� �������� �������.
					 @0.0.0.1@2013.09.04@artamir	[+]	SelectExpertTickets
			>Rev:0
	*/
	
	string fn="SelectExpertTickets";
	int ticks=GetTickCount();
	A_eraseFilter();
	A_FilterAdd_AND(OE_MN, TR_MN, -1, AS_OP_EQ);	//����� �� ������
	A_FilterAdd_AND(OE_IT, 1	, -1, AS_OP_EQ);	//����� ���� � ���������.
	
	//A_d_Select(aOE,aT);
	
	int aI[];
	AId_Init2(aOE, aI);
	//Print(fn+".Init2 ms="+(GetTickCount()-ticks));
	ticks=GetTickCount();
	AId_Select2(aOE, aI);
	//Print(fn+".Select2 ms="+(GetTickCount()-ticks));
	//ticks=GetTickCount();
	AId_SetIndexOnArray(aOE,aI,aT);
	
	int rows_t=ArrayRange(aT,0);
	//Print(fn+".SetIndexOnArray ms="+(GetTickCount()-ticks));
	return(rows_t);
}

int SelectPositions(double &a[][], int ty=-1){
	/**
		\version	0.0.0.2
		\date		2013.10.23
		\author		Morochin <artamir> Artiom
		\details	�������� ����� ������� ��������
		\internal
			>Hist:		
					 @0.0.0.2@2013.10.23@artamir	[]	����������� �� ���������� ������� �� �������.
					 @0.0.0.1@2013.09.05@artamir	[+]	SelectPositions
			>Rev:0
	*/

	// double aMN[][OE_MAX];
	// int ROWS_MN = ELT_SelectByMN_d2(aOE, aMN);
	// if(!ROWS_MN){return(0);}
	
	//{
	// if(ty<0){
		// ELT_SelectPositions_d2(aMN, a);	//�� ��� �������� ������ �������	
	// }else{
		// ELT_SelectPosByTY_d2(aMN, a, ty);
	// }	
	// ArrayResize(aMN,0);
	// return(ArrayRange(a,0));
	
	A_eraseFilter();
	A_FilterAdd_AND(OE_MN, TR_MN, -1, AS_OP_EQ);	//����� �� ������
	A_FilterAdd_AND(OE_IT, 1	, -1, AS_OP_EQ);	//����� ���� � ���������.
	A_FilterAdd_AND(OE_IM, 1	, -1, AS_OP_EQ);	//����� ��������
	if(ty>=0){
		A_FilterAdd_AND(OE_TY, ty, -1, AS_OP_EQ);	//����� �� ���� ������.
	}
	//A_d_Select(aOE, a);
	
	int aI[];
	AId_Init2(aOE, aI);
	//BP_SRT=true;
	AId_Select2(aOE, aI);
	AId_SetIndexOnArray(aOE,aI,a);
	//BP_SRT=false;
	return(ArrayRange(a,0));
}

int SelectPosBySID(double &a[][], int sid){
	/**
		\version	0.0.0.2
		\date		2013.10.23
		\author		Morochin <artamir> Artiom
		\details	�������� ������� �������� � �������� sid
		\internal
			>Hist:			
					 @0.0.0.2@2013.10.23@artamir	[*]	����������� �� ���������� ������� �� �������.
					 @0.0.0.1@2013.09.30@artamir	[+]	SelectPosBySID
			>Rev:0
	*/

	//double aMN[][OE_MAX];
	//int ROWS_MN = ELT_SelectByMN_d2(aOE, aMN);
	//if(!ROWS_MN){return(0);}
	
	//ELT_SelectPosBySID_d2(aMN, a, sid);	//�� ��� �������� ������ �������	
	A_eraseFilter();
	A_FilterAdd_AND(OE_MN	, TR_MN	, -1, AS_OP_EQ);	//����� �� ������
	A_FilterAdd_AND(OE_IM	, 1		, -1, AS_OP_EQ);	//����� �� ������
	A_FilterAdd_AND(OE_SID	, sid	, -1, AS_OP_EQ);	//����� �� ������
	//A_d_Select(aOE, a);

	int aI[];
	AId_Init2(aOE, aI);
	//BP_SRT=true;
	AId_Select2(aOE, aI);
	AId_SetIndexOnArray(aOE,aI,a);
	//BP_SRT=false;	
	return(ArrayRange(a,0));
}

int SelectTIBySID(double &a[][], int sid, int &aI[]){
	/**
		\version	0.0.0.2
		\date		2013.10.23
		\author		Morochin <artamir> Artiom
		\details	�������� ������ �������� � �������� sid
		\internal
			>Hist:			
					 @0.0.0.2@2013.10.23@artamir	[*]	����������� �� ���������� ������� �� ��������
					 @0.0.0.1@2013.09.30@artamir	[+]	SelectPosBySID
			>Rev:0
	*/

	//double aMN[][OE_MAX];
	//int ROWS_MN = ELT_SelectByMN_d2(aOE, aMN);
	//if(!ROWS_MN){return(0);}
	
	//ELT_SelectTicketsBySID_d2(aMN, a, sid);	//�� ��� �������� ������ �������	
	//ArrayResize(aMN,0);
	
	A_eraseFilter();
	A_FilterAdd_AND(OE_MN	, TR_MN	, -1, AS_OP_EQ);	//����� �� ������
	A_FilterAdd_AND(OE_SID	, sid	, -1, AS_OP_EQ);	//����� �� sid
	//A_d_Select(aOE, a);
	
	//int aI[];
	AId_Init2(aOE, aI);
	//BP_SRT=true;
	AId_Select2(aOE, aI);
	AId_SetIndexOnArray(aOE,aI,a);
	return(ArrayRange(a,0));
}

int SelectTINearPrice(double &a[][], double pr){
	/**
		\version	0.0.0.2
		\date		2013.10.23
		\author		Morochin <artamir> Artiom
		\details	����� ������� ����� ����.
		\internal
			>Hist:		
					 @0.0.0.2@2013.10.23@artamir	[*]	����������� �� ���������� ������� �� ��������
					 @0.0.0.1@2013.09.06@artamir	[+]	SelectTINearPrice
			>Rev:0
	*/

	double max_pr=pr+MarketInfo(Symbol(),MODE_SPREAD)*Point;
	double min_pr=pr-MarketInfo(Symbol(),MODE_SPREAD)*Point;
	
	A_eraseFilter();
	A_FilterAdd_AND(OE_MN, TR_MN	, -1		, AS_OP_EQ);	//����� �� ������
	A_FilterAdd_AND(OE_IT, 1		, -1		, AS_OP_EQ);	//����� ���� � ���������.
	A_FilterAdd_AND(OE_OP, max_pr	, min_pr	, AS_OP_IN);	//����� ������� � ���� ��� ��������.
	//A_d_Select(aOE, a);
	
	int aI[];
	AId_Init2(aOE, aI);
	//BP_SRT=true;
	AId_Select2(aOE, aI);
	AId_SetIndexOnArray(aOE,aI,a);
	
	return(ArrayRange(a,0));
	//double aT[][OE_MAX];
	//int t_rows = SelectExpertTickets(aT);
	
	//if(t_rows<=0){return(0);}
	
	//int np_rows = ELT_SelectNearPrice_d2(aT, a, pr);
	
	//ArrayResize(aT,0);
}

int SelectTIInWindowTP(double &a[][], int ti){
	/**
		\version	0.0.0.1
		\date		2013.10.25
		\author		Morochin <artamir> Artiom
		\details	������� ������� � ����� �� foty ��� � ��������� ������ � ����� �������� ����� ����� �������� ������ � ��� ��.
		\internal
			>Hist:	
					 @0.0.0.1@2013.10.25@artamir	[]	SelectTIInWindowTP
			>Rev:0
	*/

	string fn="SelectTIInWindowTP";
	int foty = OE_getFOTYByTicket(ti);
	double tp = OE_getTPByTicket(ti);
	double oop = OE_getOOPByTicket(ti);
	int assertion_oop = AS_OP_ABOVE;
	int assertion_tp = AS_OP_UNDER;
	
	if(foty == OP_BUYSTOP){
		assertion_oop=AS_OP_ABOVE;
		assertion_tp=AS_OP_UNDER;
	}
	if(foty == OP_SELLSTOP){
		assertion_oop=AS_OP_UNDER;
		assertion_tp=AS_OP_ABOVE;
	}
	
	A_eraseFilter();
	A_FilterAdd_AND(OE_MN	,TR_MN	,-1,AS_OP_EQ);	//������� � �������� �������
	A_FilterAdd_AND(OE_IT	,1		,-1,AS_OP_EQ);	//������� ����� �������
	A_FilterAdd_AND(OE_FOTY	,foty	,-1,AS_OP_EQ);	//������� � �������� foty
	A_FilterAdd_AND(OE_OOP	,oop	,-1,assertion_oop);
	A_FilterAdd_AND(OE_OOP	,tp		,-1,assertion_tp); 
	
	int aI[];
	AId_Init2(aOE, aI);
	//BP_SRT=true;
	AId_Select2(aOE, aI);
	AId_SetIndexOnArray(aOE,aI,a);
	//A_d_Select(aOE, a);
	
	return(ArrayRange(a,0));
}

int SendChild(int parent_ti, int step_koef=1){
	/**
		\version	0.0.0.6
		\date		2013.10.03
		\author		Morochin <artamir> Artiom
		\details	Detailed description
		\internal
			>Hist:						
					 @0.0.0.6@2013.10.03@artamir	[*]	�������� �������� ����. ����.
					 @0.0.0.5@2013.09.30@artamir	[*]	����������� ����� ������������� ������.
					 @0.0.0.4@2013.09.12@artamir	[*]	��� ����������� ������� ������ ����� ���� ���� ���� ���� ���� �������� ��������� ������.
					 @0.0.0.3@2013.09.11@artamir	[]	SendChild
					 @0.0.0.2@2013.09.11@artamir	[*]	������������ �������� �����, ���� ��� ����������� ��������� ��������.
					 @0.0.0.1@2013.09.10@artamir	[*]	SendChild
			>Rev:0
	*/

	T_SelOrderByTicket(parent_ti);
	int parent_ty = OrderType();
	double parent_op=OrderOpenPrice();
	double parent_lot=OrderLots();
	
	double dBID = MarketInfo(Symbol(),MODE_BID);
	double dASK = MarketInfo(Symbol(),MODE_ASK);
	
	int ty = -1;
	int foty = -1;
	if(parent_ty == OP_SELL || parent_ty == OP_SELLSTOP){
		ty=OP_BUYSTOP;
		foty=OP_BUYSTOP;
		if(dBID >= parent_op && parent_ty == OP_SELL){
			//ty = OP_BUYLIMIT;
			ty=-1;
		}
	}
	
	if(parent_ty == OP_BUY || parent_ty == OP_BUYSTOP){
		ty=OP_SELLSTOP;
		foty=OP_SELLSTOP;
		if(dASK <= parent_op && parent_ty == OP_BUY){
			//ty = OP_SELLLIMIT;
			ty=-1;
		}
	}
	
	if(ty==-1){return(-1);}
	
	double tp = getTPNet(ty);
	int tp_mode = TR_MODE_PRICE;
	
	if(tp<=0){
		tp = TP;
		tp_mode=TR_MODE_PIP;
	}
	
	int max_gl = getMaxGL(foty);
	
	double a[];
	TR_SendPending_array(a, ty, parent_op, Step*step_koef, parent_lot);
	int ti = a[0];
	int sid = getMaxSID();
	OE_setGLByTicket(ti,(max_gl+1));
	OE_setLPByTicket(ti,parent_ti);
	OE_setSIDByTicket(ti, sid);
	TR_ModifyTP(ti,tp,tp_mode);
	
	if(max_gl <= 0){
		SendSTOPNet(ti);
	}
}

int SendParent(		int ty	/** ��� �������� */
				,	double lot=-1 /** ����� �������� */
				,	bool new_sid=false /** ��������� ����� ������? */
				,	bool sendRevers=false /** ���������� ������ ������? (��� �������� �� ��)*/
				,	int	revers_count=1	/** ���������� ������-�������, ������� ����� ������������ */	
				,	double start_pr=0.00 /** ��������� ���� ��� ����������� ������������� ������. */){
	/**
		\version	0.0.0.1
		\date		2013.10.22
		\author		Morochin <artamir> Artiom
		\details	����������� ������� ������������ �������
		\internal
			>Hist:	
					 @0.0.0.1@2013.10.22@artamir	[+]	��������� ����������
			>Rev:0
	*/

	double a[];
	double _tp=0, _sl=0;
	string _comm="", _sy="";
	int _mn=-1, _mode=TR_MODE_PIP, _pr_mode=TR_MODE_AVG;
	
	if(lot<=0){lot=MarketInfo(Symbol(), MODE_MINLOT);}
	
	int sid=getMaxSID();
	if(new_sid){
		sid=sid+1;
	}
	
	int rows_a=TR_SendPending_array(a, ty, start_pr, Step, lot, _tp, _sl, _comm, _mn, _sy, _mode, _pr_mode);
	
	for(int i=0; i<rows_a;i++){
		OE_setGLByTicket(a[i],1);
		OE_setSIDByTicket(a[i],sid);
		TR_ModifyTP(a[i],TP,TR_MODE_PIP);
		SendSTOPNet(a[i]);
		
		if(sendRevers){
			int step_koef=2;
			for(int rev_count=0; rev_count<revers_count;rev_count++){
				SendChild(a[i], step_koef);
				step_koef++;
			}	
		}
	}
	
	ArrayResize(a,0);
}

void SendLikeOrder(int parent_ti){
	/**
		\version	0.0.0.2
		\date		2013.10.10
		\author		Morochin <artamir> Artiom
		\details	���������� ������� ����� � ������������� �������� MP
		\internal
			>Hist:		
					 @0.0.0.2@2013.10.10@artamir	[*]	���������� ����������� ������ ������� ������������� ������.
					 @0.0.0.1@2013.10.10@artamir	[+]	sendLikeOrder
			>Rev:0
	*/

	double a[];
	int rows_a=TR_SendPendingLikeOrder(a, parent_ti);
	for(int i=0;i<rows_a;i++){
		int ti=a[i];
		int idx_child=OE_setStandartDataByTicket(ti);
		int idx_parent=OE_FIBT(parent_ti);
		Ad_CopyRow2To2(aOE, aOE, idx_parent, idx_child, OE_MP, -1, A_MODE_REPL);
	}
}

double getTPNet(int foty){
	/**
		\version	0.0.0.1
		\date		2013.10.23
		\author		Morochin <artamir> Artiom
		\details	���������� �� �� ���� ������� � �����.
		\internal
			>Hist:	
					 @0.0.0.1@2013.10.23@artamir	[*]	����������� �� ��������� ������� �� �������
			>Rev:0
	*/
	
	//{
	// double aT[][OE_MAX];
	// int ti_rows=SelectExpertTickets(aT);
	// int foty = -1;
	// double aFOTY[][OE_MAX];
	// int foty_rows=ELT_SelectByFOTY_d2(aT,aFOTY,ty);
	// if(foty_rows>0){
		// return(aFOTY[0][OE_TP]);
	// }
	
	// return(0);
	
	double aT[][OE_MAX];
	A_eraseFilter();
	A_FilterAdd_AND(OE_MN, TR_MN, -1, AS_OP_EQ);	//����� �� ������
	A_FilterAdd_AND(OE_IT, 1	, -1, AS_OP_EQ);	//����� ���� � ���������.
	A_FilterAdd_AND(OE_FOTY, foty, -1, AS_OP_EQ);	//����� �� FOTY
	//A_d_Select(aOE, aT);
	
	int aI[];
	AId_Init2(aOE, aI);
	//BP_SRT=true;
	AId_Select2(aOE, aI);
	AId_SetIndexOnArray(aOE,aI,aT);
	
	int rows_foty = ArrayRange(aT,0);
	if(rows_foty>0){
		return(aT[0][OE_TP]);
	}
	
	return(0);
}

int getMaxGL(int foty){
	/**
		\version	0.0.0.1
		\date		2013.09.05
		\author		Morochin <artamir> Artiom
		\details	���������� ������������ ������� ����� ��� ���������� ����.
		\internal
			>Hist:	
					 @0.0.0.1@2013.09.05@artamir	[+]	getMaxGL
			>Rev:0
	*/

	double aT[][OE_MAX];
	int t_rows = SelectExpertTickets(aT);
	double aFOTY[][OE_MAX];
	int foty_rows = ELT_SelectByFOTY_d2(aT, aFOTY, foty);
	
	if(foty_rows <= 0){return(0);}
	
	//Ad_QuickSort2(aFOTY, -1, -1, OE_GL, A_MODE_DESC);
	//A_d_Sort2(aFOTY, ""+OE_GL+" >;");
	
	int aI[];
	AId_Init2(aFOTY,aI);
	AId_QuickSort2(aFOTY,aI, -1, -1, OE_GL, A_MODE_DESC);
	
	int res=aFOTY[aI[0]][OE_GL];
	
	ArrayResize(aT,0);
	ArrayResize(aFOTY,0);
	
	return(res);
}

int getMaxSID(){
	/**
		\version	0.0.0.1
		\date		2013.09.05
		\author		Morochin <artamir> Artiom
		\details	���������� ������������ ������� ����� ��� ���������� ����.
		\internal
			>Hist:	
					 @0.0.0.1@2013.09.05@artamir	[+]	getMaxGL
			>Rev:0
	*/

	//double aT[][OE_MAX];
	//ArrayCopy(aT, aOE);
	
	//Ad_QuickSort2(aT, -1, -1, OE_SID, A_MODE_DESC);
	//A_d_Sort2(aT,""+OE_SID+" >;");
	
	int aI[];
	AId_Init2(aOE,aI);
	AId_QuickSort2(aOE,aI, -1, -1, OE_SID, A_MODE_DESC);
	
	int res=aOE[aI[0]][OE_SID];
	return(res);
}

double getNextLot(int foty){
	/**
		\version	0.0.0.4
		\date		2013.09.30
		\author		Morochin <artamir> Artiom
		\details	�������� ������������� ������ ����������� �� ����������.
		\internal
			>Hist:				
					 @0.0.0.4@2013.09.30@artamir	[!]	���������� ��������� ���� ��������� �����.
					 @0.0.0.3@2013.09.30@artamir	[*]	������� ������� �� sid
					 @0.0.0.2@2013.09.19@artamir	[+]	getNextLot
			>Rev:0
	*/
	string fn="getNextLot";
	double aT[][OE_MAX];
	int aI[];
	int sid = getMaxSID();
	int t_rows = SelectTIBySID(aT, sid, aI);
	double aFOTY[][OE_MAX];
	int foty_rows = ELT_SelectByFOTY_d2(aT, aFOTY, foty);
	if(foty_rows <= 0){return(Lot);}
	
	double aGL[][OE_MAX];
	int gl_rows=ELT_SelectByGL_d2(aFOTY, aGL, 1);
	if(gl_rows<0){return(Lot);}
	
	A_d_Sort2(aGL,""+OE_LOT+"<;");
	//Print(fn+".Ad_QuickSort2.Start");
	//Ad_QuickSort2(aGL, -1, -1, OE_LOT, A_MODE_DESC);
	//Print(fn+".Ad_QuickSort2.End");
	
	double next_lot = Norm_vol(aGL[0][OE_LOT]*Multy);
	
	ArrayResize(aT,0);
	ArrayResize(aFOTY,0);
	ArrayResize(aGL,0);
	
	return(next_lot);
}

int CalcLevels(){
	/**
		\version	0.0.0.1
		\date		2013.09.05
		\author		Morochin <artamir> Artiom
		\details	������ ���������� ������� � ����� �� �������� �� TP
		\internal
			>Hist:	
					 @0.0.0.1@2013.09.05@artamir	[]	CalcLevels
			>Rev:0
	*/
	return(MathFloor(TP/Step)-1);
}

double CalcStartPr(int ty, int& step_count){
	/**
		\version	0.0.0.0
		\date		2013.10.22
		\author		Morochin <artamir> Artiom
		\details	���������� ���� �������� �������� ���������� ������ ��������� ����. 
		\internal
			>Hist:
			>Rev:0
	*/
	string fn="CalcStartPr";
	double nearest_pr=0.00;
	double start_pr=0.00;
	double aT[][OE_MAX];
	int ti_rows=SelectExpertTickets(aT);
	int foty = -1;
	double aFOTY[][OE_MAX];
	int foty_rows=ELT_SelectByFOTY_d2(aT,aFOTY,ty);
	if(foty_rows>0){
		double aLOSS[][OE_MAX];
		int loss_rows=ELT_SelectInLossCP_d2(aFOTY, aLOSS) ;
		if(loss_rows<=0){
			return(0.00);
		}
		
		A_d_Sort2(aLOSS,""+OE_CP2OP+" >;");
		nearest_pr=aLOSS[0][OE_OOP];
		int dist=MathAbs(nearest_pr-TR_getMarketPrice(TR_MODE_AVG))/Point;
		step_count=MathCeil(dist/Step);
		start_pr=nearest_pr+iif(ty==OP_SELLSTOP,1,-1)*(step_count+1)*Step*Point;
		step_count--;
		return(start_pr);
	}
	
	
}

void Tral(){
	/**
		\version	0.0.0.5
		\date		2013.06.25
		\author		Morochin <artamir> Artiom
		\details	Detailed description
		\internal
			>Hist:					
					 @0.0.0.5@2013.06.25@artamir	[]	CloseAllPendings
					 @0.0.0.4@2013.05.17@artamir	[]	CloseAllPendings
					 @0.0.0.3@2013.05.15@artamir	[]	CloseAllPendings
					 @0.0.0.2@2013.05.15@artamir	[]	CloseAllPendings
					 @0.0.0.1@2013.05.15@artamir	[]	CloseAllPendings
			>Rev:0
	*/

	if(!TRAL_Use){return;}
	
	double d[][OE_MAX];
	//{ --- ���� �� > 0
	A_eraseFilter();										
	
	A_FilterAdd_AND(OE_IT, 1, -1, AS_OP_EQ);
	A_FilterAdd_AND(OE_MN, TR_MN, -1, AS_OP_EQ);
	A_FilterAdd_AND(OE_CP2SL, (TRAL_Begin_pip+TRAL_DeltaPips), -1, AS_OP_ABOVE);
	A_FilterAdd_AND(OE_CP2OP, (TRAL_DeltaPips), -1, AS_OP_ABOVE);
	
	A_d_Select(aOE, d);
	
	int ROWS = ArrayRange(d, 0);
	
	for(int idx = 0; idx < ROWS; idx++){
		int ti = d[idx][OE_TI];
		TR_ModifySLByPrice(ti, TRAL_Step_pip);
	}
	//}
	
	//{ --- ���� �� = 0
	ArrayResize(d, 0);
	
	A_eraseFilter();										
	
	A_FilterAdd_AND(OE_IT, 1, -1, AS_OP_EQ);
	A_FilterAdd_AND(OE_MN, TR_MN, -1, AS_OP_EQ);
	A_FilterAdd_AND(OE_SL, 0, -1, AS_OP_EQ);
	A_FilterAdd_AND(OE_CP2OP, (TRAL_DeltaPips), -1, AS_OP_ABOVE);
	
	A_d_Select(aOE, d);
	
	ROWS = ArrayRange(d, 0);
	
	for(idx = 0; idx < ROWS; idx++){
		ti = d[idx][OE_TI];
		TR_ModifySLByPrice(ti, TRAL_Step_pip);
	}
	//}
	
	ArrayResize(d,0);
}	
//}