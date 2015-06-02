function i4vec_mean_test ( )

%*****************************************************************************80
%
%% I4VEC_MEAN_TEST tests I4VEC_MEAN;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_MEAN_TEST\n' );
  fprintf ( 1, '  For an I4VEC:\n' );
  fprintf ( 1, '  I4VEC_MEAN:    mean value;\n' );
 
  seed = 123456789;
  b = -n;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );
 
  i4vec_print ( n, a, '  Input vector:' );

  mean = i4vec_mean ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Mean:   %f\n', mean );

  return
end
