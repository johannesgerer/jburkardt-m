function linplus_test422 ( )

%*****************************************************************************80
%
%% TEST422 tests R8CC_GET, R8CC_IJK, R8CC_INC, R8CCA_KIJ, R8CC_SET.
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
  nz_num = 12;

  colptr = [ 1, 4, 6, 8, 10, 13 ];
  rowind = [ 1, 2, 4, 1, 2, 3, 5, 4, 5, 1, 2, 5 ];
  seed = 123456789;
  test_num = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST422\n' );
  fprintf ( 1, '  For a matrix in the R8CC format,\n' );
  fprintf ( 1, '  (double precision Harwell-Boeing Unsymmetric Assembled)\n' );
  fprintf ( 1, '  R8CC_GET gets an entry;\n' );
  fprintf ( 1, '  R8CC_IJK gets K from (I,J)\n' );
  fprintf ( 1, '  R8CC_INC increments an entry;\n' );
  fprintf ( 1, '  R8CC_KIJ gets (I,J) from K;\n' );
  fprintf ( 1, '  R8CC_SET sets an entry;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =          %d\n', m );
  fprintf ( 1, '  Matrix columns N =       %d\n', n );
  fprintf ( 1, '  Matrix nonzeros NZ_NUM = %d\n', nz_num );

  i4vec_print ( n+1, colptr, '  The COLPTR vector:' );

  i4vec_print ( nz_num, rowind, '  The ROWIND vector:' );

  a(1:nz_num) = 0.0;
%
%  Initialize the matrix to random values.
%
  [ a, seed ] = r8cc_random ( m, n, nz_num, colptr, rowind, seed );

  r8cc_print ( m, n, nz_num, colptr, rowind, a, ...
    '  The initial R8CC matrix:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8CC_IJK locates some (I,J) entries.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         I         J         K\n' );
  fprintf ( 1, '\n' );

  for ( test = 1 : test_num )
    [ i, seed ] = i4_uniform ( 1, m, seed );
    [ j, seed ] = i4_uniform ( 1, n, seed );
    k = r8cc_ijk ( m, n, nz_num, colptr, rowind, i, j );
    fprintf ( 1, '  %8d  %8d  %8d\n', i, j, k );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8CC_KIJ locates some K entries.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         K         I         J\n' );
  fprintf ( 1, '\n' );

  for ( test = 1 : test_num )
    [ k, seed ] = i4_uniform ( 1, nz_num, seed );
    [ i, j ] = r8cc_kij ( m, n, nz_num, colptr, rowind, k );
    fprintf ( 1, '  %8d  %8d  %8d\n', k, i, j );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8CC_SET sets 10 entries at random.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         I         J         K      NEW_VALUE\n' );
  fprintf ( 1, '\n' );

  for ( test = 1 : 10 )
    [ k, seed ] = i4_uniform ( 1, nz_num, seed );
    [ i, j ] = r8cc_kij ( m, n, nz_num, colptr, rowind, k );
    value = 100.0 + test;
    a = r8cc_set ( m, n, nz_num, colptr, rowind, a, i, j, value );
    fprintf ( 1, '  %8d  %8d  %8d  %14f\n', i, j, k, value );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8CC_INC increments 10 entries at random.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         I         J         K       NEW_VALUE\n' );
  fprintf ( 1, '\n' );

  for ( test = 1 : 10 )
    [ k, seed ] = i4_uniform ( 1, nz_num, seed );
    [ i, j ] = r8cc_kij ( m, n, nz_num, colptr, rowind, k );
    value = 20.0 + test;
    a = r8cc_inc ( m, n, nz_num, colptr, rowind, a, i, j, value );
    value = r8cc_get ( m, n, nz_num, colptr, rowind, a, i, j );
    fprintf ( 1, '  %8d  %8d  %8d  %14f\n', i, j, k, value );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8CC_GET retrieves 10 entries.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         I         J         K      VALUE\n' );
  fprintf ( 1, '\n' );

  for ( test = 1 : 10 )
    [ k, seed ] = i4_uniform ( 1, nz_num, seed );
    [ i, j ] = r8cc_kij ( m, n, nz_num, colptr, rowind, k );
    value = r8cc_get ( m, n, nz_num, colptr, rowind, a, i, j );
    fprintf ( 1, '  %8d  %8d  %8d  %14f\n', i, j, k, value );
  end

  r8cc_print ( m, n, nz_num, colptr, rowind, a, ...
    '  The final R8CC matrix:' );

  return
end
