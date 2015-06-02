function kmeans_fast_test01 ( )

%*****************************************************************************80
%
%% KMEANS_FAST_TEST01 test KMEANS_FAST on 100 random points in the unit square.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 September 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'KMEANS_FAST_TEST01\n' );
  fprintf ( 1, '  Test KMEANS_FAST on 100 points in the unit square.\n' );
%
%  Desired number of clusters.
%
  k = 5;
%
%  Desired method (0/1/2).
%
  method = 2;
%
%  Read the data points.
%
  xy = load ( 'points_100.txt' );
  [ n, m ] = size ( xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension = %d\n', m );
  fprintf ( 1, '  Number of points = %d\n', n );
  fprintf ( 1, '  Desired number of clusters  = %d\n', k );
%
%  Call KMEANS_FAST.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Step  Time   Changed   Total\n' );
  fprintf ( 1, '\n' );
  [ centers, mincenter, mindist, q2, quality ] = kmeans_fast ( xy, k, method );

  r8mat_print ( k, m, centers, '  The cluster centers:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     J  Cluster(J)    Dist(J)     X(J)   Y(J)\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    c = mincenter(j);
    d = norm ( xy(j,:) - centers(c,:) );
    fprintf ( 1, '  %4d        %4d  %8f  %8f  %8f\n', j, mincenter(j), d, xy(j,1), xy(j,2) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Mean value of distance^2 = %g\n', q2 );
  fprintf ( 1, '  Mean value of distance   = %g\n', quality );
%
%  Plot the points.
%
  clf
  figure ( 1 )
  hold on
  i = find ( mincenter(1:n) == 1 );
  plot ( xy(i,1), xy(i,2), 'r*' )
  plot ( centers(1,1), centers(1,2), 'r.', 'Markersize', 30 );
  i = find ( mincenter(1:n) == 2 );
  plot ( xy(i,1), xy(i,2), 'g*' )
  plot ( centers(2,1), centers(2,2), 'g.', 'Markersize', 30 );
  i = find ( mincenter(1:n) == 3 );
  plot ( xy(i,1), xy(i,2), 'b*' )
  plot ( centers(3,1), centers(3,2), 'b.', 'Markersize', 30 );
  i = find ( mincenter(1:n) == 4 );
  plot ( xy(i,1), xy(i,2), 'c*' )
  plot ( centers(4,1), centers(4,2), 'c.', 'Markersize', 30 );
  i = find ( mincenter(1:n) == 5 );
  plot ( xy(i,1), xy(i,2), 'm*' )
  plot ( centers(5,1), centers(5,2), 'm.', 'Markersize', 30 );
  grid on
  axis equal
  xlabel ( '<--- X --->' )
  ylabel ( '<--- Y --->' )
  title ( '100 points in [0,1]^2 in 5 clusters.', 'Fontsize', 16 )
  hold off
  filename = 'test01.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Graphics file saved as "%s"\n', filename );

  return
end
