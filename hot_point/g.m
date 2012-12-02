function value = g ( u, t )

%*****************************************************************************80
%
%% G evaluates the outward normal values assigned at Neumann boundary conditions.
%
%  Discussion:
%
%    This routine must be changed by the user to reflect a particular problem.
%
%    For this particular problem, we want to set the value of G(X,Y,T) to 1
%    if X is 1, and to 0 otherwise.
%
%  Modified:
%
%    26 February 2004
%
%  Author:
%
%    Jochen Alberty, Carsten Carstensen, Stefan Funken.
%
%  Reference:
%
%    Jochen Alberty, Carsten Carstensen, Stefan Funken,
%    Remarks Around 50 Lines of MATLAB:
%    Short Finite Element Implementation,
%    Numerical Algorithms,
%    Volume 20, pages 117-137, 1999.
%
%  Parameters:
%
%    Input, real U(N,M), contains the M-dimensional coordinates of N points.
%
%    Input, real T, the current time.
%
%    Output, VALUE(N), contains the value of the outward normal at each point
%    where a Neumann boundary condition is applied.
%
  n = size ( u, 1 );

  value = zeros ( n, 1 );

  return
end
