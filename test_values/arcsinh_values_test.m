function arcsinh_values_test ( )

%*****************************************************************************80
%
%% ARCSINH_VALUES_TEST demonstrates the use of ARCSINH_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ARCSINH_VALUES_TEST:\n' );
  fprintf ( 1, '  ARCSINH_VALUES stores values of \n' );
  fprintf ( 1, '  the hyperbolic arc sine function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = arcsinh_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
