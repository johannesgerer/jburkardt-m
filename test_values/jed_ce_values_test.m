function jed_ce_values_test ( )

%*****************************************************************************80
%
%% JED_CE_VALUES_TEST demonstrates the use of JED_CE_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 March 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JED_CE_VALUES_TEST:\n' );
  fprintf ( 1, '  JED_CE_VALUES returns:\n' );
  fprintf ( 1, '  JED, a Julian Ephemeris Date, and\n' );
  fprintf ( 1, '  YMDF, the corresponding year, month, day, fraction.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        JED          Y   M   D    F\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, jed, y, m, d, f ] = jed_ce_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %6d  %2d  %2d  %6f\n', jed, y, m, d, f );

  end

  return
end
