clc
clear all
close all
load formats.mat
load videofileinfo.mat
%%
%1) Visualization of the video frames (3 points)
[frames, N, frameformat] = visualize(framepath) 
D = dir('*.png');
frames = cell(1,numel(D));
for i = 1:numel(D)
    frames{i} = imread(D(i).name);
    subplot(3,6,i);
    imshow( frames{i})

    title(subplot(3,6,i),i)
end

N=max(size(frames));
figure

for j=1:numel(D)
    imshow(frames{j})
end

[d1 d2 d3]=size(frames{1});
for i=1:4
if  formats(i).horizontalsize==d2 && formats(i).verticalsize==d1
    frameformat=formats(i).name
end
end

%%
%2) Introduction to header (2 points)


for i=1:8
    index=videofileinfo(i).index;
    name=videofileinfo(i).name;
    header=videofileinfo(i).header;
    
    tmp = [num2str(index) ' ' header ' ' name];% the same as cat command
    disp(tmp)
    % disp(index, name, header)
end


%%
%3) Processing of the header string
parameters=struct('W' , 'width', 'H', 'Height', 'F', 'Framerate',...
    'I','interlacing', 'A' , 'pixel aspect ratio',...
    'C' , 'chroma subsampling ratio')
for i=1:8
    headerstr =videofileinfo(i).header
    headerstr_split = strsplit(headerstr)
%     parameters(i)=
%     
%     if headerstr_split=
%        H=parameters(2).H
%     else if
%             
%             
%     end
%        
    %find spaces
    space_ind=find(headerstr==' ')
    %find H
    missing_letter='W';
    data_ind=find(headerstr==missing_letter)
    %find the next space after H
    next_space=space_ind(find(space_ind>data_ind,1))
    %save the parameters from the header
    param_data=headerstr(data_ind+1:next_space-1)
    %transform the string to a number
    H = str2num(param_data)

    
end



%Test
for n=1:lenght(parameters)
    disp([W:'num2str(parameters(n).W)' 'H: 'num2str(parameters(n).H)'...
        'F:'parameters(n).W)'I:'(parameters(n).I 'A:'parameters(n).A 'C:'parameters(n).C ]')
end


    