function collatz_count_test ( )

%*****************************************************************************80
%
%% COLLATZ_COUNT_TEST tests COLLATZ_COUNT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_COUNT_TEST:\n' );
  fprintf ( 1, '  COLLATZ_COUNT(N) counts the length of the\n' );
  fprintf ( 1, '  Collatz sequence beginning with N.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N       COUNT(N)     COUNT(N)\n' );
  fprintf ( 1, '              (computed)    (table)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, count ] = collatz_count_values ( n_data );

    if ( n_data == 0 )
      break
    end

    count2 = collatz_count ( n );

    fprintf ( 1, '  %8d  %8d  %8d\n', n, count, count2 );

  end

  return
end
