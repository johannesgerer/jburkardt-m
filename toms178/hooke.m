function [ iters, endpt ] = hooke ( nvars, startpt, rho, eps, itermax, f )

%*****************************************************************************80
%
%% HOOKE seeks a minimizer of a scalar function of several variables.
%
%  Discussion:
%
%    This routine find a point X where the nonlinear objective function
%    F(X) has a local minimum.  X is an N-vector and F(X) is a scalar.
%    The objective function F(X) is not required to be differentiable
%    or even continuous.  The program does not use or require derivatives
%    of the objective function.
%
%    The user supplies three things:
%    1) a subroutine that computes F(X),
%    2) an initial "starting guess" of the minimum point X,
%    3) values for the algorithm convergence parameters.
%
%    The program searches for a local minimum, beginning from the
%    starting guess, using the Direct Search algorithm of Hooke and
%    Jeeves.
%
%    This program is adapted from the Algol pseudocode found in the
%    paper by Kaupe, and includes improvements suggested by Bell and Pike,
%    and by Tomlin and Smith.
%
%    The algorithm works by taking "steps" from one estimate of
%    a minimum, to another (hopefully better) estimate.  Taking
%    big steps gets to the minimum more quickly, at the risk of
%    "stepping right over" an excellent point.  The stepsize is
%    controlled by a user supplied parameter called RHO.  At each
%    iteration, the stepsize is multiplied by RHO  (0 < RHO < 1),
%    so the stepsize is successively reduced.
%
%    Small values of rho correspond to big stepsize changes,
%    which make the algorithm run more quickly.  However, there
%    is a chance (especially with highly nonlinear functions)
%    that these big changes will accidentally overlook a
%    promising search vector, leading to nonconvergence.
%
%    Large values of RHO correspond to small stepsize changes,
%    which force the algorithm to carefully examine nearby points
%    instead of optimistically forging ahead.  This improves the
%    probability of convergence.
%
%    The stepsize is reduced until it is equal to (or smaller
%    than) EPS.  So the number of iterations performed by
%    Hooke-Jeeves is determined by RHO and EPS:
%
%      RHO^(number_of_iterations) = EPS
%
%    In general it is a good idea to set RHO to an aggressively
%    small value like 0.5 (hoping for fast convergence).  Then,
%    if the user suspects that the reported minimum is incorrect
%    (or perhaps not accurate enough), the program can be run
%    again with a larger value of RHO such as 0.85, using the
%    result of the first minimization as the starting guess to
%    begin the second minimization.
%
%    Normal use:
%    (1) Code your function F() in the C language;
%    (2) Install your starting guess;
%    (3) Run the program.
%
%    If there are doubts about the result, the computed minimizer
%    can be used as the starting point for a second minimization attempt.
%
%    To apply this method to data fitting, code your function F() to be
%    the sum of the squares of the errors (differences) between the
%    computed values and the measured values.  Then minimize F()
%    using Hooke-Jeeves.
%
%    For example, you have 20 datapoints (T(i), Y(i)) and you want to
%    find A, B and C so that:
%
%      A*t*t + B*exp(t) + C*tan(t)
%
%    fits the data as closely as possible.  Then the objective function
%    F() to be minimized is just
%
%      F(A,B,C) = sum ( 1 <= i <= 20 )
%        ( y(i) - A*t(i)*t(i) - B*exp(t(i)) - C*tan(t(i)) )^2.
%
%  Modified:
%
%    12 February 2008
%
%  Author:
%
%    ALGOL original by Arthur Kaupe.
%    C version by Mark Johnson.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    M Bell, Malcolm Pike,
%    Remark on Algorithm 178: Direct Search,
%    Communications of the ACM,
%    Volume 9, Number 9, September 1966, page 684.
%
%    Robert Hooke, Terry Jeeves,
%    Direct Search Solution of Numerical and Statistical Problems,
%    Journal of the ACM,
%    Volume 8, Number 2, April 1961, pages 212-229.
%
%    Arthur Kaupe,
%    Algorithm 178:
%    Direct Search,
%    Communications of the ACM,
%    Volume 6, Number 6, June 1963, page 313.
%
%    FK Tomlin, LB Smith,
%    Remark on Algorithm 178: Direct Search,
%    Communications of the ACM,
%    Volume 12, Number 11, November 1969, page 637-638.
%
%  Parameters:
%
%    Input, integer NVARS, the number of spatial dimensions.
%
%    Input, real STARTPT(NVARS), the user-supplied
%    initial estimate for the minimizer.
%
%    Input, real RHO, a user-supplied convergence parameter
%    which should be set to a value between 0.0 and 1.0.  Larger values
%    of RHO give greater probability of convergence on highly nonlinear
%    functions, at a cost of more function evaluations.  Smaller
%    values of RHO reduce the number of evaluations and the program
%    running time, but increases the risk of nonconvergence.
%
%    Input, real EPS, the criterion for halting
%    the search for a minimum.  When the algorithm
%    begins to make less and less progress on each
%    iteration, it checks the halting criterion: if
%    the stepsize is below EPS, terminate the
%    iteration and return the current best estimate
%    of the minimum.  Larger values of EPS (such
%    as 1.0e-4) give quicker running time, but a
%    less accurate estimate of the minimum.  Smaller
%    values of EPS (such as 1.0e-7) give longer
%    running time, but a more accurate estimate of
%    the minimum.
%
%    Input, integer ITERMAX, a limit on the number of iterations.
%
%    Input, function handle F, the name of the function routine,
%    which should have the form:
%      function value = f ( x, n )
%
%    Output, integer ITERS, the number of iterations taken.
%
%    Output, real ENDPT(NVARS), the estimate for the
%    minimizer, as calculated by the program.
%
  verbose = 0;

  for i = 1 : nvars
    newx(i) = startpt(i);
  end

  for i = 1 : nvars
    xbefore(i) = startpt(i);
  end

  for i = 1 : nvars
    if ( startpt(i) == 0.0 )
      delta(i) = rho;
    else
      delta(i) = rho * abs ( startpt(i) );
    end
  end

  funevals = 0;
  steplength = rho;
  iters = 0;
  fbefore = f ( newx, nvars );
  funevals = funevals + 1;
  newf = fbefore;

  while ( iters < itermax & eps < steplength )

    iters = iters + 1;

    if ( verbose )

      fprintf ( 1, '\n' );
      fprintf ( 1, '  FUNEVALS = %d, F(X) = %e\n', funevals, fbefore );
      for i = 1 : nvars
        fprintf ( 1, '  %8d  %e\n', i, xbefore(i) );
      end

    end
%
%  Find best new point, one coordinate at a time.
%
    for i = 1 : nvars
      newx(i) = xbefore(i);
    end

    [ newf, newx, funevals ] = best_nearby ( delta, newx, fbefore, nvars, ...
    f, funevals );
%
%  If we made some improvements, pursue that direction.
%
    keep = 1;

    while ( newf < fbefore & keep == 1 )

      for i = 1 : nvars
%
%  Arrange the sign of DELTA.
%
        if ( newx(i) <= xbefore(i) )
          delta(i) = - abs ( delta(i) );
        else
          delta(i) = abs ( delta(i) );
        end
%
%  Now, move further in this direction.
%
        tmp = xbefore(i);
        xbefore(i) = newx(i);
        newx(i) = newx(i) + newx(i) - tmp;
      end

      fbefore = newf;
      [ newf, newx, funevals ] = best_nearby ( delta, newx, fbefore, nvars, ...
        f, funevals );
%
%  If the further (optimistic) move was bad...
%
      if ( fbefore <= newf )
        break;
      end
%
%  Make sure that the differences between the new and the old points
%  are due to actual displacements; beware of roundoff errors that
%  might cause NEWF < FBEFORE.
%
      keep = 0;

      for i = 1 : nvars
        if ( 0.5 * abs ( delta(i) ) < abs ( newx(i) - xbefore(i) ) )
          keep = 1;
          break
        end
      end

    end

    if ( eps <= steplength & fbefore <= newf )
      steplength = steplength * rho;
      for i = 1 : nvars
        delta(i) = delta(i) * rho;
      end
    end

  end

  for i = 1 : nvars
    endpt(i) = xbefore(i);
  end

  return
end
