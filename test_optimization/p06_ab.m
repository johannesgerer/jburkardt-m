function [ a, b ] = p06_ab ( m )

%*****************************************************************************80
%
%% P06_AB evaluates the limits of the optimization region for problem 06.
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
  a(1:m) = - 500.0;
  b(1:m) = + 500.0;

  return
end
