function y = seqa(a, b, n)
%SEQA   Additive sequence.
%       Y = SEQA(A, B, N) produces a row vector comprising N equally
%       spaced numbers starting at A and finishing at B.
%       If N is omitted then 10 points are generated.

if nargin == 2, n = 10; end

if n <= 1
   y = a;
   return
end
y = [a+(0:n-2)*(b-a)/(n-1), b];
