function title = p01_title ( )

%*****************************************************************************80
%
%% P01_TITLE returns a title for problem 1.
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
  title = 'f(x) = - exp(prod(x)) * sin(sum(x)).';

  return
end
