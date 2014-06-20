//+------------------------------------------------------------------+
//|                                                   fxoSignals.mqh |
//|                        Copyright 2014, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2014, MetaQuotes Software Corp."
#property link      "http://www.mql5.com"
#property version    2.3
#property strict

double tma_up=0,tma_dw=0;

input string  SI = "=== SIGNALS ===";
input string  SI_TMA = "===== TMA =====";
extern bool   SI_TMA_use                  = true; //Use TMA  
extern bool   SI_TMA_useStop              = true; //Use StopOrders
extern bool   SI_TMA_useMarketPrice       = true; //Use Market Price
extern int    SI_TMA_SODelta              = 30; //Stoporders delta
extern string SI_TMA_TimeFrame            = "current time frame"; //TimeFrame
extern int    SI_TMA_HalfLength           = 56;//HalfLength
extern ENUM_APPLIED_PRICE    SI_TMA_Price = PRICE_CLOSE;//Price
extern double SI_TMA_ATRMultiplier   = 2.0; //ATRMultiplier
extern int    SI_TMA_ATRPeriod       = 100; //ATRPeriod
extern bool   SI_TMA_Interpolate     = true; //Interpolate
extern int    SI_TMA_Delta           = 1;   //Delta

#include <sysBase.mqh>

#define  OE_TMA OE_USR1

#define SELECT(a,text) int aI[]; ArrayResize(aI,0,1000); AId_Init2(a,aI); if(bDebug){AId_Print2(a,aI,4,"line_before"+__LINE__);} B_Select(a, aI, text); if(bDebug){AId_Print2(a,aI,4,"line_after"+__LINE__);}

#define TMA_UP 1
#define TMA_DW -1



int fSI_Main(){
   int res=0; //0-��� �������, 1-���, -1-����
   
   if(SI_TMA_use){
      res=fSI_TMA();
      if(SI_TMA_useStop){
         fSI_TMAMoveStop();
         if(res!=0){
            fSI_TMASendStop(res);
         } 
         res=0;
      }
   }
   
   return(res);
}

int fSI_TMA(){
   int Signal=0;
   tma_up=iCustom(Symbol(),0,"TMA",SI_TMA_TimeFrame,SI_TMA_HalfLength, SI_TMA_Price, SI_TMA_ATRMultiplier, SI_TMA_ATRPeriod, SI_TMA_Interpolate, false, false,false,false,false,false,1,0);
   tma_dw=iCustom(Symbol(),0,"TMA",SI_TMA_TimeFrame,SI_TMA_HalfLength, SI_TMA_Price, SI_TMA_ATRMultiplier, SI_TMA_ATRPeriod, SI_TMA_Interpolate, false, false,false,false,false,false,2,0);
   
   double this_price=Bid;
   
   //������������ ������������ ����������
   tma_up=NormalizeDouble(tma_up,Digits);
   this_price=NormalizeDouble(this_price,Digits);
   
   double tma_up_zone=NormalizeDouble((tma_up-SI_TMA_Delta*Point),Digits);
   
   if(this_price>=tma_up_zone && this_price<=tma_up)Signal=-1;//sell
   
   this_price=Bid;
   
   //������������ ������������ ����������
   tma_dw=NormalizeDouble(tma_dw,Digits);
   this_price=NormalizeDouble(this_price,Digits);
   
   double tma_dw_zone=NormalizeDouble((tma_dw+SI_TMA_Delta*Point),Digits);
   
   if(this_price<=tma_dw_zone && this_price>=tma_dw)Signal=1;//buy
   
   return(Signal);
}

void fSI_TMASendStop(int sig=0){ 
   zx
   
   double tma_up=0, tma_dw=0;;
   
   if(sig==0)return;
   
   string f=StringConcatenate(""
            ,OE_MN,"==",MagicNumber
            ," AND "
            ,OE_IT,"==1"
            ," AND "
            ,OE_TMA,"==",sig);
            
   SELECT(aEC,f);
   
   int rows=ArrayRange(aI,0);
   
   if(rows<=0){
      tma_up=iCustom(Symbol(),0,"TMA",SI_TMA_TimeFrame,SI_TMA_HalfLength, SI_TMA_Price, SI_TMA_ATRMultiplier, SI_TMA_ATRPeriod, SI_TMA_Interpolate, false, false,false,false,false,false,1,0);
      tma_dw=iCustom(Symbol(),0,"TMA",SI_TMA_TimeFrame,SI_TMA_HalfLength, SI_TMA_Price, SI_TMA_ATRMultiplier, SI_TMA_ATRPeriod, SI_TMA_Interpolate, false, false,false,false,false,false,2,0);
      
      if(tma_up==tma_dw)return;
      
      Print("sig="+sig);
      
      int cmd=-1;
      double pr=0;
      if(sig==1){cmd=OP_BUYSTOP; pr=tma_dw;}
      else{cmd=OP_SELLSTOP; pr=tma_up;}
      
      double d[];
      //Print(__FUNCTION__+": tma_up="+(string)tma_up+" : tma_dw="+(string)tma_dw+" cmd="+(string)cmd);
      TR_SendPending_array(d,cmd,pr,SI_TMA_SODelta,CalcLots(gd_244),0,0,"TMA Stop",MagicNumber);
      int rows_d=ArrayRange(d,0);
      //Print(__FUNCTION__+": d="+(string)rows_d);
      for(int i=0;i<rows_d;i++){
         int ti=d[i];
         OE_setSTD(ti);
         OE_setPBT(ti,OE_TMA,sig);
      }
      
      B_Start();
   }
   xz           
}

void fSI_TMAMoveStop(){
   double tma_up=0, tma_dw=0;;
   
   if(!SI_TMA_useMarketPrice){
      tma_up=iCustom(Symbol(),0,"TMA",SI_TMA_TimeFrame,SI_TMA_HalfLength, SI_TMA_Price, SI_TMA_ATRMultiplier, SI_TMA_ATRPeriod, SI_TMA_Interpolate, false, false,false,false,false,false,1,0);
      tma_dw=iCustom(Symbol(),0,"TMA",SI_TMA_TimeFrame,SI_TMA_HalfLength, SI_TMA_Price, SI_TMA_ATRMultiplier, SI_TMA_ATRPeriod, SI_TMA_Interpolate, false, false,false,false,false,false,2,0);
   }else{
      tma_up=MarketInfo(Symbol(),MODE_ASK);
      tma_dw=MarketInfo(Symbol(),MODE_BID);
   }   
   
   string f=StringConcatenate(""
            ,OE_MN,"==",MagicNumber
            ," AND "
            ,OE_IT,"==1"
            ," AND "
            ,OE_IP,"==1");
            
   SELECT(aEC,f);
   
   int rows=ArrayRange(aI,0);
   
   for(int i=0;i<rows;i++){
      int ti=AId_Get2(aEC,aI,i,OE_TI);
      int ty=AId_Get2(aEC,aI,i,OE_TY);
      
      if(ty==OP_BUYSTOP){
         if(!SI_TMA_useMarketPrice){
            TR_MoveOrder(ti,tma_dw+SI_TMA_SODelta*Point);
         }else{
            TR_MoveOrderBetterPrice(ti,tma_dw+SI_TMA_SODelta*Point);
         }
            
      }
      
      if(ty==OP_SELLSTOP){
         if(!SI_TMA_useMarketPrice){
            TR_MoveOrder(ti,tma_up-SI_TMA_SODelta*Point);
         }else{
            TR_MoveOrderBetterPrice(ti,tma_up-SI_TMA_SODelta*Point);
         }
      }
   }
}