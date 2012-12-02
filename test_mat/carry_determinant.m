function determ = carry_determinant ( alpha, n )

%*****************************************************************************80
%
%% CARRY_DETERMINANT returns the determinant of the Carry matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ALPHA, the numeric base being used 
%    in the addition.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real DETERM, the determinant.
%
  power = ( n * ( n - 1 ) ) / 2;
  determ = 1.0 / alpha^power;

  return
end
