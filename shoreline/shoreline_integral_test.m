function shoreline_integral_test ( )

%*****************************************************************************80
%
%% SHORELINE_INTEGRAL_TEST tests SHORELINE for integration.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 January 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHORELINE_INTEGRAL_TEST:\n' );
  fprintf ( 1, '  Test the SHORELINE library by estimating the region\n' );
  fprintf ( 1, '  where 0 <= F(X,Y) and then integrating a Gaussian there.\n' );

  m = 11;
  n = 11;
  circle_centered_integral_test ( m, n );
  m = 21;
  n = 21;
  circle_centered_integral_test ( m, n );
  m = 11;
  n = 11;
  circle_offcenter_integral_test ( m, n );
  m = 21;
  n = 21;
  circle_offcenter_integral_test ( m, n );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHORELINE_INTEGRAL_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function circle_centered_integral_test ( m, n )

%*****************************************************************************80
%
%% CIRCLE_CENTERED_INTEGRAL_TEST uses a circle centered at the origin.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2012
%
%  Author:
%
%    John Burkardt
%
  global c
  global r

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_CENTERED_INTEGRAL_TEST\n' );
%
%  C = [0,0],  R = 1/4.
%
  c = [ 0.0, 0.0 ];
  r = 0.25;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;

  area = pi * r^2 / 4.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R = %f, C = [%f,%f], Area = %f\n', r, c(1:2), area );

  for step_num = 1 : 5

    [ x, t ] = shoreline ( @circle, m, n, x_min, x_max, y_min, y_max, step_num );

    [ two, x_num ] = size ( x );
    [ three, t_num ] = size ( t );

    fx = circular_normal_pdf ( x, [0.0,0.0], 1.0 );

    q = triangulation_quad ( x_num, x, t_num, t, fx );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Q = %g\n', q );

  end

  return
end
function circle_offcenter_integral_test ( m, n )

%*****************************************************************************80
%
%% CIRCLE_OFFCENTER_INTEGRAL_TEST uses an offcenter circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2012
%
%  Author:
%
%    John Burkardt
%
  global c
  global r

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_OFFCENTER_INTEGRAL_TEST\n' );
%
%  C = [0.75,0.50],  R = 1/4.
%
  c = [ 0.75, 0.50 ];
  r = 0.25;
  x_min = -1.0;
  x_max = +1.0;
  y_min = -1.0;
  y_max = +1.0;

  area = pi * r^2 / 4.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R = %f, C = [%f,%f], Area = %f\n', r, c(1:2), area );

  for step_num = 1 : 5

    [ x, t ] = shoreline ( @circle, m, n, x_min, x_max, y_min, y_max, step_num );

    [ two, x_num ] = size ( x );
    [ three, t_num ] = size ( t );

    fx = circular_normal_pdf ( x, [0.0,0.0], 1.0 );

    q = triangulation_quad ( x_num, x, t_num, t, fx );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Q = %g\n', q );

  end

  return
end
