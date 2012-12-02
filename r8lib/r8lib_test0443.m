function r8lib_test0443 ( )

%*****************************************************************************80
%
%% R8LIB_TEST0443 tests R8COL_UNDEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 July 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST0443\n' );
  fprintf ( 1, '  R8COL_UNDEX produces index vectors which create a sorted\n' );
  fprintf ( 1, '  list of the unique columns of an (unsorted) R8COL, \n' );
  fprintf ( 1, '  and a map from the original R8COL to the (implicit) \n' );
  fprintf ( 1, '  R8COL of sorted unique elements.\n' );

  m = 3;
  n = 22;

  a = [ ...
    1.9,  0.0, 10.0; ...
    2.0,  6.0, 10.0; ...
    4.0,  8.0, 12.0; ...
    1.0,  5.0,  9.0; ...
    3.0,  7.0, 11.0; ...
    2.0,  6.0,  0.0; ...
    2.0,  0.0, 10.1; ...
    2.0,  0.1, 10.0; ...
    3.0,  4.0, 18.0; ...
    1.9,  8.0, 10.0; ...
    0.0,  0.0,  0.0; ...
    0.0,  6.0, 10.0; ...
    2.1,  0.0, 10.0; ...
    2.0,  6.0, 10.0; ...
    3.0,  7.0, 11.0; ...
    2.0,  0.0, 10.0; ...
    2.0,  0.0, 10.0; ...
    2.0,  6.0, 10.0; ...
    1.0,  5.0,  9.0; ...
    2.0,  0.0, 10.1; ...
    1.0,  5.0,  9.1; ...
    1.0,  5.1,  9.0  ]';

  r8mat_transpose_print ( m, n, a, '  The R8COL (transposed):' );

  n_unique = r8col_unique_count ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of unique entries in X is %d\n', n_unique );

  [ undx, xdnu ] = r8col_undex ( m, n, a, n_unique );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  XDNU points to the representative for each item.\n' );
  fprintf ( 1, '  UNDX selects the representatives..\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n_unique
    fprintf ( 1, '  %4d  %4d  %4d\n', i, xdnu(i), undx(i) );
  end
  for i = n_unique + 1 : n
    fprintf ( 1, '  %4d  %4d\n', i, xdnu(i) );
  end

  for j = 1 : n_unique
    au(1:m,j) = a(1:m,undx(j));
  end 

  r8mat_transpose_print ( m, n_unique, au, '  The Unique R8COL (transposed):' );

  return
end
