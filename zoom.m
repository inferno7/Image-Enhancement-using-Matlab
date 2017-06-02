%CODE FOR ZOOMING

p=imread('rice.png');%imread reads the image from the file
figure,imshow(p),title('The original image :');% 3 lines done in one line,normal!
r=p(1:100,25:100);
c=zeros(150,200);%returns a 150by200 matrix of only zeroes
k=1;
for i=1:2:150
    for j=1:2:200
        c(i,j)=r(k);
        k=k+1;
    end
end
n=c';%complex conjugate/transpose of matrix c!
m=[1 1;1 1];
t=uint8(conv2(m,n));%uint8-converts matrix to unsigned 8bit integer:::conv2 creates a 2d convolution of matrix m,n 
figure;imshow(r),title('The cropped image :');
figure;imshow(t),title('The zoomed image :');
