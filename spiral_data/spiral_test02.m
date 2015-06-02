function spiral_test02 ( )

%*****************************************************************************80
%
%% SPIRAL_TEST02 generates a field and samples its residuals.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPIRAL_TEST02:\n' );
  fprintf ( 1, '  Sample a spiral velocity field and estimate the\n' );
  fprintf ( 1, '  range of residuals in the continuity equation.\n' );

  n = 1000;

  x_lo = 0.0;
  x_hi = 1.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, x_lo, x_hi, seed );
  y_lo = 0.0;
  y_hi = 1.0;
  [ y, seed ] = r8vec_uniform_ab ( n, y_lo, y_hi, seed );

  c = 1.00;

  pr = resid_spiral ( n, x, y, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '           Minimum       Maximum\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Pr:  %14.6g  %14.6g\n', min ( abs ( pr ) ), max ( abs ( pr ) ) );

  return
end

