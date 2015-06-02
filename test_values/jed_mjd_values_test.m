function jed_mjd_values_test ( )

%*****************************************************************************80
%
%% JED_MJD_VALUES_TEST demonstrates the use of JED_MJD_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 September 2004
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JED_MJD_VALUES_TEST:\n' );
  fprintf ( 1, '  JED_MJD_VALUES returns:\n' );
  fprintf ( 1, '  JED, a Julian Ephemeris Date, and\n' );
  fprintf ( 1, '  MJD, the corresponding Modified Julian Day count.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      JED            MJD\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, jed, mjd ] = jed_mjd_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f\n', jed, mjd );

  end

  return
end
