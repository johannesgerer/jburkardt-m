function value = u_d ( u )

%*****************************************************************************80
%
%% U_D evaluates the Dirichlet boundary conditions.
%
%  Discussion:
%
%    The user must supply the appropriate routine for a given problem
%
%  Modified:
%
%    25 February 2004
%
%  Parameters:
%
%    Input, real U(N,M), contains the M-dimensional coordinates of N points.
%
%    Output, VALUE(N), contains the value of the Dirichlet boundary
%    condition at each point.
%
  value = zeros ( size ( u, 1 ), 1 );

  return
end
