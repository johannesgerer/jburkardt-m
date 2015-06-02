function result = p00_exp_transform ( problem, order )

%*****************************************************************************80
%
%% P00_EXP_TRANSFORM applies an exponential transform and Gauss-Legendre rule.
%
%  Discussion:
%
%    To approximate:
%
%      Integral ( alpha <= x < Infinity ) f(x) dx
%
%    Transform:
%
%      u = exp ( -x )
%      du = - exp ( -x ) dx
%
%      x = - log ( u )
%      dx = - du / u
%
%      x = alpha    => u = exp ( -alpha )
%      x = Infinity => u = 0
%
%    Transformed integral:
%
%      Integral ( 0 <= u <= exp ( -alpha ) ) f ( -log(u) ) du / u
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
%    29 July 2007
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
%  Modify the weights from [-1,1] to [0,exp(-alpha)].
%
  weight(1:order) = exp ( -alpha ) * weight(1:order) / 2.0;
%
%  Linear transform of abscissas from [-1,1] to [0,exp(-alpha)].
%
  u(1:order) = ( ( 1.0 + u(1:order) ) * exp ( - alpha ) ...
               + ( 1.0 - u(1:order) ) * 0.0 )           ...
               / ( 2.0              );
%
%  Define U_LOG = - log ( U )
%
  u_log(1:order) = - log ( u(1:order) );
%
%  Evaluate F ( -LOG(U) ).
%
  f_vec = p00_fun ( problem, order, u_log );
%
%  The integrand is F ( -LOG(U) ) / U
%
  f_vec(1:order) = f_vec(1:order) ./ u(1:order);
%
%  Sum.
%
  result = weight(1:order) * f_vec(1:order)';

  return
end
