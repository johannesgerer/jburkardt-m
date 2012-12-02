function [ x, h, status ] = p00_step ( problem, option, nvar, x, par_index, ...
  h, hmin, hmax )

%*****************************************************************************80
%
%% P00_STEP takes one continuation step.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the starting point.
%
%    Input, integer PAR_INDEX, the continuation parameter. 
%    If the program is free to choose this value, set it to 0.
%
%    Input, real H, HMIN, HMAX, the suggested step, and the minimum
%    and maximum stepsizes.  H may be negative.
%
%    Output, real X(NVAR), the new point, if STATUS = 0.
%
%    Output, real H, the stepsize that was used.
%
%    Output, integer STATUS, the status of the calculation.
%    nonnegative, successful.
%    negative, the Newton iteration failed repeatedly even when the
%    minimum stepsize was used.
%

%
%  Compute the tangent.
%
  tan = p00_tan ( problem, option, nvar, x );
%
%  Estimate the next point.
%
  h_reduction = 0

  while ( 1 )

    xt = x + h * tan;
%
%  Use the Newton method.
%
    [ xt, status ] = p00_newton ( problem, option, nvar, xt, par_index );
 
    if ( 0 <= status )

      if ( h_reduction == 0 )
        if ( status <= 1 )
          h = h * 4.0;
        elseif ( status <= 3 )
          h = h * 2.0;
        end
        if ( hmax < abs ( h ) )
          h = hmax * r8_sign ( h );
        end
      end

      break
    end

    if ( abs ( h ) <= hmin )
      break
    end

    if ( hmin < abs ( h ) )
      h = h / 2.0;
      if ( abs ( h ) < hmin )
        h = hmin * r8_sign ( h );
      end
      h_reduction = h_reduction + 1;
    end

  end

  x = xt;

  return
end
