function h = p05_h ( n, x )

%*****************************************************************************80
%
%% P05_H evaluates the Hessian for problem 5.
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
  h = zeros ( n, n );

  for i = 1 : 10

    c = - i / 10.0;

    fi = exp ( c * x(1) ) - exp ( c * x(2) ) ...
      - x(3) * ( exp ( c ) - exp ( 10.0 * c ) );;

    dfidx1 =     c     * exp ( c * x(1) );
    d2fidx11 =   c * c * exp ( c * x(1) );
    dfidx2 =   - c     * exp ( c * x(2) );
    d2fidx22 = - c * c * exp ( c * x(2) );
    dfidx3 =  - ( exp ( c ) - exp ( 10.0 * c ) );

    h(1,1) = h(1,1) + 2.0 * dfidx1 * dfidx1 + 2.0 * fi * d2fidx11;
    h(1,2) = h(1,2) + 2.0 * dfidx1 * dfidx2;
    h(1,3) = h(1,3) + 2.0 * dfidx1 * dfidx3;

    h(2,1) = h(2,1) + 2.0 * dfidx2 * dfidx1;
    h(2,2) = h(2,2) + 2.0 * dfidx2 * dfidx2 + 2.0 * fi * d2fidx22;
    h(2,3) = h(2,3) + 2.0 * dfidx2 * dfidx3;

    h(3,1) = h(3,1) + 2.0 * dfidx3 * dfidx1;
    h(3,2) = h(3,2) + 2.0 * dfidx3 * dfidx2;
    h(3,3) = h(3,3) + 2.0 * dfidx3 * dfidx3;

  end

  return
end
