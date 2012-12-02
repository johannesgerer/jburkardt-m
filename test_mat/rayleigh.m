function value = rayleigh ( n, a, x )

%*****************************************************************************80
%
%% RAYLEIGH returns the Rayleigh quotient of the matrix A and the vector X.
%
%  Formula:
%
%    RAYLEIGH = X' * A * X / ( X' * X )
%
%  Properties:
%
%    If X is an eigenvector of A, then RAYLEIGH will equal the
%    corresponding eigenvalue.
%
%    The set of all Rayleigh quotients for a matrix is known
%    as its "field of values".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real A(N,N), the matrix.
%
%    Input, real X(N), the vector used in the Rayleigh quotient.
%
%    Output, real VALUE, the Rayleigh quotient of A and X.
%
  value = ( x(1:n) * a(1:n,1:n) * x(1:n))') /  ( x(1:n) * x(1:n)' );

  return
end
