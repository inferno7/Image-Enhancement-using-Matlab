%CODE FOR 1D ROW COMPRESSION

peppers=imread('peppers.png');
origWidth=size(peppers,2);
samplesHalf=floor(origWidth/2);
samplesQuarter=floor(origWidth/4);
samplesEigth=floor(origWidth/100);
peppersCompressed2=[];
peppersCompressed4=[];
peppersCompressed8=[];
for k=1:3%all color layers:RGB%
    for i=1:size(peppers,1)%all rows%
        rowDCT=dct(double(peppers(i,:,k)));
        peppersCompressed2(i,:,k)=idct(rowDCT(1:samplesHalf),origWidth);
        peppersCompressed4(i,:,k)=idct(rowDCT(1:samplesQuarter),origWidth);
        peppersCompressed8(i,:,k)=idct(rowDCT(1:samplesEigth),origWidth);
    end
end
subplot(2,2,1),image(uint8(peppers)),title('original image');
subplot(2,2,2),image(uint8(peppersCompressed2)),title('2Xcompression');
subplot(2,2,3),image(uint8(peppersCompressed4)),title('4Xcompression');
subplot(2,2,4),image(uint8(peppersCompressed8)),title('8Xcompression');
