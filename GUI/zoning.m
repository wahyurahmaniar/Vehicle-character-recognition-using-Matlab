%==========================================================================
function varargout = zoning(image_file)
%==========================================================================
%BW=cell2mat(varargin);
%BW=imread(image_file);
BW=image_file;
%imview(BW)
itin=bwmorph(BW,'thin',inf);
[row,col]=size(itin);
fun=inline('size((find(x==1)),1)'); %==> bikin fungsi dalam setiap blok
%image huruf, yaitu fungsi menghitung jumlah piksel bernilai 1
Iblok=blkproc(itin,[ceil(row/6) ceil(col/4)],fun); %==> membuat blok (row dan col yg diinginkan)
row=size(Iblok,1);
col=size(Iblok,2);
if row < 6
Iblok(6,:)=zeros(1,6)
end
if col < 4
Iblok(:,4)=zeros(4,1)
end
varargout=mat2cell(Iblok);
