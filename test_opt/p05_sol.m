function [ know, x ] = p05_sol ( n )

%*****************************************************************************80
%
%% P05_SOL returns the solution for problem 5.
%
%  Discussion:
%
%    The function has a minimum of 0 at (1,10,1) and also for
%    any point of the form (x,x,0).
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

  x = [ 1.0, 10.0, 1.0 ]';

  return
end
