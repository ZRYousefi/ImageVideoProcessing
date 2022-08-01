function [frames, N, frameformat] = visualize(framepath)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

D = dir('*.png');
frames = cell(1,numel(D));
for i = 1:numel(D)
    frames{i} = imread(D(i).name);
    subplot(3,6,i);
    imshow( frames{i})
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

% posvec=[50 150 1024 768];
% figure('Color',[0 0 0],'Position',posvec)
% for j=1:18
%     rgbframe=frames {j};
%     imagehandle=image(rgbframe,'Erasemode','None');
%     axis egual;axis off; 
%     for index=2:max(size(frames))
%     rgbframe=frames{index};%cell-type variable;
%     set(imagehandle,'Cdata',rgbframe);drawnow
%     
%     end
% 
% end

end

