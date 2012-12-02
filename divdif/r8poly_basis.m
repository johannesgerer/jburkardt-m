function poly_cof = r8poly_basis ( ntab, xtab )

%*****************************************************************************80
%
%% R8POLY_BASIS computes all Lagrange basis polynomial in standard form.
%
%  Discussion:
%
%    The I-th Lagrange basis polynomial for a set of NTAB X values XTAB,
%    L(I,NTAB,XTAB)(X) is a polynomial of order NTAB-1 which is zero at
%    XTAB(J) for J not equal to I, and 1 when J is equal to I.
%
%    The Lagrange basis polynomials have the property that the interpolating
%    polynomial through a set of NTAB data points (XTAB,YTAB) may be
%    represented as
%
%      P(X) = Sum ( 1 <= I <= N ) YTAB(I) * L(I,NTAB,XTAB)(X)
%
%    Higher order interpolation at selected points may be accomplished
%    using repeated X values, and scaled derivative values.
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
%    Input, integer NTAB, the number of data points XTAB.
%
%    Input, real XTAB(NTAB), the X values upon which the
%    Lagrange basis polynomial is to be based.
%
%    Output, real POLY_COF(NTAB,NTAB), the polynomial
%    coefficients for the I-th Lagrange basis polynomial are stored
%    in column I.  POLY_COF(1,I) is the constant term, and POLY_COF(1,NTAB)
%    is the coefficient of X**(NTAB-1).
%

%
%  Initialize POLY_COF to the identity matrix.
%
  poly_cof(1:ntab,1:ntab) = 0.0;
  for i = 1 : ntab
    poly_cof(i,i) = 1.0;
  end
%
%  Compute the divided difference table for the IVAL-th Lagrange basis
%  polynomial.
%
  for i = 1 : ntab
    poly_cof(1:ntab,i) = ( data_to_dif ( ntab, xtab, poly_cof(1:ntab,i) ) )';
  end
%
%  Convert the divided difference table coefficients to standard polynomial
%  coefficients.
%
  for i = 1 : ntab
    poly_cof(1:ntab,i) = ( dif_to_r8poly ( ntab, xtab, poly_cof(1:ntab,i) ) )';
  end

  return
end
