function [ c0, esterr ] = padua2 ( deg, degmax, npd, wpd, fpd )

%*****************************************************************************80
%
%% PADUA2 computes the Padua interpolation coefficient matrix.
%
%  Discussion:
%
%    This subroutine computes the coefficient matrix C0, in the
%    orthonormal Chebyshev basis T_j(x)T_{k-j}(y), 0 <= j <= k <= DEG,
%    T_0(x)=1, T_j(x) = sqrt(2) * cos(j * acos(x)), of the
%    interpolation polynomial of degree DEG of the function values FPD
%    at the set of NPD Padua points (PD1,PD2) in the square [-1,1]^2.
%
%    The interpolant may be evaluated at an arbitrary point by the
%    function PD2VAL. PD1, PD2 and WPD are the Padua points and weights
%    computed by PDPTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2014
%
%  Author:
%
%    Original FORTRAN77 version by Marco Caliari, Stefano De Marchi, 
%    Marco Vianello.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Marco Caliari, Stefano de Marchi, Marco Vianello,
%    Algorithm 886:
%    Padua2D: Lagrange Interpolation at Padua Points on Bivariate Domains,
%    ACM Transactions on Mathematical Software,
%    Volume 35, Number 3, October 2008, Article 21, 11 pages.
%
%  Parameters:
%
%    Input, integer DEG, the degree of approximation.
%
%    Input, integer DEGMAX, the maximum degree allowed.
%
%    Input, integer NPD, the number of Padua points.
%
%    Input, real WPD(NPD), the weights.
%
%    Input, real FPD(NPD), the value at the Padua points
%    of the function to be interpolated.
%
%    Output, real C0(0+1:DEG+1,0+1:DEG+1), the coefficient matrix.
%
%    Output, real ESTERR, the estimated error.
%
  BASE = 1;
%
%  Build the matrix P_2 and store it in RAUX2.
%
  raux2 = zeros ( deg + 1, deg + 2 );

  for i = 0 : deg + 1
    angle = i * pi / ( deg + 1 );
    pt = - cos ( angle );
    raux2(0+BASE:deg+BASE,i+1) = cheb ( deg, pt );
  end
%
%  Build the matrix G(f) and store it in C0.
%
  k = 0;
  for j = 0 : deg + 1
    for i = 0 : deg
      if ( mod ( i + j, 2 ) == 0 )
        k = k + 1;
        c0(i+BASE,j+BASE) = fpd(k) * wpd(k);
      else
        c0(i+BASE,j+BASE) = 0.0;
      end
    end
  end
%
%  Compute the matrix-matrix product G(f)*P_2' and store it in RAUX1.
%
  raux1 = zeros(degmax+1,deg+2);
  raux1 = dgemm ( 'n', 't', deg + 1, deg + 1, deg + 2, 1.0, ...
    c0, degmax + 2, raux2, degmax + 1, 0.0, raux1, degmax + 1 );
%
%  Build the matrix P_1 and store it in RAUX2.
%
  for i = 0 : deg
    angle = i * pi / deg;
    pt = - cos ( angle );
    raux2(0+BASE:deg+BASE,i+1) = cheb ( deg, pt );
  end
%
%  Compute the matrix-matrix product C(f) = P_1 * ( G(f) * P_2' )
%  and store it in C0.
%
  c0 = dgemm ( 'n', 'n', deg + 1, deg + 1, deg + 1, 1.0, ...
    raux2, degmax + 1, raux1, degmax + 1, 0.0, c0, degmax + 2 );

  c0(deg+BASE,0+BASE) = c0(deg+BASE,0+BASE) / 2.0;
%
%  Estimate the error.
%
  esterr = 0.0;
  for j = 0 : 2
    for i = 0 : deg - j
      esterr = esterr + abs ( c0(i+BASE,deg-i-j+BASE) );
    end
  end
  esterr = 2.0 * esterr;

  return
end
