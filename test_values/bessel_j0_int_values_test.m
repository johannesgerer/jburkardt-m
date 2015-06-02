function bessel_j0_int_values_test ( )

%*****************************************************************************80
%
%% BESSEL_J0_INT_VALUES_TEST demonstrates the use of BESSEL_JO_INT_VALUES.
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
  fprintf ( 1, 'BESSEL_J0_INT_VALUES_TEST:\n' );
  fprintf ( 1, '  BESSEL_J0_INT_VALUES stores values of \n' );
  fprintf ( 1, '  the integral of the Bessel function J0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = bessel_j0_int_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
