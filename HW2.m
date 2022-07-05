lena = imread("lena.jpg");
imOriginal = double(rgb2gray(lena));
figure();
imshow(uint8(imOriginal));
sizeOriginal = size(imOriginal);
pixelsNeededToStoreOriginalImage = sizeOriginal(1)*sizeOriginal(2)
[newU, newSigma, newV] = compress(imOriginal,50);
% k = 1
[newU, newSigma, newV] = compress(imOriginal,1);
imCompressed = newU*diag(newSigma)*newV';
figure;
hold on;
title('k = 1');
imshow(uint8(imCompressed));
hold off;
% k = 5 
[newU, newSigma, newV] = compress(imOriginal,10);
imCompressed = newU*diag(newSigma)*newV';
figure;
hold on;
title('k = 10');
imshow(uint8(imCompressed));
hold off;
% k = 50
[newU, newSigma, newV] = compress(imOriginal,50);
imCompressed = newU*diag(newSigma)*newV';
figure;
hold on;
title('k = 50');
imshow(uint8(imCompressed));
hold off;
% k = 100
[newU, newSigma, newV] = compress(imOriginal,100);
imCompressed = newU*diag(newSigma)*newV';
figure;
hold on;
title('k = 100');
imshow(uint8(imCompressed));
hold off;
% k = 256
[newU, newSigma, newV] = compress(imOriginal,256);
imCompressed = newU*diag(newSigma)*newV';
figure;
hold on;
title('k = 256');
imshow(uint8(imCompressed));
hold off;


%graph 
errnorm = zeros(1,512);
pixelsNeeded = zeros(1,512);
for i = 1:512
    [newU, newSigma, newV] = compress(imOriginal,i);
    imCompressed = newU*diag(newSigma)*newV';
    sizeV = size(newV);
    sizeU = size(newU);
    pixelsNeeded(1,i) = sizeV(1)*sizeV(2) + sizeU(1)*sizeU(2) + length(newSigma);
    err = imOriginal - imCompressed;
    errnorm(i) = norm(err,"fro")/norm(imOriginal,"fro");
end

figure;
hold on;
xlabel('k') 
ylabel('Relative error norm');
plot(errnorm);
hold off;

figure;
hold on;
xlabel('k') 
ylabel('Memory needed to store image');
plot(pixelsNeeded);
hold off;

%%
%5.2.10
anan = imread("5.2.10.tiff");
imOriginal = double(anan);
%graph 
errnorm = zeros(1,512);
pixelsNeeded = zeros(1,512);
for i = 1:512
    [newU, newSigma, newV] = compress(anan,i);
    imCompressed = newU*diag(newSigma)*newV';
    sizeV = size(newV);
    sizeU = size(newU);
    pixelsNeeded(1,i) = sizeV(1)*sizeV(2) + sizeU(1)*sizeU(2) + length(newSigma);
    err = imOriginal - imCompressed;
    errnorm(i) = norm(err,"fro")/norm(imOriginal,"fro");
end

figure;
hold on;
xlabel('k') 
ylabel('Relative error norm');
plot(errnorm);
hold off;

figure;
hold on;
xlabel('k') 
ylabel('Memory needed to store image');
plot(pixelsNeeded);
hold off;
