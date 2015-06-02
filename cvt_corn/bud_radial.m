function xy = bud_radial ( n, xy )

%*****************************************************************************80
%
%% BUD_RADIAL sets the coordinates for a "radial" bud.
%
%  Discussion:
%
%    A radial bud is created by a generator on the boundary.  The initial
%    position of the bud should be created by copying the generator's 
%    coordinates, reducing the radial component slightly.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of buds.
%
%    Input, real P_XY(2,N), the coordinates of the bud generators.
%
%    Output, real P_XY(2,N), the coordinates of the buds.
%
  r(1,1:n) = 0.999 * sqrt ( sum ( xy.^2, 1 ) );
  t(1,1:n) = atan2 ( xy(2,:), xy(1,:) );

  xy(1,:) = r(1,1:n) .* cos ( t(1,1:n) );
  xy(2,:) = r(1,1:n) .* sin ( t(1,1:n) );

  return
end

