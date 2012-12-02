function [ y, yp, t, flag ] = r8_rkf45 ( f, neqn, y, yp, t, tout, relerr, ...
  abserr, flag )

%*****************************************************************************80
%
%% R8_RKF45 carries out the Runge-Kutta-Fehlberg method (double precision).
%
%  Discussion:
%
%    This routine is primarily designed to solve non-stiff and mildly stiff
%    differential equations when derivative evaluations are inexpensive.
%    It should generally not be used when the user is demanding
%    high accuracy.
%
%    This routine integrates a system of NEQN first-order ordinary differential
%    equations of the form:
%
%      dY(i)/dT = F(T,Y(1),Y(2),...,Y(NEQN))
%
%    where the Y(1:NEQN) are given at T.
%
%    Typically the subroutine is used to integrate from T to TOUT but it
%    can be used as a one-step integrator to advance the solution a
%    single step in the direction of TOUT.  On return, the parameters in
%    the call list are set for continuing the integration.  The user has
%    only to call again (and perhaps define a new value for TOUT).
%
%    Before the first call, the user must
%
%    * supply the subroutine F(T,Y,YP) to evaluate the right hand side;
%      and declare F in an EXTERNAL statement;
%
%    * initialize the parameters:
%      NEQN, Y(1:NEQN), T, TOUT, RELERR, ABSERR, FLAG.
%      In particular, T should initially be the starting point for integration,
%      Y should be the value of the initial conditions, and FLAG should
%      normally be +1.
%
%    Normally, the user only sets the value of FLAG before the first call, and
%    thereafter, the program manages the value.  On the first call, FLAG should
%    normally be +1 (or -1 for single step mode.)  On normal return, FLAG will
%    have been reset by the program to the value of 2 (or -2 in single
%    step mode), and the user can continue to call the routine with that
%    value of FLAG.
%
%    (When the input magnitude of FLAG is 1, this indicates to the program
%    that it is necessary to do some initialization work.  An input magnitude
%    of 2 lets the program know that that initialization can be skipped,
%    and that useful information was computed earlier.)
%
%    The routine returns with all the information needed to continue
%    the integration.  If the integration reached TOUT, the user need only
%    define a new TOUT and call again.  In the one-step integrator
%    mode, returning with FLAG = -2, the user must keep in mind that
%    each step taken is in the direction of the current TOUT.  Upon
%    reaching TOUT, indicated by the output value of FLAG switching to 2,
%    the user must define a new TOUT and reset FLAG to -2 to continue
%    in the one-step integrator mode.
%
%    In some cases, an error or difficulty occurs during a call.  In that case,
%    the output value of FLAG is used to indicate that there is a problem
%    that the user must address.  These values include:
%
%    * 3, integration was not completed because the input value of RELERR, the
%      relative error tolerance, was too small.  RELERR has been increased
%      appropriately for continuing.  If the user accepts the output value of
%      RELERR, then simply reset FLAG to 2 and continue.
%
%    * 4, integration was not completed because more than MAXNFE derivative
%      evaluations were needed.  This is approximately (MAXNFE/6) steps.
%      The user may continue by simply calling again.  The function counter
%      will be reset to 0, and another MAXNFE function evaluations are allowed.
%
%    * 5, integration was not completed because the solution vanished,
%      making a pure relative error test impossible.  The user must use
%      a non-zero ABSERR to continue.  Using the one-step integration mode
%      for one step is a good way to proceed.
%
%    * 6, integration was not completed because the requested accuracy
%      could not be achieved, even using the smallest allowable stepsize.
%      The user must increase the error tolerances ABSERR or RELERR before
%      continuing.  It is also necessary to reset FLAG to 2 (or -2 when
%      the one-step integration mode is being used).  The occurrence of
%      FLAG = 6 indicates a trouble spot.  The solution is changing
%      rapidly, or a singularity may be present.  It often is inadvisable
%      to continue.
%
%    * 7, it is likely that this routine is inefficient for solving
%      this problem.  Too much output is restricting the natural stepsize
%      choice.  The user should use the one-step integration mode with
%      the stepsize determined by the code.  If the user insists upon
%      continuing the integration, reset FLAG to 2 before calling
%      again.  Otherwise, execution will be terminated.
%
%    * 8, invalid input parameters, indicates one of the following:
%      NEQN <= 0;
%      T = TOUT and |FLAG| /= 1;
%      RELERR < 0 or ABSERR < 0;
%      FLAG == 0  or FLAG < -2 or 8 < FLAG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 April 2011
%
%  Author:
%
%    Original FORTRAN77 version by Herman Watts, Lawrence Shampine.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Erwin Fehlberg,
%    Low-order Classical Runge-Kutta Formulas with Stepsize Control,
%    NASA Technical Report R-315, 1969.
%
%    Lawrence Shampine, Herman Watts, S Davenport,
%    Solving Non-stiff Ordinary Differential Equations - The State of the Art,
%    SIAM Review,
%    Volume 18, pages 376-411, 1976.
%
%  Parameters:
%
%    Input, function F, a user-supplied function to evaluate the
%    derivatives dYdT(T), of the form:
%      function yp = f ( t, y )
%
%    Input, integer NEQN, the number of equations to be integrated.
%
%    Input/output, real Y(NEQN), the current solution vector at T.
%
%    Input/output, real YP(NEQN), the current value of the
%    derivative of the dependent variable.  The user should not set or alter
%    this information%
%
%    Input/output, real T, the current value of the independent
%    variable.
%
%    Input, real TOUT, the output point at which solution is
%    desired.  TOUT = T is allowed on the first call only, in which case
%    the routine returns with FLAG = 2 if continuation is possible.
%
%    Input, real RELERR, ABSERR, the relative and absolute
%    error tolerances for the local error test.  At each step the code
%    requires:
%      abs ( local error ) <= RELERR * abs ( Y ) + ABSERR
%    for each component of the local error and the solution vector Y.
%    RELERR cannot be "too small".  If the routine believes RELERR has been
%    set too small, it will reset RELERR to an acceptable value and return
%    immediately for user action.
%
%    Input/output, integer FLAG, indicator for status of integration.
%    On the first call, set FLAG to +1 for normal use, or to -1 for single
%    step mode.  On return, a value of 2 or -2 indicates normal progress,
%    while any other value indicates a problem that should be addressed.
%
  persistent abserr_save;
  persistent flag_save;
  persistent h;
  persistent init;
  persistent kflag;
  persistent kop;
  persistent nfe;
  persistent relerr_save;

  if ( isempty ( abserr_save ) )
    abserr_save = -1.0;
    h = -1.0;
    flag_save = -1000;
    init = -1000;
    kflag = -1000;
    kop = -1;
    nfe = -1;
    relerr_save = -1.0;
  end

  maxnfe = 3000;
  remin = 1.0E-12;
%
%  Check the input parameters.
%
  if ( neqn < 1 )
    flag = 8;
    return
  end

  if ( relerr < 0.0 )
    flag = 8;
    return
  end

  if ( abserr < 0.0 )
    flag = 8;
    return
  end

  if ( flag == 0 || 8 < flag || flag < -2 )
    flag = 8;
    return
  end

  mflag = abs ( flag );
%
%  Is this a continuation call?
%
  if ( mflag ~= 1 )

    if ( t == tout && kflag ~= 3 )
      flag = 8;
      return
    end

    if ( mflag == 2 )

      if ( kflag == 3 )

        flag = flag_save;
        mflag = abs ( flag );

      elseif ( init == 0 )

        flag = flag_save;

      elseif ( kflag == 4 )

        nfe = 0;

      elseif ( kflag == 5 && abserr == 0.0 )

        fprintf ( 1, '\n' );
        fprintf ( 1, 'R8_RKF45 - Fatal error!\n' );
        fprintf ( 1, '  KFLAG = 5 and ABSERR = 0.\n' );
        error ( 'R8_RKF45 - Fatal error!' );

      elseif ( kflag == 6 && relerr <= relerr_save && abserr <= abserr_save )

        fprintf ( 1, '\n' );
        fprintf ( 1, 'R8_RKF45 - Fatal error!\n' );
        fprintf ( 1, '  KFLAG = 6 and\n' );
        fprintf ( 1, '  RELERR <= RELERR_SAVE and\n' );
        fprintf ( 1, '  ABSERR <= ABSERR_SAVE\n' );
        error ( 'R8_RKF45 - Fatal error!' );

      end
%
%  FLAG = 3, 4, 5, 6, 7 or 8.
%
    else

      if ( flag == 3 )

        flag = flag_save;
        if ( kflag == 3 )
          mflag = abs ( flag );
        end

      elseif ( flag == 4 )

        nfe = 0;
        flag = flag_save;
        if ( kflag == 3 )
          mflag = abs ( flag );
        end

      elseif ( flag == 5 && 0.0 < abserr )

        flag = flag_save;
        if ( kflag == 3 )
          mflag = abs ( flag );
        end
%
%  Integration cannot be continued because the user did not respond to
%  the instructions pertaining to FLAG = 5, 6, 7 or 8.
%
      else
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R8_RKF45 - Fatal error!\n' );
        fprintf ( 1, '  Integration cannot continue because the user\n' );
        fprintf ( 1, '  did not respond to the instructions pertaining\n' );
        fprintf ( 1, '  to the output flag warning FLAG = 5, 6, 7 or 8.\n' );
        error ( 'R8_RKF45 - Fatal error!' );
      end

    end

  end
%
%  Save the input value of FLAG.
%  Set the continuation flag KFLAG for subsequent input checking.
%
  flag_save = flag;
  kflag = 0;
%
%  Save RELERR and ABSERR for checking input on subsequent calls.
%
  relerr_save = relerr;
  abserr_save = abserr;
%
%  Restrict the relative error tolerance to be at least
%
%    2 * EPS + REMIN
%
%  to avoid limiting precision difficulties arising from impossible
%  accuracy requests.
%
  relerr_min = 2.0 * eps + remin;
%
%  Is the relative error tolerance too small?
%
  if ( relerr < relerr_min )
    relerr = relerr_min;
    flag = 3;
    kflag = 3;
    return
  end

  dt = tout - t;
%
%  Initialization:
%
%  Set the initialization completion indicator, INIT;
%  set the indicator for too many output points, KOP;
%  evaluate the initial derivatives;
%  set the counter for function evaluations, NFE;
%  estimate the starting stepsize.
%
  if ( mflag == 1 )

    init = 0;
    kop = 0;
    yp = f ( t, y );
    nfe = 1;

    if ( t == tout )
      flag = 2;
      return
    end

  end

  if ( init == 0 )

    init = 1;
    h = abs ( dt );
    toln = 0.0;

    for k = 1 : neqn
      tol = relerr * abs ( y(k) ) + abserr;
      if ( 0.0 < tol )
        toln = tol;
        ypk = abs ( yp(k) );
        if ( tol < ypk * h^5 )
          h = ( tol / ypk )^0.2;
        end
      end
    end

    if ( toln <= 0.0 )
      h = 0.0;
    end

    h = max ( h, 26.0 * eps * max ( abs ( t ), abs ( dt ) ) );

    if ( flag < 0 )
      flag_save = - 2;
    else
      flag_save = + 2;
    end

  end
%
%  Set the stepsize for integration in the direction from T to TOUT.
%
  if ( dt < 0.0 )
    h = - abs ( h );
  else
    h = + abs ( h );
  end
%
%  Test to see if too may output points are being requested.
%
  if ( 2.0 * abs ( dt ) <= abs ( h ) )
    kop = kop + 1;
  end
%
%  Unnecessary frequency of output.
%
  if ( kop == 100 )
    kop = 0;
    flag = 7;
    return
  end
%
%  If we are too close to the output point, then simply extrapolate and return.
%
  if ( abs ( dt ) <= 26.0 * eps * abs ( t ) )
    t = tout;
    y(1:neqn) = y(1:neqn) + dt * yp(1:neqn);
    yp = f ( t, y );
    nfe = nfe + 1;
    flag = 2;
    return
  end
%
%  Initialize the output point indicator.
%
  output = 0;
%
%  To avoid premature underflow in the error tolerance function,
%  scale the error tolerances.
%
  scale = 2.0 / relerr;
  ae = scale * abserr;
%
%  Step by step integration.
%
  while ( 1 )

    hfaild = 0;
%
%  Set the smallest allowable stepsize.
%
    hmin = 26.0 * eps * abs ( t );
%
%  Adjust the stepsize if necessary to hit the output point.
%
%  Look ahead two steps to avoid drastic changes in the stepsize and
%  thus lessen the impact of output points on the code.
%
    dt = tout - t;

    if ( 2.0 * abs ( h ) <= abs ( dt ) )

    else
%
%  Will the next successful step complete the integration to the output point?
%
      if ( abs ( dt ) <= abs ( h ) )
        output = 1;
        h = dt;
      else
        h = 0.5 * dt;
      end

    end
%
%  Here begins the core integrator for taking a single step.
%
%  The tolerances have been scaled to avoid premature underflow in
%  computing the error tolerance function ET.
%  To avoid problems with zero crossings, relative error is measured
%  using the average of the magnitudes of the solution at the
%  beginning and end of a step.
%  The error estimate formula has been grouped to control loss of
%  significance.
%
%  To distinguish the various arguments, H is not permitted
%  to become smaller than 26 units of roundoff in T.
%  Practical limits on the change in the stepsize are enforced to
%  smooth the stepsize selection process and to avoid excessive
%  chattering on problems having discontinuities.
%  To prevent unnecessary failures, the code uses 9/10 the stepsize
%  it estimates will succeed.
%
%  After a step failure, the stepsize is not allowed to increase for
%  the next attempted step.  This makes the code more efficient on
%  problems having discontinuities and more effective in general
%  since local extrapolation is being used and extra caution seems
%  warranted.
%
%  Test the number of derivative function evaluations.
%  If okay, try to advance the integration from T to T+H.
%
    while ( 1 )
%
%  Have we done too much work?
%
      if ( maxnfe < nfe )
        flag = 4;
        kflag = 4;
        return
      end
%
%  Advance an approximate solution over one step of length H.
%
      [ f1, f2, f3, f4, f5, f6 ] = r8_fehl ( f, neqn, y, t, h, yp );
      f1 = f6;

      nfe = nfe + 5;
%
%  Compute and test allowable tolerances versus local error estimates
%  and remove scaling of tolerances.  The relative error is
%  measured with respect to the average of the magnitudes of the
%  solution at the beginning and end of the step.
%
      eeoet = 0.0;

      for k = 1 : neqn

        et = abs ( y(k) ) + abs ( f1(k) ) + ae;

        if ( et <= 0.0 )
          flag = 5;
          return
        end

        ee = abs ...
        ( ( -2090.0 * yp(k) ...
          + ( 21970.0 * f3(k) - 15048.0 * f4(k) ) ...
          ) ...
        + ( 22528.0 * f2(k) - 27360.0 * f5(k) ) ...
        );

        eeoet = max ( eeoet, ee / et );

      end

      esttol = abs ( h ) * eeoet * scale / 752400.0;

      if ( esttol <= 1.0 )
        break
      end
%
%  Unsuccessful step.  Reduce the stepsize, try again.
%  The decrease is limited to a factor of 1/10.
%
      hfaild = 1;
      output = 0;

      if ( esttol < 59049.0 )
        s = 0.9 / esttol^0.2;
      else
        s = 0.1;
      end

      h = s * h;

      if ( abs ( h ) < hmin )
        flag = 6;
        kflag = 6;
        return
      end

    end
%
%  We exited the loop because we took a successful step.
%  Store the solution for T+H, and evaluate the derivative there.
%
    t = t + h;
    y(1:neqn) = f1(1:neqn);
    yp = f ( t, y );
    nfe = nfe + 1;
%
%  Choose the next stepsize.  The increase is limited to a factor of 5.
%  If the step failed, the next stepsize is not allowed to increase.
%
    if ( 0.0001889568 < esttol )
      s = 0.9 / esttol^0.2;
    else
      s = 5.0;
    end

    if ( hfaild )
      s = min ( s, 1.0 );
    end

    if ( h < 0.0 )
      h = - max ( s * abs ( h ), hmin );
    else
      h = + max ( s * abs ( h ), hmin );
    end
%
%  End of core integrator
%
%  Should we take another step?
%
    if ( output )
      t = tout;
      flag = 2;
      return
    end

    if ( flag <= 0 )
      break
    end

  end
%
%  One step integration mode.
%
  flag = - 2;

  return
end
