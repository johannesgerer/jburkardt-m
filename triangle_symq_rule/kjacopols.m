function pols = kjacopols ( x, a, b, n )

%*****************************************************************************80
%
%% KJACOPOLS evaluates Jacobi polynomials.
%
%  Discussion:
%
%    This routine evaluates Jacobi polynomials.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    26 June 2014
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
%    Input, real X, the evaluation point.
%
%    Input, real A, B, the parameter values.
%
%    Input, integer N, the highest degree to be evaluated.
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
  pkp1 = ( a / 2.0 - b / 2.0 ) ...
    + ( 1.0 + a / 2.0 + b / 2.0 ) * x;
  pols(2) = pkp1;

  if ( n == 1 )
    return
  end

  for k = 2 : n

    pkm1 = pk;
    pk = pkp1;

    alpha = ( 2.0 * k + a + b - 1.0 ) ...
      * ( a * a - b * b + ( 2.0 * k + a + b - 2.0 ) ...
      * ( 2.0 * k + a + b ) * x );

    beta = 2.0 * ( k + a - 1.0 ) * ( k + b - 1.0 ) ...
      * ( 2.0 * k + a + b );

    pkp1 = ( alpha * pk - beta * pkm1 ) ...
      / ( 2.0 * k * ( k + a + b ) ...
      * ( 2.0 * k + a + b - 2.0 ) );

    pols(k+1) = pkp1;

  end

  return
end