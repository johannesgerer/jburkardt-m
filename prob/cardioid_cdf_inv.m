function x = cardioid_cdf_inv ( cdf, a, b, x )

%*****************************************************************************80
%
%% CARDIOID_CDF_INV inverts the Cardioid CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%    0 <= CDF <= 1.
%
%    Input, real A, B, the parameters.
%    0.0 <= B <= 0.5.
%
%    Output, real X, the argument with the given CDF.
%    A - PI <= X <= A + PI.
%
  tol = 0.000001;

  if ( cdf <= 0.0 )

    x = a - pi;

  elseif ( cdf < 1.0 )

    x = a;

    it = 0;

    while ( 1 )

      fx = cdf - ( pi + x - a + 2.0 * b * sin ( x - a ) ) / ( 2.0 * pi );

      if ( abs ( fx ) < tol )
        break
      end

      if ( 10 < it )
        error ( 'CARDIOID_CDF_INV - Too many iterations!' );
      end

      fp = - ( 1.0 + 2.0 * b * cos ( x - a ) ) / ( 2.0 * pi );

      x = x - fx / fp;
      x = max ( x, a - pi );
      x = min ( x, a + pi );

      it = it + 1;

    end

  else

    x = a + pi;

  end

  return
end
