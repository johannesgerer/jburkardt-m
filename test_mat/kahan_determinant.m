function determ = kahan_determinant ( alpha, n )

%*****************************************************************************80
%
%% KAHAN_DETERMINANT returns the determinant of the Kahan matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines A.  A typical 
%    value is 1.2.  The "interesting" range of ALPHA is 0 < ALPHA < PI.
%
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
%
  power = ( n * ( n + 1 ) ) / 2;
  determ = ( sin ( alpha ) )^power;

  return
end
