function [ pols, dersx, dersy ] = ortho2eva30 ( mmax, z )

%*****************************************************************************80
%
%% ORTHO2EVA30: orthonormal polynomials and derivatives on triangle.
%
%  Discussion:
%
%    Evaluate the orthonormal polynomials on the triangle,
%    together with their derivatives with respect to X and Y.
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
%    Input, integer MMAX, the maximum order to which the polynomials are
%    to be evaluated.
%
%    Input, real Z(2), the evaluation point.
%
%    Output, real POLS((mmax+1)*(mmax+2)/2), the orthogonal
%    polynomials evaluated at the point Z.
%
%    Output, real DERSX((mmax+1)*(mmax+2)/2), the derivatives
%    with respect to X of the polynomials returned in POLS.
%
%    Output, real DERSY((mmax+1)*(mmax+2)/2), the derivatives
%    with respect to Y of the polynomials returned in POLS.
%
  zero = 0.0;
  sqrt2 = sqrt ( 2.0 );
  sqrt3 = sqrt ( 3.0 );
  r11 = -1.0 / 3.0;
  r12 = -1.0 / sqrt3;
  r21 = - 1.0 / 3.0;
  r22 = 2.0 / sqrt3;

  x = z(1);
  y = z(2);
%
%  Map the reference triangle to the right
%  triangle with the vertices (-1,-1), (1,-1), (-1,1)
%
  a = r11 + r12 * y + x;
  b = r21 + r22 * y;
%
%  Evaluate the Koornwinder's polynomials via the three term recursion.
%
  par1 = ( 2.0 * a + 1.0 + b ) / 2.0;
  par2 = ( 1.0 - b ) / 2.0;
  [ f1, f3, f4 ] = klegeypols3 ( par1, par2, mmax );

  for m = 0 : mmax
    par1 = 2 * m + 1;
    n1 =        1+m*(mmax+1);
    n2 = mmax-m+1+m*(mmax+1);
    [ f2(n1:n2), f5(n1:n2) ] = kjacopols2 ( b, par1, zero, (mmax-m) );
  end

  kk = 0;
  for m = 0 : mmax
    for n = 0 : m
      kk = kk + 1;
%
%  Evaluate the polynomial (m-n, n), and their derivatives
%  with respect to x,y
%
      pols(kk) = f1(m-n+1) * f2(n+1+(m-n)*(mmax+1));

      dersx(kk) = f3(m-n+1) * f2(n+1+(m-n)*(mmax+1));

      dersy(kk) = ...
        f1(m-n+1) * f5(n+1+(m-n)*(mmax+1)) * r22 + ...
        f3(m-n+1) * f2(n+1+(m-n)*(mmax+1)) ...
        * ( r12 + r22 / 2.0 ) + ...
        f4(m-n+1) * f2(n+1+(m-n)*(mmax+1)) * (- r22 / 2.0 );

%
%  Normalize.
%
      scale = sqrt ...
      ( ...
        ( ...
          ( 1 + ( m - n ) + n ) ...
          * ( 1 + ( m - n ) + ( m - n ) ) ...
        ) / sqrt3 ...
      );
      pols(kk) = pols(kk) * scale;
      dersx(kk) = dersx(kk) * scale;
      dersy(kk) = dersy(kk) * scale;

    end
  end

  return
end
