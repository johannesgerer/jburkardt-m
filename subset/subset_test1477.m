function subset_test1477 ( )

%*****************************************************************************80
%
%% TEST1477 tests SUBCOMPNZ2_NEXT.
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
  n_lo = 5;
  n_hi = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1477\n' );
  fprintf ( 1, '  SUBCOMPNZ2_NEXT generates subcompositions\n' );
  fprintf ( 1, '  using nonzero parts.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Seek all subcompositions of N\n');
  fprintf ( 1, '  using K = %d nonzero parts\n', k );
  fprintf ( 1, '  for %d <= N <= %d\n', n_lo, n_hi );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     #     N\n' );
  fprintf ( 1, '\n' );

  more = 0;
  a = [];
  count = 0;

  while ( 1 )

    [ a, more ] = subcompnz2_next ( n_lo, n_hi, k, a, more );

    count = count + 1;
    n = sum ( a(1:k) );
    fprintf ( 1, '  %4d  %4d  ', count, n );
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
