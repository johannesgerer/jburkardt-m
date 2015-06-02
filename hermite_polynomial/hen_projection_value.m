function v = hen_projection_value ( n, c, m, x )

%*****************************************************************************80
%
%% HEN_PROJECTION_VALUE: evaluation projection onto Hen(i,x).
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
%    Input, integer N, the highest order polynomial.
%
%    Input, real C(N+1), the projection coefficients.
%
%    Input, real M, the number of evaluation points.
%
%    Input, real X(M), the evaluation points.
%
%    Output, real V(M), the value of the projection function.
%
  phi = hen_polynomial_value ( m, n, x );

  v = phi * c;

  return
end
