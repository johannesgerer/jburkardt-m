function pols = klegeypols ( x, y, n )

%*****************************************************************************80
%
%% KLEGEYPOLS evaluates scaled Legendre polynomials.
%
%  Discussion:
%
%    This routine evaluate a sequence of scaled Legendre polynomials
%    P_n(x/y) y^n, with the parameter y in [0,1].
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
%    Input, real Y, the parameter.
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
  pkp1 = x;
  pols(2) = pkp1;
  if ( n == 1 )
    return
  end

  for k = 1 : n - 1
    pkm1 = pk;
    pk = pkp1;
    pkp1 = ( ( 2.0 * k + 1.0 ) * x * pk ...
      - k * pkm1 * y * y ) / ( k + 1.0 );
    pols(k+2) = pkp1;
  end

  return
end