function subset_test075 ( )

%*****************************************************************************80
%
%% TEST075 tests KSUB_RANDOM.
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
  k = 3;
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST075\n' );
  fprintf ( 1, '  KSUB_RANDOM generates a random K subset of an N set.\n' );
  fprintf ( 1, '  Set size is N =    %d\n', n );
  fprintf ( 1, '  Subset size is K = %d\n', k );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 5

    [ a, seed ] = ksub_random ( n, k, seed );

    for j = 1 : k
      fprintf ( 1, '  %3d', a(j) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
