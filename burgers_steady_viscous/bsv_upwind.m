function u = bsv_upwind ( a, b, alpha, beta, nu, n, output )

%*****************************************************************************80
%
%% BSV_UPWIND applies Newton's method to a discretized steady viscous Burgers equation.
%
%  Discussion:
%
%    An upwind scheme is used to combat the numerical oscillations that
%    can occur otherwise.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the left and right endpoints.
%
%    Input, real ALPHA, BETA, the Dirichlet boundary values at the left
%    and right.
%
%    Input, real NU, the viscosity.  Normally, 0 < NU.
%
%    Input, integer N, the number of nodes to use between A and B.
%
%    Input, logical OUTPUT, is TRUE if printout is desired.
%
%    Output, real U(N), the computed discretized solution.
%
  if ( n < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BSV_UPWIND - Fatal error!\n' );
    fprintf ( 1, '  N < 2.\n' );
    error ( 'BSV_UPWIND - Fatal error!\n' );
  end
%
%  Set some iteration parameters.
%
  newton_step_max = 50;
  newton_resid_tol = sqrt ( eps );
  newton_step_tol = sqrt ( eps );
%
%  Use equally spaced nodes from A to B.
%
  dx = ( b - a ) / ( n - 1 );
%
%  The initial guess will be the linear interpolant to the boundary conditions.
%
  u = ( linspace ( alpha, beta, n ) )';
%
%  Prepare for the Newton iteration.
%
  J = sparse ( [], [], [], n, n, 3 * n );
  newton_step = 0;

  if ( output )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Step  ||F(U)||\n' );
    fprintf ( 1, '\n' );
  end 

  while ( newton_step <= newton_step_max )

    f(1,1) = u(1) - alpha;

    f(2:n-1,1) = - nu * ( u(3:n) - 2.0 * u(2:n-1) + u(1:n-2) ) / ( dx^2 );
%
%  Massaging the results of FIND can be tedious.
%
    i = find ( 0.0 <= u(2:n-1) );
    i = i + 1;
    j = find ( u(2:n-1) < 0.0 );
    j = j + 1;

    f(i,1) = f(i,1) + 0.5 * ( u(i).^2 - u(i-1).^2 ) / dx;
    f(j,1) = f(j,1) + 0.5 * ( u(j+1).^2 - u(j).^2 ) / dx;

    f(n,1) = u(n) - beta;

    f_norm = norm ( f, inf );

    if ( output )
      fprintf ( 1, '  %4d  %g\n', newton_step, f_norm );
    end

    if ( f_norm < newton_resid_tol ) 
      break
    end
%
%  Define the Jacobian matrix.
%
    J(1,1) = 1.0;
    for i = 2 : n - 1
      if ( 0.0 <= u(i) )
        J(i,i-1) = - u(i-1) / dx        - nu / dx^2;
        J(i,i)   =   u(i)   / dx  + 2.0 * nu / dx^2;
        J(i,i+1) =                      - nu / dx^2;
      else
        J(i,i-1) =                      - nu / dx^2;
        J(i,i)   = - u(i)   / dx  + 2.0 * nu / dx^2;
        J(i,i+1) =   u(i+1) / dx        - nu / dx^2;
      end
    end
    J(n,n) = 1.0;
%
%  Solve the linear system J * du = -f to get the Newton update.
%
    du = J \ f;
    du_norm = norm ( du, inf );

    u_norm = norm ( u, inf );
    if ( du_norm < newton_step_tol * ( u_norm + 1.0 ) )
      break
    end

    u = u - du;
    newton_step = newton_step + 1;

  end

  if ( newton_step_max < newton_step )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BSV_UPWIND - Warning!\n' );
    fprintf ( 1, '  The Newton iteration did not converge.\n' );
  end

  return
end
