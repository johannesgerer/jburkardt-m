function value = enormsq0_2d ( x0, y0, x1, y1 )

%*****************************************************************************80
%
%% ENORMSQ0_2D computes the square of the Euclidean norm of (P1-P0) in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X0, Y0, X1, Y1, the coordinates of the points
%    P0 and P1.
%
%    Output, real ENORMSQ0_2D, the square of the Euclidean norm of (P1-P0).
%
  enormsq0_2d = ( x1 - x0 ).^2 + ( y1 - y0 ).^2;

  return
end
