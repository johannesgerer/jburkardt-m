function [] = optimal_control_adjoint_mc_driver ( )

%*****************************************************************************80
%
%% OPTIMAL_CONTROL_ADJOINT_MC_DRIVER: driver for the 1D optimal control problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 December 2007
%
%  Author:
%
%    Jeff Borggaard, Catalin Trenchea, Clayton Webster
%
%  Local Parameters:
%
%    Local, integer E_CONN(N_ELEMENT,NEL_DOF), the indices of the nodes
%    in the elements.
%
%    Local, integer E_CONNB(1,NEL_DOF), the indices of the nodes in the
%    master element.
%
%    Local, integer ELEMENTS_MESH, the number of elements or subintervals
%    into which the region is divided.
%
%    Local, integer ITER_MAX, the maximum number of gradient iterations.
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
  elements_mesh = 15;

  variable.element = 'continuous_quadratic';

  iter_MAX = 100;

  x_l  = 0;
  x_r  = 1;
%
%  Geometry Module
%===============================
%
  if ( strcmp ( variable.element, 'continuous_linear' ) )

    xb(:,1)      = [x_l; x_r];
    e_connb(1,:) = [1 2];
    rho(1)       = elements_mesh;

  elseif ( strcmp ( variable.element, 'continuous_quadratic' ) )

    xb(:,1)      = [x_l; .5*(x_l+x_r); x_r];
    e_connb(1,:) = [1 2 3];
    rho(1)       = elements_mesh;

  elseif ( strcmp ( variable.element, 'continuous_cubic' ) )

    xb(:,1)      = [x_l; (x_l+x_r)/3; 2*(x_l+x_r)/3; x_r];
    e_connb(1,:) = [1 2 3 4];
    rho(1)       = elements_mesh;

  end

  [ x, e_conn, index_u, index_c ] = oned_mesh ( xb, e_connb, rho );
%
%  MC Stochastic Module
%===============================
%
  %global PI;
  PI = 3.1415926535897;
%
%  Set the endpoints for the N random dimensions.
%
  a = 0;
  b = 1;
%
%  Dimensions of the random space.
%
  N = 1;
%
%  The number of samples for the Monte Carlo calculation.
%
  M = 10;
%
%  The one-dimensional probability density function for uniforms
%
  rho = 1;
%
%  The correlation length of the random variables,
%
  L = N;
%
%  Get the Monte Carlo points and weights.
%
  [ w, y ] = monte_carlo ( N, M  );
%
%  Move the points to the interval [A,B].
%
  for m = 1 : M
    y(:, m) = a + ( b - a ) .* y(:,m);
  end
%
%  Expected value of the functions to be matched.
%  ===============================
%
  [n_nodes, dim] = size(x);

  E_J = zeros(n_nodes, 2);
  E_grad =  zeros(n_nodes, 2);
  E_u =  zeros(n_nodes, 2);
  E_q = zeros(n_nodes, 2);

  [ E_u_hat, E_q_exact ] = exact_expected_value ( x, N, N, L );

% keyboard

%
%  The stochastic loop
%  ===================
%
  for k = 1 : M

    %initial guess
    q = zeros( n_nodes, 1 );
    for n=1:N
      q = q + cos((n*PI*x)/L) .* y(n,k);
    end
%
%  Solve the optimal control for the initial guess
%
    [J,grad,u] = optimal_control(x,e_conn,q, y(:,k), y(:,k), N, N, L);

    E_J(:,1) = E_J(:,1) + J * w(k);
    E_grad(:,1) = E_grad(:,1) + grad * w(k);
    E_u(:,1) = E_u(:,1) + u * w(k);
    E_q(:,1) = E_q(:,1) + q * w(k);

    fprintf('Initial cost functional for iteration k=%d is J=%g\n',k,J);

    %Plotting the realization at a particular y(k) - for the initial guess
    figure(1)
    plot(x,u_hat(x, y(:,k), N, L),'r+')
    hold on
    plot(x,u)
    hold off
    title(' Initial guess u against u(y(k))')

    figure(2)
    plot(x,q_exact(x, y(:,k), N, L),'r+')
    hold on
    plot(x,q)
    hold off
    title(' Initial value of q(y(k))')
    %pause

    if ( k == M )

      %Plotting the Expected value at the initial guess
      %fprintf(' Initial expected value of the cost functional is E[J]=%g\n'E_J(:,1));
      %pause

      figure(5)
      plot(x,E_u_hat,'r+')
      hold on
      plot(x,E_u(:,1))
      hold off
      title(' Initial guess E[u] against E[uhat]')

      figure(6)
      plot(x,E_q(:,1))
      hold on
      plot(x,E_q_exact ,'r+')
      hold off
      title(' Initial expected value of q')
      %pause
    end
%
%  The gradient iteration loop
%  ===========================
%
    epsilon = 0.000000000000001;   %  set tolerance
    J_old = J;
    q_old = q;
    u_old = u;
    grad_old = grad;
    delta_q = 0.001;    % length of the gradient vector
    fprintf('  Initial step size deltaq=%g\n',delta_q);

    for i = 1 : iter_MAX

      q_new = q_old - delta_q * grad_old;

      [ J_new, grad_new, u_new] = optimal_control ( x, e_conn, q_new, ...
        y(:,k), y(:,k), N, N, L );

      fprintf('At iteration %d,  the cost funcational J=%g\n',i,J_new);
      fprintf('  Decide whether to accept step:\n');
      fprintf('  1. If cost functional decreases, INCREASE step size by %g\n',1/2);
      fprintf('  2. If cost functional increases, DECREASE stepsize by %g\n',1/2);

      if ( J_new > J_old )   % cost functional increasing
        delta_q = delta_q * .5;
        fprintf('  Cost functional increasing, so we do not accept iteration...\n');
        fprintf('  Now cutting deltaq in half to %g\n',delta_q);
      else
        fprintf('  The cost functional decreases:\n');
        cost_diff = abs(J_new - J_old)/abs(J_new);
        fprintf('  The normalized difference in successive costs is %g\n',cost_diff);
%
%  Plotting the realization at a particular y(k) - for the initial guess
%
        %figure(1)
        %plot(x,u_hat(x, y(:,k), N, L),'r+')
        %hold on
        %plot(x,u_new)
        %hold off
        %title(' Current realization of u against u(y(k))')

        %figure(2)
        %plot(x,q_exact(x, y(:,k), N, L),'r+')
        %hold on
        %plot(x,q_new)
        %hold off
        %title(' Current realiztion of q(y(k))')
        %pause

        if ( cost_diff <= epsilon )

          fprintf('  Gradient iteration has converged at iteration %d\n',i);
%
%  Plotting the final realization at a particular y(k) - for this initial guess
%
          figure(3)
          plot(x,u_hat(x, y(:,k), N, L),'g+')
          hold on
          plot(x,u_new)
          hold off
          title(' Final realization of u against u(y(k))')

          figure(4)
          plot(x,q_exact(x, y(:,k), N, L),'g+')
          hold on
          plot(x,q_new)
          hold off
          title(' Final realiztion of q(y(k))')
          %pause

          break;
                % gradient iteration converged !!!
        else
          delta_q = delta_q * 1.5;

          fprintf('  Accept step (cost decreased), set deltaq to %g\n', delta_q);

          J_old = J_new;
          q_old = q_new;
          u_old = u_new;
          grad_old = grad_new;

        end

      end

    end
%
%  Compute the expected value at the final realization;
%
    E_J(:, 2) = E_J(:, 2) + J_new * w(k) ;
    E_grad(:, 2) = E_grad(:, 2) + grad_new * w(k);
    E_u(:, 2) = E_u(:,2) + u_new * w(k);
    E_q(:, 2) = E_q(:,2) + q_new * w(k);

    if ( k == M )
      %Plotting the Expected value at the final realization
      figure(7)
      plot(x, E_u_hat,'g+')
      hold on
      plot(x,E_u(:, 2))
      hold off
      title('  Target function uhat against E[u] at final iteration')

      figure(8)
      plot(x,E_q(:, 2))
      hold on
      plot(x,E_q_exact,'g+')
      hold off
      title('  Expected Parameter E[q] at final iteration')
    end

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'OPTIMAL_CONTROL_ADJOINT_MC_DRIVER:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
