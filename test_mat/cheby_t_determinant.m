function determ = cheby_t_determinant ( n )

%*****************************************************************************80
%
%% CHEBY_T_DETERMINANT returns the determinant of the Chebyshev T matrix.
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
  power = round ( ( ( n - 1 ) * ( n - 2 ) ) / 2 );

  determ = 2^power;

  return
end
