function int_values_test ( )

%*****************************************************************************80
%
%% INT_VALUES_TEST demonstrates the use of INT_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'INT_VALUES_TEST:\n' );
  fprintf ( 1, '  INT_VALUES stores values of the integer part of a real number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           INT(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = int_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
