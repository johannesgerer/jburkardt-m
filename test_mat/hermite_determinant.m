function determ = hermite_determinant ( n )

%*****************************************************************************80
%
%% HERMITE_DETERMINANT returns the determinant of the HERMITE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2007
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
  power = ( n * ( n - 1 ) ) / 2;
  determ = 2^power;

  return
end
