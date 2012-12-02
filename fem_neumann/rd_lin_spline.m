function [ T, W ] = rd_lin_spline ( w0, t_array, n, c_array )

%*****************************************************************************80
%
%% RD_LIN_SPLINE discretizes and solves a 1D reaction diffusion problem.
%
%  Discussion:
%
%    The problem includes homogeneous Neumann boundary conditions at both ends.
%
%    The dynamics are given by the following reaction/diffusion equation
%    for the function W(T,X):
%
%      W_t = W_xx + NL(W,c),
%
%    where NL(W,c) is a polynomial in W:
%
%       NL(W,c) = c(1) + c(2) * W + c(3) * W^2 + c(4) * W^3
%
%    with Neumann boundary conditions at X = 0.0 and X = 1.0:
%
%      W_x(T,0.0) = 0.0
%      W_x(T,1.0) = 0.0
%
%    and initial condition at T = 0.0:
%
%      W(0,X) = sin ( pi * X ).
%
%    The problem is to be solved for 0.0 <= T <= 4.0, 0.0 <= X <= 1.0.
%
%    We use a finite element approximation with piecewise linear "hat" 
%    functions. The resulting ODE model is:
%
%      M * w-dot(t) = - K * w(t) + NL(w, c)
%
%    where M is the mass matrix, K the stiffness matrix, and NL the nonlinear
%    term.
%
%      NL(w, c_array)=c_array(1)+ c_array(2)*w + c_array(3)*w^2 + c_array(4)*w^3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 April 2011
%
%  Author:
%
%   Eugene Cliff
%
%  Reference:
%
%    Jeffrey Borggaard, John Burkardt, John Burns, Eugene Cliff,
%    Working Notes on a Reaction Diffusion Model: a Finite Element Formulation.
%
%  Parameters:
%
%    w0     - handle to initial function (on [0, 1])
%
%    t_array- array of times for output
%
%    n      - grid  parameter ( > 2)
%
%    c_array- coefficients in nonlinear term
%

%
%  Assemble the mass matrix.
%
    M = spdiags([ones(n+1,1) [2;4*ones(n-1,1);2] ones(n+1,1)], ...
                                                 [-1 0 1], n+1, n+1)/(6*n);
%
%  Assemble the stiff matrix.
%
    K = n*spdiags([-ones(n+1,1) [1;2*ones(n-1,1);1] -ones(n+1,1)], ...
                                                 [-1 0 1], n+1, n+1);
%
%  Set the initial condition.
%
   wr  = zeros(n+1,1);
   h_wr = @(x) w0(x).*basic_hat(n*x );
   wr(1) = quad(h_wr, 0, 1/n);                    % < w_0, \phi_1 >
   h_wr = @(x) w0(x).*basic_hat(n*x - n);
   wr(n+1) = quad(h_wr, (n-1)/n, 1);              % < w_0, \phi_n+1 >
   for jj=2:n
      h_wr = @(x) w0(x).*basic_hat(n*x + 1 - jj);
      wr(jj) = quad(h_wr, (jj-2)/n, jj/n);        % < w_0, \phi_i >
   end
   
   w_0 = M \ wr;
   
   ODE_opt = odeset('Mass', M);                  % constant mass matrix
   h_rhs = @(t, w) -K*w  + NL(w, c_array, n, M); % handle for rhs function
   
   [T, W] = ode15s(h_rhs, t_array, w_0, ODE_opt);% invoke ODE solver

  return
end
function val = NL (w, c, n, M )

%*****************************************************************************80
%
%% NL evaluates the nonlinear term in the reaction-diffusion equation.
%
      val = (c(1)/n)* [1; 2*ones(n-1,1); 1] ... % constant
          +  c(2) * M * w     ...               % linear
          +  c(3) * Nq(w, n)  ...               % quadratic
          +  c(4) * Nc(w, n) ;                  % cubic

  return
end
function val = Nq(w, n)

%*****************************************************************************80
%
%% NQ evaluates a quadratic nonlinear finite element function.
%
     w2 = w(:).^2; wx = (w(1:end-1,1)+ w(2:end,1)).^2;
     
     val = [2*w2(1)+wx(1); wx(1:end-1)+4*w2(2:end-1)+wx(2:end) ; ...
                                                 wx(end)+2*w2(end)]/(12*n);

  return
end    
function val = Nc(w, n)                                                    

%*****************************************************************************80
%
%% NC evaluates a cubiic nonlinear finite element function.
%
     w2 = w(:).*w(:); w3 = w(:).*w2(:); wx = (w(1:end-1,1)+w(2:end,1)).^3;
     
     val = [3*w3(1)+wx(1)-w(1)*w(2)^2;  
   wx(1:end-1)+6*w3(2:end-1)+wx(2:end)-w(2:end-1).*(w2(1:end-2)+w2(3:end)); 
                               wx(end)+3*w3(end)-w(end)*w(end-1)^2]/(20*n);

  return
end
