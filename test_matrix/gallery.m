function [A, e] = gallery(n)
%GALLERY    Famous, and not so famous, test matrices.
%       A = GALLERY(N) is an N-by-N matrix with some special property.
%       The following values of N are currently available:
%         N = 3 is badly conditioned.
%         N = 4 is the Wilson matrix.  Symmetric pos def, integer inverse.
%         N = 5 is an interesting eigenvalue problem: defective, nilpotent.
%         N = 8 is the Rosser matrix, a classic symmetric eigenvalue problem.
%               [A, e] = GALLERY(8) returns the exact eigenvalues in e.
%         N = 21 is Wilkinson's tridiagonal W21+, another eigenvalue problem.

%       Original version supplied with MATLAB.  Modified by N.J. Higham.
%
%       References:
%       J.R. Westlake, A Handbook of Numerical Matrix Inversion and Solution
%          of Linear Equations, John Wiley, New York, 1968.
%       J.H. Wilkinson, The Algebraic Eigenvalue Problem, Oxford University
%          Press, 1965.

if n == 3
   A = [ -149   -50  -154
          537   180   546
          -27    -9   -25 ];

elseif n == 4
   A = [10     7     8     7
         7     5     6     5
         8     6    10     9
         7     5     9    10];

elseif n == 5
%   disp('Try to find the EXACT eigenvalues and eigenvectors.')
%   Matrix devised by Cleve Moler.  Its Jordan form has just one block, with
%   eigenvalue zero.  Proof: A^k is nonzero for k<5, zero for k=5.
%   TRACE(A)=0.  No simple form for null vector.
   A = [  -9     11    -21     63    -252
          70    -69    141   -421    1684
        -575    575  -1149   3451  -13801
        3891  -3891   7782 -23345   93365
        1024  -1024   2048  -6144   24572 ];

elseif n == 8
   A  = [ 611.  196. -192.  407.   -8.  -52.  -49.   29.
          196.  899.  113. -192.  -71.  -43.   -8.  -44.
         -192.  113.  899.  196.   61.   49.    8.   52.
          407. -192.  196.  611.    8.   44.   59.  -23.
           -8.  -71.   61.    8.  411. -599.  208.  208.
          -52.  -43.   49.   44. -599.  411.  208.  208.
          -49.   -8.    8.   59.  208.  208.   99. -911.
           29.  -44.   52.  -23.  208.  208. -911.   99.  ];

   %  Exact eigenvalues from Westlake (1968), p.150 (ei'vectors given too):
   a = sqrt(10405); b = sqrt(26);
   e = [-10*a,   0,   510-100*b,  1000,   1000,   510+100*b, ...
        1020,   10*a]';

elseif n == 21
   % W21+, Wilkinson (1965), p.308.
   E = diag(ones(n-1,1),1);
   m = (n-1)/2;
   A = diag(abs(-m:m)) + E + E';

else
   error('Sorry, that value of N is not available.')
end
