function doomsday_test02 ( )

%*****************************************************************************80
%
%% DOOMSDAY_TEST02 tests DOOMSDAY against a number of known values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DOOMSDAY_TEST02\n' );
  fprintf ( 1, '  WEEKDAY_VALUES supplies a list of dates and weekdays.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YYYY  MM  DD  Weekday    Weekday\n' );
  fprintf ( 1, '                Tabulated  Computed\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, y, m, d, w1 ] = weekday_values ( n_data );

    if ( n_data <= 0 )
      break;
    end
%
%  The transition from Julian to Gregorian calendars occurred in 1582
%  (for some people).  The data in "WEEKDAY_VALUES" before the transition
%  is stored in Julian format, which DOOMSDAY_GREGORIAN can't handle.
%  So let's just refuse to handle 1582 or earlier%
%
    if ( y <= 1582 )
      continue;
    end

    w2 = doomsday_gregorian ( y, m, d );

    s1 = weekday_to_name_common ( w1 );
    s2 = weekday_to_name_common ( w2 );

    fprintf ( 1, '  %4d  %2d  %2d  %10s  %10s\n', y, m, d, s1, s2 );

  end

  return
end
