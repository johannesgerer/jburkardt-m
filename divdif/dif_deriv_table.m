function [ xdp, ydp ] = dif_deriv_table ( nd, xd, yd )

%*****************************************************************************80
%
%% DIF_DERIV_TABLE computes the divided difference table for a derivative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 June 2013
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
%    Output, real XDP(ND-1), the abscissas for the divided
%    difference table for the derivative.
%
%    Output, real YDP(ND-1), the divided difference
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
  xdp(1:nd-1) = 0.0;

  for i = 1 : nd - 1
    ydp(i) = i * yd_temp(i+1);
  end

  return
end
