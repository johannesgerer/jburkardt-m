function test_values_test088 ( )

%*****************************************************************************80
%
%% TEST088 demonstrates the use of FACTORIAL_RISING_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST088:\n' );
  fprintf ( 1, '  FACTORIAL_RISING_VALUES returns some exact values\n' );
  fprintf ( 1, '  of the Pochhammer symbol:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     M     N      Pochhammer(M,N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, m, n, fmn ] = factorial_rising_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %4d  %10d\n', m, n, fmn );

  end

  return
end
