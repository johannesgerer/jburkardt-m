function n = sphere01_quad_mc_size ( h )

%*****************************************************************************80
%
%% SPHERE01_QUAD_MC_SIZE sizes a Monte Carlo rule for sphere quadrature.
%
%  Discussion:
%
%    A number of points N are chosen at random on the sphere, with N
%    being determined so that, if the points were laid out on a regular
%    grid, the average spacing would be no more than H.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real H, the maximum length of a side of the spherical
%    quadrilaterals.
%
%    Output, integer N, the number of points to use.
%
  sphere_area = 4.0 * pi;

  n = floor ( sphere_area / h / h );
  n = max ( n, 1 );

  return
end
