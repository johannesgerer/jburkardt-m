function floyd_test01 ( )

%*****************************************************************************80
%
%% FLOYD_TEST01 tests I4MAT_FLOYD.
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
     0, -1, -1, -1, -1, -1; ...
     2,  0, -1, -1, -1,  5; ...
     5,  7,  0, -1,  2, -1; ...
    -1,  1,  4,  0, -1,  2; ...
    -1, -1, -1,  3,  0,  4; ...
    -1,  8, -1, -1,  3,  0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1,'FLOYD_TEST01\n' );
  fprintf ( 1, '  I4MAT_FLOYO uses Floyd''s algorithm to find the\n' );
  fprintf ( 1, '  shortest distance between all pairs of nodes\n' );
  fprintf ( 1, '  in a directed graph, starting from the initial array\n' );
  fprintf ( 1, '  of direct node-to-node distances.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  In the initial direct distance array, if\n' );
  fprintf ( 1, '    A(I,J) = -1,\n' );
  fprintf ( 1, '  this indicates there is NO directed link from\n' );
  fprintf ( 1, '  node I to node J.  In that case, the value of\n' );
  fprintf ( 1, '  of A(I,J) is essentially "infinity".\n' );

  i4mat_print ( n, n, a, '  Initial direct distance array:' )

  index = find ( a(1:n,1:n) == - 1 );
  a(index) = Inf;

  a = i4mat_floyd ( n, a );

  index = find ( a(1:n,1:n) == Inf );
  a(index) = - 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  In the final shortest distance array, if\n' );
  fprintf ( 1, '    A(I,J) = -1,\n' );
  fprintf ( 1, '  this indicates there is NO directed path from\n' );
  fprintf ( 1, '  node I to node J.\n' );

  i4mat_print ( n, n, a, '  Final shortest distance array:' )

  return
end
