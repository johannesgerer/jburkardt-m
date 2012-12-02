function yi = lagrange_value_1d ( nd, xd, yd, ni, xi )

%*****************************************************************************80
%
%% LAGRANGE_VALUE_1D evaluates the Lagrange interpolant.
%
%  Discussion:
%
%    The Lagrange interpolant L(ND,XD,YD)(X) is the unique polynomial of
%    degree ND-1 which interpolates the points (XD(I),YD(I)) for I = 1
%    to ND.
%
%    The Lagrange interpolant can be constructed from the Lagrange basis
%    polynomials.  Given ND distinct abscissas, XD(1:ND), the I-th Lagrange 
%    basis polynomial LB(ND,XD,I)(X) is defined as the polynomial of degree 
%    ND - 1 which is 1 at  XD(I) and 0 at the ND - 1 other abscissas.
%
%    Given data values YD at each of the abscissas, the value of the
%    Lagrange interpolant may be written as
%
%      L(ND,XD,YD)(X) = sum ( 1 <= I <= ND ) LB(ND,XD,I)(X) * YD(I)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
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
  lb = lagrange_basis_1d ( nd, xd, ni, xi );

  yi = lb * yd;

  return
end
