function [ ntab, xtab, diftab ] = roots_to_dif ( nroots, roots )

%*****************************************************************************80
%
%% ROOTS_TO_DIF sets a divided difference table for a polynomial from its roots.
%
%  Discussion:
%
%    This turns out to be a simple task, because of two facts:
%
%    * The divided difference polynomial of one smaller degree which
%      passes through the values ( ROOT(I), 0 ) is the zero polynomial,
%      and hence has a zero divided difference table.
%
%    * We want a polynomial of one degree higher, but we don't want it
%      to pass through an addditional point.  Instead, we specify that
%      the polynomial is MONIC.  This means that the divided difference
%      table is almost the same as for the zero polynomial, except that
%      there is one more pair of entries, an arbitrary X value, and
%      a Y value of 1.
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
%  Parameters:
%
%    Input, integer NROOTS, is the number of roots.
%
%    Input, real ROOTS(NROOTS), the roots of
%    the polynomial.
%
%    Output, integer NTAB, is equal to NROOTS+1.
%
%    Output, real XTAB(NTAB), the abscissas of the divided
%    difference table.
%
%    Output, real DIFTAB(NTAB), the divided difference
%    table.
%
  ntab = nroots + 1;
%
%  Build the appropriate difference table for the polynomial
%  through ( ROOTS(I), 0 ) of degree NTAB-2.
%
  diftab(1:ntab-1) = 0.0;
%
%  Append the extra data to make a monic polynomial of degree NTAB-1
%  which is zero at the NTAB-1 roots.
%
  xtab(1:ntab-1) = roots(1:ntab-1);
  xtab(ntab) = 0.0;

  diftab(ntab) = 1.0;

  return
end
