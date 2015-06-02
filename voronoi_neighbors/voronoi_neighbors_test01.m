function voronoi_neighbor_test01 ( )

%*****************************************************************************80
%
%% VORONOI_NEIGHBOR_TEST01 demonstrates VORONOI_NEIGHBORS
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VORONOI_NEIGHBORS_TEST01:\n' );
  fprintf ( 1, '  Select a random set of points in the unit square.\n' );
  fprintf ( 1, '  Compute the Voronoi diagram.\n' );
  fprintf ( 1, '  Have VORONOI_NEIGHBORS determine the neighbors.\n' );

  n = 8;
  x = rand ( n, 2 );
%
%  Compute and display the Voronoi diagram.
%
  figure ( );

  hold on
  voronoi ( x(:,1), x(:,2) );
  for i = 1 : n
    txt = sprintf ( '%d', i );
    text ( x(i,1), x(i,2), txt, 'FontSize', 12 );
  end
  hold off

  filename = 'voronoi_neighbors_test01.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Voronoi diagram saved as "%s".\n', filename );
%
%  Compute and list the finite Voronoi edges.
%
  [ V, C ] = voronoin ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Voronoi edges:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : length ( C )
    disp ( C{i} )
  end
%
%  Compute the Voronoi neighbors.
%
  vn = voronoi_neighbors ( x );
%
%  To print the matrix, make a full version.
%
  vn = full ( vn );
  i4mat_print ( n, n, vn, '  Voronoi adjacency:' )

  return
end


