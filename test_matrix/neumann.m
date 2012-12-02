function [A, T] = neumann(n)
%NEUMANN  Singular matrix from the discrete Neumann problem (sparse).
%         NEUMANN(N) is the singular, row diagonally dominant matrix resulting
%         from discretizing the Neumann problem with the usual five point
%         operator on a regular mesh.
%         It has a one-dimensional null space with null vector ONES(N,1).
%         The dimension N should be a perfect square, or else a 2-vector,
%         in which case the dimension of the matrix is N(1)*N(2).

%         Reference:
%         R.J. Plemmons, Regular splittings and the discrete Neumann
%         problem, Numer. Math., 25 (1976), pp. 153-161.

if max(size(n)) == 1
   m = sqrt(n);
   if m^2 ~= n, error('N must be a perfect square.'), end
   n(1) = m; n(2) = m;
end

T = tridiag(n(1), -1, 2, -1);
T(1,2) = -2;
T(n(1),n(1)-1) = -2;

A = kron(T, eye(n(2))) + kron(eye(n(2)), T);
