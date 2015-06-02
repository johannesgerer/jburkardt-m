function [ pols, ders ] = kjacopols2 ( x, a, b, n )

%*****************************************************************************80
%
%% KJACOPOLS2 evaluates Jacobi polynomials and derivatives.
%
%  Discussion:
%
%    This routine evaluates Jacobi polynomials and  derivatives.
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
%    Output, real DERS(N+1), the polynomial derivative values.
%
  pols = zeros(n+1,1);
  ders = zeros(n+1,1);

  pkp1 = 1.0;
  pols(1) = pkp1;

  dkp1 = 0.0;
  ders(1) = dkp1;

  if ( n == 0 )
    return
  end

  pk = pkp1;
  pkp1 = ( a / 2.0 - b / 2.0 ) ...
    + ( 1.0 + a / 2.0 + b / 2.0 ) * x;
  pols(2) = pkp1;

  dk = dkp1;
  dkp1 = ( 1.0 + a / 2.0 + b / 2.0 );
  ders(2) = dkp1;

  if ( n == 1 )
    return
  end

  for k = 2 : n

    pkm1 = pk;
    pk = pkp1;
    dkm1 = dk;
    dk = dkp1;

    alpha1 = ( 2.0 * k + a + b - 1.0 ) * ( a * a - b * b );
    alpha2 = ( 2.0 * k + a + b - 1.0 ) ...
      * ( ( 2.0 * k + a + b - 2.0 ) ...
      * ( 2.0 * k + a + b ) );
    beta = 2.0 * ( k + a - 1.0 ) * ( k + b - 1.0 ) ...
      * ( 2.0 * k + a + b );
    gamma = ( 2.0 * k * ( k + a + b ) ...
      * ( 2.0 * k + a + b - 2.0 ) );
    pkp1 = ( ( alpha1 + alpha2 * x ) * pk - beta * pkm1 ) / gamma;
    dkp1 = ( ( alpha1 + alpha2 * x ) * dk ...
      - beta * dkm1 + alpha2 * pk ) / gamma;

    pols(k+1) = pkp1;
    ders(k+1) = dkp1;

  end

  return
end