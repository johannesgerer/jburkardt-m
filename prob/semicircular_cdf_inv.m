function x = semicircular_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% SEMICIRCULAR_CDF_INV inverts the Semicircular CDF.
%
%  Discussion:
%
%    A simple bisection method is used on the interval [ A - B, A + B ].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2004
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Output, real X, the corresponding argument of the CDF.
%
  it_max = 100;
  tol = 0.0001;

  if ( cdf <= 0.0 )
    x = a - b;
    return
  elseif ( 1.0 <= cdf )
    x = a + b;
    return
  end

  x1 = a - b;
  cdf1 = 0.0;

  x2 = a + b;
  cdf2 = 1.0;
%
%  Now use bisection.
%
  it = 0;

  while ( 1 )

    it = it + 1;

    x3 = 0.5 * ( x1 + x2 );
    cdf3 = semicircular_cdf ( x3, a, b );

    if ( abs ( cdf3 - cdf ) < tol )
      x = x3;
      break
    end

    if ( it_max < it )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SEMICIRCULAR_CDF_INV - Fatal error!\n' );
      fprintf ( 1, '  Iteration limit exceeded.\n' );
      error ( 'SEMICIRCULAR_CDF_INV - Fatal error!' );
    end

    if ( ( cdf <= cdf3 & cdf <= cdf1 ) | ( cdf3 <= cdf & cdf1 <= cdf ) )
      x1 = x3;
      cdf1 = cdf3;
    else
      x2 = x3;
      cdf2 = cdf3;
    end

  end

  return
end
