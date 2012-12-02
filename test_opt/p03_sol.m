function [ know, x ] = p03_sol ( n )

%*****************************************************************************80
%
%% P03_SOL returns the solution for problem 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer KNOW.
%    If KNOW is 0, then the solution is not known.
%    If KNOW is positive, then the solution is known, and is returned in X.
%
%    Input, integer N, the order of the problem.  This value
%    is only needed for those problems with variable N.
%
%    Output, real X(N), the solution, if known.
%
  know = 0;

  x = zeros ( n, 1 );

  return
end
