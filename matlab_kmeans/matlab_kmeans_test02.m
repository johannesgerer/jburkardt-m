function matlab_kmeans_test02 ( )

%*****************************************************************************80
%
%% MATLAB_KMEANS_TEST02 clusters the 100 point data.
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
  fprintf ( 1, 'MATLAB_KMEANS_TEST02\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Cluster the 100 point data, comprising N = 100 points\n' );
  fprintf ( 1, '  in M = 2 dimensions, \n' );
  fprintf ( 1, '  which we divide into K = 5 clusters.\n' );

  x = load ( 'x_m2_n100.txt' );
%
%  Display the data.
%
  figure ( 3 )
  plot ( x(:,1), x(:,2), 'b*' );
  xlabel ( '<--- X --->', 'Fontsize', 16 );
  ylabel ( '<--- Y --->', 'Fontsize', 16 );
  title ( '100 Point Data for Clustering', 'Fontsize', 16 );
  grid on;
  axis equal;
  filename = 'x_m2_n100.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved graphics file as "%s"\n', filename );
%
%  Cluster the data.
%
  k = 5;
  idx = kmeans ( x, k );

  figure ( 4 )
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

  i5 = find ( idx == 5 );
  x5 = x(i5,:);
  plot ( x5(:,1), x5(:,2), 'c*' );

  xlabel ( '<--- X --->', 'Fontsize', 16 );
  ylabel ( '<--- Y --->', 'Fontsize', 16 );
  title ( '100 Point Clusters by Color', 'Fontsize', 16 );
  grid on;
  axis equal;
  hold off

  filename = 'x_m2_n100_k5.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved graphics file as "%s"\n', filename );

  return
end
