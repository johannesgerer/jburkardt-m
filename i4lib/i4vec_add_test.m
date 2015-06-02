function i4vec_add_test ( )

%*****************************************************************************80
%
%% I4VEC_ADD_TEST tests I4VEC_ADD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 September 2014
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_ADD_TEST\n' );
  fprintf ( 1, '  I4VEC_ADD adds two I4VEC''s;\n' );

  seed = 123456789;

  lo = - n;
  hi = n;

  [ a, seed ] = i4vec_uniform_ab ( n, lo, hi, seed );
  [ b, seed ] = i4vec_uniform_ab ( n, lo, hi, seed );
  c = i4vec_add ( n, a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     A     B     C\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '%6d%6d%6d%6d\n', i, a(i), b(i), c(i) );
  end

  return
end
