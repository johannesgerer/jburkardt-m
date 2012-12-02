function [ a, b ] = p06_ab ( m )

%*****************************************************************************80
%
%% P06_AB returns bounds for problem 6.
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
%  Reference:
%
%    Harald Niederreiter, Kevin McCurley,
%    Optimization of functions by quasi-random search methods,
%    Computing,
%    Volume 22, Number 2, 1979, pages 119-123.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Output, real A(M,1), B(M,1), lower and upper bounds.
%
  a(1:m,1) = 0.0;
  b(1:m,1) = 1.0;

  return
end
