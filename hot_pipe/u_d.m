function value = u_d ( xy, t )

%*****************************************************************************80
%
%% U_D evaluates the Dirichlet boundary conditions.
%
%  Modified:
%
%    06 June 2005
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
%    Input, real XY(N,M), contains the M-dimensional coordinates of N points.
%
%    Output, VALUE(N), contains the value of the Dirichlet boundary
%    condition at each point.
%
  n = size ( xy, 1 );

  value = t * ones ( n, 1 );

  return
end
