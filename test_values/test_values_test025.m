function test_values_test025 ( )

%*****************************************************************************80
%
%% TEST025 demonstrates the use of BESSEL_J1_SPHERICAL_VALUES.
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
  fprintf ( 1, 'TEST025:\n' );
  fprintf ( 1, '  BESSEL_J1_SPHERICAL_VALUES stores values of\n' );
  fprintf ( 1, '  the j1 spherical Bessel function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = bessel_j1_spherical_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
