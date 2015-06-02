function value = woods ( x, n )

%*****************************************************************************80
%
%% WOODS evaluates the Woods function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(N), the argument of the function.
%
%    Input, integer N, the spatial dimension.
%
%    Output, real VALUE, the value of the function.
%
  s1 = x(2) - x(1) * x(1);
  s2 = 1.0 - x(1);
  s3 = x(2) - 1.0;
  t1 = x(4) - x(3) * x(3);
  t2 = 1.0 - x(3);
  t3 = x(4) - 1.0;
  t4 = s3 + t3;
  t5 = s3 - t3;

  value = 100.0 * s1 * s1 ...
        +         s2 * s2 ...
        +  90.0 * t1 * t1 ...
        +         t2 * t2 ...
        +  10.0 * t4 * t4 ...
        +   0.1 * t5 * t5;

  return
end
