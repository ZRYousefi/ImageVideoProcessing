function  output = histMatch(img,Ref)
L = 256;

[~, T] = histequal(img);
[~, G] = histequal(Ref);
M = zeros(L,1);
for i = 1:L
    diff = abs(T(i)-G);
    [~,ind] = min(diff);
    M(i) = ind-1;
end

output = uint8(M(img+1));




