function value = u_init ( xy, t )

%*****************************************************************************80
%
%% U_INIT sets the initial condition for the state variable.
%
%  Discussion:
%
%    The user must supply the appropriate routine for a given problem
%
%    In many problems, the initial time is 0.  However, the value of
%    T is passed, in case the user wishes to use this same routine to
%    evaluate, for instance, the exact solution.
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
%    N is probably the total number of points, and M is probably 2.
%
%    Input, real T, the initial time.  
%
%    Output, VALUE(N), contains the value of the solution U(X,Y,T).
%
  n = size ( xy, 1 );

  value = zeros ( n, 1 );

  return
end
