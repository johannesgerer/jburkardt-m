function c8mat_uniform_01_test ( )

%*****************************************************************************80
%
% C8MAT_UNIFORM_01_TEST tests C8MAT_UNIFORM_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 December 2014
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8MAT_UNIFORM_01_TEST\n' );
  fprintf ( 1, '  C8MAT_UNIFORM_01 computes pseudorandom complex values\n' );
  fprintf ( 1, '  in the unit circle.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );

  m = 5;
  n = 2;

  [ c, seed ] = c8mat_uniform_01 ( m, n, seed );

  c8mat_print ( m, n, c, '  The Uniform C8MAT:' );

  return
end
