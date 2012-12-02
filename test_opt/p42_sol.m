function [ know, x ] = p42_sol ( n )

%*****************************************************************************80
%
%% P42_SOL returns the solution for problem 42.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2002
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the problem.  This value
%    is only needed for those problems with variable N.
%
%    Output, integer KNOW.
%    If KNOW is 0, then the solution is not known.
%    If KNOW is positive, then the solution is known, and is returned in X.
%
%    Output, real X(N), the solution, if known.
%
  know = 1;

  x = ones ( n, 1 );

  return
end
