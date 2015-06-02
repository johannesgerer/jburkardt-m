function c = hen_projection ( n, f )

%*****************************************************************************80
%
%% HEN_PROJECTION projects a function f onto polynomials Hen(i,x).
%
%  Discussion:
%
%    Hen(i,x) is the normalized probabilist's Hermite polynomial of degree I.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the highest order polynomial to compute.
%
%    Input, function handle F, of the form
%      function v = f ( n, x )
%
%    Output, real C(N+1,1), projection coefficients for Hen(0,x) through Hen(N,x).
%
  c = zeros ( n + 1, 1 );

  [ x, w ] = he_quadrature_rule ( n + 1 );

  f_vec = f ( n + 1, x );

  phi = hen_polynomial_value ( n + 1, n, x );

  for i = 1 : n + 1
    phi(i,1:n+1) = phi(i,1:n+1) * w(i);
  end

  c = phi' * f_vec;

  return
end

