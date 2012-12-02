function subset_test156 ( )

%*****************************************************************************80
%
%% TEST156 tests VEC_RANDOM.
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
  n = 3;
  base = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST156\n' );
  fprintf ( 1, '  VEC_RANDOM generates a random N-vector\n' );
  fprintf ( 1, '  in a given base.\n' );
  fprintf ( 1, '  Here, we use base %d\n', base );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    [ a, seed ] = vec_random ( n, base, seed );
    for j = 1 : n
      fprintf ( 1, '  %2d', a(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
