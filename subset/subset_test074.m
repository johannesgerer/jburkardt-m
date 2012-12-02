function subset_test074 ( )

%*****************************************************************************80
%
%% TEST074 tests KSUB_NEXT4.
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
  fprintf ( 1, 'TEST074\n' );
  fprintf ( 1, '  KSUB_NEXT4 generates K subsets of an N set.\n' );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  K = %d\n', k );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Rank    Subset\n' );
  fprintf ( 1, '\n' );

  a = [];
  done = 1;
  rank = 0;
 
  while ( 1 )
 
    [ a, done ] = ksub_next4 ( n, k, a, done );
 
    if ( done )
      break
    end

    rank = rank + 1;
    fprintf ( 1, '  %2d  ', rank );
    for i = 1 : k
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
