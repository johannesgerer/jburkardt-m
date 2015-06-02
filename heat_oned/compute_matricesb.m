function [ A, B, M ] = compute_matricesb ( x, e_conn, mu, h, ide, n_gauss, ...
  n_equations )

%*****************************************************************************80
%
%% COMPUTE_MATRICESB computes finite element matrices for the heat equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2012
%
%  Author:
%
%    Jeff Borggaard
%
%  Parameters:
%
%    Input, real X(), the coordinates of the nodes.
%
%    Input, integer E_CONN(N_ELEMENTS,NEL_DOF), the element connectivity matrix.
%
%    Input, real MU, the viscosity parameter.
%
%    Input, real H, the heat transfer coefficient.
%
%    Input, integer IDE(N_NODE), labels that identify the index of the
%    unknown or control variable at each node.
%
%    Input, integer N_GAUSS, the number of Gauss points.
%
%    Input, integer N_EQUATIONS, the number of equations.
%
%    Output, sparse real A(N_EQUATIONS,EQUATIONS), the A matrix
%    corresponding to M dxdt = Ax + Bu.
%
%    Output, real B(N_EQUATIONS,2), the B matrix
%    corresponding to M dxdt = Ax + Bu.
%
%    Output, sparse real M(N_EQUATIONS,N_EQUATIONS), the mass matrix
%    corresponding to M dxdt = Ax + Bu.
%
  [ n_elements, nel_dof ] = size ( e_conn );
    
  [ rr, wt ] = oned_gauss ( n_gauss );
  one = ones ( size ( rr ) );
  
  A = sparse(n_equations,n_equations);
  B = zeros (n_equations,          2);
  M = sparse(n_equations,n_equations);
%
%  Compute value of each test function and their spatial derivatives
%  at the integration points.
%
  for n_el=1:n_elements

    nodes_local        = e_conn(n_el,:);
    x_local            = x(nodes_local,:);
    [x_g,wt_g,phi,p_x] = oned_shape(x_local,rr,wt);
%
%  Integrate the weak form of the equations.
%
    A_loc = - mu * oned_bilinear( one , p_x , p_x, wt_g);
    
    M_loc =   oned_bilinear( one, phi  , phi, wt_g);
%
%  Assemble the contributions to global matrices
%
    for n_t=1:nel_dof

      n_test = ide(nodes_local(n_t));
%
%  If N_T corresponds to an unknown, set this row.
%
      if (n_test > 0)     
        for n_u=1:nel_dof
%
%  If N_UNK corresponds to an unknown, set this column.
%
          n_unk = ide(nodes_local(n_u));
          if (n_unk > 0)  % this "j" corresponds to an unknown...
            A(n_test,n_unk) = A(n_test,n_unk) + A_loc(n_t,n_u);
            M(n_test,n_unk) = M(n_test,n_unk) + M_loc(n_t,n_u);
          end
        end
        
      end
    end
    
  end
%    
%  From the first element
%
  nodes_local       = e_conn(1,:);
  x_local           = x(nodes_local,:);
  [x_g,w_g,phi,p_x] = oned_shape(x_local,[-1],[1]); 
  B(1:length(p_x')-1,1) = mu*p_x(2:end)';
%  
%  From the last element
%
  nodes_local       = e_conn(end,:);
  x_local           = x(nodes_local,:);
  [x_g,w_g,phi,p_x] = oned_shape(x_local,[1],[1]);
  B(end-length(p_x')+2:end,2) =-mu*p_x(1:end-1)';
  
  return
end
