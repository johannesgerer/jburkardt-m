function value = pd2val ( deg, degmax, c0, tg1, tg2 )

%*****************************************************************************80
%
%% PD2VAL evaluates the Padua2 interpolant.
%
%  Discussion:
%
%    This function returns the value of the interpolant at (TG1,TG2).
%    C0 is the matrix of the coefficients computed by PADUA2.
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
%    Input, real C0(0+1:DEGMAX+1+1,0+1:DEG+1), the coefficient matrix.
%
%    Input, real TG1, TG2, the first and second coordinates of
%    the target point.
%
%    Output, real VALUE, the value of the interpolant at the target point.
%
  BASE = 1;
%
%  Compute the normalized Chebyshev polynomials at the target point.
%
  ttg1 = cheb ( deg, tg1 );
  ttg2 = cheb ( deg, tg2 );
%
%  Evaluate the interpolant.
%
  value = 0.0;
  for i = deg : -1 : 0
    value = value + ttg2(deg-i+1) ...
      * ( ttg1(0+BASE:i+BASE)' * c0(0+BASE:i+BASE,deg-i+BASE) );
  end

  return
end
