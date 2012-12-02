function yi = lagrange_approx_1d ( m, nd, xd, yd, ni, xi )

%*****************************************************************************80
%
%% LAGRANGE_APPROX_1D evaluates the Lagrange approximant of degree M.
%
%  Discussion:
%
%    The Lagrange approximant L(M,ND,XD,YD)(X) is a polynomial of
%    degree M which approximates the data (XD(I),YD(I)) for I = 1 to ND.
%
%    We can represent any polynomial of degree M+1 as the sum of the Lagrange 
%    basis functions at the M+1 Chebyshev points.
%
%      L(M)(X) = sum ( 1 <= I <= M+1 ) C(I) LB(M,XC)(X)
%
%    Given our data, we can seek the M+1 unknown coefficients C which minimize
%    the norm of || L(M)(XD(1:ND)) - YD(1:ND) ||.
%
%    Given the coefficients, we can then evaluate the polynomial at the
%    points XI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the polynomial degree.
%
%    Input, integer ND, the number of data points.
%    ND must be at least 1.
%
%    Input, real XD(ND,1), the data points.
%
%    Input, real YD(ND,1), the data values.
%
%    Input, integer NI, the number of interpolation points.
%
%    Input, real XI(NI,1), the interpolation points.
%
%    Output, real YI(NI,1), the interpolated values.
%

%
%  Evaluate the Chebyshev points.
%
  xc = r8vec_chebyspace ( m + 1, -1.0, +1.0 );
%
%  Evaluate the Lagrange basis functions for the Chebyshev points 
%  at the data points.
%
  ld = lagrange_basis_1d ( m + 1, xc, nd, xd );
%
%  The value of the Lagrange approximant at each data point should
%  approximate the data value: LD * YC = YD, where YC are the unknown
%  coefficients.
%
  yc = ld \ yd;
%
%  Now we want to evaluate the Lagrange approximant at the "interpolant
%  points": LI * YC = YI;
%
  li = lagrange_basis_1d ( m + 1, xc, ni, xi );
  yi = li * yc;

  return
end
