function determ = forsythe_determinant ( alpha, beta, n )

%*****************************************************************************80
%
%% FORSYTHE_DETERMINANT returns the determinant of the FORSYTHE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, BETA, define the matrix.  A typical 
%    value of ALPHA is the square root of the machine precision; a typical
%    value of BETA is 0.0.
%
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
%
  determ = ( -1.0 ) ^ ( n - 1 ) * alpha + beta ^ n;

  return
end
