function r8mat_normal_01_test ( )

%*****************************************************************************80
%
%% R8MAT_NORMAL_01_TEST tests R8MAT_NORMAL_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 July 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_NORMAL_01_TEST\n' );
  fprintf ( 1, '  R8MAT_NORMAL_01 computes a matrix of Normal 01 values.\n' );

  m = 5;
  n = 4;
  seed = 123456789;
  [ r, seed ] = r8mat_normal_01 ( m, n, seed );

  r8mat_print ( m, n, r, '  The matrix:' );

  return
end
