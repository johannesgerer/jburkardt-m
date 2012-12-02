function linplus_test28 ( )

%*****************************************************************************80
%
%% TEST28 tests R8GD_MXV, R8GD_PRINT, R8GD_RANDOM, R8GD_VXM.
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
  n = 10;
  ndiag = 4;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST28\n' );
  fprintf ( 1, '  For a general diagonal matrix:\n' );
  fprintf ( 1, '  R8GD_MXV computes A * x;\n' );
  fprintf ( 1, '  R8GD_PRINT prints it;\n' );
  fprintf ( 1, '  R8GD_RANDOM randomly generates one;\n' );
  fprintf ( 1, '  R8GD_VXM computes A''*x;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N            = %d\n', n );
  fprintf ( 1, '  Number of diagonals NDIAG = %d\n', ndiag );
%
%  Set the matrix.
%
  offset = [ -2, 0, 1, n - 1 ];

  i4vec_print ( ndiag, offset, '  The offset vector:' );

  [ a, seed ] = r8gd_random ( n, ndiag, offset, seed );

  r8ge_print ( n, ndiag, a, '  The raw matrix: ' );

  r8gd_print ( n, ndiag, offset, a, '  The general diagonal matrix:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  b = r8gd_mxv ( n, ndiag, offset, a, x );

  r8vec_print ( n, b, '  A * x:' );
%
%  Compute the corresponding right hand side.
%
  b = r8gd_vxm ( n, ndiag, offset, a, x );

  r8vec_print ( n, b, '  A'' * x:' );

  return
end
