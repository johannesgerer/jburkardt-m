function toms097_test02 ( )

%*****************************************************************************80
%
%% TOMS097_TEST02 tests R8MAT_SHORTEST_PATH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2014
%
%  Author:
%
%    John Burkardt
%
  n = 6;

  a = [ ...
     0.0, -1.0, -1.0, -1.0, -1.0, -1.0; ...
     2.0,  0.0, -1.0, -1.0, -1.0,  5.0; ...
     5.0,  7.0,  0.0, -1.0,  2.0, -1.0; ...
    -1.0,  1.0,  4.0,  0.0, -1.0,  2.0; ...
    -1.0, -1.0, -1.0,  3.0,  0.0,  4.0; ...
    -1.0,  8.0, -1.0, -1.0,  3.0,  0.0 ]';
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS097_TEST02\n' );
  fprintf ( 1, '  R8MAT_SHORTEST_PATH uses Floyd''s algorithm to find the\n' );
  fprintf ( 1, '  shortest distance between all pairs of nodes\n' );
  fprintf ( 1, '  in a directed graph, starting from the initial array\n' );
  fprintf ( 1, '  of direct node-to-node distances.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  In the initial direct distance array, if\n' );
  fprintf ( 1, '    A(I,J) = -1,\n' );
  fprintf ( 1, '  this indicates there is NO directed link from\n' );
  fprintf ( 1, '  node I to node J.  In that case, the value of\n' );
  fprintf ( 1, '  of A(I,J) is essentially "infinity".\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial direct-link distance matrix:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '%10.4f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  for j = 1 : n
    for i = 1 : n
      if ( a(i,j) == -1.0 )
        a(i,j) = Inf;
      end
    end
  end 

  a = r8mat_shortest_path ( n, a );

  for j = 1 : n
    for i = 1 : n
      if ( a(i,j) == Inf )
        a(i,j) = -1.0;
      end
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  In the final shortest distance array, if\n' );
  fprintf ( 1, '    A(I,J) = -1,\n' );
  fprintf ( 1, '  this indicates there is NO directed path from\n' );
  fprintf ( 1, '  node I to node J.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Final distance matrix:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '%10.4f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
