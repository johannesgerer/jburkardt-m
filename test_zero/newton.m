function [ xa, fxa ] = newton ( fatol, step_max, prob, xatol, xmin, xmax, ...
  xa, fxa )

%*****************************************************************************80
%
%% NEWTON carries out Newton's method to seek a root of F(X) = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2011
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
%    Input, real XMIN, XMAX, the interval in which the root should
%    be sought.
%
%    Input/output, real XA.  On input, the starting point for
%    the iteration.  On output, the current approximation to the root.
%
%    Input/output, real FXA, the function value at XA.
%
  step = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NEWTON\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Step         X             F(X)      FP(X)\n' );
  fprintf ( 1, '\n' );

  step_num = 0;
  fp = p00_fx1 ( prob, xa );

  fprintf ( 1, '  %4d  %12g  %12g  %12g\n', step_num, xa, fxa, fp );

  for step_num = 1 : step_max

    if ( xa < xmin || xmax < xa )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  The iterate X = %f\n', xa );
      fprintf ( 1, '  has left the region [XMIN,XMAX].\n' );
      return
    end

    if ( abs ( fxa ) <= fatol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  The function norm is small enough for convergence.\n' );
      return
    end

    if ( 1 < step_num && abs ( step ) <= xatol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  The stepsize is small enough for convergence.\n' );
      return
    end

    if ( fp == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  F''(X)=0, the algorithm fails.\n' );
      return
    end

    step = fxa / fp;

    xa = xa - step;

    fxa = p00_fx ( prob, xa );
    fp = p00_fx1 ( prob, xa );

    fprintf ( 1, '  %4d  %12g  %12g  %12g\n', step_num, xa, fxa, fp );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Took maximum number of steps without convergence.\n' );

  return
end
