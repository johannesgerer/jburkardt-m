function r8lib_test121 ( )

%*****************************************************************************80
%
%% TEST121 tests R8VEC_FRAC.
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
  fprintf ( 1, 'TEST121\n' );
  fprintf ( 1, '  R8VEC_FRAC: K-th smallest DVEC entry;\n' );

  seed = 123456789;

  [ a, seed ] = r8vec_uniform_01 ( n, seed );

  r8vec_print ( n, a, '  Array to search:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Fractile  Value\n' );
  fprintf ( 1, '\n' );

  for k = 1 : floor ( n / 2 ) : n

    afrac = r8vec_frac ( n, a, k );

    fprintf ( 1, '  %8d  %14f\n', k, afrac );

  end

  return
end
