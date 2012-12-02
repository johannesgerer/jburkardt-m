function subset_test0175 ( )

%*****************************************************************************80
%
%% TEST0175 tests COMPNZ_RANDOM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2008
%
%  Author:
%
%    John Burkardt
%
  k = 5;
  n = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0175\n' );
  fprintf ( 1, '  COMPNZ_RANDOM generates random compositions\n' );
  fprintf ( 1, '  using nonzero parts.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Seeking random compositions of N = %d\n', n );
  fprintf ( 1, '  using %d nonzero parts.\n', k );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    [ a, seed ] = compnz_random ( n, k, seed );
    for j = 1 : k
      fprintf ( 1, '  %2d', a(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
