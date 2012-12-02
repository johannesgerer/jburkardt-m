function determ = cheby_van3_determinant ( n )

%*****************************************************************************80
%
%% CHEBY_VAN3_DETERMINANT returns the determinant of the CHEBY_VAN3 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real DETERM, the determinant.
%
  determ = r8_mop ( n + 1 ) * sqrt ( n^n ) / sqrt ( 2.0^( n - 1 ) );

  return
end
