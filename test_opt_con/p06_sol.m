function [ x, know ] = p06_sol ( m, know )

%*****************************************************************************80
%
%% P06_SOL returns known solutions for problem 6.
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
%    Input/output, integer KNOW.
%    On input, KNOW is 0, or the index of the previously returned solution.
%    On output, KNOW is 0 if there are no more solutions, or it is the
%    index of the next solution.
%
%    Output, real X(M), the solution.
%
  if ( know == 0 )
    know = 1;
    x(1:m,1) = [ ...
      0.509282516910744, ...
      0.509282516910744, ...
      0.509282516910746, ...
      0.509282516910744 ]';
  else
    know = 0;
    x = zeros ( m, 1 );
  end

  return
end
