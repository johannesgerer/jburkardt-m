function i4vec_variance_test (  )

%*****************************************************************************80
%
%% I4VEC_VARIANCE_TEST tests I4VEC_VARIANCE.
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
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_VARIANCE_TEST\n' );
  fprintf ( 1, '  For an integer vector:\n' );
  fprintf ( 1, '  I4VEC_VARIANCE: variance.\n' );

  seed = 123456789;
  b = -n;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Input vector:' );

  variance = i4vec_variance ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Variance: %f\n', variance );

  return
end
