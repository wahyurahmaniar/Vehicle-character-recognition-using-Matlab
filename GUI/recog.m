%==========================================================================
function akhir = recog(Ibox3)
%==========================================================================
global Ibox23 Ibw
if isempty(Ibox23)==1
Cellcrop = crop2(Ibox3,Ibw);
else
Cellcrop = crop2(Ibox3,Ibox23);
end

L=length(Cellcrop);
tampil=zeros(1,(L));
for k=1:L
Iblok=cell2mat(Cellcrop(k));
abjad=dicoba(Iblok);
tampil(k)=abjad;
akhir(k)=char(tampil(k));
end