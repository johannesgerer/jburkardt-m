function subset_test017 ( )

%*****************************************************************************80
%
%% TEST017 tests COMP_RANDOM.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST017\n' );
  fprintf ( 1, '  COMP_RANDOM generates random compositions.\n' );
  fprintf ( 1, '\n' );

  n = 10;
  seed = 123456789;

  for i = 1 : 5
    [ a, seed ] = comp_random ( n, k, seed );
    for j = 1 : k
      fprintf ( 1, '  %2d', a(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
