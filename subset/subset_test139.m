function subset_test139 ( )

%*****************************************************************************80
%
%% TEST139 tests R8VEC_FRAC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  ahi = 10.0;
  alo = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST139\n' );
  fprintf ( 1, '  R8VEC_FRAC: K-th smallest real vector entry;\n' );

  seed = 123456789;

  [ a, seed ] = r8vec_uniform ( n, alo, ahi, seed );

  r8vec_print ( n, a, '  The real array to search: ' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Frac   R8VEC_FRAC\n' );
  fprintf ( 1, '\n' );

  for k = 1 : n

    afrac = r8vec_frac ( n, a, k );
    fprintf ( 1, '  %2d  %6f\n', k, afrac );

  end

  return
end
