function subset_test037 ( )

%*****************************************************************************80
%
%% TEST037 tests I4MAT_01_ROWCOLSUM.
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
  m = 5;
  n = 5;
  c = [ 2, 2, 2, 2, 1 ];
  r = [ 3, 2, 2, 1, 1 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST037\n' );
  fprintf ( 1, '  I4MAT_01_ROWCOLSUM constructs a 01 matrix with\n' );
  fprintf ( 1, '  given row and column sums.\n' );
  
  i4vec_print ( m, r, '  The rowsum vector:' );
  i4vec_print ( n, c, '  The columnsum vector: ' );

  [ a, ierror ] = i4mat_01_rowcolsum ( m, n, r, c );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Error flag IERROR = %d\n', ierror );
  else
    i4mat_print ( m, n, a, '  The rowcolsum matrix:' );
  end

  return
end
