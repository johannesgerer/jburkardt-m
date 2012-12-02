function A = redheff(n)
%REDHEFF    A (0,1) matrix of Redheffer associated with the Riemann hypothesis.
%           A = REDHEFF(N) is an N-by-N matrix of 0s and 1s defined by
%               A(i,j) = 1 if j = 1 or if i divides j,
%               A(i,j) = 0 otherwise.
%           It has N - FLOOR(LOG2(N)) - 1 eigenvalues equal to 1,
%           a real eigenvalue (the spectral radius) approximately SQRT(N),
%           a negative eigenvalue approximately -SQRT(N),
%           and the remaining eigenvalues are provably ``small''.
%           Barrett and Jarvis (1992) conjecture that
%             ``the small eigenvalues all lie inside the unit circle
%               ABS(Z) = 1'',
%           and a proof of this conjecture, together with a proof that some
%           eigenvalue tends to zero as N tends to infinity, would yield
%           a new proof of the prime number theorem.
%           The Riemann hypothesis is true if and only if
%           DET(A) = O( N^(1/2+epsilon) ) for every epsilon > 0
%                                             (`!' denotes factorial).
%           See also RIEMANN.

%           Reference:
%           W.W. Barrett and T.J. Jarvis,
%           Spectral Properties of a Matrix of Redheffer,
%           Linear Algebra and Appl., 162 (1992), pp. 673-683.

i = (1:n)'*ones(1,n);
A = ~rem(i',i);
A(:,1) = ones(n,1);
