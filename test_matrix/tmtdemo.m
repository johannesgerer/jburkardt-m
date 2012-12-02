clc
format compact
echo on

%TMTDEMO       Demonstration of Test Matrix Toolbox.
%              N. J. Higham.

% The Test Matrix Toolbox contains test matrices, visualization routines,
% and other miscellaneous routines.

% The version of the toolbox is

matrix(-1)
echo on

% For this demonstration you will need to view both the command window
% and one figure window.
% This demonstration emphasises graphics and shows only
% some of the features of the toolbox.

pause  % Press any key to continue after pauses.

% A list of the available M-files is obtained by typing `matrix':

matrix

pause

% The FV command plots the boundary of the field of values of a matrix
% (the set of all Rayleigh quotients) and plots the eigenvalues as
% crosses (`x').  Here are some examples:

% The Grcar matrix is a Toeplitz matrix of the following form:

grcar(5)

% Here is the field of values of the 10-by-10 Grcar matrix:

fv(grcar(10));
title('fv(grcar(10))')

pause

% Next, we form a random orthogonal matrix and look at its field of values.
% The boundary is the convex hull of the eigenvalues since A is normal.

A = randsvd(10, 1);
fv(A);
title('randsvd(10, 1)')
pause

% The RANDSVD commands generates random matrices with pre-assigned
% condition number, and various singular value distributions:

A = randsvd(6, 1e6, 3);  % Exponential distribution.

format short e
svd(A)'
cond(A)
pause

% The PS command plots an approximation to a pseudospectrum of A,
% which is the set of complex numbers that are eigenvalues of some
% perturbed matrix A + E, with the norm of E at most epsilon
% (default: epsilon = 1E-3).
% The eigenvalues of A are plotted as crosses (`x').
% Here are some interesting PS plots.

% First, we use the KAHAN matrix, a triangular matrix made up of sines and
% cosines.  Here is an approximate pseudospectrum of the 10-by-10 matrix:

ps(kahan(10),25);
title('ps(kahan(10))')
pause

% Next, a different way of looking at pseudospectra, via norms of
% the resolvent.  (The resolvent of A is INV(z*I-A), where z is a complex
% variable).  PSCONT gives a color map with a superimposed contour
% plot.  Here we specify a region of the complex plane in
% which the 8-by-8 Kahan matrix is interesting to look at.

pscont(kahan(8), 0, 20, [0.2 1.2 -0.5 0.5]);
title('pscont(kahan(8))')
pause

% The TRIW matrix is upper triangular, made up of 1s and -1s:

triw(4)

% Here is a combined surface and contour plot of its resolvent.
% Notice how the repeated eigenvalue 1 `sucks in' the resolvent.

pscont(triw(11), 2, 15, [-2 2 -2 2]);
title('pscont(triw(11))')
pause

% The next PSCONT plot is for the companion matrix of the characteristic
% polynomial of the CHEBSPEC matrix:

A = chebspec(8); C = compan(A);

% The SHOW command shows the +/- pattern of the elements of a matrix, with
% blanks for zero elements:

show(C)

pscont(C, 2, 20, [-.1 .1 -.1 .1]);
title('pscont(compan(chebspec(8)))')
pause

% The following matrix has a pseudospectrum in the form of a limacon.

n = 25; A = triw(n,1,2) - eye(n);
sub(A, 6)               % Leading principal 6-by-6 submatrix of A.
ps(A);
pause

% Here is the 8-by-8 Frank matrix.
A = frank(8)

% We can get a visual representation of the matrix using the SEE
% command, which produces subplots with the following layout:
%     /---------------------------------\
%     | MESH(A)            MESH(INV(A)) |
%     | SEMILOGY(SVD(A))   FV(A)        |
%     \---------------------------------/
% where FV is the field of values.

see(A)

pause

% The Frank matrix is well-known for having ill-conditioned eigenvalues.
% Here are the eigenvalues (in column 1) together with the corresponding
% eigenvalue condition numbers (in column 2):

format short e
[V, D, c] = eigsens(A);
[diag(D) c 1./diag(D)]

% In the last column are shown the reciprocals of the eigenvalues.
% Notice that if LAMBDA is an eigenvalue, so is 1/LAMBDA!

pause

% Matlab's MAGIC function produces magic squares:

A = magic(5)

% Using the toolbox routine PNORM we can estimate the matrix p-norm
% for any value of p.

[pnorm(A,1) pnorm(A,1.5) pnorm(A,2) pnorm(A,pi) pnorm(A,inf)]

% As this example suggests, the p-norm of a magic square is
% constant for all p!

pause

% GERSH plots Gershgorin disks.  Here are some interesting examples.

gersh(lesp(12));
title('gersh(lesp(12))')
pause

gersh(hanowa(10));
title('gersh(hanowa(10))')
pause

gersh(ipjfact(6,1));
title('gersh(ipjfact(6,1))')
pause

gersh(smoke(16,1));
title('gersh(smoke(16,1))')
pause

% A Hadamard matrix has elements 1 or -1 and mutually orthogonal rows:

show(hadamard(16))

% A CONTOUR plot of this matrix is interesting:

contour(hadamard(16))
pause

% There are a few sparse matrices in the toolbox.
% WATHEN is a finite element matrix with random entries.

spy(wathen(6,6));  % SPY plot of sparsity pattern.

pause

% GFPP generates matrices for which Gaussian elimination with partial
% pivoting produces a large growth factor.

gfpp(6)
pause

% Let's find the growth factor for partial pivoting and complete pivoting
% for a bigger matrix:

A = gfpp(20);
[L, U] = lu(A);    % Partial pivoting.
max(max(abs(U))) / max(max(abs(A)))

[L, U, P, Q, rho] = gecp(A);  % Complete pivoting using toolbox routine GECP.
rho
% As expected, complete pivoting does not produce large growth here.
pause

% The toolbox function MATRIX allows the test matrices to be accessed
% by number.  The following piece of code steps through all the
% square matrices of arbitrary dimension, setting A to each 10-by-10
% matrix in turn. It evaluate the 2-norm condition number and the
% ratio of the largest to smallest eigenvalue (in absolute values).
c = []; e = []; j = 1;
for i=1:matrix(0)
    A = full(matrix(i, 10));
    if norm(skewpart(A),1)  % If not Hermitian...
       c1 = cond(A);
       eg = eig(A);
       e1 = max(abs(eg)) / min(abs(eg));
       % Filter out extremely ill-conditioned matrices.
       if c1 <= 1e10, c(j) = c1; e(j) = e1; j = j + 1; end
    end
end

% The following plots confirm that the condition number can be much
% larger than the extremal eigenvalue ratio.
echo off
j = max(size(c));
subplot(2,1,1)
semilogy(1:j, c, 'x', 1:j, e, 'o'), hold on
semilogy(1:j, c, '-', 1:j, e, '--'), hold off
title('cond: x, eig_ratio: o')
subplot(2,1,2)
semilogy(1:j, c./e)
title('cond/eig_ratio')
echo on
pause

% Finally, here are three interesting pseudospectra based on pentadiagonal
% Toeplitz matrices:

A = full(pentoep(6,0,1/2,0,0,1))

subplot(1,1,1)
ps(full(pentoep(32,0,1/2,0,0,1)));            % Propeller
title('ps(full(pentoep(32,0,1/2,0,0,1))')
pause

ps(inv(full(pentoep(32,0,1,1,0,.25))));       % Man in the moon
title('ps(inv(full(pentoep(32,0,1,1,0,.25))')
pause

ps(full(pentoep(32,0,1/2,1,1,1)));            % Fish
title('ps(full(pentoep(32,0,1/2,1,1,1)))')
pause

echo off
clear A L U P Q V D
format
