function bessel_y0_values_test ( )

%*****************************************************************************80
%
%% BESSEL_Y0_VALUES_TEST demonstrates the use of BESSEL_Y0_VALUES.
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
  fprintf ( 1, 'BESSEL_Y0_VALUES_TEST:\n' );
  fprintf ( 1, '  BESSEL_Y0_VALUES stores values of\n' );
  fprintf ( 1, '  the Bessel Y0 function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            Y0(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = bessel_y0_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
