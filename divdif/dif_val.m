function yv = dif_val ( ntab, xtab, diftab, xv )

%*****************************************************************************80
%
%% DIF_VAL evaluates a divided difference polynomial at a point.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2004
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
%    Input, integer NTAB, the number of divided difference
%    coefficients in DIFTAB, and the number of points XTAB.
%
%    Input, real XTAB(NTAB), the X values upon which the
%    divided difference polynomial is based.
%
%    Input, real DIFTAB(NTAB), the divided difference
%    polynomial coefficients.
%
%    Input, real XV, the value where the polynomial
%    is to be evaluated.
%
%    Output, real YV, the value of the polynomial at XV.
%
  yv = diftab(ntab);
  for i = 1 : ntab - 1
    yv = diftab(ntab-i) + ( xv - xtab(ntab-i) ) * yv;
  end

  return
end
