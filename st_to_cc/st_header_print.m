function st_header_print ( i_min, i_max, j_min, j_max, m, n, nst )

%*****************************************************************************80
%
%% ST_HEADER_PRINT prints the header of an ST file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I_MIN, I_MAX, the minimum and maximum rows.
%
%    Input, integer J_MIN, J_MAX, the minimum and maximum columns.
%
%    Input, integer M, the number of rows.
%
%    Input, integer N, the number of columns.
%
%    Input, integer NST, the number of nonzeros.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sparse Triplet (ST) header:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Minimum row index I_MIN = %d\n', i_min );
  fprintf ( 1, '  Maximum row index I_MAX = %d\n', i_max );
  fprintf ( 1, '  Minimum col index J_MIN = %d\n', j_min );
  fprintf ( 1, '  Maximum col index J_MAX = %d\n', j_max );
  fprintf ( 1, '  Number of rows        M = %d\n', m );
  fprintf ( 1, '  Number of columns     N = %d\n', n );
  fprintf ( 1, '  Number of nonzeros  NST = %d\n', nst );

  return
end
