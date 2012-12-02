function diftab = dif_basis ( ntab, xtab )

%*****************************************************************************80
%
%% DIF_BASIS computes all Lagrange basis polynomials in divided difference form.
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
%    Input, integer NTAB, the number of X data points XTAB, and the number of
%    basis polynomials to compute.
%
%    Input, real XTAB(NTAB), the X values upon which the
%    Lagrange basis polynomials are to be based.
%
%    Output, real DIFTAB(NTAB,NTAB), the set of divided
%    difference tables.  Column I of DIFTAB contains the table for
%    the I-th Lagrange basis polynomial.
%

%
%  Initialize DIFTAB to the identity matrix.
%
  diftab(1:ntab,1:ntab) = 0.0;
  for i = 1 : ntab
    diftab(i,i) = 1.0;
  end
%
%  Compute each Lagrange basis polynomial.
%
  for i = 1 : ntab
    diftab(1:ntab,i) = ( data_to_dif ( ntab, xtab, diftab(1:ntab,i) ) )';
  end

  return
end
