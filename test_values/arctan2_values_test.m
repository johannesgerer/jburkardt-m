function arctan2_values_test ( )

%*****************************************************************************80
%
%% ARCTAN2_VALUES_TEST demonstrates the use of ARCTAN2_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ARCTAN2_VALUES_TEST:\n' );
  fprintf ( 1, '  ARCTAN2_VALUES stores values of \n' );
  fprintf ( 1, '  the arc tangent function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           Y            F\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, y, f ] = arctan2_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16f\n', x, y, f );

  end

  return
end
