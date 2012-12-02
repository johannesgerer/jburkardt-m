function x = p06_x ( n )

%*****************************************************************************80
%
%% P06_X returns the least squares solution X for problem 6.
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
    angle = i * pi / ( n + 1 );
    x(i,1) = sin ( angle );
  end

  x(1:n,1) = x(1:n,1) * sqrt ( 2.0 / ( n + 1) );

  return
end
