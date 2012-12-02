function A = compan(p)
%COMPAN  Companion matrix.
%        COMPAN(P) is a companion matrix.  There are three cases.
%        If P is a scalar then COMPAN(P) is the P-by-P matrix COMPAN(1:P+1).
%        If P is an (n+1)-vector, COMPAN(P) is the n-by-n companion matrix
%           whose first row is -P(2:n+1)/P(1).
%        If P is a square matrix, COMPAN(P) is the companion matrix
%           of the characteristic polynomial of P, computed as
%           COMPAN(POLY(P)).

%        References:
%        J.H. Wilkinson, The Algebraic Eigenvalue Problem,
%           Oxford University Press, 1965, p. 12.
%        G.H. Golub and C.F. Van Loan, Matrix Computations, second edition,
%           Johns Hopkins University Press, Baltimore, Maryland, 1989,
%           sec 7.4.6.
%        C. Kenney and A.J. Laub, Controllability and stability radii for
%          companion form systems, Math. Control Signals Systems, 1 (1988),
%          pp. 239-256. (Gives explicit formulas for the singular values of
%          COMPAN(P).)

[n,m] = size(p);

if n == m & n > 1
   % Matrix argument.
   A = compan(poly(p));
   return
end

n = max(n,m);
%  Handle scalar p.
if n == 1
   n = p+1;
   p = 1:n;
end

p = p(:)';                    % Ensure p is a row vector.

% Construct matrix of order n-1.
if n == 2
   A = 1;
else
    A = diag(ones(1,n-2),-1);
    A(1,:) = -p(2:n)/p(1);
end
