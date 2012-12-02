function y = ainv_x ( x, R, k )

%*****************************************************************************80
%
%% AINV_X computes inverse(A)*x.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(*), the vector to be multiplied by inverse(A).
%
%    Input, character R, the first argument to the NUMGRID command.
%
%    Input, integer K, the order of the grid.
%
%    Output, real Y, the value of inverse(A)*X.
%
  y = ( delsq ( numgrid ( R, k ) ) ) \ x;

  return
end
