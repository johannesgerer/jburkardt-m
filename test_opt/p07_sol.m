function [ know, x ] = p07_sol ( n )

%*****************************************************************************80
%
%% P07_SOL returns the solution for problem 7.
%
%  Discussion:
%
%    The values of the approximate solutions are taken from Brent.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2002
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
  if ( n == 6 )
    know = 1;
    x = [ -0.015725, 1.012435, -0.232992, 1.260430, -1.513729, 0.992996 ]';
  elseif ( n == 9 )
    know = 1;
    x = [ -0.000015, 0.999790, 0.014764, 0.146342, ...
      1.000821, -2.617731, 4.104403, -3.143612, 1.052627 ]';
  else
    know = 0;
    x = zeros ( n, 1 );
  end

  return
end
