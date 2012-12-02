function [ xa, xb, fxa, fxb ] = regula_falsi ( fatol, step_max, prob, xatol, ...
  xa, xb, fxa, fxb )

%*****************************************************************************80
%
%% REGULA_FALSI carries out the Regula Falsi method to seek a root of F(X) = 0.
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
%    Input/output, real XA, XB, two points at which the 
%    function differs in sign.  On output, these values have been adjusted
%    to a smaller interval.
%
%    Input/output, real FXA, FXB, the value of the function 
%    at XA and XB.
% 

%
%  The method requires a change-of-sign interval.
%
  if ( r8_sign ( fxa ) == r8_sign ( fxb ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'REGULA_FALSI - Fatal error!\n' );
    fprintf ( 1, '  Function does not change sign at endpoints.\n' );
    error ( 'REGULA_FALSI - Fatal error!' );
  end
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'REGULA FALSI\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Step            XA            XB             F(XA)         F(XB)\n' );
  fprintf ( 1, '\n' );

  step_num = 0;
  fprintf ( 1, '  %4d  %14g  %14g  %14g  %14g\n', step_num, xa, xb, fxa, fxb );

  for step_num = 1 : step_max

    if ( abs ( xa - xb ) < xatol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Interval small enough for convergence.\n' );
      return
    end

    if ( abs ( fxa ) <= fatol || abs ( fxb ) <= fatol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Function small enough for convergence.\n' );
      return
    end

    xc = ( fxa * xb - fxb * xa ) / ( fxa - fxb );
    fxc = p00_fx ( prob, xc );

    if ( fxc < 0.0 )
      xa = xc;
      fxa = fxc;
    else
      xb = xc;
      fxb = fxc;
    end

    fprintf ( 1, '  %4d  %14g  %14g  %14g  %14g\n', step_num, xa, xb, fxa, fxb );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Took maximum number of steps without convergence.\n' );

  return
end
