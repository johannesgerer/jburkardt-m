function p06_limit_test ( option )

%*****************************************************************************80
%
%% P06_LIMIT_TEST seeks limit points for problem 6.
%
%  Discussion:
%
%    We want to find points X such that TAN(7) = 0.
%
%    The number of limit points that may be expected depends on the option:
%
%    There are five options, which vary in the value they fix the
%    elevator value X(6):
%
%      Option   Elevator Value    Limit Points
%
%       1        -0.050              1
%       2        -0.008              3
%       3         0.0                2
%       4         0.05               1
%       5         0.1                1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Raman Mehra, William Kessel, James Carroll,
%    Global stability and contral analysis of aircraft at high angles of attack,
%    Technical Report CR-215-248-1, -2, -3,
%    Office of Naval Research, June 1977.
%
%    Rami Melhem, Werner Rheinboldt,
%    A Comparison of Methods for Determining Turning Points of Nonlinear Equations,
%    Computing,
%    Volume 29, Number 3, September 1982, pages 201-226.
%
%    Albert Schy, Margery Hannah,
%    Prediction of Jump Phenomena in Roll-coupled Maneuvers of Airplanes,
%    Journal of Aircraft,
%    Volume 14, Number 4, 1977,  pages 375-382.
%
%    John Young, Albert Schy, Katherine Johnson,,
%    Prediction of Jump Phenomena in Aircraft Maneuvers, Including
%    Nonlinear Aerodynamic Effects,
%    Journal of Guidance and Control,
%    Volume 1, Number 1, 1978, pages 26-31.
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%    1, X(6) fixed at -0.050, X(7) free, X(8) fixed at 0.0;
%    2, X(6) fixed at -0.008, X(7) free, X(8) fixed at 0.0;
%    3, X(6) fixed at  0.000, X(7) free, X(8) fixed at 0.0;
%    4, X(6) fixed at  0.050, X(7) free, X(8) fixed at 0.0;
%    5, X(6) fixed at  0.100, X(7) free, X(8) fixed at 0.0.
%
  problem = 6;
  lim = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'P06_LIMIT_TEST\n' );
  fprintf ( 1, '  Compute a series of solutions for problem 6.\n' );
  fprintf ( 1, '  We are trying to find limit points X such that\n' );
  fprintf ( 1, '  TAN(%d) = 0.\n', lim );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The option chosen is %d\n', option );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   #   Tan(7)     X1       X2       X3       X4       X5       X6       X7      X8\n' );
  fprintf ( 1, '                Roll     Pitch    Yaw      Attack   Sideslip Elevator Aileron Rudder\n' );
  fprintf ( 1, '\n' );
%
%  Get problem size.
%
  nvar = p00_nvar ( problem, option );

  lim_num = 0;
%
%  Get starting point.
%
  x2 = p00_start ( problem, option, nvar );
%
%  Get the tangent vector.
%
  tan2 = p00_tan ( problem, option, nvar, x2 );
%
%  For correction of initial point, use variable index 7.
%
  par_index = 7;
%
%  Force F(X) = 0.
%
  step = -1;
  fprintf ( 1, '  %2d %8.1e %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f\n', ...
    step, tan2(lim), x2(1:nvar) );

  [ x2, status ] = p00_newton ( problem, option, nvar, x2, par_index );

  if ( status < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Newton iteration failed on starting point.\n' );
    return
  end

  tan2 = p00_tan ( problem, option, nvar, x2 );

  step = 0;
  fprintf ( 1, '  %2d %8.1e %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f\n', ...
    step, tan2(lim), x2(1:nvar) );
%
%  Get stepsize.
%
  [ h, hmin, hmax ] = p00_stepsize ( problem, option );
%
%  LOOP:
%
  step_max = 30;

  for step = 1 : step_max
%
%  Save old data as X1, TAN1.
%
    x1 = x2;
    tan1 = tan2;

    h_reduction = 0;
%
%  Use X1 + H * TAN1 as a starting estimate for Newton iteration.
%
    while ( 1 )

      if ( hmax < abs ( h ) )
        h = hmax * r8_sign ( h );
      end

      if ( abs ( h ) < hmin )
        h = hmin * r8_sign ( h );
      end

      x2 = x1 + h * tan1;

      par_index = 0;
      [ x2, status ] = p00_newton ( problem, option, nvar, x2, par_index );
%
%  If we didn't get it, can we try again?
%
      if ( status < 0 )

        if ( abs ( h ) <= hmin )
          fprintf ( 1, '\n' );
          fprintf ( 1, '  Cannot decrease stepsize any more.\n' );
          fprintf ( 1, '  Cannot complete the computation.\n' );
          return
        else
          h = h / 4.0;
          h_reduction = h_reduction + 1;
        end
%
%  We computed the point.
%  Should we change the stepsize?
%
      else

        if ( h_reduction == 0 )

          if ( status <= 1 )
            h = h * 4.0;
          elseif ( status <= 3 )
            h = h * 2.0;
          elseif ( 12 <= status )
            h = h / 4.0;
          elseif ( 8 <= status )
            h = h / 2.0;
          end

        end

        break;

      end

    end
%
%  Compute the tangent vector.
%
    tan2 = p00_tan ( problem, option, nvar, x2 );
%
%  Check for a limit point.
%
    if ( tan1(lim) * tan2(lim) <= 0.0 )
      [ x, tan, status ] = p00_limit ( problem, option, nvar, x1, tan1, x2, tan2, lim );
      fprintf ( 1, '   L %8.1e %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f\n', ...
        tan(lim), x(1:nvar) );
      lim_num = lim_num + 1;
    end

    fprintf ( 1, '  %2d %8.1e %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f\n', ...
      step, tan2(lim), x2(1:nvar) );

    if ( step == step_max )
      break
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of limit points found was %d\n', lim_num );

  return
end
