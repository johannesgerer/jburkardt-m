function yval = dif_val ( ntab, xtab, diftab, xval )

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
%    Carl de Boor,
%    A Practical Guide to Splines,
%    Springer Verlag, 1978.
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
%    Input, real XVAL, the value where the polynomial
%    is to be evaluated.
%
%    Output, real YVAL, the value of the polynomial at XVAL.
%
  yval = diftab(ntab);
  for i = 1 : ntab-1
    yval = diftab(ntab-i) + ( xval - xtab(ntab-i) ) * yval;
  end

  return
end
