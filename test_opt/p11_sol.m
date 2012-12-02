function [ know, x ] = p11_sol ( n )

%*****************************************************************************80
%
%% P11_SOL returns the solution for problem 11.
%
%  Discussion:
%
%    A local minimizer is approximately known.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 January 2001
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

  x = [ -11.5844, 13.1999, -0.406200, 0.240998 ]';

  return
end
