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
%    23 February 2004
%
%  Parameters:
%
%    Input, real U(N,M), contains the M-dimensional coordinates of N points.
%
%    Output, VALUE(N), contains the value of the right hand side of Laplace's
%    equation at each of the points.
%
  value = ones ( size ( u, 1 ), 1 );

  return
end
