function subset_test068 ( )

%*****************************************************************************80
%
%% TEST068 tests I4VEC_FRAC;
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
  fprintf ( 1, 'TEST068\n' );
  fprintf ( 1, '  I4VEC_FRAC: K-th smallest integer vector entry.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  [ a, seed ] = i4vec_uniform ( n, 1, 2*n, seed );

  i4vec_print ( n, a, '  The integer array to search:' );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '     K     K-th smallest\n' );
  fprintf ( 1, '\n' );

  for k = 1 : n

    afrac = i4vec_frac ( n, a, k );
    fprintf ( 1, '  %4d  %4d\n', k, afrac );

  end

  return
end
