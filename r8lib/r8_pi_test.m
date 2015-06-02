function r8_pi_test ( )

%*****************************************************************************80
%
%% R8_PI_TEST tests R8_PI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_PI_TEST\n' );
  fprintf ( 1, '  R8_PI returns the value of PI.\n' );
  fprintf ( 1, '\n' );
  v1 = r8_pi ( );
  fprintf ( 1, '  R8_PI =       %24.16f\n', v1 );
  v2 = 4.0 * atan ( 1.0 );
  fprintf ( 1, '  4 * Atan(1) = %24.16f\n', v2 );
  v3 = pi;
  fprintf ( 1, '  PI    =       %24.16f\n', v3 );

  return
end
