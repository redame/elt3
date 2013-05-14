/*
		>Ver	:	0.0.0.15
		>Date	:	2013.05.14
		>Hist:											
				 @0.0.0.15@2013.05.14@artamir	[]	onNewOrder
				 @0.0.14@2013.03.06@artamir	[]	onChangeType
				 @0.0.13@2013.02.24@artamir	[]	onChangeType
				 @0.0.12@2013.02.23@artamir	[]	onChangeOP
				 @0.0.11@2013.02.21@artamir	[]	onCloseOrder
				 @0.0.10@2013.02.21@artamir	[]	onNewOrder
				 @0.0.9@2013.02.16@artamir	[]	onCloseOrder
				 @0.0.8@2013.02.15@artamir	[]	E_FillEventsArray
				 @0.0.7@2013.02.15@artamir	[]	onChangeSL
				 @0.0.5@2013.02.15@artamir	[]	onChangeOP
		>Author	:	Morochin <artamir> Artiom
		>Descr:
			Working with orders events.
		>Pendings:
			#include	<libArray.mqh>
			#include	<libTerminal.mqh>
		>Pref:	E	
*/

//{	//=== GLOBAL VARIABLES
	//{	@������ �������/�������
	#define	E_TI	1	//Ticket 
	#define	E_EVENT	2	//Type of event
	#define	E_MAX	3	//Max index
	
	#define	EVENT_NO	1	//EVENT_NewOrder
	#define	EVENT_CHTY	2	//EVENT_CHangeTYpe
	#define	EVENT_CHOP	3	//EVENT_CHangeOpenPrice
	#define EVENT_CO	4	//EVENT_ClosedOrder
	//======================================================
	double	aEvents[][E_MAX];								// array of events
	//}
//}

//==========================================================
void E_Start(){
	/*
		>Ver	:	0.0.1
		>Date	:	2012.10.02
		>Hist	:
		>Author	:	Morochin <artamir> Artiom
		>Desc	:	Start func.
	*/
	//----------------------------------------------------------------------------------------------
	A_d_eraseArray2(aEvents);								
	
	//----------------------------------------------------------------------------------------------
	E_FillEventsArray();									
}

//==========================================================
void E_FillEventsArray(){
	/*
		>Ver	:	0.0.2
		>Date	:	2013.02.15
		>Hist	:
			@0.0.1@2012.10.03@artamir	[]
		>Author	:	Morochin <artamir> Artiom
		>Desc	:	Filling array of events
		>Pendings	: 
						#include <sysTerminal.mqh>
	*/
	
	int cur.idx;
	int old_idx;
	
	int cur.ti;
	int old_ti;
	
	int cur.ty;
	int old_ty;
	
	double cur.op;
	double old_op;
	
	double cur.sl;
	double old_sl;
	//------------------------------------------------------
	int cur.ROWS = T_CurRows();
	int old_ROWS = T_OldRows();
	
	//------------------------------------------------------
	//checking for new orders
	for(cur.idx = 0; cur.idx < cur.ROWS; cur.idx++){
	
		//--------------------------------------------------
		cur.ti	=	T_CurTicketByIndex(cur.idx);
		
		//--------------------------------------------------
		old_idx	=	T_OldIndexByTicket(cur.ti);
		
		
		// @onNewOrder
		if(old_idx <= -1){									// this is new order
			
			//----------------------------------------------
			onNewOrder(cur.ti);
		}
		
		//--------------------------------------------------
		if(old_idx >= 0){
			
			//----------------------------------------------
			//{	@onChangeType
			cur.ty = T_CurTypeByIndex(cur.idx);
			old_ty = T_OldTypeByIndex(old_idx);
			
			//----------------------------------------------
			if(cur.ty != old_ty){
				onChangeType(cur.ti, cur.ty, old_ty);
			}
			//}
			
			//{	@opChangeOP
			cur.op = T_CurOPByIndex(cur.idx);
			old_op = T_OldOPByIndex(old_idx);
			
			//----------------------------------------------
			if(cur.op != old_op){
				onChangeOP(cur.ti, cur.op, old_op);
			}
			//}
		
			//{	@onChangeSL
			cur.sl = T_CurSLByIndex(cur.idx);
			old_sl = T_OldSLByIndex(cur.idx);
			
			//----------------------------------------------
			if(cur.sl != old_sl){
				onChangeSL(cur.idx, cur.sl, old_sl);
			}
			//}
		}
	}

	//checking for closed orders
	for(old_idx = 0; old_idx < old_ROWS; old_idx++){
	
		//--------------------------------------------------
		old_ti	=	T_OldTicketByIndex(old_idx);
		
		//--------------------------------------------------
		cur.idx	=	T_CurIndexByTicket(old_ti);
		
		//{	@onCloseOrder
		if(cur.idx <= -1){
			
			onCloseOrder(old_ti);
		}
		//}
	}	
}

//{	@onEvents	====================================

void onNewOrder(int ticket){
	/*
		>Ver	:	0.0.0.4
		>Date	:	2013.05.14
		>Hist	:	
					@0.0.0.4@2013.05.14@artamir	[]	onNewOrder
			@0.0.2@2012.10.03@artamir	[]
		>Author	:	Morochin <artamir> Artiom
		>Desc	:
	*/
	
	//------------------------------------------------------
	//TODO: �������� ���������� ������ ������.
	//1.���������� � ������ �������������
	//2.���������� ����������� ������� ������������
	//3.���������� ������ ������� � ������ �������
	
	//------------------------------------------------------
	if(Debug && BP_Events_NEW){
		BP("onNewOrder", "ti = ", ticket);
	}
	
	//OE_setStandartDataByTicket(ticket);
	SQL_setStandartDataByTI(ticket);
	if(Debug && BP_Events_NEW){
		A_d_PrintArray2(aOE, 4, "aOE_NewOrder");
	}
}

void onChangeType(int ticket, int ty_new, int ty_old = -1){
	/*
		>Ver	:	0.0.3
		>Date	:	2013.03.06
		>Hist	:
		>Author	:	Morochin <artamir> Artiom
		>Desc	:
	*/
	
	//------------------------------------------------------
	//TODO: �������� ���������� ��������� ���� ������.
	//1.���������� � ������ �������������
	//2.���������� ����������� ������� ������������
	//3.���������� ������ ������� � ������ �������
	
	if(Debug && BP_Events_CHTY){
		BP("onChangeType");
	}
	
	OE_setChangeTYBuTicket(ticket, ty_new);
}

void onChangeOP(int ticket, double op.new, double op.old = -1){
	/*
		>Ver	:	0.0.2
		>Date	:	2013.02.23
		>Hist	:
		>Author	:	Morochin <artamir> Artiom
		>Desc	:
	*/
	
	//------------------------------------------------------
	//TODO: �������� ���������� ��������� ���� �������� ������.
	//1.���������� � ������ �������������
	//2.���������� ����������� ������� ������������
	//3.���������� ������ ������� � ������ �������
	if(Debug && BP_Events_CHOP){
		BP("onChangeOP","ti = ", ticket, "op.new = ", op.new, "op.old = ", op.old);
	}
	
	OE_setOPByTicket(ticket, op.new);
}

void onChangeSL(int ticket, double sl.new, double sl.old = -1){
	/*
		>Ver	:	0.0.1
		>Date	:	2013.02.15
		>Hist	:
		>Author	:	Morochin <artamir> Artiom
		>Desc	:
	*/
	
	//------------------------------------------------------
	//TODO: �������� ���������� ��������� ���� �������� ������.
	//1.���������� � ������ �������������
	//2.���������� ����������� ������� ������������
	//3.���������� ������ ������� � ������ �������
	if(Debug && BP_Events_CHSL){
		BP("onChangeSL");
	}
}

void onCloseOrder(int ticket){
	/*
		>Ver	:	0.0.3
		>Date	:	2013.02.21
		>Hist	:
		>Author	:	Morochin <artamir> Artiom
		>Desc	:
	*/
	
	//------------------------------------------------------
	//TODO: �������� ���������� ��������� ������.
	//1.���������� ������� IsClosed ������� �������������.
	//2.���������� ������ ������� � ������ �������
	OE_setCloseByTicket(ticket);
	if(Debug && BP_Events_CL){
		A_d_PrintArray2(aOE, 4, "aOE_Close");
		A_d_PrintArray2(aCurOrders, 4, "aCUR_Close");
		A_d_PrintArray2(aOldOrders, 4, "aOLD_Close");
		BP("onCloseOrder","ti = ",ticket);
	}
}

//}
