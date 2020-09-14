%==========================================================================
function [Ibox22]=misah(Ibox21,buang,rata2)
%==========================================================================
posisi=Ibox21(:,(buang));
posisipertama=[(posisi(1)); (posisi(2)+rata2); (posisi(3)); (posisi(4)-rata2)]; %delete garis
posisikedua=[(posisi(1)); (posisi(2)); (posisi(3));(rata2)]; %tinggal hurufnya

Ibox22=posisikedua;
   