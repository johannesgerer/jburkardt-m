function value = u_d ( u, t )

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
%    Output, VALUE(N), contains the value of the Dirichlet boundary
%    condition at each point.
%
  n = size ( u, 1 );

  value = 0.1 * ( u(:,1) + u(:,2) );

  return
end
