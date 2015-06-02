function r8vec_norm_l1_test ( )

%*****************************************************************************80
%
%% R8VEC_NORM_L1_TEST tests R8VEC_NORM_L1.
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
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_NORM_L1_TEST\n' );
  fprintf ( 1, '  For an R8VEC:\n' );
  fprintf ( 1, '  R8VEC_NORM_L1:   L1 norm.\n' );
 
  b = -n;
  c = n;

  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );
 
  r8vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L1 norm:         %f\n', r8vec_norm_l1 ( n, a ) );

  return
end
