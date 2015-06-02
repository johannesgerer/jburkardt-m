function tno_sparse_grid_write_test ( )

%*****************************************************************************80
%
%% TNO_SPARSE_GRID_WRITE_TEST writes a TNO sparse grid to X and W files.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TNO_SPARSE_GRID_WRITE_TEST:\n' );
  fprintf ( 1, '  Write a TNO sparse grid to a file.\n' );

  m = 2;
  sym = 0;

  for l = 1 : 7
    [ x, w ] = nwspgr ( 'tno', m, l, sym );
    x = x';
    header = 'tno';
    [ ~, n ] = size ( x );
    tno_sparse_grid_write ( header, l, m, n, x, w );
  end

  return
end
