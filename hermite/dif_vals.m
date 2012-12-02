function yv = dif_vals ( nd, xd, yd, nv, xv )

%*****************************************************************************80
%
%% DIF_VALS evaluates a divided difference polynomial at a set of points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2011
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
%    Input, integer ND, the order of the difference table.
%
%    Input, real XD(ND), the X values of the difference table.
%
%    Input, real YD(ND), the divided differences.
%
%    Input, integer NV, the number of evaluation points.
%
%    Input, real XV(NV), the evaluation points.
%
%    Output, real YV(NV), the value of the divided difference
%    polynomial at the evaluation points.
%

%
%  Deal with the blasted curse of row vectors.
%
  yd = yd ( : );
  xd = xd ( : );
  xv = xv ( : );

  yv = zeros ( nv, 1 );

  yv(1:nv) = yd(nd);

  for i = 1 : nd - 1
    yv(1:nv) = yd(nd-i) + ( xv(1:nv) - xd(nd-i) ) .* yv(1:nv);
  end

  return
end
