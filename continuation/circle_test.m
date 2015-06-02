function circle_test ( )

%*****************************************************************************80
%
%% CIRCLE_TEST applies continuation to the circle problem.
%
%  Discussion:
%
%    Our function is 
%
%      f(x,y) = x^2 + y^2 - 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2014
%
%  Author:
%
%    John Burkardt
%
  step_max = 35;
  step_num = 0;
  xy = zeros ( 2, step_max );
%
%  A: 
%  Choose a starting point,
%  Choose a starting "parameter",
%  Call Newton to try to get starting point to satisfy implicit function
%  while holding parameter fixed.
%
  n = 2;
  x0 = [ 0.5; -2.0 ];
  p0 = 1;
  tol = 1.0E-05;

  fx_norm = max ( abs ( f_circle ( n, x0 ) ) );
  fprintf ( 1, '  %2d  %14.6g  %14.6g  %8.2e\n', 0, x0(1), x0(2), fx_norm );

  [ status, x2 ] = newton ( n, x0, p0, @f_circle, @fp_circle, tol );

  step_num = step_num + 1;

  xy(1:2,step_num) = x2(1:2,1);
  fx_norm = max ( abs ( f_circle ( n, x2 ) ) );
  fprintf ( 1, '  %2d  %14.6g  %14.6g  %8.2e\n', step_num, x2(1), x2(2), fx_norm );
%
%  B:
%  X0 <= X2.
%  Take a step from the current point X0.
%
  x0 = x2;
  t0 = zeros ( n, 1 );
  h = 0.15;
 
  for step_num = 2 : step_max

    [ status, x2, t2, p2 ] = step ( n, x0, t0, p0, @f_circle, @fp_circle, h, tol );

    if ( status ~= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  STEP failed!\n' );
      break
    end

    xy(1:2,step_num) = x2(1:2,1);
    fx_norm = max ( abs ( f_circle ( n, x2 ) ) );
    fprintf ( 1, '  %2d  %14.6g  %14.6g  %8.2e\n', step_num, x2(1), x2(2), fx_norm );

    if ( p0 ~= p2 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Switching parameters from %d to %d\n', p0, p2 );
      p0 = p2;
    end

    x0 = x2;
    t0 = t2;

  end
%
%  Plot the points.
%
  plot ( xy(1,:), xy(2,:), 'r.-', 'Markersize', 25 );
  grid on
  axis equal
  xlabel ( '<--- X --->', 'Fontsize', 16 );
  ylabel ( '<--- Y --->', 'Fontsize', 16 );
  title ( 'Points on the circle, by the continuation method.', 'Fontsize', 24 );

  filename = 'circle_test.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file saved as "%s"\n', filename );

  return
end

