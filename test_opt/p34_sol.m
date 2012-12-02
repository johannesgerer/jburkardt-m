function [ know, x ] = p34_sol ( n )

%*****************************************************************************80
%
%% P34_SOL returns the solution for problem 34.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 January 2001
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
  know = 2;

  r = 2 * rand ( );

  if ( r < 1.0 )
    x = [ -0.0898,  0.7126 ]';
  else
    x = [  0.0898, -0.7126 ]';
  end

  return
end
