function [ ndp, xdp, ydp ] = dif_deriv ( nd, xd, yd )

%*****************************************************************************80
%
%% DIF_DERIV computes the divided difference table for a derivative.
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
%    Input, integer ND, the size of the input table.
%
%    Input, real XD(ND), the abscissas for the divided
%    difference table.
%
%    Input, real YD(ND), the divided difference table.
%
%    Output, integer NDP, the size of the output table, which is ND-1.
%
%    Input, real XDP(NDP), the abscissas for the divided
%    difference table for the derivative.
%
%    Output, real YDP(NDP), the divided difference
%    table for the derivative.
%

%  Using a temporary copy of the difference table, shift the
%  abscissas to zero.
%
  xd_temp(1:nd) = xd(1:nd);
  yd_temp(1:nd) = yd(1:nd);

  [ xd_temp, yd_temp ] = dif_shift_zero ( nd, xd_temp, yd_temp );
%
%  Construct the derivative.
%
  ndp = nd - 1;

  xdp(1:ndp) = 0.0;

  for i = 1 : ndp
    ydp(i) = i * yd_temp(i+1);
  end

  return
end
