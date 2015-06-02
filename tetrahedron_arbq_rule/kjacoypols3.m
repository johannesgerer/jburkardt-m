function pols = kjacoypols3 ( x, y, a, b, n )

%*****************************************************************************80
%
%% KJACOYPOLS3 evaluates modified Jacobi polynomials.
%
%  Discussion:
%
%    This procedure evaluates Jacobi polynomials multiplied by
%    specific polynomials given by the formula
%      P_n^{(a,b)} (x/y) y^n
%    at the user-provided point x/y.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    10 July 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, real X, Y, define the evaluation point X/Y.
%
%    Input, real A, B, the parameters.
%
%    Input, integer N, the highest degree to compute.
%
%    Output, real POLS(N+1), the polynomial values.
%
  pols = zeros(n+1,1);

  pkp1 = 1.0;
  pols(1) = pkp1;

  if ( n == 0 )
    return
  end

  pk = pkp1;
  pkp1 = 0.5 * ( ( a - b ) * y + ( 2.0 + a + b ) * x );
  pols(2)= pkp1;

  if ( n == 1 )
    return
  end

  for k = 2 : n

    alpha = ( 2.0 * k + a + b - 1.0 ) ...
      * ( a - b ) * ( a + b ) * y ...
      + ( 2.0 * k + a + b - 1.0 ) ...
      * ( 2.0 * k + a + b - 2.0 ) ...
      * ( 2.0 * k + a + b ) * x;

    beta = 2.0 * ( k + a - 1.0 ) ...
      * ( k + b - 1.0 ) ...
      * ( 2.0 * k + a + b ) * y * y;

    pkm1 = pk;
    pk = pkp1;
    pkp1 = ( alpha * pk - beta * pkm1 ) ...
      / ( 2.0 * k * ( k + a + b ) ...
      * ( 2.0 * k + a + b - 2.0 ) );

    pols(k+1) = pkp1;

  end

  return
end
