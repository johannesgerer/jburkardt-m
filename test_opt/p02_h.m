function h = p02_h ( n, x )

%*****************************************************************************80
%
%% P02_H evaluates the Hessian for problem 2.
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

  for i = 1 : 13

    c = - i / 10.0;

    fi =   x(3) * exp ( c * x(1) )  - x(4) * exp ( c * x(2) ) ...
          + x(6) * exp ( c * x(5) ) -        exp ( c ) ...
          + 5.0 * exp ( 10.0 * c ) -  3.0 * exp ( 4.0 * c );

    dfdx1 =     c     * x(3) * exp ( c * x(1) );
    d2fdx11 =   c * c * x(3) * exp ( c * x(1) );
    d2fdx13 =   c     *        exp ( c * x(1) );
    dfdx2 =   - c     * x(4) * exp ( c * x(2) );
    d2fdx22 = - c * c * x(4) * exp ( c * x(2) );
    d2fdx24 = - c     *        exp ( c * x(2) );
    dfdx3 =                    exp ( c * x(1) );
    d2fdx31 =   c     *        exp ( c * x(1) );
    dfdx4 =   -                exp ( c * x(2) );
    d2fdx42 = - c     *        exp ( c * x(2) );
    dfdx5 =     c     * x(6) * exp ( c * x(5) );
    d2fdx55 =   c * c * x(6) * exp ( c * x(5) );
    d2fdx56 =   c     *        exp ( c * x(5) );
    dfdx6 =                    exp ( c * x(5) );
    d2fdx65 =   c     *        exp ( c * x(5) );

    h(1,1) = h(1,1) + 2.0 * dfdx1 * dfdx1 + 2.0 * fi * d2fdx11;
    h(1,2) = h(1,2) + 2.0 * dfdx2 * dfdx1;
    h(1,3) = h(1,3) + 2.0 * dfdx3 * dfdx1 + 2.0 * fi * d2fdx13;
    h(1,4) = h(1,4) + 2.0 * dfdx4 * dfdx1;
    h(1,5) = h(1,5) + 2.0 * dfdx5 * dfdx1;
    h(1,6) = h(1,6) + 2.0 * dfdx6 * dfdx1;

    h(2,1) = h(2,1) + 2.0 * dfdx1 * dfdx2;
    h(2,2) = h(2,2) + 2.0 * dfdx2 * dfdx2 + 2.0 * fi * d2fdx22;
    h(2,3) = h(2,3) + 2.0 * dfdx3 * dfdx2;
    h(2,4) = h(2,4) + 2.0 * dfdx4 * dfdx2 + 2.0 * fi * d2fdx24;
    h(2,5) = h(2,5) + 2.0 * dfdx5 * dfdx2;
    h(2,6) = h(2,6) + 2.0 * dfdx6 * dfdx2;

    h(3,1) = h(3,1) + 2.0 * dfdx1 * dfdx3 + 2.0 * fi * d2fdx31;
    h(3,2) = h(3,2) + 2.0 * dfdx2 * dfdx3;
    h(3,3) = h(3,3) + 2.0 * dfdx3 * dfdx3;
    h(3,4) = h(3,4) + 2.0 * dfdx4 * dfdx3;
    h(3,5) = h(3,5) + 2.0 * dfdx5 * dfdx3;
    h(3,6) = h(3,6) + 2.0 * dfdx6 * dfdx3;

    h(4,1) = h(4,1) + 2.0 * dfdx1 * dfdx4;
    h(4,2) = h(4,2) + 2.0 * dfdx2 * dfdx4 + 2.0 * fi * d2fdx42;
    h(4,3) = h(4,3) + 2.0 * dfdx3 * dfdx4;
    h(4,4) = h(4,4) + 2.0 * dfdx4 * dfdx4;
    h(4,5) = h(4,5) + 2.0 * dfdx5 * dfdx4;
    h(4,6) = h(4,6) + 2.0 * dfdx6 * dfdx4;

    h(5,1) = h(5,1) + 2.0 * dfdx1 * dfdx5;
    h(5,2) = h(5,2) + 2.0 * dfdx2 * dfdx5;
    h(5,3) = h(5,3) + 2.0 * dfdx3 * dfdx5;
    h(5,4) = h(5,4) + 2.0 * dfdx4 * dfdx5;
    h(5,5) = h(5,5) + 2.0 * dfdx5 * dfdx5 + 2.0 * fi * d2fdx55;
    h(5,6) = h(5,6) + 2.0 * dfdx6 * dfdx5 + 2.0 * fi * d2fdx56;

    h(6,1) = h(6,1) + 2.0 * dfdx1 * dfdx6;
    h(6,2) = h(6,2) + 2.0 * dfdx2 * dfdx6;
    h(6,3) = h(6,3) + 2.0 * dfdx3 * dfdx6;
    h(6,4) = h(6,4) + 2.0 * dfdx4 * dfdx6;
    h(6,5) = h(6,5) + 2.0 * dfdx5 * dfdx6 + 2.0 * fi * d2fdx65;
    h(6,6) = h(6,6) + 2.0 * dfdx6 * dfdx6;

  end

  return
end
