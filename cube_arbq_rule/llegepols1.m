function pols = llegepols1 ( degree, x )

%*****************************************************************************80
%
%% LLEGEPOLS1 evaluates orthogonal polynomials on the symmetric interval.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 July 2014
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
%    Input, integer DEGREE, the maximum degree.
%
%    Input, real X, the evaluation point.
%
%    Output, real POLS(DEGREE+1)), the orthogonal
%    polynomials evaluated at X.
%
  pols = zeros ( degree + 1, 1 );

  pkp1 = 1.0;
  pols(1) = pkp1;

  if ( degree == 0 )
    return
  end

  pk = pkp1;
  pkp1 = x;
  pols(2) = pkp1;

  if ( degree == 1 )
    return
  end

  for k = 1 : degree - 1

    pkm1 = pk;
    pk = pkp1;
    pkp1 = ( ( 2 * k + 1 ) * x * pk ...
           + (   - k     ) * pkm1 ) ...
           / (     k + 1 );

    pols(k+2) = pkp1;

  end

  return
end
