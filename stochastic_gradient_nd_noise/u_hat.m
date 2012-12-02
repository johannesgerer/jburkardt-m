function u = u_hat ( x, y, Md, L )

%*****************************************************************************80
%
%% UHAT is the exact target function to be matched.
%
%  Discussion:
%
%    UHAT is the function which exactly solves the system
%
%      d/dx ( q(x) d/dx u(x) ) = f(x)
%
%    and the corresponding boundary conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Parameters:
%		
%    Input, real X(N_NODES,DIM), the spatial coordinates of points.
%
%    Input, real Y(Md), the stochastic vector.
%
%    Input, integer MD, the dimension of the probability space.
%
%    Input, real L, the correlation length of the random variables.
%
%    Output, U(N_NODES), the target function.
%  
  [ n_nodes, dim ] = size ( x );

  u = zeros ( n_nodes, 1 );

  for m = 1 : Md

  	u = u + um( m ) .* cm( x, m, L ) .*  pm( y, m );
  	
  end  
  
  return
end
function p_m = pm ( y, m )

%*****************************************************************************80
%
%% PM ?
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
  p_m = y(m);
 
  return
end
function c_m = cm ( x, m, L )

%*****************************************************************************80
%
%% CM ?
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
  c_m = sin ( ( m * pi * x ) / L );
  
end
function u_m = um ( m )

%*****************************************************************************80
%
%% UM ?
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
  u_m = 1;

  return 
end
