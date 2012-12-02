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
  xv = 0.0;

  for i = 1 : nd
    [ xd, yd ] =  dif_shift_x ( nd, xd, yd, xv );
  end

  return
end
