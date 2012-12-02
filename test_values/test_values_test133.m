function test_values_test133 ( )

%*****************************************************************************80
%
%% TEST133 demonstrates the use of STIRLING1_VALUES.
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
  fprintf ( 1, 'TEST133:\n' );
  fprintf ( 1, '  STIRLING1_VALUES returns values of \n' );
  fprintf ( 1, '  the Stirling numbers of the first kind.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      N      M        S1\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, m, n, s1 ] = stirling1_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %4d  %10d\n', m, n, s1 );

  end

  return
end
