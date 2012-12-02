function subset_test076 ( )

%*****************************************************************************80
%
%% TEST076 tests KSUB_RANDOM2.
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
  n = 5;
  k = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST076\n' );
  fprintf ( 1, '  KSUB_RANDOM2 generates a random K subset of an N set.\n' );
  fprintf ( 1, '  Set size is N =    %d\n', n );
  fprintf ( 1, '  Subset size is K = %d\n', k );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    fprintf ( 1, '%12d  ', seed );
    [ a, seed ] = ksub_random2 ( n, k, seed );
    for j = 1 : k
      fprintf ( 1, '%d  ', a(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
