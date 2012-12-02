function value = rayleigh2 ( n, a, x, y )

%*****************************************************************************80
%
%% RAYLEIGH2 returns the generalized Rayleigh quotient.
%
%  Formula:
%
%    RAYLEIGH2 = X' * A * Y / ( X' * Y )
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
%    Input, real X(N), Y(N), the vectors used in the 
%    Rayleigh quotient.
%
%    Output, real VALUE, the Rayleigh quotient of A and X.
%
  value = ( x(1:n) * a(1:n,1:n) * y(1:n)' ) / ( x(1:n) * y(1:n)' );

  return
end
