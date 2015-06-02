function [ pols, dersx, dersy ] = klegeypols3 ( x, y, n )

%*****************************************************************************80
%
%% KLEGEYPOLS3 evaluate scaled Legendre polynomials and derivatives.
%
%  Discussion:
%
%    This routine evaluates a sequence of scaled Legendre polynomials
%    P_n(x/y) y^n, with the parameter y in [0,1], together with their
%    derivatives with respect to the parameters x and y.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    27 June 2014
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
%    Input, real Y, the parameter value.
%
%    Input, integer N, the highest degree to be evaluated.
%
%    Output, real POLS(N+1), the polynomial values.
%
%    Output, real DERSX(N+1), the derivatives with respect to X.
%
%    Output, real DERSY(N+1), the derivatives with respect to Y.
%
  pkp1 = 1.0;
  pols(1) = pkp1;
  dkp1 = 0.0;
  dersx(1) = dkp1;
  ykp1 = 0.0;
  dersy(1) = ykp1;

  if ( n == 0 )
    return
  end

  pk = pkp1;
  pkp1 = x;
  pols(2) = pkp1;
  dk = dkp1;
  dkp1 = 1.0;
  dersx(2) = dkp1;
  yk = ykp1;
  ykp1 = 0.0;
  dersy(2) = ykp1;

  if ( n == 1 )
    return
  end

  for k = 1 : n - 1
    pkm1 = pk;
    pk = pkp1;
    dkm1 = dk;
    dk = dkp1;
    ykm1 = yk;
    yk = ykp1;
    pkp1 = ( ( 2.0 * k + 1.0 ) * x * pk - k * pkm1 * y * y ) / ( k + 1.0 );
    dkp1 = ( ( 2.0 * k + 1.0 ) * ( x * dk + pk ) ...
      - k * dkm1 * y * y ) / ( k + 1.0 );
    ykp1 = ( ( 2.0 * k + 1.0 ) * ( x * yk ) ...
      - k * ( pkm1 * 2.0 * y + ykm1 * y * y ) ) / ( k + 1.0 );
    pols(k+2) = pkp1;
    dersx(k+2) = dkp1;
    dersy(k+2) = ykp1;
  end

  return
end
