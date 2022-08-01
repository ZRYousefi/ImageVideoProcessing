close all,
clear all, 
clc,

% function Ex1_batch
    imgFiles = dir('C:\Users\Z RY\Documents\TUT\Introduction to Image and Video Processing\Ex1\task2\*.jpg');  % the folder in which ur images exists
    for i = 1 : length(imgFiles)
        filename = strcat('C:\Users\Z RY\Documents\TUT\Introduction to Image and Video Processing\Ex1\task2\',imgFiles(i).name);
        I = imread(filename);
        Out = Process(I);
        figure, imshow(Out);
        name = num2str(imgFiles(i).name(1:3));
        imwrite(I, [name, '.bmp'])
    end
% end

function Output = Process(I)
    I_scale = imresize(I, 0.75);
    I_rightHalf = I_scale(:,1:size(I_scale,2)/2,:);
    I_flip = fliplr(I_rightHalf);
    I_rotate = imrotate(I_flip, 90);
    Output = I_rotate;
end
