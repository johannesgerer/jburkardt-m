function [ xa, xb, xc, fxa, fxb, fxc ] = muller ( fatol, step_max, prob, ...
  xatol, xrtol, xa, xb, xc, fxa, fxb, fxc )

%*****************************************************************************80
%
%% MULLER carries out Muller's method for a real root of a nonlinear function.
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
%    Input, real XATOL, XRTOL, absolute and relative error
%    tolerances  for the root.
%
%    Input/output, real XA, XB, XC, three points.
%
%    Input/output, real FXA, FXB, FXC, the value of the
%    function at XA, XB, and XC.
%

%
%  Initialization.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MULLER\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Step      XA           XB           XC\n' );
  fprintf ( 1, '          F(XA)        F(XB)        F(XC)\n' );
  fprintf ( 1, '\n' );

  i = 0;

  fprintf ( 1, '  %4d  %14g  %14g  %14g\n', i,  xa,  xb,  xc );
  fprintf ( 1, '        %14g  %14g  %14g\n', fxa, fxb, fxc );

  for i = 1 : step_max
%
%  Determine the coefficients
%    A, B, C
%  of the polynomial
%    Y(X) = A * (X-X2)**2 + B * (X-X2) + C
%  which goes through the data:
%    (X1,Y1), (X2,Y2), (X3,Y3).
%
    a = ( ( fxa - fxc ) * ( xb - xc ) ...
        - ( fxb - fxc ) * ( xa - xc ) ) / ...
          ( ( xa - xc ) * ( xb - xc ) * ( xa - xb ) );

    b = ( ( fxb - fxc ) * ( xa - xc ) * ( xa - xc ) ...
        - ( fxa - fxc ) * ( xb - xc ) * ( xb - xc ) ) / ...
        ( ( xa - xc ) * ( xb - xc ) * ( xa - xb ) );

    c = fxc;
%
%  Get the real roots of the polynomial,
%  unless A = 0, in which case the algorithm is breaking down.
%
    if ( a ~= 0.0 )

      [ z1, z2 ] = r8poly2_rroot ( a, b, c );

    elseif ( b ~= 0.0 )

      z2 = - c / b;

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Polynomial fitting has failed.\n' );
      fprintf ( 1, '  Muller''s algorithm breaks down.\n' );
      return

    end

    xd = xc + z2;
%
%  Set XA, YA, based on which of XA and XB is closer to XD.
%
    if ( abs ( xd - xb ) < abs ( xd - xa ) )
      t = xa;
      xa = xb;
      xb = t;
      t = fxa;
      fxa = fxb;
      fxb = t;
    end
%
%  Set XB, YB, based on which of XB and XC is closer to XD.
%
    if ( abs ( xd - xc ) < abs ( xd - xb ) )
      t = xb;
      xb = xc;
      xc = t;
      t = fxb;
      fxb = fxc;
      fxc = t;
    end
%
%  Set XC, YC.
%
    xc = xd;
    fxc = p00_fx ( prob, xc );

    fprintf ( 1, '  %4d  %14g  %14g  %14g\n', i,  xa,  xb,  xc );
    fprintf ( 1, '        %14g  %14g  %14g\n', fxa, fxb, fxc );
%
%  Estimate the relative significance of the most recent correction.
%
    if ( abs ( z2 ) <= xrtol * abs ( xc ) + xatol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Stepsize small enough for convergence.\n' );
      return
    end

    if ( abs ( fxc ) < fatol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Function small enough for convergence.\n' );
      return
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Took maximum number of steps without convergence.\n' );

  return
end
