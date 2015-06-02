function stirling2_values_test ( )

%*****************************************************************************80
%
%% STIRLING2_VALUES_TEST demonstrates the use of STIRLING2_VALUES.
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
  fprintf ( 1, 'STIRLING2_VALUES_TEST:\n' );
  fprintf ( 1, '  STIRLING2_VALUES returns values of \n' );
  fprintf ( 1, '  the Stirling numbers of the second kind.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      N      M        S2\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, m, n, s2 ] = stirling2_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %4d  %10d\n', m, n, s2 );

  end

  return
end
