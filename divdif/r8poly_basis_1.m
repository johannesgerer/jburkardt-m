function poly_cof = r8poly_basis_1 ( ival, ntab, xtab )

%*****************************************************************************80
%
%% R8POLY_BASIS_1 computes the I-th Lagrange basis polynomial in standard form.
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
%    05 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer IVAL, the index of the desired Lagrange basis polynomial.
%    IVAL should be between 1 and NTAB.
%
%    Input, integer NTAB, the number of data points XTAB.
%
%    Input, real XTAB(NTAB), the X values upon which the
%    Lagrange basis polynomial is to be based.
%
%    Output, real POLY_COF(1:NTAB), the polynomial coefficients for the IVAL-th 
%    Lagrange basis polynomial.
%

%
%  Check IVAL.
%
  if ( ival < 1 | ntab < ival )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8POLY_BASE_1 - Fatal error!\n' );
    fprintf ( 1, '  IVAL must be between 1 and %d\n', ntab );
    fprintf ( 1, '  but your value is %d\n', ival );
    error ( 'R8POLY_BASE_1 - Fatal error!' );
  end
%
%  Initialize POLY_COF to the IVAL-th column of the identity matrix.
%
  poly_cof(1:ntab) = 0.0;
  poly_cof(ival) = 1.0;
%
%  Compute the divided difference table for the IVAL-th Lagrange basis
%  polynomial.
%
  poly_cof = data_to_dif ( ntab, xtab, poly_cof );
%
%  Convert the divided difference table coefficients to standard polynomial
%  coefficients.
%
  poly_cof = dif_to_r8poly ( ntab, xtab, poly_cof );

  return
end
