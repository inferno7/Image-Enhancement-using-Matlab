%CODE FOR 1D COLUMN COMPRESSION

peppers=imread('peppers.png');
origHeight=size(peppers,2);
samplesHalf=floor(origHeight/2);
samplesQuarter=floor(origHeight/4);
samplesEigth=floor(origHeight/100);
peppersCompressed2=[];
peppersCompressed4=[];
peppersCompressed8=[];

for k=1:3  %all color layers:RGB%
    for i=1:size(peppers,1)% all columns%
        columnDCT=dct(double(peppers(:,i,k)));
         peppersCompressed2(:,i,k)=idct(columnDCT(1:samplesHalf),origHeight);
         peppersCompressed4(:,i,k)=idct(columnDCT(1:samplesQuarter),origHeight);
         peppersCompressed8(:,i,k)=idct(columnDCT(1:samplesEigth),origHeight);
    end
end
subplot(2,2,1),image(uint8(peppers)),title('Original Image');
subplot(2,2,2),image(uint8(peppersCompressed2)),title('Compression by factor 2');
subplot(2,2,3),image(uint8(peppersCompressed4)),title('Compression by factor 4');
subplot(2,2,4),image(uint8(peppersCompressed8)),title('Compression by factor 8');
