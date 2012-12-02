function [ nc, c ] = roots_to_r8poly ( nroots, roots )

%*****************************************************************************80
%
%% ROOTS_TO_R8POLY converts polynomial roots to polynomial coefficients.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NROOTS, the number of roots specified.
%
%    Input, real ROOTS(NROOTS), the roots.
%
%    Output, integer NC, the order of the polynomial, which will be NROOTS+1.
%
%    Output, real C(NC), the coefficients of the polynomial.
%
  nc = nroots + 1;
%
%  Initialize C to (0, 0, ..., 0, 1).
%  Essentially, we are setting up a divided difference table.
%
  xtab(1:nc-1) = roots(1:nroots);
  xtab(nc) = 0.0;

  c(1:nc-1) = 0.0;
  c(nc) = 1.0;
%
%  Convert to standard polynomial form by shifting the abscissas
%  of the divided difference table to 0.
%
  [ xtab, c ] = dif_shift_zero ( nc, xtab, c );

  return
end
