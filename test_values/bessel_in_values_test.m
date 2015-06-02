function bessel_in_values_test ( )

%*****************************************************************************80
%
%% BESSEL_IN_VALUES_TEST demonstrates the use of BESSEL_IN_VALUES.
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
  fprintf ( 1, 'BESSEL_IN_VALUES_TEST:\n' );
  fprintf ( 1, '  BESSEL_IN_VALUES stores values of \n' );
  fprintf ( 1, '  the Bessel In function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X            IN(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = bessel_in_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6d  %12f  %24.16e\n', n, x, fx );

  end

  return
end
