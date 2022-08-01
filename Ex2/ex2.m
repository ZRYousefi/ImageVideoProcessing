clear all,
close all,
clc,

%% Task 1
A = 0:255;

step = 256/4; % 64
QA1 = quant(A, step); % Discretize values as multiples of quantity and 
% returns values from A rounded to nearest multiple of 64. (0*64, 1*64, 2*64, 3*64, 4*64)
figure, plot(QA1);

partition = step:step:256-step; % 64, 128, 192  partition is 
% a real vector whose entries are in strictly ascending order.
% Partition has length 3, index is a vector whose kth entry is
    % 0 if A(k) ? partition(1)=64
    % 1 if partition(1)=64 < A(k) ? partition(2)=128
    % 2 if partition(2)=128 < A(k) ? partition(3)=192
    % 3 if partition(3)=192 < A(k)
codebook = step/2:step:256-step/2; % 32, 32+64=96, 96+64=160, 160+64=224
[indx,QA2] = quantiz(A, partition, codebook); % returns the quantization levels 
% in the real vector signal A using the parameter partition. 

% codebook prescribes a value for each partition in the quantization and 
% quants contains the quantization of A based on the quantization levels and 
% prescribed values. codebook is a vector whose length exceeds the length of partition by one. 
% quants is a row vector whose length is the same as the length of A. 
% quants is related to codebook and index by
% `   quants(ii) = codebook(index(ii)+1); 
% where ii is an integer between 1 and length(A).    
figure, plot(QA2);
% it design a 4-levels uniform quantizer to quantize the vector signal A
C1 = unique(QA1)
C2 = unique(QA2)


%% Task 2
% a
clear all, 
close all,

I = imread('lena_face.png');
figure, imshow(I)
A = I(:);
n = [5:-1:0];

figure,
for i = 1: length(n)
    level(i) = 4*(2^n(i));
    step(i) = 256/level(i);
    partition{i} = step(i):step(i):256-step(i);
    codebook{i} = step(i)/2:step(i):256-step(i)/2;
    [indx{i},QA{i}] = quantiz(A, partition{i}, codebook{i});
    R{i} = uint8(reshape(QA{i},[256,256])); 
    subplot(2,3,i),imshow(R{i});title({'quantize_level_',level(i)}, 'Interpreter', 'latex');
end


% b

noise = uint8(randi(64,256));
N = noise + I;
A_n = N(:);
[indx,QA_n] = quantiz(A_n, partition{4}, codebook{4});
R_n = uint8(reshape(QA_n,[256,256]));
% figure, imshow(R_n)
figure, subplot(1,2,1), imshow(R{4}), title('noiseless quantized to 16 level');
subplot(1,2,2), imshow(R_n), title('noisy quantized to 16 level');

%% Task 3

I1 = 63*ones(8);
I1(3:6, 3:6) = 127;
Image1 = uint8(I1);

I2 = 223*ones(8);
I2(3:6, 3:6) = 127;
Image2 = uint8(I2);

side_image = cat(2, Image1, Image2);
figure,  imshow(side_image)

I3 = 223*ones(8);
I3(3:6, 3:6) = 160;
Image3 = uint8(I3);

side_image_2 = cat(2, Image1, Image3);
figure, subplot(1,2,1),imshow(side_image)
subplot(1,2,2), imshow(side_image_2)


