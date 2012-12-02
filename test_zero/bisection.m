function [ xa, xb, fxa, fxb ] = bisection ( fatol, step_max, prob, xatol, ...
  xa, xb, fxa, fxb )

%*****************************************************************************80
%
%% BISECTION carries out the bisection method to seek a root of F(X) = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real FATOL, an absolute error tolerance for
%    the function value of the root.  If an approximate root X satisfies
%      ABS ( F ( X ) ) <= FATOL, then X will be accepted as the
%    root and the iteration will be terminated.
%
%    Input, integer STEP_MAX, the maximum number of steps
%    allowed for an iteration.
%
%    Input, integer PROB, the index of the function whose root is
%    to be sought.
%
%    Input, real XATOL, an absolute error tolerance for the root.
%
%    Input/output, real XA, XB, two points at which the
%    function differs in sign.  On output, these values have been adjusted
%    to a smaller interval.
%
%    Input/output, real FXA, FXB, the value of the function
%    at XA and XB.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BISECTION\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Step      XA            XB             F(XA)         F(XB)\n' );
  fprintf ( 1, '\n' );
%
%  Make A the root with negative F, B the root with positive F.
%
  if ( 0.0 < fxa )
    t = xa;
    xa = xb;
    xb = t;
    t = fxa;
    fxa = fxb;
    fxb = t;
  end

  step_num = 0;
%
%  Loop
%
  while ( 1 )

    fprintf ( 1, '  %4d  %14e  %14e  %14e  %14e\n', step_num, xa, xb, fxa, fxb );

    step_num = step_num + 1;

    if ( step_max < step_num )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Maximum number of steps taken without convergence.\n' );
      break
    end

    if ( abs ( xa - xb ) < xatol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Interval small enough for convergence.\n' );
      break
    end

    if ( abs ( fxa ) <= fatol || abs ( fxb ) <= fatol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Function small enough for convergence.\n' );
      break
    end
%
%  Compute the next iterate.
%
    xc = 0.5 * ( xa + xb );
    fxc = p00_fx ( prob, xc );
%
%  Replace one of the old points.
%
    if ( fxc < 0.0 )
      xa = xc;
      fxa = fxc;
    else
      xb = xc;
      fxb = fxc;
    end

  end

  return
end
