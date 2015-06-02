function spiral_test01 ( )

%*****************************************************************************80
%
%% SPIRAL_TEST01 generates a field and estimates its range.
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
  fprintf ( 1, 'SPIRAL_TEST01:\n' );
  fprintf ( 1, '  Sample a spiral velocity field and estimate\n' );
  fprintf ( 1, '  the range of the solution values.\n' );

  n = 1000;

  x_lo = 0.0;
  x_hi = 1.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, x_lo, x_hi, seed );
  y_lo = 0.0;
  y_hi = 1.0;
  [ y, seed ] = r8vec_uniform_ab ( n, y_lo, y_hi, seed );

  c = 1.00;

  [ u, v ] = uv_spiral ( n, x, y, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '           Minimum       Maximum\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  U:  %14.6g  %14.6g\n', min ( u ), max ( u ) );
  fprintf ( 1, '  V:  %14.6g  %14.6g\n', min ( v ), max ( v ) );

  return
end

