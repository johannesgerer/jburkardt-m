function x = dipole_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% DIPOLE_CDF_INV inverts the Dipole CDF.
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
%    07 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%
%    Input, real A, B, the parameters of the PDF.
%    -1.0 <= B <= 1.0.
%
%    Output, real X, the corresponding argument of the CDF.
%
  it_max = 100;
  tol = 0.0001;
%
%  Take care of horrible input.
%
  if ( cdf <= 0.0 )
    x = -r8_huge ( )
    return
  elseif ( 1.0 <= cdf )
    x = r8_huge ( )
    return
  end
%
%  Seek X1 < X < X2.
%
  x1 = -1.0;

  while ( 1 )

    cdf1 = dipole_cdf ( x1, a, b );

    if ( cdf1 <= cdf )
      break
    end

    x1 = 2.0 * x1;

  end

  x2 = 1.0;

  while ( 1 )

    cdf2 = dipole_cdf ( x2, a, b );

    if ( cdf <= cdf2 )
      break
    end

    x2 = 2.0 * x2;

  end
%
%  Now use bisection.
%
  it = 0;

  while ( 1 )

    it = it + 1;

    x3 = 0.5 * ( x1 + x2 );
    cdf3 = dipole_cdf ( x3, a, b );

    if ( abs ( cdf3 - cdf ) < tol )
      x = x3;
      break
    end

    if ( it_max < it )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DIPOLE_CDF_INV - Fatal error!\n' );
      fprintf ( 1, '  Iteration limit exceeded.\n' );
      error ( 'DIPOLE_CDF_INV - Fatal error!' );
    end

    if ( ( cdf3 <= cdf & cdf1 <= cdf ) | ( cdf <= cdf3 & cdf <= cdf1 ) )
      x1 = x3;
      cdf1 = cdf3;
    else
      x2 = x3;
      cdf2 = cdf3;
    end

  end

  return
end
