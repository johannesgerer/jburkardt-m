function test_values_test029 ( )

%*****************************************************************************80
%
%% TEST029 demonstrates the use of BESSEL_K1_VALUES.
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
  fprintf ( 1, 'TEST029:\n' );
  fprintf ( 1, '  BESSEL_K1_VALUES stores values of\n' );
  fprintf ( 1, '  the Bessel K1 function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            K1(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = bessel_k1_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
