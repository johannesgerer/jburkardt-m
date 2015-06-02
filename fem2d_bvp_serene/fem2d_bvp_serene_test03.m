function fem2d_bvp_serene_test03 ( )

%*****************************************************************************80
%
%% FEM2D_BVP_SERENE_TEST03 carries out test case #3.
%
%  Discussion:
%
%    Use A3, C3, F3, EXACT3, EXACT_UX3, EXACT_UY3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2014
%
%  Author:
%
%    John Burkardt
%
  nx = 5;
  ny = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_BVP_SERENE_TEST03\n' );
  fprintf ( 1, '  Solve - del ( A del U ) + C U = F \n' );
  fprintf ( 1, '  on the unit square with zero boundary conditions.\n' );
  fprintf ( 1, '  A1(X,Y) = 0.0\n' );
  fprintf ( 1, '  C1(X,Y) = 1.0\n' );
  fprintf ( 1, '  F1(X,Y) = X * ( 1 - X ) * Y * ( 1 - Y ).\n' );
  fprintf ( 1, '  U1(X,Y) = X * ( 1 - X ) * Y * ( 1 - Y )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This example is contrived so that the system matrix\n' );
  fprintf ( 1, '  is the WATHEN matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The grid uses %d by %d nodes.\n', nx, ny );
  node_num = fem2d_bvp_serene_node_num ( nx, ny );
  fprintf ( 1, '  The number of nodes is %d\n', node_num );
%
%  Geometry definitions.
%
  x = linspace ( 0.0, 1.0, nx );
  y = linspace ( 0.0, 1.0, ny );

  show11 = 1;

  u = fem2d_bvp_serene ( nx, ny, @a3, @c3, @f3, x, y, show11 );

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
        uexact = exact3 ( x(i), y(j) );
        fprintf ( 1, '  %4d  %4d  %8f  %8f  %8f  %8f  %8e\n', ...
          i, j, x(i), y(j), u(k), uexact, abs ( u(k) - uexact ) );
      end
    end

  end

  e1 = fem2d_l1_error_serene ( nx, ny, x, y, u, @exact3 );
  e2 = fem2d_l2_error_serene ( nx, ny, x, y, u, @exact3 );
  h1s = fem2d_h1s_error_serene ( nx, ny, x, y, u, @exact_ux3, @exact_uy3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  l1 error   = %g\n', e1 );
  fprintf ( 1, '  L2 error   = %g\n', e2 );
  fprintf ( 1, '  H1S error  = %g\n', h1s );
%
%  Pull out the Wathen matrix from MATLAB.
%  It will have been multiplied by a random scale factor.
%  While my numbering scheme is
%    3  2  1
%    4     8
%    5  6  7
%  the numbering scheme used here is 
%    1  2  3
%    4     5
%    6  7  8
%    
%
  A = gallery ( 'wathen', 1, 1 );
  A = full ( A );
  s = 0.5 * A(1,3);
  A = A / s;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  WATHEN Matrix from "gallery(''wathen'',1,1)"\n' );
  fprintf ( 1, '\n' );
  i = [3,2,1,4,6,7,8,5];
  A(i,i)

  return
end
function value = a3 ( x, y )

%*****************************************************************************80
%
%% A3 evaluates A function #3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2014
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
  value = 0.0;

  return
end
function value = c3 ( x, y )

%*****************************************************************************80
%
%% C3 evaluates C function #3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2014
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
  value = 1.0;

  return
end
function value = exact3 ( x, y )

%*****************************************************************************80
%
%% EXACT3 evaluates exact solution #3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2014
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
function value = exact_ux3 ( x, y )

%*****************************************************************************80
%
%% EXACT_UX3 evaluates the derivative dUdX of exact solution #3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2014
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
function value = exact_uy3 ( x, y )

%*****************************************************************************80
%
%% EXACT_UY3 evaluates the derivative dUdY of exact solution #3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2014
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
function value = f3 ( x, y )

%*****************************************************************************80
%
%% F3 evaluates right hand side function #3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 June 2014
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
  value = x .* ( 1.0 - x ) .* y .* ( 1.0 - y );

  return
end

