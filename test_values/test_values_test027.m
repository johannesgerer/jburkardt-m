function test_values_test027 ( )

%*****************************************************************************80
%
%% TEST027 demonstrates the use of BESSEL_K0_VALUES.
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
  fprintf ( 1, 'TEST027:\n' );
  fprintf ( 1, '  BESSEL_K0_VALUES stores values of \n' );
  fprintf ( 1, '  the Bessel K0 function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            K0(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = bessel_k0_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
