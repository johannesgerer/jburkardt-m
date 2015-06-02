function spherical_harmonic_test ( )

%*****************************************************************************80
%
%% SPHERICAL_HARMONIC_TEST tests the SPHERICAL_HARMONIC library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERICAL_HARMONIC_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPHERICAL_HARMONIC library.\n' );

  spherical_harmonic_test01 ( );
  spherical_harmonic_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERICAL_HARMONIC_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
