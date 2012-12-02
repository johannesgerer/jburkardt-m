function x = poisson_cdf_inv ( cdf, a )

%*****************************************************************************80
%
%% POISSON_CDF_INV inverts the Poisson CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF, a value of the CDF.
%    0 <= CDF < 1.
%
%    Input, real A, the parameter of the PDF.
%    0.0 < A.
%
%    Output, integer X, the corresponding argument.
%
  xmax = 100;
%
%  Now simply start at X = 0, and find the first value for which
%  CDF(X-1) <= CDF <= CDF(X).
%
  sum2 = 0.0;

  for i = 0 : xmax

    sumold = sum2;

    if ( i == 0 )
      new = exp ( -a );
      sum2 = new;
    else
      last = new;
      new = last * a / i;
      sum2 = sum2 + new;
    end

    if ( sumold <= cdf & cdf <= sum2 )
      x = i;
      return
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POISSON_CDF_INV - Warning!\n' );
  fprintf ( 1, '  Exceeded XMAX = %d\n', xmax );

  x = xmax;

  return
end
