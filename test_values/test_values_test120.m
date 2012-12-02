function test_values_test120 ( )

%*****************************************************************************80
%
%% TEST120 demonstrates the use of PRIME_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST120:\n' );
  fprintf ( 1, '  PRIME_VALUES returns values of\n' );
  fprintf ( 1, '  the prime function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '           N          P[N]\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, p ] = prime_values ( n_data );

    if ( n_data == 0 )
      break;
    end

    fprintf ( 1, '%12d  %12d\n', n, p );

  end

  return
end
