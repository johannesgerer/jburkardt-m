function determ = cheby_u_determinant ( n )

%*****************************************************************************80
%
%% CHEBY_U_DETERMINANT returns the determinant of the Chebyshev U matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
%
  power = floor ( ( n * ( n - 1 ) ) / 2 );

  determ = 2^power;

  return
end
