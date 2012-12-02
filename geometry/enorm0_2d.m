function value = enorm0_2d ( x0, y0, x1, y1 )

%*****************************************************************************80
%
%% ENORM0_2D computes the Euclidean norm of (P1-P0) in 2D.
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
%    Input, real X0, Y0, X1, Y1, the coordinates of the points P0 and P1.
%
%    Output, real VALUE, the Euclidean norm of (P1-P0).
%
  value = sqrt ( ( x1 - x0 ).^2 + ( y1 - y0 ).^2 );

  return
end
