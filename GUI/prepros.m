%==========================================================================
function Ibox3 = prepros(I)
%==========================================================================
global Ibox23 Ibox22 Ibw
%% Baca Image
%% grayscale image
Igray=rgb2gray(I);
%figure,imshow(Igray)
%% Convert binary image
Ibw=im2bw(Igray,graythresh(Igray));
%figure,imshow(Ibw)
%Image Filling
Ifill=imfill(Ibw,'holes');
%figure,imshow(Ifill)

Ibox1=labeling_new(Ifill);
[r,c]=size(Ibw);
kandi=find(Ibox1(4,:)>(0.47*r));
Ibox21=Ibox1(:,kandi);
buang=find(Ibox21(3,:)>(0.9*c))

if isempty(buang)==1
Ibox2=Ibox21;
Ibox23=[];
elseif isempty(buang)~=1
verti=Ibox21(4,buang);
ting=Ibox21(4,:);
ting(buang)=[];
tinggistandar=ting;
rata2=mean(tinggistandar);
  if verti>rata2 %ada ganthet verti
  Ibox22=misah(Ibox21,buang,rata2);
  Ibox23=imcrop(Ibw,Ibox22);
  Ib=labeling_new(Ibox23);
  [er,ce]=size(Ibox23);
  kandid=find(Ib(4,:)>(0.5*er));
  Ibox2=Ib(:,kandid);
  elseif verti<rata2
  Ibox21(:,buang)=[];
  Ibox2=Ibox21;
  Ibox23=[];
  end    
end

[nilai posisis]=max(Ibox2(3,:));
lebarstandar=mean(Ibox2(3,:));
sel=(nilai)-(lebarstandar);
if sel>(nilai/3)
buanglagi=(posisis);
else
buanglagi=[]
end

[nilaii posisii]=min(Ibox2(3,:));
if nilaii<(lebarstandar/2.5)
Ibox2(:,posisii)=[]
else
Ibox2=Ibox2;
end

if isempty(buanglagi)==1
Ibox3=Ibox2;
else
Ibox3=pisah(Ibox2,lebarstandar);
end