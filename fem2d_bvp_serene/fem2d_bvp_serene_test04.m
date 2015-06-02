function fem2d_bvp_serene_test04 ( )

%*****************************************************************************80
%
%% FEM2D_BVP_SERENE_TEST04 carries out test case #4.
%
%  Discussion:
%
%    Use A4, C4, F4, EXACT4, EXACT_UX4, EXACT_UY4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 June 2014
%
%  Author:
%
%    John Burkardt
%
  nx = 17;
  ny = 17;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_BVP_SERENE_TEST04\n' );
  fprintf ( 1, '  Solve - del ( A del U ) + C U = F \n' );
  fprintf ( 1, '  on the unit square with zero boundary conditions.\n' );
  fprintf ( 1, '  Use FEM2D_BVP_SERENE_EXTEND to "extend" the solution.\n' );
  fprintf ( 1, '  A4(X,Y) = 1.0\n' );
  fprintf ( 1, '  C4(X,Y) = 0.0\n' );
  fprintf ( 1, '  F4(X,Y) = 2*X*(1-X)+2*Y*(1-Y).\n' );
  fprintf ( 1, '  U4(X,Y) = X * ( 1 - X ) * Y * ( 1 - Y )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The grid uses %d by %d nodes.\n', nx, ny );
  node_num = fem2d_bvp_serene_node_num ( nx, ny );
  fprintf ( 1, '  The number of nodes is %d\n', node_num );
%
%  Geometry definitions.
%
  x = linspace ( 0.0, 1.0, nx );
  y = linspace ( 0.0, 1.0, ny );

  show11 = 0;
  u = fem2d_bvp_serene ( nx, ny, @a4, @c4, @f4, x, y, show11 );
%
%  Extend the array so that it is a regular matrix.
%
  uu = fem2d_bvp_serene_extend ( nx, ny, x, y, u );

  if ( nx * ny <= 25 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '     I     J    X         Y         U         Uexact    Error\n' );
    fprintf ( 1, '\n' );

    for j = 1 : ny

      for i = 1 : nx
        uexact = exact4 ( x(i), y(j) );
        fprintf ( 1, '  %4d  %4d  %8f  %8f  %8f  %8f  %8e\n', ...
          i, j, x(i), y(j), uu(i,j), uexact, abs ( uu(i,j) - uexact ) );
      end
    end

  end
%
%  Plot the extended array.
%
  [ X, Y ] = meshgrid ( x, y );

  surf ( X, Y, uu )

  print ( '-dpng', 'fem2d_bvp_serene_test04.png' )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Graphics image saved as "fem2d_bvp_serene_test04.png".\n' );
  

  return
end
function value = a4 ( x, y )

%*****************************************************************************80
%
%% A4 evaluates A function #4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the evaluation point.
%
%    Output, real VALUE, the value of A(X).
%
  value = 1.0;

  return
end
function value = c4 ( x, y )

%*****************************************************************************80
%
%% C4 evaluates C function #4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the evaluation point.
%
%    Output, real VALUE, the value of C(X).
%
  value = 0.0;

  return
end
function value = exact4 ( x, y )

%*****************************************************************************80
%
%% EXACT4 evaluates exact solution #4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the evaluation point.
%
%    Output, real VALUE, the value of the solution.
%
  value = x .* ( 1.0 - x ) .* y .* ( 1.0 - y );

  return
end
function value = exact_ux4 ( x, y )

%*****************************************************************************80
%
%% EXACT_UX4 evaluates the derivative dUdX of exact solution #4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the evaluation point.
%
%    Output, real VALUE, the value of dUdX.
%
  value = ( 1.0 - 2.0 * x ) .* ( y - y .* y );

  return
end
function value = exact_uy4 ( x, y )

%*****************************************************************************80
%
%% EXACT_UY4 evaluates the derivative dUdY of exact solution #4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the evaluation point.
%
%    Output, real VALUE, the value of dUdX.
%
  value = ( x - x .* x ) .* ( 1.0 - 2.0 * y );

  return
end
function value = f4 ( x, y )

%*****************************************************************************80
%
%% F4 evaluates right hand side function #4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the evaluation point.
%
%    Output, real VALUE, the value of the right hand side.
%
  value = 2.0 * x .* ( 1.0 - x ) ...
        + 2.0 * y .* ( 1.0 - y );

  return
end

