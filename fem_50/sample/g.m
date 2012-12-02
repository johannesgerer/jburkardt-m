function value = g ( u )

%*****************************************************************************80
%
%% G evaluates the outward normal values assigned at Neumann boundary conditions.
%
%  Discussion:
%
%    This routine must be changed by the user to reflect a particular problem.
%
%  Modified:
%
%    23 February 2004
%
%  Parameters:
%
%    Input, real U(N,M), contains the M-dimensional coordinates of N points.
%
%    Output, VALUE(N), contains the value of outward normal at each point
%    where a Neumann boundary condition is applied.
%
  value = zeros ( size ( u, 1 ), 1 );

  return
end
