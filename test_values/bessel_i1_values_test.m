function bessel_i1_values_test ( )

%*****************************************************************************80
%
%% BESSEL_I1_VALUES_TEST demonstrates the use of BESSEL_I1_VALUES.
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
  fprintf ( 1, 'BESSEL_I1_VALUES_TEST:\n' );
  fprintf ( 1, '  BESSEL_I1_VALUES stores values of \n' );
  fprintf ( 1, '  the Bessel I1 function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            I1(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = bessel_i1_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
