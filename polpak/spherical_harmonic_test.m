function spherical_harmonic_test ( )

%*****************************************************************************80
%
%% SPHERICAL_HARMONIC_TEST tests SPHERICAL_HARMONIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERICAL_HARMONIC_TEST:\n' );
  fprintf ( 1, '  SPHERICAL_HARMONIC evaluates the\n' );
  fprintf ( 1, '  spherical harmonic function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      L       M    THETA   PHI   YR   YI\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, l, m, theta, phi, yr, yi ] = spherical_harmonic_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ c, s ] = spherical_harmonic ( l, m, theta, phi );

    fprintf ( 1, '  %6d  %6d  %6f  %6f  %12f  %12f\n', ...
      l, m, theta, phi, yr, yi );
    fprintf ( 1, '                                      %12f  %12f\n', ...
      c(l+1), s(l+1) );

  end

  return
end
