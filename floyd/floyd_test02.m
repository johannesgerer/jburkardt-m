function floyd_test02 ( )

%*****************************************************************************80
%
%% FLOYD_TEST02 tests R8MAT_FLOYD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 November 2008
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
  fprintf ( 1, 'FLOYD_TEST02\n' );
  fprintf ( 1, '  R8MAT_FLOYO uses Floyd''s algorithm to find the\n' );
  fprintf ( 1, '  shortest distance between all pairs of nodes\n' );
  fprintf ( 1, '  in a directed graph, starting from the initial array\n' );
  fprintf ( 1, '  of direct node-to-node distances.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  In the initial direct distance array, if\n' );
  fprintf ( 1, '    A(I,J) = -1,\n' );
  fprintf ( 1, '  this indicates there is NO directed link from\n' );
  fprintf ( 1, '  node I to node J.  In that case, the value of\n' );
  fprintf ( 1, '  of A(I,J) is essentially "infinity".\n' );

  r8mat_print ( n, n, a, '  Initial direct distance array:' );

  index = ( a(1:n,1:n) == - 1.0 );
  a(index) = Inf;

  a = r8mat_floyd ( n, a );

  index = find ( a(1:n,1:n) == Inf );
  a(index) = - 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  In the final shortest distance array, if\n' );
  fprintf ( 1, '    A(I,J) = -1,\n' );
  fprintf ( 1, '  this indicates there is NO directed path from\n' );
  fprintf ( 1, '  node I to node J.\n' );

  r8mat_print ( n, n, a, '  Final shortest distance array:' );

  return
end
