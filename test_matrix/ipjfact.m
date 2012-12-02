function [A, detA] = ipjfact(n, k)
%IPJFACT   A Hankel matrix with factorial elements.
%          A = IPJFACT(N, K) is the matrix with
%                    A(i,j) = (i+j)!    (K = 0, default)
%                    A(i,j) = 1/(i+j)!  (K = 1)
%          Both are Hankel matrices.
%          The determinant and inverse are known explicitly.
%          If a second output argument is present, d = DET(A) is returned:
%          [A, d] = IPJFACT(N, K);

%          Suggested by P. R. Graves-Morris.
%
%          Reference:
%          M.J.C. Gover, The explicit inverse of factorial Hankel matrices,
%          Dept. of Mathematics, University of Bradford, 1993.

if nargin == 1, k = 0; end

c = cumprod(2:n+1);
d = cumprod(n+1:2*n) * c(n-1);

A = hankel(c, d);

if k == 1
   A = ones(n)./A;
end

if nargout == 2
   d = 1;
   if k == 0
      for i=1:n-1
          d = d*prod(1:i+1)*prod(1:n-i);
      end
      d = d*prod(1:n+1);
   else
      for i=0:n-1
          d = d*prod(1:i)/prod(1:n+1+i);
      end
      if rem(n*(n-1)/2,2), d = -d; end
   end
   detA = d;
end
