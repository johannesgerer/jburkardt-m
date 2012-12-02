function voronoi_mountains ( p )

%*****************************************************************************80
%
%% VORONOI_MOUNTAINS displays a surface plot of the Voronoi distance function.
%
%  Discussion:
%
%    For each point in the picture, we have computed the distance to the
%    nearest Voronoi generator.  This value is zero at a Voronoi generator,
%    of course, and nearby, it rises in a circular cone.  When two generators
%    are neighbors, the boundary between them is a straight line segment;
%    in a 3d plot, you see a ridge that is "straight" but whose height
%    is parabolic.
%
%    If you run this example, be sure to try out MATLAB's 3D graphing features,
%    including the 3D rotation option and the zoom.
%
%    Thanks to Jonathan Hadida for pointing out how to vectorize the
%    distance calculation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, June 2004, pages 329-345.
%
%  Parameters:
%
%    Input, real P(NP,2), the coordinates of a set of Voronoi generators.
%
%  Local Parameters:
%
%    Local, integer NS, the number of grid points in the X and Y
%    directions.  Making this number bigger may give greater detail in the
%    plot.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VORONOI_MOUNTAINS:\n' );
  fprintf ( 1, '  Display a plot of a Voronoi region as a 3D surface.\n' );
  fprintf ( 1, '  The Z coordinate in this plot is the distance of any point\n' );
  fprintf ( 1, '  (X,Y) to the nearest Voronoi generator.\n' );

  ns = 401;

  xmin = min ( p(:,1) );
  xmax = max ( p(:,1) );
  xrange = xmax - xmin;
  xmin = xmin - 0.30 * xrange;
  xmax = xmax + 0.30 * xrange;
  xdel = ( xmax - xmin ) / ( ns - 1 );

  ymin = min ( p(:,2) );
  ymax = max ( p(:,2) );
  yrange = ymax - ymin;
  ymin = ymin - 0.30 * yrange;
  ymax = ymax + 0.30 * yrange;
  ydel = ( ymax - ymin ) / ( ns - 1 );
%
%  Set up NS sample points.
%  Unfortunately, XS and YS are matrices, and we will shortly need them
%  to be column vectors...and then matrices again!
%
  [ xs, ys ] = meshgrid ( xmin : xdel : xmax, ymin : ydel : ymax );
%
%  Compute the Delaunay triangulation of the data points,
%  and then use the Delaunay search method.
%
%  MATLAB's "delaunay" and "dsearch" functions are going to be retired soon.
%
  if ( 0 )
    t = delaunay ( p(:,1), p(:,2) );
    k = dsearch ( p(:,1), p(:,2), t, xs, ys );
  else
    t = DelaunayTri ( p(:,1), p(:,2) );
    xs = reshape ( xs, ns * ns, 1 );
    ys = reshape ( ys, ns * ns, 1 );
    k = nearestNeighbor ( t, xs, ys );
  end
%
%  Evaluate the distance.
%  I am sure you can do this in a vectorized way, but I gave up trying.
%
  if ( 0 )

    for j = 1 : ns
      for i = 1 : ns
        zs(i,j) = sqrt ( ( xs(i,j) - p(k(i,j),1) ).^2 ...
                       + ( ys(i,j) - p(k(i,j),2) ).^2 );
      end
    end
%
%  Jonathan Hadida pointed out how to vectorize the above loop.
%
  else

    zs = sqrt ( ( xs - reshape ( p(k,1), ns * ns, 1 ) ).^2 ...
              + ( ys - reshape ( p(k,2), ns * ns, 1 ) ).^2 );

  end
%
%  Draw the 3D surface.
%
  clf

  xs = reshape ( xs, ns, ns );
  ys = reshape ( ys, ns, ns );
  zs = reshape ( zs, ns, ns );

  h = surf ( xs, ys, zs, 'FaceColor', 'Interp', 'EdgeColor', 'None' );
%
%  Choose a color map and the number of levels.
%  An interesting and different choice is "prism ( 60 )".
%
% colormap ( cool ( 60 ) );
  colormap ( prism ( 60 ) );
  hold on
%
%  Add little dots to the plot indicating the location of the generators.
%
  z = zeros ( size(p,1), 1 ) + 0.04;
  scatter3 ( p(:,1), p(:,2), z, 100, 'w', 'filled' );

  view ( 2 )
  axis equal
  axis off

  hold off

  return
end
