function result = ball_monomial_nd ( n, p, r )

%*****************************************************************************80
%
%% BALL_MONOMIAL_ND integrates a monomial on a ball in ND.
%
%  Integration region:
%
%    Points X(1:N) such that
%
%      Sum ( X(1:N)**2 ) <= R**2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gerald Folland,
%    How to Integrate a Polynomial Over a Sphere,
%    American Mathematical Monthly,
%    Volume 108, May 2001, pages 446-448.
%
%  Parameters:
%
%    Input, integer N, the dimension of the space.
%
%    Input, integer P(N), the exponents of X(1) through X(N) in the monomial.
%    The exponents P(N) must be nonnegative.
%
%    Input, real R, the radius of the ball.
%
%    Output, real BALL_MONOMIAL_ND, the integral of
%    X1**P(1)*X2**P(2)*...*XN**P(N) over the ball.
%
  power = sum ( p(1:n) ) + n;

  result = sphere_unit_monomial_nd ( n, p ) * r^power / power;

  return
end
