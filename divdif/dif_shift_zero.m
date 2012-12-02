function [ xd, yd ] = dif_shift_zero ( nd, xd, yd )

%*****************************************************************************80
%
%% DIF_SHIFT_ZERO shifts a divided difference table so that all abscissas are zero.
%
%  Discussion:
%
%    When the abscissas are changed, the coefficients naturally
%    must also be changed.
%
%    The resulting pair (XD, YD) still represents the
%    same polynomial, but the entries in YD are now the
%    standard polynomial coefficients.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2011
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
%    Input, integer ND, the length of the XD and YD arrays.
%
%    Input, real XD(ND), the abscissas of the difference table.
%
%    Input, real YD(ND), the divided difference table.
%
%    Output, real XD(ND), the abscissas of the updated table,
%    which are all zero.
%
%    Output, real YD(ND), the updated divided difference table.
%
  for j = 1 : nd

    for i = nd - 1 : -1 : 1
      yd(i) = yd(i) - xd(i) * yd(i+1);
    end
%
%  Shift the XD values up one position.
%
    xd(2:nd) = xd(1:nd-1);

    xd(1) = 0.0;

  end

  return
end
