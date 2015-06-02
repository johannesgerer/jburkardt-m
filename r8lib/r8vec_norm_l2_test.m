function r8vec_norm_l2_test ( )

%*****************************************************************************80
%
%% R8VEC_NORM_L2_TEST tests R8VEC_NORM_L2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_NORM_L2_TEST\n' );
  fprintf ( 1, '  R8VEC_NORM_L2 computes the L2 norm of an R8VEC.\n' );
 
  n = 10;
  b = -n;
  c = n;
  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );
 
  r8vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 norm = %f\n', r8vec_norm_l2 ( n, a ) );

  return
end
