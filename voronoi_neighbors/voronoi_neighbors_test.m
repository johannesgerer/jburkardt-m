function voronoi_neighbor_test ( )

%*****************************************************************************80
%
%% VORONOI_NEIGHBOR_TEST tests the VORONOI_NEIGHBORS library.
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
  fprintf ( 1, 'VORONOI_NEIGHBORS_TEST:\n' );
  fprintf ( 1, '  Test the VORONOI_NEIGHBORS library.\n' );

  voronoi_neighbors_test01 ( );
  voronoi_neighbors_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VORONOI_NEIGHBORS_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end


