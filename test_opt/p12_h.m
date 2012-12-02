function h = p12_h ( n, x )

%*****************************************************************************80
%
%% P12_H evaluates the Hessian for problem 12.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 March 2000
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
  h = zeros ( n, n );

  d1 = 2.0 / 3.0;

  for i = 1 : 99

    arg = i / 100.0;
    r = ( - 50.0 * log ( arg ) )^d1 + 25.0 - x(2);
    t1 = abs ( r )^x(3) / x(1);
    t2 = exp ( - t1 );
    t3 = t1 * t2 * ( t1 * t2 + ( t1 - 1.0 ) * ( t2 - arg ) );
    t = t1 * t2 * ( t2 - arg );
    logr = log ( abs ( r ) );

    h(1,1) = h(1,1) + 2.0 * t3 - 2.0 * t;
    h(1,2) = h(1,2) + 2.0 * t3 / r;
    h(1,3) = h(1,3) - 2.0 * t3 * logr;

    h(2,1) = h(2,1) + 2.0 * t3 / r;
    h(2,2) = h(2,2) + 2.0 * ( t + x(3) * t3 ) / r / r;
    h(2,3) = h(2,3) + 2.0 * ( t - x(3) * t3 * logr ) / r;

    h(3,1) = h(3,1) - 2.0 * t3 * logr;
    h(3,2) = h(3,2) + 2.0 * ( t - x(3) * t3 * logr ) / r;
    h(3,3) = h(3,3) + 2.0 * t3 * logr * logr;

  end

  h(1,1) = ( h(1,1) / x(1) ) / x(1);
  h(1,2) = h(1,2) * x(3) / x(1);
  h(1,3) = h(1,3) / x(1);

  h(2,1) = h(2,1) * x(3) / x(1);
  h(2,2) = h(2,2) * x(3);

  h(3,1) = h(3,1) / x(1);

  return
end
