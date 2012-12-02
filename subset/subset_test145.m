function subset_test145 ( )

%*****************************************************************************80
%
%% TEST145 tests SUBSET_RANDOM.
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
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST145\n' );
  fprintf ( 1, '  SUBSET_RANDOM picks a subset at random.\n' );
  fprintf ( 1, '  The number of elements in the main set is %d\n', n );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 5
    [ a, seed ] = subset_random ( n, seed );
    for j = 1 : n
      fprintf ( 1, '  %2d', a(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
