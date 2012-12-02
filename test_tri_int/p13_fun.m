function f = p13_fun ( n, p )

%*****************************************************************************80
%
%% P13_FUN evaluates the integrand for problem 13.
%
%  Discussion:
%
%    The integral has been transformed from the integral of G(X,Y)
%    over the unit reference triangle.
%
%  Integrand:
%
%    PA = 0
%    PB = -7
%    PC = 0
%    PD = 0
%    PG = -3/7
%    PH = -3
%    D = PB - PA
%    U(X) = ( X - PA ) / D
%    V1(X) = ( 1 - ( X - PA ) / D ) / ( ( PG - PC ) * X + PH - PD )
%    V(X,Y) = V1(X) * ( Y - PC * X - PD )
%
%    G(X,Y) = (X*Y)**-0.2
%
%    f(x,y) = g ( u(x), v(x,y) ) * v1(x) / d
%
%  Vertices:
%
%    (0,0), (-7,0), (0,-3)
%
%  Integral:
%
%    0.94810264549557699446
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
  c = 0.94810264549557699446;
  pa = 0.0;
  pb = -7.0;
  pc = 0.0;
  pd = 0.0;
  pg = ( -3.0 / 7.0 );
  ph =  -3.0;
  power = -0.2;

  d = pb - pa;
  u(1:n) = ( p(1,1:n) - pa ) / d;
  v1(1:n) = ( 1.0 - u(1:n) ) ./ ( ( pg - pc ) * p(1,1:n) + ph - pd );
  v(1:n) = v1(1:n) .* ( p(2,1:n) - pc * p(1,1:n) - pd );
  f(1:n) = ( u(1:n) .* v(1:n) ).^power .* v1(1:n) / d / c;

  return
end
