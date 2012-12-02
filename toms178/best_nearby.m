function [ newbest, point, funevals ] = best_nearby ( delta, point, ...
  prevbest, nvars, f, funevals )

%*****************************************************************************80
%
%% BEST_NEARBY looks for a better nearby point, one coordinate at a time.
%
%  Modified:
%
%    12 February 2008
%
%  Author:
%
%    Original ALGOL version by Arthur Kaupe.
%    C version by Mark Johnson.
%    MATLAB version by John Burkardt
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
%    Input, real DELTA(NVARS), the size of a step in each direction.
%
%    Input, real POINT(NVARS); on input, the current candidate.
%    On output, the value of POINT may have been updated.
%
%    Input, real PREVBEST, the minimum value of the function seen
%    so far.
%
%    Input, integer NVARS, the number of variables.
%
%    Input, function handle F, the name of the function routine,
%    which should have the form:
%      function value = f ( x, n )
%
%    Input, integer FUNEVALS, the number of function evaluations.
%
%    Output, real NEWBEST, the minimum value of the function seen
%    after checking the nearby neighbors.
%
%    Output, real POINT(NVARS); the value of POINT may have been updated.
%
%    Output, integer FUNEVALS, the number of function evaluations.
%
  z(1:nvars) = point(1:nvars);
  minf = prevbest;

  for i = 1 : nvars

    z(i) = point(i) + delta(i);

    ftmp = f ( z, nvars );
    funevals = funevals + 1;

    if ( ftmp < minf )

      minf = ftmp;

    else

      delta(i) = - delta(i);
      z(i) = point(i) + delta(i);
      ftmp = f ( z, nvars );
      funevals = funevals + 1;

      if ( ftmp < minf )
        minf = ftmp;
      else
        z(i) = point(i);
      end

    end

  end

  point(1:nvars) = z(1:nvars);
  newbest = minf;

  return
end
