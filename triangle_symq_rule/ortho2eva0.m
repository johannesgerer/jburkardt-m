function pols = ortho2eva0 ( mmax, z )

%*****************************************************************************80
%
%% ORTHO2EVA0 evaluates the orthonormal polynomials on the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    28 June 2014
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
%    Input, integer MMAX, the maximum order to which the polynomials are
%    to be evaluated.
%
%    Input, real Z(2), the coordinates of the evaluation point.
%
%    Output, real POLS((mmax+1)*(mmax+2)/2), the orthogonal
%    polynomials evaluated at the point Z.
%
  zero = 0.0;
  sqrt2 = sqrt ( 2.0 );
  sqrt3 = sqrt ( 3.0 );
  r11 = -1.0 / 3.0;
  r12 = -1.0 / sqrt3;
  r21 = - 1.0 / 3.0;
  r22 = 2.0 / sqrt3;

  a = z(1);
  b = z(2);
%
%  Map the reference triangle to the right
%  triangle with the vertices (-1,-1), (1,-1), (-1,1)
%
  x = r11 + r12 * b + a;
  y = r21 + r22 * b;
%
%  Evaluate the Koornwinder's polynomials via the three term recursion.
%
  par1 = ( 2.0 * x + 1.0 + y ) / 2.0;
  par2 = ( 1.0 - y ) / 2.0;
  f1 = klegeypols ( par1, par2, mmax );

  f2 = zeros(mmax+1,mmax+1);
  for m = 0 : mmax
    par1 = 2 * m + 1;
    f2(1:mmax+1,m+1) = kjacopols ( y, par1, zero, mmax - m );
  end

  npols = ( ( mmax + 1 ) * ( mmax + 2 ) ) / 2;
  pols = zeros(npols,1);

  kk = 0;
  for m = 0 : mmax
    for n = 0 : m
      kk = kk + 1;
%
%  Evaluate the polynomial (m-n, n)
%
      pols(kk) = f1(m-n+1) * f2(n+1,m-n+1);
%
%  Normalize.
%
      scale = sqrt ...
      ( ...
        ( ...
          ( 1 + ( m - n ) + n ) * ...
          ( 1 + ( m - n ) + ( m - n ) ) ...
        ) / sqrt3 ...
      );

      pols(kk) = pols(kk) * scale;

    end

  end

  return
end
