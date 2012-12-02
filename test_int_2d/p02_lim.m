function [ a, b ] = p02_lim ( )

%*****************************************************************************80
%
%% P02_LIM returns the integration limits for problem 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(2), B(2), the lower and upper limits of integration.
%
  a(1:2) = -1.0;
  b(1:2) =  1.0;

  return
end
