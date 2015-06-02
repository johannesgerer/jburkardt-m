function tno_sparse_grid_test ( )

%*****************************************************************************80
%
%% TNO_SPARSE_GRID_TEST uses NWSPGR to generate a TNO sparse grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TNO_SPARSE_GRID_TEST:\n' );
  fprintf ( 1, '  Use NWSPGR to generate a sparse grid in 2D\n' );
  fprintf ( 1, '  based on the Truncated Normal Odd (TNO) family.\n' );

  d = 2;
  sym = 0;

  for l = 1 : 7
    [ x, w ] = nwspgr ( 'tno', d, l, sym );
    x = x';
    [ m, n ] = size ( x );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  TNO sparse grid, Dim %d, Level %d', d, l );
    fprintf ( 1, '\n' );
    for j = 1 : n
      fprintf ( 1, '  %3d  %24.16g', j, w(j) );
      for i = 1 : m
        fprintf ( 1, '  %24.16g', x(i,j) );
      end
      fprintf ( 1, '\n' );
    end
  end

  return
end
