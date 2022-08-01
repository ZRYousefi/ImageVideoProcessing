function [ output_args ] = ContrastStretch( input_args )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


end







clc; clear all; close all;
f=imread('man8.png');
c=input('Enter the constant value, c = ');
[M,N]=size(f);
        for x = 1:M
            for y = 1:N
                m=double(f(x,y));
                z(x,y)=c.*log10(1+m);
            end
        end
imshow(f), figure, imshow(z);