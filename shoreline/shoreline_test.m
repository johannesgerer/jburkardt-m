function shoreline_test ( )

%*****************************************************************************80
%
%% SHORELINE_TEST tests the SHORELINE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHORELINE_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SHORELINE library.\n' );

  circle_centered_test ( );
  circle_offcenter_test ( );
  ellipse_centered_test ( );
  ellipse_slanted_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHORELINE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function circle_centered_test ( )

%*****************************************************************************80
%
%% CIRCLE_CENTERED_TEST uses a circle centered at the origin.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2012
%
%  Author:
%
%    John Burkardt
%
  global c
  global r

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_CENTERED_TEST\n' );
%
%  C = [0,0],  R = 1.
%
  c = [ 0.0, 0.0 ];
  r = 1.0;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r^2 / 4.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R = %f, C = [%f,%f], Area = %f\n', r, c(1:2), area );
  shoreline ( @circle, m, n, x_min, x_max, y_min, y_max, step_num );
%
%  C = [0,0],  R = 1/2.
%
  c = [ 0.0, 0.0 ];
  r = 0.5;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r^2 / 4.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R = %f, C = [%f,%f], Area = %f\n', r, c(1:2), area );
  shoreline ( @circle, m, n, x_min, x_max, y_min, y_max, step_num );
%
%  C = [0,0],  R = 1/4.
%
  c = [ 0.0, 0.0 ];
  r = 0.25;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r^2 / 4.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R = %f, C = [%f,%f], Area = %f\n', r, c(1:2), area );
  shoreline ( @circle, m, n, x_min, x_max, y_min, y_max, step_num );
%
%  C = [0,0],  R = 1/8.
%
  c = [ 0.0, 0.0 ];
  r = 0.125;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r^2 / 4.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R = %f, C = [%f,%f], Area = %f\n', r, c(1:2), area );
  shoreline ( @circle, m, n, x_min, x_max, y_min, y_max, step_num );

  return
end
function circle_offcenter_test ( )

%*****************************************************************************80
%
%% CIRCLE_OFFCENTER_TEST uses a circle not centered at the origin.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2012
%
%  Author:
%
%    John Burkardt
%
  global c
  global r

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_OFFCENTER_TEST\n' );
%
%  C = [-1,0],  R = 1/2.
%
  c = [-1.0, 0.0 ];
  r = 0.50;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r^2 / 2.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R = %f, C = [%f,%f], Area = %f\n', r, c(1), c(2), area );
  shoreline ( @circle, m, n, x_min, x_max, y_min, y_max, step_num );
%
%  C = [0.5,0.5],  R = 1/4.
%
  c = [ 0.0, 0.0 ];
  r = 0.5;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r^2;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R = %f, C = [%f,%f], Area = %f\n', r, c(1:2), area );
  shoreline ( @circle, m, n, x_min, x_max, y_min, y_max, step_num );
%
%  C = [0.75,0.50],  R = 1/4.
%
  c = [ 0.75, 0.50 ];
  r = 0.25;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r^2;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R = %f, C = [%f,%f], Area = %f\n', r, c(1:2), area );
  shoreline ( @circle, m, n, x_min, x_max, y_min, y_max, step_num );

  shoreline ( @circle, m, n, x_min, x_max, y_min, y_max, step_num );
%
%  C = [1.0,1.0],  R = 1/2.
%
  c = [ 1.0, 1.0 ];
  r = 0.50;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r^2 / 4.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R = %f, C = [%f,%f], Area = %f\n', r, c(1:2), area );
  shoreline ( @circle, m, n, x_min, x_max, y_min, y_max, step_num );

  return
end
function ellipse_centered_test ( )

%*****************************************************************************80
%
%% ELLIPSE_CENTERED_TEST uses an ellipse centered at the origin.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2012
%
%  Author:
%
%    John Burkardt
%
  global angle
  global c
  global r1
  global r2

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELLIPSE_CENTERED_TEST\n' );
%
%  Angle = 0.0, C = [0,0],  R1 = 0.75, R2 = 0.50;
%
  angle = 0.0;
  c = [ 0.0, 0.0 ];
  r1 = 0.75;
  r2 = 0.50;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r1 * r2;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Angle = %f, R = [%f,%f], C = [%f,%f], Area = %f\n', ...
    angle, r1, r2, c(1:2), area );
  shoreline ( @ellipse, m, n, x_min, x_max, y_min, y_max, step_num );
%
%  Angle = 0.0, C = [0,0],  R1 = 0.75, R2 = 0.25
%
  angle = 0.0;
  c = [ 0.0, 0.0 ];
  r1 = 0.75;
  r2 = 0.25;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r1 * r2;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Angle = %f, R = [%f,%f], C = [%f,%f], Area = %f\n', ...
    angle, r1, r2, c(1:2), area );
  shoreline ( @ellipse, m, n, x_min, x_max, y_min, y_max, step_num );
%
%  Angle = 0.0, C = [0,0],  R1 = 0.75, R2 = 0.125
%
  angle = 0.0;
  c = [ 0.0, 0.0 ];
  r1 = 0.75;
  r2 = 0.125;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r1 * r2;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Angle = %f, R = [%f,%f], C = [%f,%f], Area = %f\n', ...
    angle, r1, r2, c(1:2), area );
  shoreline ( @ellipse, m, n, x_min, x_max, y_min, y_max, step_num );
%
%  Angle = 0.0, C = [0,0],  R1 = 0.75, R2 = 0.0625
%
  angle = 0.0;
  c = [ 0.0, 0.0 ];
  r1 = 0.75;
  r2 = 0.0625;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r1 * r2;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Angle = %f, R = [%f,%f], C = [%f,%f], Area = %f\n', ...
    angle, r1, r2, c(1:2), area );
  shoreline ( @ellipse, m, n, x_min, x_max, y_min, y_max, step_num );

  return
end
function ellipse_slanted_test ( )

%*****************************************************************************80
%
%% ELLIPSE_SLANTED_TEST uses a slanted ellipse centered at the origin.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2012
%
%  Author:
%
%    John Burkardt
%
  global angle
  global c
  global r1
  global r2

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELLIPSE_SLANTED_TEST\n' );
%
%  ANGLE = 0.0, C = [0,0],  R1 = 0.75, R2 = 0.25.
%
  angle = 0.0 * ( pi / 180.0 );
  c = [ 0.0, 0.0 ];
  r1 = 0.75;
  r2 = 0.25;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r1 * r2;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Angle = %f, R = [%f,%f], C = [%f,%f], Area = %f\n', ...
    angle, r1, r2, c(1:2), area );
  shoreline ( @ellipse, m, n, x_min, x_max, y_min, y_max, step_num );
%
%  ANGLE = 30, C = [0,0],  R1 = 0.75, R2 = 0.25
%
  angle = 30.0 * ( pi / 180.0 );
  c = [ 0.0, 0.0 ];
  r1 = 0.75;
  r2 = 0.25;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r1 * r2;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Angle = %f, R = [%f,%f], C = [%f,%f], Area = %f\n', ...
    angle, r1, r2, c(1:2), area );
  shoreline ( @ellipse, m, n, x_min, x_max, y_min, y_max, step_num );
%
%  ANGLE = 45, C = [0,0],  R1 = 0.75, R2 = 0.125
%
  angle = 45.0 * ( pi / 180.0 );
  c = [ 0.0, 0.0 ];
  r1 = 0.75;
  r2 = 0.25;
  m = 11;
  n = 11;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;
  step_num = 4;

  area = pi * r1 * r2;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Angle = %f, R = [%f,%f], C = [%f,%f], Area = %f\n', ...
    angle, r1, r2, c(1:2), area );
  shoreline ( @ellipse, m, n, x_min, x_max, y_min, y_max, step_num );

  return
end
