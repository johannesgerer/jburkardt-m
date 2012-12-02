function A = gearm(n, i, j)
%GEARM   Gear matrix.
%        A = GEARM(N,I,J) is the N-by-N matrix with ones on the sub- and
%        super-diagonals, SIGN(I) in the (1,ABS(I)) position, SIGN(J)
%        in the (N,N+1-ABS(J)) position, and zeros everywhere else.
%        Defaults: I = N, j = -N.
%        All eigenvalues are of the form 2*COS(a) and the eigenvectors
%        are of the form [SIN(w+a), SIN(w+2a), ..., SIN(w+Na)].
%        The values of a and w are given in the reference below.
%        A can have double and triple eigenvalues and can be defective.
%        GEARM(N) is singular.

%        (GEAR is a Simulink function, hence GEARM for Gear matrix.)
%        Reference:
%        C.W. Gear, A simple set of test matrices for eigenvalue programs,
%        Math. Comp., 23 (1969), pp. 119-125.

if nargin == 1, i = n; j = -n; end

if ~(i~=0 & abs(i)<=n & j~=0 & abs(j)<=n)
     error('Invalid I and J parameters')
end

A = diag(ones(n-1,1),-1) + diag(ones(n-1,1),1);
A(1, abs(i)) = sign(i);
A(n, n+1-abs(j)) = sign(j);
