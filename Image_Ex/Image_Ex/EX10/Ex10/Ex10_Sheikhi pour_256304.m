clc
clear all
close all
x=0:100:700;
R=[0 255   0     255   0    255   255    0]
G=[0   0   255   255    255  0    255    0]
B=[0 255   0     255    255  0    0    255]
xlim([0 700])
subplot(311);stairs(x,R,'r');title('R')
subplot(312);stairs(x,G,'g');title('G')
subplot(313);stairs(x,B,'b');title('B')

H=[160 200   120     160   80  0     40   160]
S=[0   240   240     0    240  240   240    240]
V=[0   120   120     240  120  120   120  120 ]
figure
xlim([0 700])
subplot(311);stairs(x,H,'m');title('H')
subplot(312);stairs(x,S,'c');title('S')
subplot(313);stairs(x,V,'k');title('V')
