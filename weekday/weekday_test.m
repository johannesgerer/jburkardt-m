function weekday_test ( )

%*****************************************************************************80
%
%% WEEKDAY_TEST tests the WEEKDAY library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 April 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEEKDAY_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the WEEKDAY library.\n' );

  weekday_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEEKDAY_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function weekday_test01 ( )

%*****************************************************************************80
%
%% WEEKDAY_TEST01 tests YMD_TO_WEEKDAY_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 March 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEEKDAY_TEST01\n' );
  fprintf ( 1, '  For dates in the Common calendar:\n' );
  fprintf ( 1, '  YMD_TO_WEEKDAY_COMMON returns the day of the week.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YMD                   Weekday    Weekday\n' );
  fprintf ( 1, '                        Tabulated  Computed\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, y, m, d, w1 ] = weekday_values ( n_data );

    if ( n_data == 0 )
      break;
    end
 
    s3 = ymd_to_s_common ( y, m, d );
    w2 = ymd_to_weekday_common ( y, m, d );
    s1 = weekday_to_name_common ( w1 );
    s2 = weekday_to_name_common ( w2 );

    fprintf ( 1, '  %20s  %9s  %9s\n', s3, s1, s2 );

  end

  return
end
