function value = sphere_unit_monomial_nd ( n, p )

%*****************************************************************************80
%
%% SPHERE_UNIT_MONOMIAL_ND integrates a monomial on a unit sphere in ND.
%
%  Integration region:
%
%    Points X(1:N) such that
%
%      Sum ( X(1:N)**2 ) == 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 May 2004
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
%    Output, real SPHERE_UNIT_MONOMIAL_ND, the integral of
%    X1**P(1)*X2**P(2)*...*XN**P(N) over the unit sphere.
%
  for i = 1 : n
    if ( mod ( p(i), 2 ) == 1 )
      value = 0.0E+00;
      return
    end
  end

  temp = 0.0E+00;
  arg2 = 0.0E+00;

  for i = 1 : n
    arg1 = ( p(i) + 1 ) / 2.0E+00;
    temp = temp + gammaln ( arg1 );
    arg2 = arg2 + arg1;
  end
  temp = temp - gammaln ( arg2 );

  value = 2.0E+00 * exp ( temp );

  return
end
