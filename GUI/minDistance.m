%==========================================================================
 function [jarak]=minDistance(Iblok,hrf)
%==========================================================================
 for i=1:length(hrf);
     hrff=cell2mat(hrf(i))
     sell=abs(Iblok-hrff);
     d=sell.*sell;
     d=sum(sum(d));
     jarak(i)=sqrt(d);
 end
