function x = p06_start ( n )

%*****************************************************************************80
%
%% P06_START returns a starting point for optimization for problem 6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables X.
%
%    Output, real X(N), a starting point for the optimization.
%
  x = zeros ( n, 1 );

  for i = 1 : n
    x(i) = ( n - i ) / n;
  end

  return
end
