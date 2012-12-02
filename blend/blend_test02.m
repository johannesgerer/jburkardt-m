function blend_test02 ( )

%*****************************************************************************80
%
%% BLEND_TEST02 checks for simple errors in the blend coefficients.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2008
%
%  Author:
%
%    John Burkardt
%
  nmax = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLEND_TEST02\n' );
  fprintf ( 1, '  Shift and stretch test to detect simple errors.\n' );
%
%  Set N to 1.
%
  n = 1;
%
%  Test BLEND_R_0DN on shift by 1, stretch by 2.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Shift and stretch test for BLEND_R_0DN:\n' );
  fprintf ( 1, '\n' );
  r = 0.0;
  x = blend_r_0dn ( r, n, @stretch_r );
  fprintf ( 1, '  %8f  %8f\n', r, x(1) );

  r = 1.0;
  x = blend_r_0dn ( r, n, @stretch_r );
  fprintf ( 1, '  %8f  %8f\n', r, x(1) );

  r = 0.5;
  x = blend_r_0dn ( r, n, @stretch_r );
  fprintf ( 1, '  %8f  %8f\n', r, x(1) );
%
%  Set N to 2.
%
  n = 2;
%
%  Test BLEND_RS_0DN on shift by (1,2), stretch by (3,4).
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Shift and stretch test for BLEND_RS_0DN:\n' );
  fprintf ( 1, '\n' );
  r = 0.0;
  s = 0.0;
  x = blend_rs_0dn ( r, s, n, @stretch_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 1.0;
  s = 0.0;
  x = blend_rs_0dn ( r, s, n, @stretch_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 0.0;
  s = 1.0;
  x = blend_rs_0dn ( r, s, n, @stretch_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 1.0;
  s = 1.0;
  x = blend_rs_0dn ( r, s, n, @stretch_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 0.5;
  s = 0.5;
  x = blend_rs_0dn ( r, s, n, @stretch_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );
%
%  Test BLEND_RS_1D on shift by (1,2), stretch by (3,4).
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Shift and stretch test for BLEND_RS_1DN:\n' );
  fprintf ( 1, '\n' );
  r = 0.0;
  s = 0.0;
  x = blend_rs_1dn ( r, s, n, @stretch_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 1.0;
  s = 0.0;
  x = blend_rs_1dn ( r, s, n, @stretch_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 0.0;
  s = 1.0;
  x = blend_rs_1dn ( r, s, n, @stretch_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 1.0;
  s = 1.0;
  x = blend_rs_1dn ( r, s, n, @stretch_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );

  r = 0.5;
  s = 0.5;
  x = blend_rs_1dn ( r, s, n, @stretch_rs );
  fprintf ( 1, '  %8f  %8f  %8f  %8f\n', r, s, x(1:2) );
%
%  Set N to 3.
%
  n = 3;
%
%  Test BLEND_RST_0DN on shift by (1,2,3), stretch by (4,5,6).
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Shift and stretch test for BLEND_RST_0DN:\n' );
  fprintf ( 1, '\n' );
  r = 0.0;
  s = 0.0;
  t = 0.0;
  x = blend_rst_0dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 1.0;
  s = 0.0;
  t = 0.0;
  x = blend_rst_0dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.0;
  s = 1.0;
  t = 0.0;
  x = blend_rst_0dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.0;
  s = 0.0;
  t = 1.0;
  x = blend_rst_0dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 1.0;
  s = 1.0;
  t = 1.0;
  x = blend_rst_0dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.5;
  s = 0.5;
  t = 0.5;
  x = blend_rst_0dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );
%
%  Test BLEND_RST_1DN on shift by (1,2,3), stretch by (4,5,6).
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Shift and stretch test for BLEND_RST_1DN:\n' );
  fprintf ( 1, '\n' );
  r = 0.0;
  s = 0.0;
  t = 0.0;
  x = blend_rst_1dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 1.0;
  s = 0.0;
  t = 0.0;
  x = blend_rst_1dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.0;
  s = 1.0;
  t = 0.0;
  x = blend_rst_1dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.0;
  s = 0.0;
  t = 1.0;
  x = blend_rst_1dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 1.0;
  s = 1.0;
  t = 1.0;
  x = blend_rst_1dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.5;
  s = 0.5;
  t = 0.5;
  x = blend_rst_1dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );
%
%  Test BLEND_RST_2DN on shift by (1,2,3), stretch by (4,5,6).
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Shift and stretch test for BLEND_RST_2DN:\n' );
  fprintf ( 1, '\n' );
  r = 0.0;
  s = 0.0;
  t = 0.0;
  x = blend_rst_2dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 1.0;
  s = 0.0;
  t = 0.0;
  x = blend_rst_2dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.0;
  s = 1.0;
  t = 0.0;
  x = blend_rst_2dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.0;
  s = 0.0;
  t = 1.0;
  x = blend_rst_2dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 1.0;
  s = 1.0;
  t = 1.0;
  x = blend_rst_2dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  r = 0.5;
  s = 0.5;
  t = 0.5;
  x = blend_rst_2dn ( r, s, t, n, @stretch_rst );
  fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', r, s, t, x(1:3) );

  return
end
