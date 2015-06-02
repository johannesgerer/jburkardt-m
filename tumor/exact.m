function [ u, dudx ] = exact ( x )

%*****************************************************************************80
%
%% EXACT is an exact solution used for testing.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
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
