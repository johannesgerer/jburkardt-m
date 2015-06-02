function weekday_values_test ( )

%*****************************************************************************80
%
%% WEEKDAY_VALUES_TEST demonstrates the use of WEEKDAY_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEEKDAY_VALUES_TEST:\n' );
  fprintf ( 1, '  WEEKDAY_VALUES stores values of\n' );
  fprintf ( 1, '  the weekday for a given Y/M/D date.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Y     M     D     W\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, y, m, d, w ] = weekday_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %4d  %4d  %4d\n', y, m, d, w );

  end

  return
end
