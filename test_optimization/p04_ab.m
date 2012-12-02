function [ a, b ] = p04_ab ( m )

%*****************************************************************************80
%
%% P04_AB evaluates the limits of the optimization region for problem 04.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Marcin Molga, Czeslaw Smutnicki,
%    Test functions for optimization needs.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Output, real A(M), B(M), the lower and upper bounds.
%
  a(1:m) = - 2.048;
  b(1:m) = + 2.048;

  return
end
