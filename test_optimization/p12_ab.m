function [ a, b ] = p12_ab ( m )

%*****************************************************************************80
%
%% P12_AB evaluates the limits of the optimization region for problem 12.
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
  a(1:m) = 0.0;
  b(1:m) = 1.0;

  return
end
