function subset_test1475 ( )

%*****************************************************************************80
%
%% TEST1475 tests SUBCOMP_NEXT.
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
  n = 6;
  k = 3;
  a = [];
  more = 0;
  h = 0;
  t = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1475\n' );
  fprintf ( 1, '  SUBCOMP_NEXT generates subcompositions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Seek all subcompositions of N = %d\n', n );
  fprintf ( 1, '  Into K = %d parts.\n', k );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     #   Sum\n' );
  fprintf ( 1, '\n' );

  index = 0;

  while ( 1 )

    [ a, more, h, t ] = subcomp_next ( n, k, a, more, h, t );

    index = index + 1;
    fprintf ( 1, '  %4d  %4d  ', index, sum ( a(1:k) ) );
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
