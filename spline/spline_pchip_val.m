function fe = spline_pchip_val ( n, x, f, d, ne, xe )

%*****************************************************************************80
%
%% SPLINE_PCHIP_VAL evaluates a piecewise cubic Hermite function.
%
%  Description:
%
%    This routine may be used by itself for Hermite interpolation, or as an
%    evaluator for SPLINE_PCHIP_SET.
%
%    This routine evaluates the cubic Hermite function at the points XE.
%
%    Most of the coding between the call to CHFEV and the end of
%    the IR loop could be eliminated if it were permissible to
%    assume that XE is ordered relative to X.
%
%    CHFEV does not assume that X1 is less than X2.  Thus, it would
%    be possible to write a version of SPLINE_PCHIP_VAL that assumes a strictly
%    decreasing X array by simply running the IR loop backwards
%    and reversing the order of appropriate tests.
%
%    The present code has a minor bug, which I have decided is not
%    worth the effort that would be required to fix it.
%    If XE contains points in [X(N-1),X(N)], followed by points less than
%    X(N-1), followed by points greater than X(N), the extrapolation points
%    will be counted (at least) twice in the total returned in IERR.
%
%    The evaluation will be most efficient if the elements of XE are
%    increasing relative to X; that is, for all J <= K,
%      X(I) <= XE(J)
%    implies
%      X(I) <= XE(K).
%
%    If any of the XE are outside the interval [X(1),X(N)],
%    values are extrapolated from the nearest extreme cubic,
%    and a warning error is returned.
%
%    This routine was originally named "PCHFE".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2005
%
%  Author:
%
%    Original FORTRAN77 version by Fred Fritsch.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Fred Fritsch, Ralph Carlson,
%    Monotone Piecewise Cubic Interpolation,
%    SIAM Journal on Numerical Analysis,
%    Volume 17, Number 2, April 1980, pages 238-246.
%
%  Parameters:
%
%    Input, integer N, the number of data points.  N must be at least 2.
%
%    Input, real X(N), the strictly increasing independent
%    variable values.
%
%    Input, real F(N), the function values.
%
%    Input, real D(N), the derivative values.
%
%    Input, integer NE, the number of evaluation points.
%
%    Input, real XE(NE), points at which the function is to
%    be evaluated.
%
%    Output, real FE(NE), the values of the cubic Hermite
%    function at XE.
%

%
%  Check arguments.
%
  if ( n < 2 )
    ierr = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPLINE_PCHIP_VAL - Fatal error!\n' );
    fprintf ( 1, '  Number of data points less than 2.\n' );
    error ( 'SPLINE_PCHIP_VAL - Fatal error!' );
  end

  for i = 2 : n
    if ( x(i) <= x(i-1) )
      ierr = -3;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SPLINE_PCHIP_VAL - Fatal error!\n' );
      fprintf ( 1, '  X array not strictly increasing.\n' );
      error ( 'SPLINE_PCHIP_VAL - Fatal error!' );
    end
  end

  if ( ne < 1 )
    ierr = -4;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPLINE_PCHIP_VAL - Fatal error!\n' );
    fprintf ( 1, '  Number of evaluation points less than 1.\n' );
    fe = [];
    return
  end

  ierr = 0;
%
%  Loop over intervals.
%  The interval index is IL = IR-1.
%  The interval is X(IL) <= X < X(IR).
%
  j_first = 1;
  ir = 2;

  while ( 1 )
%
%  Skip out of the loop if have processed all evaluation points.
%
    if ( ne < j_first )
      break
    end
%
%  Locate all points in the interval.
%
    j_save = ne + 1;

    for j = j_first : ne
      if ( x(ir) <= xe(j) )
        j_save = j;
        if ( ir == n )
          j_save = ne + 1;
        end
        break
      end
    end
%
%  Have located first point beyond interval.
%
    j = j_save;

    nj = j - j_first;
%
%  Skip evaluation if no points in interval.
%
    if ( nj ~= 0 )
%
%  Evaluate cubic at XE(J_FIRST:J-1).
%
      [ fe(j_first:j-1), next, ierc ] = chfev ( x(ir-1), x(ir), f(ir-1), ...
        f(ir), d(ir-1), d(ir),  nj, xe(j_first:j-1) );

      if ( ierc < 0 )
        ierr = -5;
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SPLINE_PCHIP_VAL - Fatal error!\n' );
        fprintf ( 1, '  Error return from CHFEV.\n' );
        error ( 'SPLINE_PCHIP_VAL - Fatal error!' );
      end
%
%  In the current set of XE points, there are NEXT(2) to the right of X(IR).
%
      if ( next(2) ~= 0 )

        if ( ir < n )
          ierr = -5;
          fprintf ( 1, '\n' );
          fprintf ( 1, 'SPLINE_PCHIP_VAL - Fatal error!\n' );
          fprintf ( 1, '  IR < N.\n' );
          error ( 'SPLINE_PCHIP_VAL - Fatal error!' );
        end
%
%  These are actually extrapolation points.
%
        ierr = ierr + next(2);

      end
%
%  In the current set of XE points, there are NEXT(1) to the left of X(IR-1).
%
      if ( next(1) ~= 0 )
%
%  These are actually extrapolation points.
%
        if ( ir <= 2 )
          ierr = ierr + next(1);
        else

          j_new = -1;

          for i = j_first : j-1
            if ( xe(i) < x(ir-1) )
              j_new = i;
              break
            end
          end

          if ( j_new == -1 )
            ierr = -5;
            fprintf ( 1, '\n' );
            fprintf ( 1, 'SPLINE_PCHIP_VAL - Fatal error!\n' );
            fprintf ( 1, '  Could not bracket the data point.\n' );
            error ( 'SPLINE_PCHIP_VAL - Fatal error!' );
          end
%
%  Reset J.  This will be the new J_FIRST.
%
          j = j_new;
%
%  Now find out how far to back up in the X array.
%
          for i = 1 : ir-1
            if ( xe(j) < x(i) )
              break
            end
          end
%
%  At this point, either XE(J) < X(1) or X(i-1) <= XE(J) < X(I) .
%
%  Reset IR, recognizing that it will be incremented before cycling.
%
          ir = max ( 1, i-1 );

        end

      end

      j_first = j;

    end

    ir = ir + 1;

    if ( n < ir )
      break
    end

  end

  return
end

