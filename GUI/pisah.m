%==========================================================================
function [Ibox3] = pisah(tampil,lebarstandar)
%==========================================================================
cnt=size(Ibox2,2);
simpan=zeros(1,cnt);

for i=1:cnt-1
simpan(i)=(Ibox2(3,(i))>lebarstandar);
    if simpan(i)~=0
    posisi=Ibox2(:,(i));
    posisipertama=[(posisi(1)); (posisi(2)); (posisi(3)/2); (posisi(4))]; %posisi huruf pertama dalam Ibw
    posisikedua=[(posisi(1)+(posisi(3)/2)); (posisi(2)); (posisi(3)/2); (posisi(4))]; %posisi huruf kedua dalam Ibw
    Ibox2(:,(i))=[]; %di hapus yang ganthet
    Ibox2=Ibox2'; %di transpose
    Ibox2=[Ibox2(1:((i)-1),:);posisipertama';posisikedua';Ibox2((i),:)]; %nyelipin yg udah di split
    Ibox2=Ibox2';
    Ibox3=Ibox2; % dibalikin lagi
    end
end

simpann=(Ibox2(3,(cnt))>lebarstandar);
if simpann==1
posisi=Ibox2(:,cnt);
posisipertama=[(posisi(1)); (posisi(2)); (posisi(3)/2); (posisi(4))]; %posisi huruf pertama dalam Ibw
posisikedua=[(posisi(1)+(posisi(3)/2)); (posisi(2)); (posisi(3)/2); (posisi(4))]; %posisi huruf kedua dalam Ibw
Ibox2(:,(cnt))=[]; %di hapus yang ganthet
Ibox2=Ibox21'; %di transpose
Ibox2=[Ibox21(1:((cnt)-1),:); posisipertama'; posisikedua']; %nyelipin yg udah di split
Ibox2=Ibox2';
Ibox3=Ibox2; % dibalikin lagi
end

simpannn=(Ibox2(3,1)>lebarstandar);
if simpannn==1
posisi=Ibox2(:,(1));
posisipertama=[(posisi(1)); (posisi(2)); (posisi(3)/2); (posisi(4))]; %posisi huruf pertama dalam Ibw
posisikedua=[(posisi(1)+(posisi(3)/2)); (posisi(2)); (posisi(3)/2);
(posisi(4))]; %posisi huruf kedua dalam Ibw
Ibox2(:,(1))=[]; %di hapus yang ganthet
Ibox2=Ibox2'; %di transpose
Ibox2=[posisipertama'; posisikedua'; Ibox21(1:((cnt)-1),:)]; %nyelipin yg udah di split
Ibox2=Ibox21';
Ibox3=Ibox2; % dibalikin lagi
end


