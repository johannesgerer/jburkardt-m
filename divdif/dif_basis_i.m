function diftab = dif_basis_i ( ival, ntab, xtab )

%*****************************************************************************80
%
%% DIF_BASIS_I computes the I-th Lagrange basis polynomial in divided difference form.
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
%    Input, integer IVAL, the index of the desired Lagrange basis polynomial.
%    IVAL should be between 1 and NTAB.
%
%    Input, integer NTAB, the number of data points XTAB.
%
%    Input, real XTAB(NTAB), the X values upon which the
%    Lagrange basis polynomial is to be based.
%
%    Output, real DIFTAB(NTAB), the divided difference table
%    for the IVAL-th Lagrange basis polynomial.
%

%
%  Check IVAL.
%
  if ( ival < 1 | ntab < ival )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIF_BASIS_I - Fatal error!\n' );
    fprintf ( 1, '  IVAL must be between 1 and %d\n', ntab );
    fprintf ( 1, '  but your value is %d\n', ival );
    error ( 'DIF_BASIS_I - Fatal error!' );
  end
%
%  Initialize DIFTAB to Delta(I,J).
%
  diftab(1:ntab) = 0.0;
  diftab(ival) = 1.0;
%
%  Compute the IVAL-th Lagrange basis polynomial.
%
  diftab = data_to_dif ( ntab, xtab, diftab );

  return
end
