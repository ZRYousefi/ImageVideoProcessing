function W = walsh_hadamard(N)
%Jenni 2012

n = log2(N);
H1 = [ 1 1; 1 -1 ];

H = 1/sqrt(2)*H1;

for i=2:n
    H = 1/sqrt(2)*[H H; H -H];
end

%reorder basis functions
p = sum([zeros( size(H,1),1) H] .* [H zeros( size(H,1),1) ] < 0,2);
p = p+1;
W(p,:) = H;
%W = H