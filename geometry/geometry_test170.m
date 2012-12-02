function geometry_test170 ( )

%*****************************************************************************80
%
%% TEST170 tests PROVEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  m = 4;
  n = 2;

  base = [ ...
    4.0, 3.0, 2.0, 1.0; ...
    1.0, 2.0, 3.0, 4.0 ]';
  vecm = [ 1.0, 1.0, 1.0, 2.0 ];
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST170\n' );
  fprintf ( 1, '  PROVEC projects a vector onto a subspace.\n' );
 
  r8mat_transpose_print ( m, n, base, '  Base vectors' );
  
  r8vec_print ( m, vecm, '  Vector to be projected:' );
 
  [ vecn, vecnm ] = provec ( m, n, base, vecm );
 
  r8vec_print ( n, vecn, '  Projected vector in BASE coordinates:' );

  r8vec_print ( m, vecnm, '  Projected vector in original coordinates:' );
 
  return
end
