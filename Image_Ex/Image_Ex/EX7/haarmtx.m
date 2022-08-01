
% % MATLAB FILE: Exercise 7: Solution
% function H = haarmtx(N)

% Haar Transform function
function H = haarmtx(N)

k=0:N-1;
p = floor(log2(k));
p(1) = 0;
q = k-2.^p+1;

x=(0:N-1)/N;
for i = 2:N
  for j=1:N
    if (x(j) >= (q(i)-1)/(2^p(i))) & (x(j) < (q(i)-1/2)/(2^p(i)))
      H(i,j) =  2^(p(i)/2);
    elseif (x(j)>=(q(i)-1/2)/(2^p(i))) & (x(j)<q(i)/2^(p(i)))
      H(i,j) = -2^(p(i)/2);
    else
      H(i,j) = 0;
    end
  end
end
H(1,:)=1;
H = 1/sqrt(N)*H;