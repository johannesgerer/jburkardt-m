function test_values_test107 ( )

%*****************************************************************************80
%
%% TEST107 demonstrates the use of LOGARITHMIC_INTEGRAL_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST107:\n' );
  fprintf ( 1, '  LOGARITHMIC_INTEGAL_VALUES stores values of\n' );
  fprintf ( 1, '  the logarithmic integral function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            LI(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = logarithmic_integral_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
