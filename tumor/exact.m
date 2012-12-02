function [ u, dudx ] = exact ( x )

%% EXACT is an exact solution used for testing.
%
%  Modified:
%
%    15 June 2006
%
%  Parameters:
%
%    Input, real X, the point at which the exact solution is desired.
%    X may be a vector.
%
%    Output, real U, DUDX, the value of the exact solution and its
%    derivative at X.
%
  u    =       cos ( pi * x );
  dudx = -pi * sin ( pi * x ); 

  return
end
