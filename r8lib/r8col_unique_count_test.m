function r8col_unique_count_test ( )

%*****************************************************************************80
%
%% R8COL_UNIQUE_COUNT_TEST tests R8COL_UNIQUE_COUNT.
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
  m = 3;
  n = 15;

  a = [ ...
    2.0,  6.0, 10.0; ...
    4.0,  8.0, 12.0; ...
    1.0,  5.0,  9.0; ...
    3.0,  7.0, 11.0; ...
    2.0,  6.0,  0.0; ...
    3.0,  4.0, 18.0; ...
    0.0,  0.0,  0.0; ...
    0.0,  6.0, 10.0; ...
    2.0,  6.0, 10.0; ...
    3.0,  7.0, 11.0; ...
    2.0,  0.0, 10.0; ...
    2.0,  6.0, 10.0; ...
    1.0,  5.0,  9.0; ...
    1.0,  5.0,  9.1; ...
    1.0,  5.1,  9.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8COL_UNIQUE_COUNT_TEST\n' );
  fprintf ( 1, '  For an R8COL;\n' );
  fprintf ( 1, '  R8COL_UNIQUE_COUNT counts unique columns.\n' );
  fprintf ( 1, '\n' );

  r8mat_transpose_print ( m, n, a, '  The R8COL (transposed):' );

  unique_num = r8col_unique_count ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of unique columns is %d\n', unique_num );

  return
end
