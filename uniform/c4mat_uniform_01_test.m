function c4mat_uniform_01_test ( )

%*****************************************************************************80
%
% C4MAT_UNIFORM_01_TEST tests C4MAT_UNIFORM_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 December 2014
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 2;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C4MAT_UNIFORM_01_TEST\n' );
  fprintf ( 1, '  C4MAT_UNIFORM_01 computes pseudorandom complex values\n' );
  fprintf ( 1, '  in the unit circle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );

  [ c, seed ] = c4mat_uniform_01 ( m, n, seed );

  c4mat_print ( m, n, c, '  The Uniform C4MAT:' );

  return
end
