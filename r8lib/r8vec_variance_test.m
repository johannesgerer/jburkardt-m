function r8vec_variance_test ( )

%*****************************************************************************80
%
%% R8VEC_VARIANCE_TEST tests R8VEC_VARIANCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_VARIANCE_TEST\n' );
  fprintf ( 1, '  R8VEC_VARIANCE computes the variance of an R8VEC.\n' );;
 
  n = 10;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ a, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
 
  r8vec_print ( n, a, '  Input vector:' );

  variance = r8vec_variance ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Variance:   %f\n', variance );

  return
end
