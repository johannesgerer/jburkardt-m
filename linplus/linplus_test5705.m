function linplus_test5705 ( )

%*****************************************************************************80
%
%% TEST5705 tests R8SP_IJ_TO_K.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  m = 7;
  n = 5;
  nz_num = 10;

  col = [ 2, 5, 1, 5, 1, 2, 3, 4, 4, 1 ];
  row = [ 1, 1, 2, 2, 4, 4, 4, 5, 6, 7 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST5705\n' );
  fprintf ( 1, '  R8SP_IJ_TO_K returns the R8SP index of (I,J).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %8d\n', m );
  fprintf ( 1, '  Matrix columns N = %8d\n', n );
  fprintf ( 1, '  Matrix nonzeros =  %8d\n', nz_num );

  check = r8sp_check ( m, n, nz_num, row, col );

  if ( ~check )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8SP_CHECK - Error!\n' );
    fprintf ( 1, '  The matrix is not in the proper sorted format.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '         I         J         K\n' );
  fprintf ( 1, '\n' );
  for i = 1 : m
    for j = 1 : n
      k = r8sp_ij_to_k ( nz_num, row, col, i, j );
      fprintf ( 1, '  %8d  %8d  %8d\n', i, j, k );
    end
  end

  return
end
