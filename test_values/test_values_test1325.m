function test_values_test1325 ( )

%*****************************************************************************80
%
%% TEST1325 demonstrates the use of SPHERICAL_HARMONIC_VALUES.
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
  fprintf ( 1, 'TEST1325:\n' );
  fprintf ( 1, '  SPHERICAL_HARMONIC_VALUES stores values of\n' );
  fprintf ( 1, '  the spherical harmonic function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   L   M    THETA   PHI               YR                YI\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, l, m, theta, phi, yr, yi ] = spherical_harmonic_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %2d  %2d  %8f  %8f  %24.16f  %24.16f\n', ...
      l, m, theta, phi, yr, yi );

  end

  return
end
