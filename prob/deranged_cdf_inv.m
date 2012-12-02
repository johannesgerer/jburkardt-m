function x = deranged_cdf_inv ( cdf, a )

%*****************************************************************************80
%
%% DERANGED_CDF_INV inverts the Deranged CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
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
%    Input, integer A, the number of items.
%    1 <= A.
%
%    Output, integer X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DERANGED_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'DERANGED_CDF_INV - Fatal error!' );
  end

  cdf2 = 0.0;

  for x2 = 0 : a

    pdf = deranged_pdf ( x2, a );

    cdf2 = cdf2 + pdf;

    if ( cdf <= cdf2 )
      x = x2;
      return
    end

  end

  x = a;

  return
end
