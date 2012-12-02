function r8lib_test129 ( )

%*****************************************************************************80
%
%% TEST129 tests R8VEC_NORM_L1, R8VEC_NORM_L2, R8VEC_NORM_LI.
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
  fprintf ( 1, 'TEST129\n' );
  fprintf ( 1, '  For an R8VEC:\n' );
  fprintf ( 1, '  R8VEC_NORM_L1:   L1 norm.\n' );
  fprintf ( 1, '  R8VEC_NORM_L2:   L2 norm.\n' );
  fprintf ( 1, '  R8VEC_NORM_LI:   L-infinity norm.\n' );
 
  b = -n;
  c = n;

  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );
 
  r8vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L1 norm:         %f\n', r8vec_norm_l1 ( n, a ) );
  fprintf ( 1, '  L2 norm:         %f\n', r8vec_norm_l2 ( n, a ) );
  fprintf ( 1, '  L-Infinity norm: %f\n', r8vec_norm_li ( n, a ) );

  return
end
