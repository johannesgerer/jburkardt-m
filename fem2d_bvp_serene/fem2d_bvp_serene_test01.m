function fem2d_bvp_serene_test01 ( )

%*****************************************************************************80
%
%% FEM2D_BVP_SERENE_TEST01 carries out test case #1.
%
%  Discussion:
%
%    Use A1, C1, F1, EXACT1, EXACT_UX1, EXACT_UY1.
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
  nx = 5;
  ny = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_BVP_SERENE_TEST01\n' );
  fprintf ( 1, '  Solve - del ( A del U ) + C U = F \n' );
  fprintf ( 1, '  on the unit square with zero boundary conditions.\n' );
  fprintf ( 1, '  A1(X,Y) = 1.0\n' );
  fprintf ( 1, '  C1(X,Y) = 0.0\n' );
  fprintf ( 1, '  F1(X,Y) = 2*X*(1-X)+2*Y*(1-Y).\n' );
  fprintf ( 1, '  U1(X,Y) = X * ( 1 - X ) * Y * ( 1 - Y )\n' );
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
  u = fem2d_bvp_serene ( nx, ny, @a1, @c1, @f1, x, y, show11 );

  if ( nx * ny <= 25 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '     I     J    X         Y         U         Uexact    Error\n' );
    fprintf ( 1, '\n' );

    k = 0;

    for j = 1 : ny

      if ( mod ( j, 2 ) == 1 )
        inc = 1;
      else
        inc = 2;
      end

      for i = 1 : inc : nx
        k = k + 1;
        uexact = exact1 ( x(i), y(j) );
        fprintf ( 1, '  %4d  %4d  %8f  %8f  %8f  %8f  %8e\n', ...
          i, j, x(i), y(j), u(k), uexact, abs ( u(k) - uexact ) );
      end
    end

  end

  e1 = fem2d_l1_error_serene ( nx, ny, x, y, u, @exact1 );
  e2 = fem2d_l2_error_serene ( nx, ny, x, y, u, @exact1 );
  h1s = fem2d_h1s_error_serene ( nx, ny, x, y, u, @exact_ux1, @exact_uy1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  l1 error   = %g\n', e1 );
  fprintf ( 1, '  L2 error   = %g\n', e2 );
  fprintf ( 1, '  H1S error  = %g\n', h1s );

  return
end
function value = a1 ( x, y )

%*****************************************************************************80
%
%% A1 evaluates A function #1.
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
function value = c1 ( x, y )

%*****************************************************************************80
%
%% C1 evaluates C function #1.
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
function value = exact1 ( x, y )

%*****************************************************************************80
%
%% EXACT1 evaluates exact solution #1.
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
function value = exact_ux1 ( x, y )

%*****************************************************************************80
%
%% EXACT_UX1 evaluates the derivative dUdX of exact solution #1.
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
function value = exact_uy1 ( x, y )

%*****************************************************************************80
%
%% EXACT_UY1 evaluates the derivative dUdY of exact solution #1.
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
function value = f1 ( x, y )

%*****************************************************************************80
%
%% F1 evaluates right hand side function #1.
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

