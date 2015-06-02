function bessel_ix_values_test ( )

%*****************************************************************************80
%
%% BESSEL_IX_VALUES_TEST demonstrates the use of BESSEL_IX_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BESSEL_IX_VALUES_TEST:\n' );
  fprintf ( 1, '  BESSEL_IX_VALUES stores values of \n' );
  fprintf ( 1, '  the Bessel In function for NONINTEGER order.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X            IN(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = bessel_ix_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16e\n', n, x, fx );

  end

  return
end
