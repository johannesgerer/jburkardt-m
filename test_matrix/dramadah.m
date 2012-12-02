function A = dramadah(n, k)
%DRAMADAH  A (0,1) matrix whose inverse has large integer entries.
%          An anti-Hadamard matrix A is a matrix with elements 0 or 1 for
%          which MU(A) := NORM(INV(A),'FRO') is maximal.
%          A = DRAMADAH(N, K) is an N-by-N (0,1) matrix for which MU(A) is
%          relatively large, although not necessarily maximal.
%          Available types (the default is K = 1):
%          K = 1: A is Toeplitz, with ABS(DET(A)) = 1, and MU(A) > c(1.75)^N,
%                 where c is a constant.
%          K = 2: A is upper triangular and Toeplitz.
%          The inverses of both types have integer entries.
%
%          Another interesting (0,1) matrix:
%          K = 3: A has maximal determinant among (0,1) lower Hessenberg
%          matrices: det(A) = the n'th Fibonacci number.  A is Toeplitz.
%          The eigenvalues have an interesting distribution in the complex
%          plane.

%          References:
%          R.L. Graham and N.J.A. Sloane, Anti-Hadamard matrices,
%             Linear Algebra and Appl., 62 (1984), pp. 113-137.
%          L. Ching, The maximum determinant of an nxn lower Hessenberg
%             (0,1) matrix, Linear Algebra and Appl., 183 (1993), pp. 147-153.

if nargin < 2, k = 1; end

if k == 1  % Toeplitz

   c = ones(n,1);
   for i=2:4:n
       m = min(1,n-i);
       c(i:i+m) = zeros(m+1,1);
   end
   r = zeros(n,1);
   r(1:4) = [1 1 0 1];
   if n < 4, r = r(1:n); end
   A = toeplitz(c,r);

elseif k == 2  % Upper triangular and Toeplitz

   c = zeros(n,1);
   c(1) = 1;
   r = ones(n,1);
   for i=3:2:n
       r(i) = 0;
   end
   A = toeplitz(c,r);

elseif k == 3  % Lower Hessenberg.

   c = ones(n,1);
   for i=2:2:n, c(i)=0; end;
   A = toeplitz(c, [1 1 zeros(1,n-2)]);

end
