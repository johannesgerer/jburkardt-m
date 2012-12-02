function [ x, know ] = p02_sol ( m, know )

%*****************************************************************************80
%
%% P02_SOL returns known solutions for problem 2.
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
    x = [ ...
      0.390500591228663, ...
      0.392051909813608, ...
      0.393601661544812, ...
      0.395149843840982 ]';
  else
    know = 0;
    x = zeros ( m, 1 );
  end

  return
end
