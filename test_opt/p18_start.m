function x = p18_start ( n )

%*****************************************************************************80
%
%% P18_START returns a starting point for optimization for problem 18.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2000
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
    x(i) = i / ( n + 1 );
  end

  return
end
