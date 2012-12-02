function x = maxwell_cdf_inv ( cdf, a )

%*****************************************************************************80
%
%% MAXWELL_CDF_INV inverts the Maxwell CDF.
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
%    Input, real A, the parameter of the PDF.
%    0 < A.
%
%    Output, real X, the corresponding argument of the CDF.
%
  it_max = 100;
  tol = 0.0001;

  if ( cdf <= 0.0 )
    x = 0.0;
    return
  elseif ( 1.0 <= cdf )
    x = r8_huge ( );
    return
  end

  x1 = 0.0;
  cdf1 = 0.0;

  x2 = 1.0;

  while ( 1 )

    cdf2 = maxwell_cdf ( x2, a );

    if ( cdf < cdf2 )
      break
    end

    x2 = 2.0 * x2;

    if ( 1000000.0 < x2 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MAXWELL_CDF_INV - Fatal error!\n' );
      fprintf ( 1, '  Initial bracketing effort fails.\n' );
      error ( 'MAXWELL_CDF_INV - Fatal error!' );
    end

  end
%
%  Now use bisection.
%
  it = 0;

  while ( 1 )

    it = it + 1;

    x3 = 0.5 * ( x1 + x2 );
    cdf3 = maxwell_cdf ( x3, a );

    if ( abs ( cdf3 - cdf ) < tol )
      x = x3;
      break
    end

    if ( it_max < it )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'MAXWELL_CDF_INV - Fatal error!\n' );
      fprintf ( 1, '  Iteration limit exceeded.\n' );
      error ( 'MAXWELL_CDF_INV - Fatal error!' );
    end

    if ( ( cdf3 <= cdf & cdf1 < cdf ) | ( cdf <= cdf3 & cdf <= cdf1 ) )
      x1 = x3;
      cdf1 = cdf3;
    else
      x2 = x3;
      cdf2 = cdf3;
    end

  end

  return
end
