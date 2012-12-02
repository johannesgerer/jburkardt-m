function [ J, grad, u ] = optimal_control ( x, e_conn, q, y1, y2, Md, Nd, L )

%*****************************************************************************80
%
%% OPTIMAL_CONTROL is a script to solve the optimal control problem.
%
%  Discussion:
%
%    The differential equation being solved has the form:
%
%      ( q(x) u_x(x) )_x = f(x)
%
%    The solution is approxiamted using 1D linear finite elements.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Parameters:
%
%    Input, X
%
%    Input, E_CONN
%
%    Input, Q
%
%    Input, Y1
%
%    Input, Y2
%
%    Input, MD
%
%    Input, ND
%
%    Input, L
%
%    Output, J
%
%    Output, GRAD
%
%    Output, U
%
  alpha = 0.000003;

  [n_nodes   , n_dimensions] = size(x     );
  [n_elements, nel_dof     ] = size(e_conn);

  n_equations      = n_nodes-2;
  ide(1)           = -1;
  ide(2:n_nodes-1) = 1:n_equations;
  ide(n_nodes)     = -2;

  dir              = zeros(2,1);

  n_gauss          = 3;  % number of points used in Gaussian integration


% q = x./(1-3*x.^2);
% q = x.^3;
% q = x.*(1-x);
%---------------------------------------------------------------------
%  Build the finite element matrices
%---------------------------------------------------------------------

  M = sparse(n_nodes    ,n_nodes    );
  K = sparse(n_equations,n_equations);
  b = zeros (n_equations,1          );
  u = zeros (n_nodes    ,1          );

  [r,w] = oned_gauss(n_gauss);

  o_g   = ones(size(r));

  for n_el=1:n_elements

    % compute value of each test function and their spatial derivaties
    % at the integration points
    nodes_local       = e_conn(n_el,:);
    x_local           = x(nodes_local,:);
    [x_g,w_g,phi,p_x] = oned_shape(x_local,r,w);

    q_local           = q(nodes_local);
    q_g               = phi*q_local;

    % compute the value of functions at the Gauss points
    f_g   = f_function(x_g, y1, y2, Md, Nd, L);

    %--------------------------------------------------------------------
    %  Integrate the weak form of the equations (element contributions)
    %--------------------------------------------------------------------
    M_loc = oned_bilinear(o_g, phi, phi, w_g);
    K_loc =-oned_bilinear(q_g, p_x, p_x, w_g);
    b_loc = oned_f_int   (f_g, phi,      w_g);

    %-----------------------------------------------------------------
    % Assemble contributions into the global system matrix
    %-----------------------------------------------------------------

    M(nodes_local,nodes_local) = M(nodes_local,nodes_local) + M_loc;

    for n_t=1:nel_dof
      n_test = ide(nodes_local(n_t));
      if (n_test > 0)  % this is an unknown, fill the row
        for n_u=1:nel_dof
          n_unk = ide(nodes_local(n_u));
          if (n_unk > 0)
            K(n_test,n_unk) = K(n_test,n_unk) + K_loc(n_t,n_u);
          end
        end
        b(n_test) = b(n_test) + b_loc(n_t);
      end
    end

  end

  %-----------------------------------------------------------------------
  %  Perform Implicit Solve
  %-----------------------------------------------------------------------
%  figure(5); spy(A);  % view the sparsity pattern in A

  du = K\b;

  %-----------------------------------------------------------------------
  %  Construct the Solution (here, we simply apply the Dirichlet bc's)
  %-----------------------------------------------------------------------
  for n=1:n_nodes
    i = ide(n);
    if (i>0)
      %  get the nodal value out of the linear system solve
      u(n) = du(i);
    else
      %  get the nodal value from the specified Dirichlet bc
      u(n) = dir(-i);
    end
  end

%  figure(12)
%  plot(x,u)
%  hold on
%  up = u_hat(x, y);
%  plot(x,up,'r+')

  lam = zeros(n_nodes  ,1);
  c = zeros(n_equations,1);
  %   Compute the right hand side of the adjoint equation
  for n_el=1:n_elements

    nodes_local       = e_conn(n_el,:);
    x_local           = x(nodes_local,:);
    [x_g,w_g,phi,p_x] = oned_shape(x_local,r,w);

    u_local           = u(nodes_local);
    u_g               = phi*u_local;

    % compute the value of functions at the Gauss points
    uhat_g   = u_hat(x_g, y1, Md, L);

    %--------------------------------------------------------------------
    %  Integrate the weak form of the equations (element contributions)
    %--------------------------------------------------------------------
    c_loc = oned_f_int   ( uhat_g-u_g, phi,      w_g);

    %-----------------------------------------------------------------
    % Assemble contributions into the global system matrix
    %-----------------------------------------------------------------
    for n_t=1:nel_dof
      n_test = ide(nodes_local(n_t));
      if (n_test > 0)  % this is an unknown, fill the row
        c(n_test) = c(n_test) + c_loc(n_t);
      end
    end

  end

  J = 0.5*sqrt(c'*M(2:end-1,2:end-1)*c);
  dlam = K'\c;

  for n=1:n_nodes
    i = ide(n);
    if (i>0)
      lam(n) = dlam(i);
    else
      lam(n) = dir(-i);
    end
  end

%  figure
%  plot(x,lam)

  grad = zeros(n_nodes,1);

  % Compute the gradient
  for n_el=1:n_elements

    nodes_local       = e_conn(n_el,:);
    x_local           = x(nodes_local,:);
    [x_g,w_g,phi,p_x] = oned_shape(x_local,r,w);

    u_local           = u(nodes_local);
    u_g               = phi*u_local;
    ux_g              = p_x*u_local;

    q_local           = q(nodes_local);
    q_g               = phi*q_local;
    qx_g              = p_x*q_local;

    lam_local         = lam(nodes_local);
    lam_g             = phi*lam_local;
    lamx_g            = p_x*lam_local;

%     grad_loc = alpha*oned_f_int( q_g, phi, w_g) ...
%               - oned_f_int( lamx_g.*ux_g, phi, w_g);
    grad_loc = alpha*oned_f_int( qx_g, p_x, w_g) ...
              - oned_f_int( lamx_g.*ux_g, phi, w_g);

    for n_t=1:nel_dof
      n_test = nodes_local(n_t);
      grad(n_test) = grad(n_test) + grad_loc(n_t);
    end

  end

%  figure
%  plot(x,grad)
%  title('gradient')

  return
end
