function i4lib_test54 ( )

%*****************************************************************************80
%
%% TEST54 tests I4VEC_FRAC;
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
  b = 1;
  c = 2 * n;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST54\n' );
  fprintf ( 1, '  I4VEC_FRAC: K-th smallest integer vector entry.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  The array to search:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Fractile    Value\n' );
  fprintf ( 1, '\n' );

  for k = 1 : floor ( n / 2 ) : n

    afrac = i4vec_frac ( n, a, k );

    fprintf ( 1, '  %6d  %6d\n', k, afrac );

  end

  return
end
