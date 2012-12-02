function x = p05_x ( n )

%*****************************************************************************80
%
%% P05_X returns the least squares solution X for problem 5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Output, real X(N,1), the least squares solution.
%
  for i = 1 : n
    x(i,1) = r8_mop ( i + 1 ) * i ...
      * r8_choose ( n + i - 1, n - 1 ) * r8_choose ( n, n - i );
  end

  return
end
