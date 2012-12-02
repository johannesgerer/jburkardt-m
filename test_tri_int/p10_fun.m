function f = p10_fun ( n, p )

%*****************************************************************************80
%
%% P10_FUN evaluates the integrand for problem 10.
%
%  Discussion:
%
%    The integral has been transformed from the integral of G(X,Y)
%    over the unit reference triangle.
%
%  Integrand:
%
%    PA = 1
%    PB = 5
%    PC = 0
%    PD = 0
%    PG = 0.25
%    PH = -0.25
%    D = PB - PA
%    U(X) = ( X - PA ) / D
%    V1(X) = ( 1 - ( X - PA ) / D ) / ( ( PG - PC ) * X + PH - PD )
%    V(X,Y) = V1(X) * ( Y - PC * X - PD )
%
%    G(X,Y) = X^(-0.2)
%
%    f(x,y) = g ( u(x), v(x,y) ) * v1(x) / d
%
%  Vertices:
%
%    (1,0), (5,0), (5,1)
%
%  Integral:
%
%    0.6944444444444444
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Elise deDoncker, Ian Robinson,
%    Algorithm 612:
%    Integration over a Triangle Using Nonlinear Extrapolation,
%    ACM Transactions on Mathematical Software,
%    Volume 10, Number 1, March 1984, pages 17-22.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real P(2,N), the evaluation points.
%
%    Output, real F(N), the function values.
%
  pa = 1.0;
  pb = 5.0;
  pc = 0.0;
  pd = 0.0;
  pg = 0.25;
  ph = -0.25;
  power = -0.2;

  d = pb - pa;
  u(1:n) = ( p(1,1:n) - pa ) / d;
  v1(1:n) = ( 1.0 - u(1:n) ) ./ ( ( pg - pc ) * p(1,1:n) + ph - pd );
  v(1:n) = v1(1:n) .* ( p(2,1:n) - pc * p(1,1:n) - pd );
  f(1:n) = ( 36.0 / 25.0 ) * u(1:n).^power .* v1(1:n) / d;

  return
end
