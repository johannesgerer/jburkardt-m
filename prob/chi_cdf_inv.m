function x = chi_cdf_inv ( cdf, a, b, c )

%*****************************************************************************80
%
%% CHI_CDF_INV inverts the Chi CDF.
%
%  Discussion:
%
%    A simple bisection method is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%
%    Input, real A, B, C, the parameters of the PDF.
%    0 < B,
%    0 < C.
%
%    Output, real X, the corresponding argument of the CDF.
%
  it_max = 100;
  tol = 0.0001;

  if ( cdf <= 0.0 )
    x = a;
    return
  elseif ( 1.0 <= cdf )
    x = r8_huge ( );
    return
  end

  x1 = a;
  cdf1 = 0.0;

  x2 = a + 1.0;

  while ( 1 )

    cdf2 = chi_cdf ( x2, a, b, c );

    if ( cdf < cdf2 )
      break;
    end

    x2 = a + 2.0 * ( x2 - a );

  end
%
%  Now use bisection.
%
  it = 0;

  while ( 1 )

    it = it + 1;

    x3 = 0.5 * ( x1 + x2 );
    cdf3 = chi_cdf ( x3, a, b, c );

    if ( abs ( cdf3 - cdf ) < tol )
      x = x3;
      return
    end

    if ( it_max < it )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CHI_CDF_INV - Fatal error!\n' );
      fprintf ( 1, '  Iteration limit exceeded.\n' );
      error ( 'CHI_CDF_INV - Fatal error!' );
    end

    if ( ( cdf3 < cdf & cdf1 < cdf ) | ( cdf < cdf3 & cdf < cdf1 ) )
      x1 = x3;
      cdf1 = cdf3;
    else
      x2 = x3;
      cdf2 = cdf3;
    end

  end

  return
end
