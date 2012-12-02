function value = genz_integral ( indx, ndim, a, b, alpha, beta )

%*****************************************************************************80
%
%% GENZ_INTEGRAL computes the exact integrals of the test functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2007
%
%  Author:
%
%    Alan Genz
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Alan Genz,
%    A Package for Testing Multiple Integration Subroutines,
%    in Numerical Integration:
%    Recent Developments, Software and Applications,
%    edited by Patrick Keast, Graeme Fairweather,
%    D Reidel, 1987, pages 337-340,
%    LC: QA299.3.N38.
%
%  Parameters:
%
%    Input, integer INDX, the index of the test.
%
%    Input, integer NDIM, the spatial dimension.
%
%    Input, real A(NDIM), B(NDIM), the lower and upper limits
%    of integration.
%
%    Input, real ALPHA(NDIM), BETA(NDIM), parameters 
%    associated with the integrand function.
%
%    Output, real VALUE, the exact value of the integral.
%

%
%  Oscillatory.
%
  if ( indx == 1 )

    value = 0.0;
%
%  Generate all sequences of NDIM 0's and 1's.
%
    rank = 0;
    ic = [];

    while ( 1 )

      [ rank, ic ] = tuple_next ( 0, 1, ndim, rank, ic );

      if ( rank == 0 )
        break
      end

      total = 2.0 * pi * beta(1);
      for j = 1 : ndim
        if ( ic(j) ~= 1 )
          total = total + alpha(j);
        end
      end

      isum = sum ( ic(1:ndim) );

      s = 1 + 2 * ( floor ( isum / 2 ) * 2 - isum );

      if ( mod ( ndim, 2 ) == 0 )
        value = value + s * cos ( total );
      else
        value = value + s * sin ( total );
      end

    end

    if ( 1 < mod ( ndim, 4 ) )
      value = - value;
    end
%
%  Product Peak.
%
  elseif ( indx == 2 )

    value = 1.0;

    for j = 1 : ndim
      value = value * alpha(j) * ( ...
          atan ( ( 1.0D+00 - beta(j) ) * alpha(j) ) ...
        + atan (           + beta(j)   * alpha(j) ) );
    end
%
%  Corner Peak.
%
  elseif ( indx == 3 )

    value = 0.0;

    sgndm = 1.0;
    for j = 1 : ndim
      sgndm = - sgndm / j;
    end

    rank = 0;
    ic = [];

    while ( 1 )

      [ rank, ic ] = tuple_next ( 0, 1, ndim, rank, ic );

      if ( rank == 0 )
        break
      end

      total = 1.0;

      for j = 1 : ndim
        if ( ic(j) ~= 1 )
          total = total + alpha(j);
        end
      end

      isum = sum ( ic(1:ndim) );

      s = 1 + 2 * ( floor ( isum / 2 ) * 2 - isum );
      value = value + s / total;

    end

    value = value * sgndm;
%
%  Gaussian.
%
  elseif ( indx == 4 )

    value = 1.0;

    ab = sqrt ( 2.0 );
    for j = 1 : ndim
      value = value * ( sqrt ( pi ) / alpha(j) ) * ...
        (   genz_phi ( ( 1.0 - beta(j) ) * ab * alpha(j) ) ...
          - genz_phi (       - beta(j)   * ab * alpha(j) ) );
    end
%
%  C0 Function.
%
  elseif ( indx == 5 )

    value = 1.0;
    for j = 1 : ndim
      ab = alpha(j) * beta(j);
      value = value * ...
        ( 2.0 - exp ( - ab ) - exp ( ab - alpha(j) ) ) / alpha(j);
    end
%
%  Discontinuous.
%
  elseif ( indx == 6 )

    value = 1.0;
    for j = 1 : ndim
      value = value * ( exp ( alpha(j) * beta(j) ) - 1.0 ) / alpha(j);
    end

  end

  return
end
