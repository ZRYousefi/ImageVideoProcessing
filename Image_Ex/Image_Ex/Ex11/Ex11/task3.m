%% task 3
close all;
clear all;
clc;
% Create a struct named "parameters", 
% which has following fields for the header parameters
% W = width, H = Height, F = Framerate, I = interlacing,
% A = pixel aspect ratio, C = chroma subsampling ratio
% Create a struct named "parameters", 
% which has following fields for the header parameters
% W = width, H = Height, F = Framerate, I = interlacing,
% A = pixel aspect ratio, C = chroma subsampling ratio

field1 = 'W';  value1 = 0;
field2 = 'H';  value2 = 0;
field3 = 'F';  value3 = 0;
field4 = 'I';  value4 = 0;
field5 = 'A';  value5 = 0;
field6 = 'C';  value6 = 0;
field=['W','H','F','I','A','C'];
parameters = struct(field1,[],field2,[],field3,[],field4,[],...
    field5,[],field6,[]);
parameters(3).W=5;
% Create a for -loop 
% where all headers in videofileinfo are processed
% and variables are saved to paramters struct

load('videofileinfo');
v=length(videofileinfo);

%  headerstr='YUV4MPEG2 W176 H144 Ip F30000:1001 A128:117';
%  mystr=[headerstr,' ','D'];
%  mystr;
%   
%    missing_letter='C';
%   data_ind=find(headerstr==missing_letter)
%  
%   parameterValue=myfind(headerstr,missing_letter)
 
 

for i=1:v
    headerstr=videofileinfo(i).header;
    
    missing_letter='W';
    parameterValue=myfind(headerstr,missing_letter);
    parameterValue=str2double(parameterValue);
    parameters(i).W=parameterValue;
    
    missing_letter='H';
    parameterValue=myfind(headerstr,missing_letter);
    parameterValue=str2double(parameterValue);
    parameters(i).H=parameterValue;
    
    missing_letter='F';
    parameterValue=myfind(headerstr,missing_letter);
    parameters(i).F=parameterValue;
    
    missing_letter='I';
    parameterValue=myfind(headerstr,missing_letter);
    parameters(i).I=parameterValue;
    
    missing_letter='A';
    parameterValue=myfind(headerstr,missing_letter);
    parameters(i).A=parameterValue;
    
    missing_letter='C';
    parameterValue=myfind(headerstr,missing_letter);

    if(isempty(parameterValue))
        parameterValue='420';
    end

    parameters(i).C=parameterValue;
end
