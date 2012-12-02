function [ ntab2, xtab2, diftab2 ] = dif_antideriv ( ntab, xtab, diftab )

%*****************************************************************************80
%
%% DIF_ANTIDERIV computes the antiderivative of a divided difference polynomial.
%
%  Discussion:
%
%    The routine uses the divided difference representation
%    of a polynomial to compute the divided difference representation
%    of the antiderivative of the polynomial.
%
%    The antiderivative of a polynomial P(X) is any polynomial Q(X)
%    with the property that d/dX Q(X) = P(X).
%
%    This routine chooses the antiderivative whose constant term is zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NTAB, the size of the difference table.
%
%    Input, real XTAB(NTAB), the abscissas of the
%    difference table.
%
%    Input, real DIFTAB(NTAB), the difference table.
%
%    Input, integer NTAB2, the size of the difference table for the
%    antiderivative, which will be NTAB+1.
%
%    Input, real XTAB2(NTAB2), the abscissas of the
%    difference table for the antiderivative.
%
%    Input, real DIFTAB2(NTAB2), the difference table
%    for the antiderivative.
%

%
%  Copy the input data, and shift the abscissas to zero.
%
  xtab1(1:ntab) = xtab(1:ntab);
  diftab1(1:ntab) = diftab(1:ntab);

  [ xtab1, diftab1 ] = dif_shift_zero ( ntab, xtab1, diftab1 );
%
%  Append a final zero to XTAB.
%
  ntab2 = ntab + 1;
  xtab2(1:ntab2) = 0.0;
%
%  Get the antiderivative of the standard form polynomial.
%
  diftab2 = r8poly_ant_cof ( ntab, diftab1 );

  return
end
