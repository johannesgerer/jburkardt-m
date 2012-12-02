function [ pxmin, pxmax, pxdiv, nticks ] = axis_limits ( xmin, xmax, ndivs )

%*****************************************************************************80
%
%% AXIS_LIMITS returns "nice" axis limits for a plot.
%
%  Discussion:
%
%    The routine is given information about the range of a variable, and
%    the number of divisions desired.  It returns suggestions for
%    labeling a plotting axis for the variable, including the
%    starting and ending points, the length of a single division,
%    and a suggested tick marking for the axis.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XMIN, XMAX, the lower and upper values that must be
%    included on the axis.  XMIN must be less than XMAX.
%
%    Input, integer NDIVS, the number of divisions desired along
%    the axis.
%
%    Output, real PXMIN, PXMAX, the recommended lower and upper axis
%    bounds.  It will be the case that PXMIN <= XMIN < XMAX <= PXMAX.
%
%    Output, real PXDIV, the recommended size of a single division.
%
%    Output, integer NTICKS, a suggested number of ticks to use,
%    if subdividing each of the NDIVS divisions of the axis.
%
  nsteps = 5;

  if ( xmin == xmax )
    xmin = xmin - 0.5;
    xmax = xmax + 0.5;
  elseif ( xmax < xmin )
    temp = xmin;
    xmin = xmax;
    xmax = temp;
  end

  if ( ndivs <= 0 )
    ndivs = 5;
  end

  steps(1:5) =  [ 1.0, 2.0, 4.0, 5.0, 10.0 ];
  iticks(1:5) = [ 5, 4, 4, 5, 5 ];
%
%  Set RELDIF, the size of the X interval divided by the largest X.
%
  if ( xmax ~= xmin ) 
    reldif = ( xmax - xmin ) / max ( abs ( xmax ), abs ( xmin ) );
  else
    reldif = 0.0;
  end
%
%  If RELDIF tells us that XMIN and XMAX are extremely close,
%  do some simple things.
%
  if ( reldif < 0.00001 )

    if ( xmax == 0.0 )

      pxdiv = 1.0;

    else

      intlog = floor ( r_log_10 ( xmax ) );

      if ( intlog < 0 )
        intlog = intlog - 1;
      end

      pxdiv = 10.0^intlog;

      if ( 1.0 < pxdiv )
        pxdiv = 1.0;
      end

    end

    nticks = 5;
    pxmin = xmax - floor ( ndivs / 2 ) * pxdiv;
    pxmax = xmax + ( ndivs - floor ( ndivs / 2 ) ) * pxdiv;
%
%  But now handle the more general case, when XMIN and XMAX
%  are relatively far apart.
%
  else

    best = -999.0;
%
%  On second loop, increase INTLOG by 1.
%
    for j = 1 : 2
%
%  Compute INTLOG, roughly the logarithm base 10 of the range
%  divided by the number of divisions.
%
      intlog = floor ( ( r8_log_10 ( ( xmax - xmin ) / ndivs ) ) ) + ( j - 1 );

      if ( xmax - xmin  < ndivs )
        intlog = intlog - 1;
      end
%
%  Now consider taking 1, 2, 4, 5 or 10 steps of size 10**INTLOG:
%
      for i = 1 : nsteps
%
%  Compute the size of each step.
%
        pxdiv2 = steps(i) * 10.0^intlog;
%
%  Make sure NDIVS steps can reach from XMIN to XMAX, at least.
%
        if ( xmax <= xmin + ndivs * pxdiv2 )
%
%  Now decide where to start the axis.
%  Start the axis at PXMIN2, to the left of XMIN, and
%  representing a whole number of steps of size PXDIV2.
%
          if ( 0.0 <= xmin )
            ival = floor ( xmin / pxdiv2 );
          else
            ival = floor ( xmin / pxdiv2 ) - 1;
          end

          pxmin2 = ival * pxdiv2;
%
%  PXMAX2 is, of course, NDIVS steps above PXMIN2.
%
          pxmax2 = pxmin2 + ndivs * pxdiv2;
%
%  Only consider going on if PXMAX2 is at least XMAX.
%
          if ( xmax <= pxmax2 )
%
%  Now judge this grid by the relative amount of wasted axis length.
%
            good = ( xmax - xmin ) / ( pxmax2 - pxmin2 );

            if ( best < good )
              best = good;
              pxmax = pxmax2;
              pxmin = pxmin2;
              pxdiv = pxdiv2;
              nticks = iticks(i);
            end 
          end
        end
      end
    end
  end
%
%  If necessary, adjust the locations of PXMIN and PXMAX so that the
%  interval is more symmetric in containing XMIN through XMAX.
%
  while ( 1 )

    ilo = floor ( ( xmin - pxmin ) / pxdiv );
    ihi = floor ( ( pxmax - xmax ) / pxdiv );

    if ( ihi < ilo + 2 )
      break;
    end

    pxmin = pxmin - pxdiv;
    pxmax = pxmax - pxdiv;

  end

  return
end
