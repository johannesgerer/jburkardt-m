function v = t_polynomial_ab ( a, b, m, n, x )

%*****************************************************************************80
%
%% T_POLYNOMIAL_AB: Chebyshev polynomials T(N,X) of the first kind in [A,B].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the domain of definition.
%
%    Input, integer M, the number of evaluation points.
%
%    Input, integer N, the highest polynomial to compute.
%
%    Input, real X(M,1), the evaluation points.
%    It must be the case that A <= X(*) <= B.
%
%    Output, real V(M,N+1), the values of the Chebyshev polynomials.
%
  y = ( ( b - x     )   ...
      - (     x - a ) ) ...
      / ( b     - a );

  v = t_polynomial ( m, n, x );
 
  return
end
