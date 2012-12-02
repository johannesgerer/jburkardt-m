function h = p03_h ( n, x )

%*****************************************************************************80
%
%% P03_H evaluates the Hessian for problem 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real H(N,N), the N by N Hessian matrix.
%
  y = p03_yvec ( );

  h = zeros ( n, n );

  for i = 1 : 15

    d1 = 0.5 * ( i - 1 );
    d2 = 3.5 - d1 - x(3);
    arg = 0.5 * x(2) * d2 * d2;
    r = exp ( - arg );
    t = x(1) * r - y(i);
    t1 = 2.0 * x(1) * r - y(i);

    h(1,1) = h(1,1) + r * r;
    h(2,2) = h(2,2) + r * t1 * d2^4;
    h(3,3) = h(3,3) + r * ( x(2) * t1 * d2 * d2 - t );
    h(2,1) = h(2,1) - r * t1 * d2 * d2;
    h(3,1) = h(3,1) + d2 * r * t1;
    h(3,2) = h(3,2) + d2 * r * ( t - arg * t1 );

  end

  h(1,1) = 2.0 * h(1,1);
  h(2,2) = 0.5 * x(1) * h(2,2);
  h(3,3) = 2.0 * x(1) * x(2) * h(3,3);
  h(3,1) = 2.0 * x(2) * h(3,1);
  h(3,2) = 2.0 * x(1) * h(3,2);

  h(1,2) = h(2,1);
  h(1,3) = h(3,1);
  h(2,3) = h(3,2);

  return
end
