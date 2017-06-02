%CODE FOR BRIGHTNESS

[FileName,PathName]=uigetfile('*.jpg','Select any image:');%uigetfile returns a window to select an image
y=[PathName,FileName];
img=imread(y);%reads the image y got by uigetfile
figure,imshow(y),title('Original image');
[m1 n1 r1]=size(img);%3-d size of image
if(r1==3)
    a=rgb2ntsc(img);%converts rgbmap to YIQ map
end
if(r1==1)
    a=double(img)./255;
end
[m1 n1 r1]=size(a);
limit=mean(mean(a(:,:,1)))%all rows&all columns in the first page
my_limit=0.9;
limca=my_limit-limit;
for i=1:m1
    for j=1:n1
        a(i,j,1)=a(i,j,1)+limca;
    end
end
if(r1==3)
  image=ntsc2rgb(a);
end
if(r1==1)
    image=a;
end
image=image.*255;
image=round(image);%rounding to nearest integer or decimal
image=uint8(image);%conversion to unsigned 8bit integers
imwrite(image,y);%writes an image to the graphics file
figure,imshow(image),title('The enhanced image is:')