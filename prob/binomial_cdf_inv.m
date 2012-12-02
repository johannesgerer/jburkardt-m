function x = binomial_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% BINOMIAL_CDF_INV inverts the Binomial CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%    0.0 <= CDF <= 1.0.
%
%    Input, integer A, the number of trials.
%    1 <= A.
%
%    Input, real B, the probability of success on one trial.
%    0.0 <= B <= 1.0.
%
%    Output, integer X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BINOMIAL_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'BINOMIAL_CDF_INV - Fatal error!' );
  end

  cdf2 = 0.0;

  for x2 = 0 : a

    pdf = binomial_pdf ( x2, a, b );

    cdf2 = cdf2 + pdf;

    if ( cdf <= cdf2 )
      x = x2;
      return
    end

  end

  return
end
