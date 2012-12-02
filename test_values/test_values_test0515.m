function test_values_test0515 ( )

%*****************************************************************************80
%
%% TEST0515 demonstrates the use of COLLATZ_COUNT_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0515:\n' );
  fprintf ( 1, '  COLLATZ_COUNT_VALUES returns values of\n' );
  fprintf ( 1, '  the length of the Collatz sequence that\n' );
  fprintf ( 1, '  starts at N.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         N      COLLATZ_COUNT(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, count ] = collatz_count_values ( n_data );

    if ( n_data == 0 )
      break
    end 

    fprintf ( 1, '  %8d  %8d\n', n, count );

  end

  return
end
