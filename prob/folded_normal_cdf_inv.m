function x = folded_normal_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% FOLDED_NORMAL_CDF_INV inverts the Folded Normal CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2004
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
%    0.0 <= A,
%    0.0 < B.
%
%    Output, real X, the argument of the CDF.
%    0.0 <= X.
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
%
%  Find X1, for which the value of CDF will be too small.
%
  if ( 0.0 <= a )
    x1 = normal_cdf_inv ( cdf, a, b );
  else
    x1 = normal_cdf_inv ( cdf, -a, b );
  end

  x1 = max ( x1, 0.0 );
  cdf1 = folded_normal_cdf ( x1, a, b );
%
%  Find X2, for which the value of CDF will be too big.
%
  cdf2 = ( 1.0 - cdf ) / 2.0;

  xa = normal_cdf_inv ( cdf2, a, b );
  xb = normal_cdf_inv ( cdf2, -a, b );
  x2 = max ( abs ( xa ), abs ( xb ) );
  cdf2 = folded_normal_cdf ( x2, a, b );
%
%  Now use bisection.
%
  it = 0;

  while ( 1 )

    it = it + 1;

    x3 = 0.5 * ( x1 + x2 );
    cdf3 = folded_normal_cdf ( x3, a, b );

    if ( abs ( cdf3 - cdf ) < tol )
      x = x3;
      break
    end

    if ( it_max < it )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'FOLDED_NORMAL_CDF_INV - Fatal error!\n' );
      fprintf ( 1, '  Iteration limit exceeded.\n' );
      error ( 'FOLDED_NORMAL_CDF_INV - Fatal error!' );
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

