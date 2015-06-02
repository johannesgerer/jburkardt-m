function result = p00_rat_transform ( problem, order )

%*****************************************************************************80
%
%% P00_RAT_TRANSFORM applies a rational transform and Gauss-Legendre rule.
%
%  Discussion:
%
%    To approximate:
%
%      Integral ( alpha <= x < Infinity ) f(x) dx
%
%    Transform:
%
%      u = 1 / ( 1 + x )
%      du = - dx / ( 1 + x )^2
%
%      x = ( 1 - u ) / u
%      dx = - du / u^2
%
%      x = alpha    => u = 1 / ( 1 + alpha )
%      x = Infinity => u = 0
%
%    Transformed integral:
%
%      Integral ( 0 < u <= 1 / ( 1 + alpha ) ) f ( ( 1 - u ) / u ) du / u^2
%
%    We apply a Gauss-Legendre rule here, but we could easily use any rule
%    that avoids evaluation at U = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud, Don Secrest,
%    Gaussian Quadrature Formulas,
%    Prentice Hall, 1966,
%    LC: QA299.4G3S7.
%
%  Parameters:
%
%    Input, integer PROBLEM, the index of the problem.
%
%    Input, integer ORDER, the order of the Gauss-Legendre rule
%    to apply.
%
%    Output, real RESULT, the approximate integral.
%
  alpha = p00_alpha ( problem );
%
%  Get the abscissas and weights for Gauss-Legendre quadrature.
%
  [ u, weight ] = legendre_compute ( order );
%
%  Modify the weights from [-1,1] to [0,1/(1+alpha)].
%
  weight(1:order) = weight(1:order) / 2.0 / ( 1.0 + alpha );
%
%  Linear transform of abscissas from [-1,1] to [0,1/(1+alpha)].
%
  u(1:order) = ( ( 1.0 + u(1:order) ) / ( 1.0 + alpha ) ...
               + ( 1.0 - u(1:order) ) * 0.0 )           ...
               / ( 2.0              );
%
%  Define U_RAT = ( 1 - U ) / U.
%
  u_rat(1:order) = ( 1.0 - u(1:order) ) ./ u(1:order);
%
%  Evaluate F ( (1-U)/U ).
%
  f_vec = p00_fun ( problem, order, u_rat );
%
%  The integrand is F ( (1-U)/U ) / U^2
%
  f_vec(1:order) = f_vec(1:order) ./ u(1:order).^2;
%
%  Sum.
%
  result = weight(1:order) * f_vec(1:order)';

  return
end
