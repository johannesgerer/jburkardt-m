function [ know, x ] = p18_sol ( n )

%*****************************************************************************80
%
%% P18_SOL returns the solution for problem 18.
%
%  Discussion:
%
%    The solution values are taken from Brent.
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
  if ( n == 2 )
    know = 1;
    x = [ 0.2113249, 0.7886751 ]';
  elseif ( n == 4 )
    know = 1;
    x = [ 0.1026728, 0.4062037, 0.5937963, 0.8973272 ]';
  elseif ( n == 6 )
    know = 1;
    x = [ 0.066877, 0.288741, 0.366682, 0.633318, ...
      0.711259, 0.933123 ]';
  elseif ( n == 8 )
    know = 1;
    x = [ 0.043153, 0.193091, 0.266329, 0.500000, ...
      0.500000, 0.733671, 0.806910, 0.956847 ]';
  else
    know = 0;
    x = zeros ( n, 1 );
  end

  return
end
