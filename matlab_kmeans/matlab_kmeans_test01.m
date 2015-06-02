function matlab_kmeans_test01 ( )

%*****************************************************************************80
%
%% MATLAB_KMEANS_TEST01 clusters the Ruspini data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MATLAB_KMEANS_TEST01\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Cluster the Ruspini data, comprising N = 75 points\n' );
  fprintf ( 1, '  in M = 2 dimensions, \n' );
  fprintf ( 1, '  which naturally fall into K = 4 clusters.\n' );

  x = load ( 'x_m2_n75.txt' );
%
%  Display the data.
%
  figure ( 1 )
  plot ( x(:,1), x(:,2), 'b*' );
  xlabel ( '<--- X --->', 'Fontsize', 16 );
  ylabel ( '<--- Y --->', 'Fontsize', 16 );
  title ( 'Ruspini Data for Clustering', 'Fontsize', 16 );
  grid on;
  axis equal;
  filename = 'x_m2_n75.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved graphics file as "%s"\n', filename );
%
%  Cluster the data.
%
  k = 4;
  idx = kmeans ( x, k );

  figure ( 2 )
  hold on
  i1 = find ( idx == 1 );
  x1 = x(i1,:);
  plot ( x1(:,1), x1(:,2), 'r*' );

  i2 = find ( idx == 2 );
  x2 = x(i2,:);
  plot ( x2(:,1), x2(:,2), 'g*' );

  i3 = find ( idx == 3 );
  x3 = x(i3,:);
  plot ( x3(:,1), x3(:,2), 'b*' );

  i4 = find ( idx == 4 );
  x4 = x(i4,:);
  plot ( x4(:,1), x4(:,2), 'k*' );

  xlabel ( '<--- X --->', 'Fontsize', 16 );
  ylabel ( '<--- Y --->', 'Fontsize', 16 );
  title ( 'Ruspini Clusters by Color', 'Fontsize', 16 );
  grid on;
  axis equal;
  hold off

  filename = 'x_m2_n75_k4.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved graphics file as "%s"\n', filename );

  return
end
