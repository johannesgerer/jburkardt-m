function test_values_test034 ( )

%*****************************************************************************80
%
%% TEST034 demonstrates the use of BESSEL_Y1_VALUES.
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
  fprintf ( 1, 'TEST034:\n' );
  fprintf ( 1, '  BESSEL_Y1_VALUES stores values of\n' );
  fprintf ( 1, '  the Bessel Y1 function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            Y1(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = bessel_y1_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
