function value = genz_function ( indx, ndim, z, alpha, beta )

%*****************************************************************************80
%
%% GENZ_FUNCTION evaluates one of the test integrand functions.
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
%    Input, real Z(NDIM), the point at which the integrand 
%    is to be evaluated.
%
%    Input, real ALPHA(NDIM), BETA(NDIM), parameters 
%    associated with the integrand function.
%
%    Output, real VALUE, the value of the test function. 
%
  value = 0.0;
%
%  Oscillatory.
%
  if ( indx == 1 )

    total = 2.0 * pi * beta(1) + sum ( z(1:ndim) );
    value = cos ( total );
%
%  Product Peak.
%
  elseif ( indx == 2 )
      
    total = 1.0;
    for dim = 1 : ndim
      total = total * ( 1.0 / alpha(dim)^2 + ( z(dim) - beta(dim) )^2 );
    end

    value = 1.0 / total;
%
%  Corner Peak.
%
  elseif ( indx == 3 )
%
%  For this case, the BETA's are used to randomly select
%  a corner for the peak.
%
    total = 1.0;
    for j = 1 : ndim
      if ( beta(j) < 0.5 )
        total = total + z(j);
      else
        total = total + alpha(j) - z(j);
      end
    end
    value = 1.0 / total^( ndim + 1 );
%
%  Gaussian.
%
  elseif ( indx == 4 )

    total = 0.0;
    for j = 1 : ndim
      total = total + ( alpha(j) * ( z(j) - beta(j) ) )^2;
    end
    value = exp ( - total );
%
%  C0 Function.
%
  elseif ( indx == 5 )

    total = alpha(1:ndim) * ( abs ( z(1:ndim) - beta(1:ndim) ) )';
    value = exp ( - total );
%
%  Discontinuous.
%
  elseif ( indx == 6 )

    if ( any ( beta(1:ndim) < z(1:ndim) ) ) 
      value = 0.0;
    else
      total = alpha(1:ndim) * z(1:ndim)';
      value = exp ( total );
    end

  end

  return
end
