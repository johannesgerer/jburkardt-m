function title = p03_title ( )

%*****************************************************************************80
%
%% P03_TITLE returns a title for problem 3.
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
%    Output, string TITLE, a title for the problem.
%
  title = 'f(x) = -1000 * product(x) * exp(-x(1)-2x(2)-3x(3)-4x(4)).';

  return
end
