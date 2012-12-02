function c = data_to_r8poly ( ntab, xtab, ytab )

%*****************************************************************************80
%
%% DATA_TO_R8POLY computes the coefficients of a polynomial interpolating data.
%
%  Discussion:
%
%    Space can be saved by using a single array for both the C and
%    YTAB parameters.  In that case, the coefficients will
%    overwrite the Y data without interfering with the computation.
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
%    Input, integer NTAB, the number of data points.
%
%    Input, real XTAB(NTAB), YTAB(NTAB), the data values.
%
%    Output, real C(NTAB), the coefficients of the
%    polynomial that passes through the data (XTAB,YTAB).  C(1) is the
%    constant term.
%
  if ( ~r8vec_distinct ( ntab, xtab ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DATA_TO_R8POLY - Fatal error!\n' );
    fprintf ( 1, '  Two entries of XTAB are equal!\n' );
    error ( 'DATA_TO_R8POLY - Fatal error!' );
  end

  diftab = data_to_dif ( ntab, xtab, ytab );

  c = dif_to_r8poly ( ntab, xtab, diftab );

  return
end
