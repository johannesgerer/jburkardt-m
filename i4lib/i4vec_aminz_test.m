function i4vec_aminz_test ( )

%*****************************************************************************80
%
%% I4VEC_AMINZ_TEST tests I4VEC_AMINZ;
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
  fprintf ( 1, 'I4VEC_AMINZ_TEST\n' );
  fprintf ( 1, '  For an integer vector:\n' );
  fprintf ( 1, '  I4VEC_AMINZ:  minimum nonzero absolute entry;\n' );
 
  seed = 123456789;

  b = -n;
  c = n;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );
 
  i4vec_print ( n, a, '  Input vector:' );

  fprintf ( 1, '\n' );

  aval = i4vec_aminz ( n, a );

  fprintf ( 1, '  Minimum abs nonzero:       %f\n', aval );

  return
end
