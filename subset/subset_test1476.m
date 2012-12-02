function subset_test1476 ( )

%*****************************************************************************80
%
%% TEST1476 tests SUBCOMPNZ_NEXT.
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
  k = 3;
  n = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1476\n' );
  fprintf ( 1, '  SUBCOMPNZ_NEXT generates subcompositions\n' );
  fprintf ( 1, '  using nonzero parts.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Seek all subcompositions of N = %d\n', n );
  fprintf ( 1, '  using K = %d nonzero parts.\n', k );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     #   Sum\n' );
  fprintf ( 1, '\n' );

  more = 0;
  a = [];
  count = 0;

  while ( 1 )

    [ a, more ] = subcompnz_next ( n, k, a, more );

    count = count + 1;
    fprintf ( 1, '  %4d  %4d  ', count, sum ( a(1:k) ) );
    for i = 1 : k
      fprintf ( 1, '%4d', a(i) );
    end
    fprintf ( 1, '\n' );

    if ( ~more )
      break
    end

  end

  return
end
