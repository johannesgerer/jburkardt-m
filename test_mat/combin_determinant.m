function determ = combin_determinant ( alpha, beta, n )

%*****************************************************************************80
%
%% COMBIN_DETERMINANT returns the determinant of the COMBIN matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, BETA, scalars that define the matrix.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real DETERM, the determinant.
%
  determ = alpha ^ ( n - 1 ) * ( alpha + n * beta );

  return
end
