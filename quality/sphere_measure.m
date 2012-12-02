function s = sphere_measure ( dim_num, n, z )

%*****************************************************************************80
%
%% SPHERE_MEASURE determines the pointset quality measure S.
%
%  Discussion:
%
%    This routine computes a measure of even spacing in a set of
%    N points in the DIM_NUM-dimensional unit hypercube.  We will discuss 
%    the program as though the space is 2-dimensional and the spheres 
%    are circles, but the program may be used for general DIM_NUM-dimensional data.
%
%    The points are assumed to lie in the unit square.
%
%    The program makes a circle-packing measurement on the points
%    by assuming that, at each point, a circle is centered; all
%    the circles start out with zero radius, and then expand
%    together at the same rate.  A circle stops expanding as soon
%    as it touches any other circle.
%
%    The amount of area covered by the circles is compared to the
%    area of the unit square.  This measurement has a certain amount
%    of boundary effect: some circles will naturally extend outside
%    the unit hypercube.  If this is a concern, is possible to restrict
%    the circles to remain inside the unit hypercube.  In any case,
%    this problem generally goes away as the number of points increases.
%
%    Since we are interested in the coverage of the unit hypercube,
%    it is probably best if the circles are restricted.  This way,
%    computing the area of the circles gives a measure of the even
%    coverage of the region, relative to the presumably best possible
%    covering, by the same number of circles, but of equal radius.
%
%    In the limit, the maximum relative packing density of a 2D
%    region with equal-sized circles is 0.9069.  In 3D, a density
%    of at least 0.74 can be achieved, and it is known that no
%    greater than 0.7796 is possible.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real Z(DIM_NUM,N), the points.
%
%    Output, real S, the amount of volume taken up
%    by the nonintersecting spheres of maximum radius around each
%    point.  Ignoring boundary effects, the "ideal" value would be
%    1 (achievable only in 1 dimension), and the maximum value
%    possible is the sphere packing density in the given spatial
%    dimension.  If boundary effects can be ignored, the value of
%    SPHERE_VOLUME reports how closely the given set of points
%    behaves like a set of close-packed spheres.
%
%  Local Parameters:
%
%    Local, logical WALLS, is TRUE if the spheres are restricted
%    to lie within the unit hypercube.
%
  if ( ~r8mat_in_01 ( dim_num, n, z ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPHERE_MEASURE - Fatal error!\n' );
    fprintf ( 1, '  Some data is not in the unit hypercube.\n' );
    s = r8_huge ( );
  end

  walls = 1;
  verbose = 0;

  radius = radius_maximus ( dim_num, n, z, walls );

  s = 0.0;
  for j = 1 : n
    volume = sphere_volume_nd ( dim_num, radius(j) );
    s = s + volume;
  end

  if ( verbose )

    radius_ave = sum ( radius(1:n) ) / n;
    radius_min = min ( radius(1:n) );
    radius_max = max ( radius(1:n) );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of dimensions is %6d\n', dim_num );
    fprintf ( 1, '  Number of points is %6d\n', n );
    if ( walls )
      fprintf ( 1, 'Spheres stay in the unit hypercube.\n' );
    else
      fprintf ( 1, '  Spheres need not stay in the unit hypercube.\n' );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Average radius = %14f\n', radius_ave );
    fprintf ( 1, '  Minimum radius = %14f\n', radius_min );
    fprintf ( 1, '  Maximum radius = %14f\n', radius_max );
    fprintf ( 1, '  Sphere volume =  %14f\n', s );
  end

  return
end
