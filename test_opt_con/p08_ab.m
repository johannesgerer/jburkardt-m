function [ a, b ] = p08_ab ( m )

%*****************************************************************************80
%
%% P08_AB returns bounds for problem 8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Output, real A(M,1), B(M,1), lower and upper bounds.
%
  a(1:m,1) = 0.0;
  b(1:m,1) = 10.0;

  return
end
