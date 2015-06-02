function pols = lege2eva ( degree, z )

%*****************************************************************************80
%
%% LEGE2EVA evaluates orthogonal polynomials on the symmetric square.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2014
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
%    Input, integer DEGREE, the maximum degree of the polynomials.
%
%    Input, real Z(2), the evaluation point.
%
%    Output, real POLS((DEGREE+1)*(DEGREE+2)/2), the orthogonal
%    polynomials evaluated at Z.
%
  npols = ( ( degree + 1 ) * ( degree + 2 ) ) / 2;
  pols = zeros(npols,1);

  f1 = llegepols1 ( degree, z(1) );
  f2 = llegepols1 ( degree, z(2) );

  kk = 0;
  for m = 0 : degree
    for n = 0 : m
      kk = kk + 1;
      pols(kk) = f1(m-n+1) * f2(n+1);
      scale = ( 1 + 2 * n ) * ( 1 + 2 * ( m - n ) );
      scale = 0.5 * sqrt ( scale );
      pols(kk) = pols(kk) * scale;
    end
  end

  return
end
