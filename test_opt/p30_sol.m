function [ know, x ] = p30_sol ( n )

%*****************************************************************************80
%
%% P30_SOL returns the solution for problem 30.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2001
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
  know = 3;

  r = rand ( ) * 3;

  if ( r <= 1 )
    x = [ -pi, 12.275 ]';
  elseif ( r <= 2 )
    x = [  pi,  2.275 ]';
  else
    x = [ 9.42478, 2.475 ]';
  end

  return
end
