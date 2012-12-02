function f = p11_fun ( n, p )

%*****************************************************************************80
%
%% P11_FUN evaluates the integrand for problem 11.
%
%  Discussion:
%
%    The integral has been transformed from the integral of G(X,Y)
%    over the unit reference triangle.
%
%  Integrand:
%
%    PA = 0
%    PB = 1
%    PC = 0
%    PD = 0
%    PG = -1.0
%    PH = 1.0
%    D = PB - PA
%    U(X) = ( X - PA ) / D
%    V1(X) = ( 1 - ( X - PA ) / D ) / ( ( PG - PC ) * X + PH - PD )
%    V(X,Y) = V1(X) * ( Y - PC * X - PD )
%
%    G(X,Y) = (X+Y)**-0.2
%
%    f(x,y) = g ( u(x), v(x,y) ) * v1(x) / d
%
%  Vertices:
%
%    (0,0), (1,0), (0,1)
%
%  Integral:
%
%    0.5555555555555556
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
  pa = 0.0;
  pb = 1.0;
  pc = 0.0;
  pd = 0.0;
  pg = -1.0;
  ph =  1.0;
  power = -0.2;

  d = pb - pa;
  u(1:n) = ( p(1,1:n) - pa ) / d;
  v1(1:n) = ( 1.0 - u(1:n) ) ./ ( ( pg - pc ) * p(1,1:n) + ph - pd );
  v(1:n) = v1(1:n) .* ( p(2,1:n) - pc * p(1,1:n) - pd );

  f(1:n) = ( 9.0 / 5.0 ) * ( u(1:n) + v(1:n) ).^power .* v1(1:n) / d;

  return
end
