function [out] = histequal(image,out)
%histogram equalization function
[x,y]=size(image);
t=zeros(256,1)
for x=1:size(image,1)
     for y=1:size(image,2)
         val=image(x,y)
         if val==256
             val=255
         end
          t(val+1)=t(val+1)+1;
     end
end
  bar(1:256,t)
end

