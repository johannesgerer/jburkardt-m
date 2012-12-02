function test_values_test032 ( )

%*****************************************************************************80
%
%% TEST032 demonstrates the use of BESSEL_YO_INT_VALUES.
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
  fprintf ( 1, 'TEST032:\n' );
  fprintf ( 1, '  BESSEL_Y0_INT_VALUES stores values of \n' );
  fprintf ( 1, '  the integral of the Bessel function Y0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = bessel_y0_int_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end

