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

noise = uint8(randi(128,256));
N = noise + I;
A_n = N(:);
[indx,QA_n] = quantiz(A_n, partition{4}, codebook{4});
R_n = uint8(reshape(QA_n,[256,256]));
% figure, imshow(R_n)
figure, subplot(1,2,1), imshow(R{4}), title('noiseless quantized to 16 level');
subplot(1,2,2), imshow(R_n), title('noisy quantized to 16 level');
