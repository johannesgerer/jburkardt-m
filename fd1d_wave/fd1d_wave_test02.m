function fd1d_wave_test02 ( )

%*****************************************************************************80
%
%% FD1D_WAVE_TEST02 tests the FD1D finite difference wave computation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2012
%
%  Author:
%
%    John Burkardt
%
  x_num = 16;
  x1 = 0.0;
  x2 = 1.5;
  x_vec = linspace ( x1, x2, x_num );

  t_num = 41;
  t1 = 0.0;
  t2 = 4.0;
%
%  Changing T2 to 4.5 is enough to push the algorithm into instability.
%
%  t2 = 4.5;
%
  t_vec = linspace ( t1, t2, t_num );
  t_delta = ( t2 - t1 ) / ( t_num - 1 );

  c = 1.0;
  alpha = fd1d_wave_alpha ( x_num, x1, x2, t_num, t1, t2, c );

  u = zeros ( t_num, x_num );
%
%  Load the initial condition.
%
  u1(1:x_num) = u_t1_02 ( x_num, x_vec );
  u(1,1:x_num) = u1(1:x_num);
%
%  Take the first step.
%
  t = t_vec(2);
  u2(1:x_num) = fd1d_wave_start ( x_num, x_vec, t, t_delta, alpha, @u_x1_02, ...
    @u_x2_02, @ut_t1_02, u1 );
  u(2,1:x_num) = u2(1:x_num);
%
%  Take all the other steps.
%
  for i = 3 : t_num
    t = t_vec(i);
    u3(1:x_num) = fd1d_wave_step ( x_num, t, alpha, @u_x1_02, @u_x2_02, u1, u2 );
    u(i,1:x_num) = u3(1:x_num);
    u1(1:x_num) = u2(1:x_num);
    u2(1:x_num) = u3(1:x_num);
  end

  u_min = min ( min ( u ) );
  u_max = max ( max ( u ) );
%
%  Plot the solution as it evolves in time.
%
  x = linspace ( x1, x2, x_num );
  for t = 1 : t_num
    time = ( ( t_num - t ) * t1 + ( t - 1 ) * t2 ) / ( t_num - 1 );
    plot ( x(1:x_num), u(t,1:x_num), 'b*- ' )
    grid on
    axis ( [ x1, x2, u_min-1.0, u_max+1.0 ] );
    title ( sprintf ( 'Step %d, Time %f\n', t - 1, time ) )
    xlabel ( '<-- X -->' )
    ylabel ( 'Vertical displacement' )
    pause
  end
%
%  Plot the entire solution as a surface.
%
  if ( 1 )

    t_vec = linspace ( t1, t2, t_num );
    x_vec = linspace ( x1, x2, x_num );
    
    [ T, X ] = meshgrid ( t_vec, x_vec );

    surfl ( T', X', u )

    axis ( [ t1, t2, x1, x2, u_min, u_max ] );
    xlabel ( '<-- T -->' );
    ylabel ( '<-- X -->' );
    zlabel ( 'Vertical displacement' );
    title ( 'Solution U(T,X)' );

  end
%
%  Write the solution to a file.
%
  r8mat_write ( 'test02_plot.txt', t_num, x_num, u );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot data written to "test02_plot.txt".\n' );

  return
end
function u = u_x1_02 ( t )

%*****************************************************************************80
%
%% U_X1_02 evaluates U at the boundary X1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T, the time.
%
%    Output, real U, the value of U(T,X1).
%
  u = 0.0;

  return
end
function u = u_x2_02 ( t )

%*****************************************************************************80
%
%% U_X2_02 evaluates U at the boundary X2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T, the time.
%
%    Output, real U, the value of U(T,X2).
%
  u = 0.0;

  return
end
function u = u_t1_02 ( x_num, x_vec )

%*****************************************************************************80
%
%% U_T1_02 evaluates U at the initial time T1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X_NUM, the number of nodes.
%
%    Input, real X_VEC(X_NUM), the spatial node coordinates.
%
%    Output, real U(1,X_NUM), the value of U at the initial time,
%    and every node.
%
  u = zeros(1,x_num);
  u(1,1:x_num) = sin ( 2 * pi * x_vec );

  return
end
function ut = ut_t1_02 ( x_num, x_vec )

%*****************************************************************************80
%
%% UT_T1_02 evaluates dUdT at the initial time T1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X_NUM, the number of nodes.
%
%    Input, real X_VEC(X_NUM), the spatial node coordinates.
%
%    Output, real UT(1,X_NUM), the value of dU/dt at the initial time,
%    and every node.
%
  ut = zeros(1,x_num);

  return
end
