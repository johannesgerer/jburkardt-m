function [ xa, xb, fxa, fxb ] = secant ( fatol, step_max, prob, xatol, xmin, ...
  xmax, xa, xb, fxa, fxb )

%*****************************************************************************80
%
%% SECANT carries out the secant method to seek a root of F(X) = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real FATOL, an absolute error tolerance for the
%    function value of the root.  If an approximate root X satisfies
%      ABS ( F ( X ) ) <= FATOL, then X will be accepted as the
%    root and the iteration will be terminated.
%
%    Input, integer STEP_MAX, the maximum number of steps allowed
%    for an iteration.
%
%    Input, integer PROB, the index of the function whose root is
%    to be sought.
%
%    Input, real XATOL, an absolute error tolerance for the root.
%
%    Input, real XMAX, XMIN, the interval in which the root should
%    be sought.
%
%    Input/output, real XA, XB, two points at which the 
%    function differs in sign.  On output, these values have been adjusted
%    to a smaller interval.
%
%    Input/output, real FXA, FXB, the value of the function 
%    at XA and XB.
% 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SECANT\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Step             X             F(X)\n' );
  fprintf ( 1, '\n' );

  step_num = -1;
  fprintf ( 1, '  %4d  %14g  %14g\n', step_num, xa, fxa );

  if ( abs ( fxa ) <= fatol )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Function small enough for convergence.\n' );
    return
  end

  step_num = 0;
  fprintf ( 1, '  %4d  %14g  %14g\n', step_num, xb, fxb );

  for step_num = 1 : step_max

    if ( abs ( fxb ) <= fatol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Function small enough for convergence.\n' );
      return
    end

    if ( abs ( xa - xb ) < xatol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Interval small enough for convergence.\n' );
      return
    end

    if ( xb < xmin || xmax < xb )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Iterate has left the region [XMIN,XMAX].\n' );
      return
    end

    if ( fxa == fxb )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  F(A) = F(B), algorithm fails.\n' );
      return
    end

    xc = ( fxa * xb - fxb * xa ) / ( fxa - fxb );

    fxc = p00_fx ( prob, xc );

    xa = xb;
    fxa = fxb;
    xb = xc;
    fxb = fxc;
    fprintf ( 1, '  %4d  %14g  %14g\n', step_num, xb, fxb );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Took maximum number of steps.\n' );

  return
end
