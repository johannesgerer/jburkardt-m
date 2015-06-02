function fd2d_heat_steady_test01 ( )

%*****************************************************************************80
%
%% FD2D_HEAT_STEADY_TEST01 demonstrates the use of FD2D_HEAT_STEADY.
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

%
%  Specify the spatial grid.
%
  nx = 41;
  ny = 21;
  xvec = linspace ( 0.0, 2.0, nx );
  yvec = linspace ( 0.0, 1.0, ny );

  [ xmat, ymat ] = meshgrid ( xvec, yvec );
%
%  Solve the finite difference approximation to the steady 2D heat equation.
%
  u = fd2d_heat_steady ( nx, ny, xvec, yvec, @d, @f );
%
%  Apparently, my ordering of the nodes is the opposite of MATLAB's.
%  So I have to do a mad set of transposes to get what I want,
%  and at least the picture is correct, although the axes are now
%  left-handed and in the wrong corner and so on...
%
  umat = reshape ( u, nx, ny );
  xmat = xmat';
  ymat = ymat';

  surf ( ymat, xmat, umat );
  xlabel ( '<--- Y --->', 'Fontsize', 16 )
  ylabel ( '<--- X --->', 'Fontsize', 16 )
  zlabel ( '<---U(X,Y)--->', 'Fontsize', 16 )
  title ( 'Solution of steady heat equation', 'Fontsize', 24 )
  filename = 'fd2d_heat_steady_test01.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plotfile saved as "%s".\n', filename );

  return
end
function value = d ( x, y )

%*****************************************************************************80
%
%% D evaluates the heat conductivity coefficient.
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
%    Output, real VALUE, the value of the heat conductivity at (X,Y).
%
  value = 1.0;

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
  value = 0.0;

  return
end
