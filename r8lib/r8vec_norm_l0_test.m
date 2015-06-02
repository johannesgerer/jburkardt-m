function r8vec_norm_l0_test ( )

%*****************************************************************************80
%
%% R8VEC_NORM_L0_TEST tests R8VEC_NORM_L0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_NORM_L0_TEST\n' );
  fprintf ( 1, '  R8VEC_NORM_L0 computes the L0 "norm" of an R8VEC.\n' );
 
  n = 10;
  a_lo = - 2.0;
  a_hi = + 2.0;
  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, a_lo, a_hi, seed );
  a = r8vec_nint ( n, a );

  r8vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L0 norm:         %f\n', r8vec_norm_l0 ( n, a ) );

  return
end
