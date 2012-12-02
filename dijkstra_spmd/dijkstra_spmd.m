function dijkstra_spmd ( )

%*****************************************************************************80
%
%% DIJKSTRA_SPMD runs an example of Dijkstra's minimum distance algorithm.
%
%  Discussion:
%
%    Given the distance matrix that defines a graph, we seek a list
%    of the minimum distances between node 1 and all other nodes.
%
%    This program sets up a small example problem and solves it.
%
%    The correct minimum distances are:
%
%      0   35   15   45   49   41
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 July 2010
%
%  Author:
%
%    Original C version by Norm Matloff, CS Dept, UC Davis.
%    This MATLAB version by John Burkardt.
%
  nv = 6;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIJKSTRA_SPMD\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Use Dijkstra''s algorithm to determine the minimum\n' );
  fprintf ( 1, '  distance from node 1 to each node in a graph,\n' );
  fprintf ( 1, '  given the distances between each pair of nodes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  MATLAB''s SPMD parallel computing option is used to\n' );
  fprintf ( 1, '  carry out the task in parallel, by assigning to each worker\n' );
  fprintf ( 1, '  a subset of the nodes.\n' );
%
%  Initialize the problem data.
%
  ohd = initial_distance ( );
%
%  Print the distance matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Distance matrix:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nv
    for j = 1 : nv
      if ( ohd(i,j) == Inf )
        fprintf ( 1, '  Inf' );
      else
        fprintf ( 1, '  %3d', ohd(i,j) );
      end
    end
    fprintf ( 1, '\n' );
  end
%
%  Carry out the algorithm using SPMD workers.
%
  mind = dijkstra_fun ( nv, ohd );
%
%  Print the results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Minimum distances from node 1:\n');
  fprintf ( 1, '\n' );
  for i = 1 : nv
    fprintf ( 1, '  %2d  %2d\n', i, mind(i) );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIJKSTRA_SPMD\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
