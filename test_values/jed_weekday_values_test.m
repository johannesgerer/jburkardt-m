function jed_weekday_values_test ( )

%*****************************************************************************80
%
%% JED_WEEKDAY_VALUES_TEST demonstrates the use of JED_WEEKDAY_VALUES.
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
  weekday_name = [ ...
    'Sunday   '; ... 
    'Monday   '; ...
    'Tuesday  '; ...
    'Wednesday'; ...
    'Thursday '; ...
    'Friday   '; ...
    'Saturday ' ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'JED_WEEKDAY_VALUES_TEST:\n' );
  fprintf ( 1, '  JED_WEEKDAY_VALUES returns Julian Ephemeris Dates\n' );
  fprintf ( 1, '  (JED) and the corresponding weekday\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   JED           #  Weekday\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, jed, weekday ] = jed_weekday_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %1d  %8s\n', jed, weekday, weekday_name(weekday,1:9) );

  end

  return
end
