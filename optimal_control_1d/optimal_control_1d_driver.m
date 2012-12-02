function optimal_control_1d_driver ( )

%*****************************************************************************80
%
%% OPTIMAL_CONTROL_1D_DRIVER is the driver for the 1D optimal control problem.
%
%  Discussion:
%
%    We are given a two point boundary value problem:
%
%      d/dx ( q(x) * du(x)/dx ) = f(x)
%
%    over the interval [0,1], with boundary conditions u(0)=u(1)=0,
%    and right hand side function f(x) = - 15*x^4 + 3*x^2 - 6*x.
%
%    Most functions q(x) implicitly define a function u(q)(x) which
%    satisfies the BVP.  (Obviously, q(x)=0 is one choice for which
%    this is NOT true.)
%
%    We suppose that we wish to determine a function q(x) with the
%    property that the corresponding function u(q)(x) is equal to, or
%    close to, some given target function u_hat(x).  In particular,
%    we write
%
%      J(u(q)) = 1/2 sqrt ( integral ( 0 < x < 1 ) ( u(q)(x) - u_hat(x) )^2 dx
%
%    and so our problem becomes:
%
%      Given u_hat(), find q() such that u(q) minimizes J().
%
%    This program seeks a solution of such a problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2011
%
%  Author:
%
%    Jeff Borggaard, John Burkardt, Catalin Trenchea, Clayton Webster
%
%  Local parameters:
%
%    Local, integer E_CONN(N_ELEMENT,NEL_DOF), the indices of the nodes in the elements.
%
%    Local, integer E_CONNB(1,NEL_DOF), the indices of the nodes in the master element.
%
%    Local, integer ELEMENTS_MESH, the number of elements (subintervals)
%    into which the region is divided.
%
%    Local, string VARIABLE.ELEMENT, indicates the kind of element being used.
%    'continuous_linear'
%    'continuous_quadratic'
%    'continuous_cubic'
%
%    Local, real X(N_NODES,1), the nodes of the mesh.
%
%    Local, real XB(NEL_DOF,1), the nodes of the master element.
%
%    Local, real X_L, X_R, the left and right endpoints of the interval.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'OPTIMAL_CONTROL_1D_DRIVER:\n' );
%
%  Define the finite element geometry.
%  Quadratic elements are chosen by default.
%
  x_l = 0.0;
  x_r = 1.0;
  elements_mesh = 15;

  [ x, e_conn ] = geometry_1d ( x_l, x_r, elements_mesh );
%
%  Set an initial guess for Q.
%
  q_new = x + 0.5;   

  [ J_new, grad_new, u_new ] = optimal_control_1d ( x, e_conn, q_new );
  fprintf ( '  Cost functional J(q) = %g\n', J_new );  
%
%  The function to be matched.
%
  u_hat_plot = u_hat ( x );

  q_hat_plot = q_hat ( x );

  graphics ( 0, x, q_new, q_hat_plot, u_new, u_hat_plot ) 
 
  epsilon = 0.00000001;
  J_old = J_new;
  q_old = q_new;
  u_old = u_new;
  grad_old = grad_new;
%
%  DELTA_Q controls the stepsize along the gradient vector.
%
  delta_q = 0.001;
  fprintf ('  Initial gradient vector step size deltaq = %g\n', delta_q );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Step         Delta Q               J         Delta J\n' );
  fprintf ( 1, '\n' );

  for it = 1 : 1000
  
    q_new = q_old - delta_q * grad_old;

    [ J_new, grad_new, u_new ] = optimal_control_1d ( x, e_conn, q_new );

    J_delta = abs ( J_new - J_old ) / abs ( J_new );

    fprintf ( '  %4d  %14g  %14g  %14g\n', it, delta_q, J_new, J_delta );
%
%  Convergence?
%
    if ( J_delta <= epsilon )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'OPTIMAL_CONTROL_1D_DRIVER:\n' );
      fprintf ( '  The gradient iteration has converged at iteration %d\n', it );
      break;
    end
%
%  J did not decrease?
%
    if ( J_old <= J_new )
      delta_q = delta_q * 0.5;
      continue
    end
%
%  J decreased.
%
    delta_q = delta_q * 1.5;

    graphics ( it, x, q_new, q_hat_plot, u_new, u_hat_plot )   

    J_old = J_new;
    q_old = q_new;
    u_old = u_new;
    grad_old = grad_new;
            
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'OPTIMAL_CONTROL_1D_DRIVER:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

