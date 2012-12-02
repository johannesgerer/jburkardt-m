function subset_test07715 ( )

%*****************************************************************************80
%
%% TEST07715 tests KSUB_RANDOM5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2011
%
%  Author:
%
%    John Burkardt
%
  n = 52;
  k = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07715\n' );
  fprintf ( 1, '  KSUB_RANDOM5 generates a random K-subset of an N-set.\n' );
  fprintf ( 1, '  Set size is N =    %d\n', n );
  fprintf ( 1, '  Subset size is K = %d\n', k );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 5
    [ a, seed ] = ksub_random5 ( n, k, seed );
    for j = 1 : k
      fprintf ( 1, '  %3d', a(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
