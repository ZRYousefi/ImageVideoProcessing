clear;clc;close all;

I_ref = imread('im1.png');
I_cur = imread('im2.png');

sz = size(I_ref)
bsize = 5;
searchRadius = 10;
MotionEstimation( I_ref, I_cur, sz, bsize, searchRadius);