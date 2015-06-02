function lorenz_cluster_test01 ( )

%*****************************************************************************80
%
%% LORENZ_CLUSTER_TEST01 clusters the Lorenz data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LORENZ_CLUSTER_TEST01\n' );
  fprintf ( 1, '  Cluster the Lorenz data.\n' );
%
%  Read the data, and trim the first component, which is time.
%
  x = load ( 'x_m3_n4001.txt' );
  x = x(:,2:4);

  [ n, m ] = size ( x );
  k = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data comprises N = %d points\n', n );
  fprintf ( 1, '  in M = %d dimensions. \n', m );
  fprintf ( 1, '  We will seek K = %d clusters.\n', k );
%
%  Display the raw data.
%
  figure ( 1 )

  plot3 ( x(:,1), x(:,2), x(:,3), ...
    'LineStyle', 'None', ...
    'Marker', '.', ...
    'MarkerEdgeColor', 'b' );

  xlabel ( '<--- X --->', 'Fontsize', 16 );
  ylabel ( '<--- Y --->', 'Fontsize', 16 );
  zlabel ( '<--- Z --->', 'Fontsize', 16 );
  title ( 'Lorenz Data for Clustering', 'Fontsize', 16 );
  grid on;
  axis equal;
  view ( -60, 45 );
  filename = 'x_m3_n4001.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved graphics file as "%s"\n', filename );
%
%  Cluster the data.
%
  opts = statset ( 'MaxIter', 200 );

  tic
  idx = kmeans ( x, k, 'Options', opts );
  value = toc;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  MATLAB kmeans() clustered the data in %g seconds.\n', value );
%
%  Display the clustered data.
%
  figure ( 2 )
  hold on

  color = [ ...
    1.0, 0.0, 0.0; ...
    0.0, 1.0, 0.0; ...
    0.0, 0.0, 1.0; ...
    0.0, 1.0, 1.0; ...
    1.0, 0.0, 1.0; ...
    1.0, 1.0, 0.0; ...
    1.0, 0.5, 0.5; ...
    0.5, 1.0, 0.5; ...
    0.5, 0.5, 1.0; ...
    0.0, 0.0, 0.0 ];
   
  for c = 1 : k

    ic = find ( idx == c );

    plot3 ( x(ic,1), x(ic,2), x(ic,3), ...
      'LineStyle', 'None', ...
      'Marker', '.', ...
      'MarkerEdgeColor', color(c,1:3) );

  end

% plot3 ( x(:,1), x(:,2), x(:,3), ...
%     'LineStyle', 'None', ...
%     'Marker', '.', ...
%     'MarkerEdgeColor', color(idx,1:3) );

  xlabel ( '<--- X --->', 'Fontsize', 16 );
  ylabel ( '<--- Y --->', 'Fontsize', 16 );
  zlabel ( '<--- Z --->', 'Fontsize', 16 );
  title ( 'Lorenz Clusters by Color', 'Fontsize', 16 );
  grid on;
  axis equal;
  view ( -60, 45 )

  hold off

  filename = 'x_m3_n4001_k10.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved graphics file as "%s"\n', filename );
%
%  Compute the transition matrix.
%
  tmat = zeros ( k, k );

  for t = 1 : n - 1
    i = idx(t);
    j = idx(t+1);
    tmat(i,j) = tmat(i,j) + 1;
  end

  for i = 1 : k
    rsum = sum ( tmat(i,1:k) );
    tmat(i,1:k) = tmat(i,1:k) / rsum;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Transition matrix:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : k
    for j = 1 : k
      fprintf ( 1, '  %6.4f', tmat(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
