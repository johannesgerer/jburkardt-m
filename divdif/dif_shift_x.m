function [ xd, yd ] = dif_shift_x ( nd, xd, yd, xv )

%*****************************************************************************80
%
%% DIF_SHIFT_X replaces one abscissa of a divided difference table with a new one.
%
%  Discussion:
%
%    The routine shifts the representation of a divided difference polynomial by
%    dropping the last X value in XD, and adding a new X value to the
%    beginning of the XD array, suitably modifying the coefficients stored
%    in YD.
%
%    The representation of the polynomial is changed, but the polynomial itself
%    should be identical.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Carl deBoor,
%    A Practical Guide to Splines,
%    Springer, 2001,
%    ISBN: 0387953663,
%    LC: QA1.A647.v27.
%
%  Parameters:
%
%    Input, integer ND, the number of divided difference coefficients, and
%    the number of entries in XD.
%
%    Input, real XD(ND), the abscissas for the divided difference table.
%
%    Input, real YD(ND), the divided difference table.
%
%    Input, real XV, a new X value which is to be used in
%    the representation of the polynomial.  On output, XD(1) equals
%    XV and the representation of the polynomial has been suitably changed.
%    Note that XV does not have to be distinct from any of the original XD
%    values.
%
%    Output, real XD(ND), the updated abscissas.
%
%    Output, real YD(ND), the updated divided difference table.
%

%
%  Recompute the divided difference coefficients.
%
  for i = nd - 1 : -1 : 1
    yd(i) = yd(i) + ( xv - xd(i) ) * yd(i+1);
  end
%
%  Shift the XD values up one position and insert XV.
%
  xd(2:nd) = xd(1:nd-1);

  xd(1) = xv;

  return
end
