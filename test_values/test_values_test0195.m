function test_values_test0195 ( )

%*****************************************************************************80
%
%% TEST0195 demonstrates the use of BESSEL_I1_SPHERICAL_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0195:\n' );
  fprintf ( 1, '  BESSEL_I1_SPHERICAL_VALUES stores values of\n' );
  fprintf ( 1, '  the i1 spherical Bessel function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = bessel_i1_spherical_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
