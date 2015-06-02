function stochastic_heat2d_test ( )

%*****************************************************************************80
%
%% STOCHASTIC_HEAT2D_TEST tests the STOCHASTIC_HEAT2D library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 August 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STOCHASTIC_HEAT2D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the STOCHASTIC_HEAT2D library.\n' );
  
  stochastic_heat2d_test01 ( );
  stochastic_heat2d_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STOCHASTIC_HEAT2D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function stochastic_heat2d_test01 ( )

%*****************************************************************************80
%
%% STOCHASTIC_HEAT2D_TEST01 demonstrates the use of STOCHASTIC_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 August 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STOCHASTIC_HEAT2D_TEST01\n' );
  fprintf ( 1, '  Consider steady heat equation in the unit square,\n' );
  fprintf ( 1, '  with 0 Dirichlet boundary conditions, \n' );
  fprintf ( 1, '  and a heat source term that is a Gaussian centered at (0.60,0.80).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Model the diffusivity coefficient as spatially varying,\n' );
  fprintf ( 1, '  with a stochastic dependence on parameters Omega1 through Omega4,\n' );
  fprintf ( 1, '  as described in Babuska, Nobile, Tempone (BNT).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute a solution for sample values of OMEGA.\n' );
%
%  Specify the spatial grid.
%
  nx = 21;
  ny = 21;
  xvec = linspace ( 0.0, 1.0, nx );
  yvec = linspace ( 0.0, 1.0, ny );

  [ xmat, ymat ] = meshgrid ( xvec, yvec );
%
%  Sample OMEGA:
%
  seed = 123456789;
  [ omega, seed ] = r8vec_normal_01 ( 4, seed );
  omega(1:4) = 2.0 * omega(1:4);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Example omega:  %g  %g  %g  %g\n', omega(1:4) );
%
%  Solve the finite difference approximation to the steady 2D heat equation
%  for this set of OMEGA values.
%
  u = stochastic_heat2d ( omega, nx, ny, xvec, yvec, @f );
%
%  Apparently, my ordering of the nodes is the opposite of MATLAB's.
%  So I have to do a mad set of transposes to get what I want,
%  and at least the picture is correct, although the axes are now
%  left-handed and in the wrong corner and so on...
%
  umat = reshape ( u, nx, ny );
  xmat = xmat';
  ymat = ymat';

  figure ( 1 )
  surf ( ymat, xmat, umat );
  xlabel ( '<--- Y --->', 'Fontsize', 16 )
  ylabel ( '<--- X --->', 'Fontsize', 16 )
  zlabel ( '<---U(X,Y)--->', 'Fontsize', 16 )
  title ( 'Example solution of steady heat equation', 'Fontsize', 24 )
  filename = 'example_solution.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plotfile saved as "%s".\n', filename );

  fprintf ( 1, '  Mean value of example solution is %g\n', mean ( u ) );

  return
end
function stochastic_heat2d_test02 ( )

%*****************************************************************************80
%
%% STOCHASTIC_HEAT2D_TEST02 demonstrates the use of STOCHASTIC_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 August 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STOCHASTIC_HEAT2D_TEST02\n' );
  fprintf ( 1, '  Consider steady heat equation in the unit square,\n' );
  fprintf ( 1, '  with 0 Dirichlet boundary conditions, \n' );
  fprintf ( 1, '  and a heat source term that is a Gaussian centered at (0.60,0.80).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Model the diffusivity coefficient as spatially varying,\n' );
  fprintf ( 1, '  with a stochastic dependence on parameters Omega1 through Omega4,\n' );
  fprintf ( 1, '  as described in Babuska, Nobile, Tempone (BNT).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Fix Omega3 = 4, Omega4 = 0, and\n' );
  fprintf ( 1, '  examine dependence of average temperature on Omega1 and Omega2\n' );
  fprintf ( 1, '  over the range [-10,+10].\n' );
%
%  Specify the spatial grid.
%
  nx = 21;
  ny = 21;
  xvec = linspace ( 0.0, 1.0, nx );
  yvec = linspace ( 0.0, 1.0, ny );

  [ xmat, ymat ] = meshgrid ( xvec, yvec );
%
%  Sample OMEGA:
%  Actually, fix OMEGA(3) and OMEGA(4), preparing to evaluate OMEGA(1)
%  and OMEGA(2) over a grid.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now fix OMEGA(3) and OMEGA(4), and compute U\n' );
  fprintf ( 1, '  for a range of OMEGA(1) and OMEGA(2) values,\n' );
  fprintf ( 1, '  keeping track of mean solution value each time.\n' );

  omega = zeros ( 4, 1 );
  omega1_vec = linspace ( -10.0, +10.0, 21 );
  omega2_vec = linspace ( -10.0, +10.0, 21 );
  [ omega1_mat, omega2_mat ] = meshgrid ( omega1_vec, omega2_vec );
  omega(3) = 4.0;
  omega(4) = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Omega(3) fixed at %g\n', omega(3) );
  fprintf ( 1, '  Omega(4) fixed at %g\n', omega(4) );
%
%  Solve the finite difference approximation to the steady 2D heat equation,
%  and save the mean value of the solution, which is a slightly biased
%  estimate of the heat integral over the unit square.
%
  u_mean_mat = zeros ( 21, 21 );

  for r2 = 1 : 21
    omega(2) = omega2_vec(r2);
    for r1 = 1 : 21
      omega(1) = omega1_vec(r1);
      u = stochastic_heat2d ( omega, nx, ny, xvec, yvec, @f );
      u_mean_mat(r1,r2) = mean ( u );
    end
  end
%
%  Plot the mean value of the solution as a function of Omega(1) and Omega(2).
%
  figure ( 2 )
  surf ( omega1_mat, omega2_mat, u_mean_mat )
  xlabel ( '<-- \omega_1 -->', 'Fontsize', 16 )
  ylabel ( '<-- \omega_2 -->', 'Fontsize', 16 )
  zlabel ( '<-- Mean temperature-->', 'Fontsize', 16 )
  title ( 'Mean temperature as a function of \omega_1, \omega_2', 'Fontsize', 16 )
  filename = 'mean_temperature.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file saved as "%s".\n', filename );
%
%  Print the maximum value of the mean.
%
  u_mean_max = max ( max ( u_mean_mat ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  U_Mean_Max=%10f\n', u_mean_max );

  return
end
function value = f ( x, y )

%*****************************************************************************80
%
%% F evaluates the heat source term.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the evaluation point.
%
%    Output, real VALUE, the value of the heat source term at (X,Y).
%
  v = 0.05;
  arg = ( ( x - 0.60 ).^2 + ( y - 0.80 ).^2 ) / v^2;
  value = 2000.0 * exp ( - arg );

  return
end
