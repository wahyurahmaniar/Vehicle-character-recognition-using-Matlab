%==========================================================================
function varargout = labeling_new(varargin)
%==========================================================================

Ifill=cell2mat(varargin);
[Ilabel num] = bwlabel(Ifill,8);
%Memberi tanda area tiap objek
Iprops=regionprops(Ilabel);
AllArea=[Iprops.Area];
%mencari luas objek kurang dari 1000
idx2=find([Iprops.Area]>0);
inew=ismember(Ilabel,idx2); %image irisan
%image irisan diberi label baru
[Ilabel2,num2]=bwlabel(inew,8);
Iprops2=regionprops(Ilabel2,'Basic') %properti kotak batas dari image
Ibox2=[Iprops2.BoundingBox]
Ibox2=reshape(Ibox2,[4 num2]);
varargout=mat2cell(Ibox2);