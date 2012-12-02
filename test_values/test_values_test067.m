function test_values_test067 ( )

%*****************************************************************************80
%
%% TEST067 demonstrates the use of EULER_NUMBER_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST067:\n' );
  fprintf ( 1, '  EULER_NUMBER_VALUES returns values of\n' );
  fprintf ( 1, '  the Euler numbers.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N        EULER_NUMBER(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = euler_number_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %10d\n', n, c );

  end

  return
end
