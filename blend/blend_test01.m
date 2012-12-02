function test01 ( )

%*****************************************************************************80
%
%% TEST01 checks for a gross error in the blend coefficients.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2008
%
%  Author:
%
%    John Burkardt
%
  nmax = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Simple identity test to detect gross errors.\n' );
%
%  Set N to 1.
%
  n = 1;
%
%  Test BLEND_R_0DN on identity.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Identity test for BLEND_R_0DN:\n' );
  fprintf ( 1, '\n' );
  r = 0.0;
  x = blend_r_0dn ( r, n, @identity_r );
  fprintf ( 1, '  %8f  %8f\n', r, x(1) );

  r = 1.0;
  x = blend_r_0dn ( r, n, @identity_r );
  fprintf ( 1, '  %8f  %8f\n', r, x(1) );

  r = 0.5;
  x = blend_r_0dn ( r, n, @identity_r );
  fprintf ( 1, '  %8f  %8f\n', r, x(1) );
%
%  Set N to 2.
%
  n = 2;
%
%  Test BLEND_RS_0DN on identity.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Identity test for BLEND_RS_0DN:\n' );
  fprintf ( 1, '\n' );
  r = 0.0;
  s = 0.0;
  x = blend_rs_0dn ( r, s, n, @identity_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 1.0;
  s = 0.0;
  x = blend_rs_0dn ( r, s, n, @identity_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 0.0;
  s = 1.0;
  x = blend_rs_0dn ( r, s, n, @identity_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 1.0;
  s = 1.0;
  x = blend_rs_0dn ( r, s, n, @identity_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 0.5;
  s = 0.5;
  x = blend_rs_0dn ( r, s, n, @identity_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );
%
%  Test BLEND_RS_1DN on identity.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Identity test for BLEND_RS_1DN:\n' );
  fprintf ( 1, '\n' );
  r = 0.0;
  s = 0.0;
  x = blend_rs_1dn ( r, s, n, @identity_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 1.0;
  s = 0.0;
  x = blend_rs_1dn ( r, s, n, @identity_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 0.0;
  s = 1.0;
  x = blend_rs_1dn ( r, s, n, @identity_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 1.0;
  s = 1.0;
  x = blend_rs_1dn ( r, s, n, @identity_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 0.5;
  s = 0.5;
  x = blend_rs_1dn ( r, s, n, @identity_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );
%
%  Set N to 3.
%
  n = 3;
%
%  Test BLEND_RST_0DN on identity.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Identity test for BLEND_RST_0DN:\n' );
  fprintf ( 1, '\n' );
  r = 0.0;
  s = 0.0;
  t = 0.0;
  x = blend_rst_0dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 1.0;
  s = 0.0;
  t = 0.0;
  x = blend_rst_0dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.0;
  s = 1.0;
  t = 0.0;
  x = blend_rst_0dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.0;
  s = 0.0;
  t = 1.0;
  x = blend_rst_0dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 1.0;
  s = 1.0;
  t = 1.0;
  x = blend_rst_0dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.5;
  s = 0.5;
  t = 0.5;
  x = blend_rst_0dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );
%
%  Test BLEND_RST_1DN on identity.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Identity test for BLEND_RST_1DN:\n' );
  fprintf ( 1, '\n' );
  r = 0.0;
  s = 0.0;
  t = 0.0;
  x = blend_rst_1dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 1.0;
  s = 0.0;
  t = 0.0;
  x = blend_rst_1dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.0;
  s = 1.0;
  t = 0.0;
  x = blend_rst_1dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.0;
  s = 0.0;
  t = 1.0;
  x = blend_rst_1dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 1.0;
  s = 1.0;
  t = 1.0;
  x = blend_rst_1dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.5;
  s = 0.5;
  t = 0.5;
  x = blend_rst_1dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );
%
%  Test BLEND_RST_2DN on identity.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Identity test for BLEND_RST_2DN:\n' );
  fprintf ( 1, '\n' );
  r = 0.0;
  s = 0.0;
  t = 0.0;
  x = blend_rst_2dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 1.0;
  s = 0.0;
  t = 0.0;
  x = blend_rst_2dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.0;
  s = 1.0;
  t = 0.0;
  x = blend_rst_2dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.0;
  s = 0.0;
  t = 1.0;
  x = blend_rst_2dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 1.0;
  s = 1.0;
  t = 1.0;
  x = blend_rst_2dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.5;
  s = 0.5;
  t = 0.5;
  x = blend_rst_2dn ( r, s, t, n, @identity_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  return
end
