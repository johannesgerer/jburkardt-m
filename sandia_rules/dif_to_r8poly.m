function c = dif_to_r8poly ( ntab, xtab, diftab )

%*****************************************************************************80
%
%% DIF_TO_R8POLY converts a divided difference table to standard polynomial form.
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
%    Input, integer NTAB, the number of coefficients, and abscissas.
%
%    Input, real XTAB(NTAB), the X values used in the divided
%    difference representation of the polynomial.
%
%    Input, real DIFTAB(NTAB), the divided difference table.
%
%    Output, real C(NTAB), the standard form polyomial coefficients.
%    C(1) is the constant term, and C(NTAB) is the coefficient
%    of X**(NTAB-1).
%
  c(1:ntab) = diftab(1:ntab);
%
%  Recompute the divided difference coefficients.
%
  for j = 1 : ntab-1
    for i = 1 : ntab-j
      c(ntab-i) = c(ntab-i) - xtab(ntab-i-j+1) * c(ntab-i+1);
    end
  end

  return
end
