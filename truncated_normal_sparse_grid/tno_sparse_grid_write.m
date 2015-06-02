function tno_sparse_grid_write ( header, l, m, n, x, w )

%*****************************************************************************80
%
%% TNO_SPARSE_GRID_WRITE writes a Truncated Normal Odd Sparse Grid to X and W files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string HEADER, a header for the file names.
%
%    Input, integer L, the level of the rule.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real X(M,N), the abscissas.
%
%    Input, real W(N), the weights.
%
  w_filename = sprintf ( '%s_d%d_level%d_w.txt', header, m, l );
  x_filename = sprintf ( '%s_d%d_level%d_x.txt', header, m, l );

  r8vec_write ( w_filename, n, w );
  r8mat_write ( x_filename, m, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  W data written to "%s".\n', w_filename );
  fprintf ( 1, '  X data written to "%s",\n', x_filename );

  return
end
