function value = f ( u )

%*****************************************************************************80
%
%% F evaluates the right hand side of Laplace's equation.
%
%  Discussion:
%
%    This routine must be changed by the user to reflect a particular problem.
%
%  Modified:
%
%    25 February 2004
%
%  Parameters:
%
%    Input, real U(N,M), contains the M-dimensional coordinates of N points.
%
%    Output, VALUE(N), contains the value of the right hand side of Laplace's
%    equation at each of the points.
%
  n = size ( u, 1 );

  value(1:n) = 2.0 * pi * pi * sin ( pi * u(1:n,1) ) .* sin ( pi * u(1:n,2) );

  return
end
