function tno_sparse_grid_size_test ( )

%*****************************************************************************80
%
%% TNO_SPARSE_GRID_SIZE_TEST tests NWSPGR_SIZE.
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
  fprintf ( 1, 'TNO_SPARSE_GRID_SIZE_TEST:\n' );
  fprintf ( 1, '  NWSPGR_SIZE returns the size of a sparse grid\n' );
  fprintf ( 1, '  formed from 1D quadrature rules.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Our 1D rules will be the Truncated Normal Odd (TNO)\n' );
  fprintf ( 1, '  family.\n' );
%
%  Do a table.
%
  sym = 0;
  compress = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension / Level table for TNO Family\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dim:' )
  for d = 1 : 10
    fprintf ( 1, '%7d', d );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Level:\n' );
  for k = 1 : 6
    fprintf ( 1, '  %2d:', k );
    for d = 1 : 10
      fprintf ( 1, '%7d', nwspgr_size ( 'tno', d, k, sym, compress ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
