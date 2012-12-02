function [ a, b ] = p01_ab ( m )

%*****************************************************************************80
%
%% P01_AB evaluates the limits of the optimization region for problem 01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Output, real A(M), B(M), the lower and upper bounds.
%
  a(1:m) = - 5.0;
  b(1:m) = + 5.0;

  return
end
