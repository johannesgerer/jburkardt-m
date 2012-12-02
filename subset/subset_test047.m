function subset_test047 ( )

%*****************************************************************************80
%
%% TEST047 tests I4MAT_PERM2, TRIANG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  a = [ ...
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0; ...
    0, 1, 0, 1, 0, 1, 0, 1, 0, 0; ...
    1, 0, 1, 1, 0, 0, 0, 0, 0, 0; ...
    0, 0, 0, 1, 0, 0, 0, 0, 0, 0; ...
    1, 1, 1, 1, 1, 1, 1, 1, 0, 1; ...
    0, 0, 0, 1, 0, 1, 0, 1, 0, 0; ...
    1, 0, 1, 1, 0, 1, 1, 1, 0, 1; ...
    0, 0, 0, 1, 0, 0, 0, 1, 0, 0; ...
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0; ...
    1, 0, 1, 1, 0, 0, 0, 1, 0, 1];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST047\n' );
  fprintf ( 1, '  TRIANG relabels elements for a partial ordering,\n' );
  fprintf ( 1, '  I4MAT_PERM2 reorders an integer matrix in place.\n' );

  i4mat_print ( n, n, a, '  The input matrix:' );
 
  p = triang ( n, a );
 
  perm_print ( n, p, '  The new ordering:' );

  a = i4mat_perm2 ( n, n, a, p, p );
 
  i4mat_print ( n, n, a, '  The reordered matrix:' );

  return
end
