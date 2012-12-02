function [ a, b ] = p02_ab ( m )

%*****************************************************************************80
%
%% P02_AB evaluates the limits of the optimization region for problem 02.
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
  a(1:m) = - 5.12;
  b(1:m) = + 5.12;

  return
end
