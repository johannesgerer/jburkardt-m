function fx = p14_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P14_FUN computes the function for problem 14.
%
%  Discussion:
%
%    Keller's boundary value problem.
%
%    The continuous problem is a two point boundary value problem
%    describing a diffusion-kinetics system, of the form:
%
%      -d/dt ( t**2 * F(U) * dU/dt ) + t**2 * G(U) = 0
%
%    where F(U) and G(U) are given functions,
%    with boundary conditions
%
%      dU/dt(0) = 0,
%      U(1) = 1.
%
%    A finite difference approximation to this continous problem
%    is used.
%
%    M points T(I) are used.  With a spacing of H=1/(M-2), the points
%    are set so that
%
%      T(1)=-H, T(2)=0, T(3)=H, ..., T(M)=1.0
%
%    First equation:
%
%      U(3) - U(1) = 0.0
%
%    Equations I = 2 through I = M-1
%
%      TL**2 * F(UL) * ( U(I) - U(I-1) ) +
%      TR**2 * F(UR) * ( U(I) - U(I+1) ) +
%      H**2 * T**2 * G(U) = 0.0
%
%    with
%
%      T  = T(I) = ( I - 2 ) * H
%      U  = U(I)
%      TL = 0.5 * ( T(I-1) + T(I) )
%      UL = 0.5 * ( U(I-1) + U(I) )
%      TR = 0.5 * ( T(I) + T(I+1) )
%      UR = 0.5 * ( U(I) + U(I+1) )
%
%    and the diffusion function F(U)
%
%      F(U) = 1 + LAMBDA / ( U + ALPHA )**2
%
%    and
%
%      G(U) = U / ( BETA * ( U + GAMMA ) )
%
%    Equation M-1:
%
%      U(M) = 1.0
%
%    For this version ALPHA = BETA = GAMMA = 0.1.
%
%    The only choice for options is
%
%    OPTION = 1:
%      IT = NVAR,
%      XIT = 1.0,
%      LIM = NVAR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Herbert Keller,
%    Numerical Methods for Two-point Boundary Value Problems,
%    Dover, 1992,
%    ISBN: 0486669254,
%    LC: QA372.K42.
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the argument of the function.
%
%    Output, real FX(NVAR-1), the value of the function at X.
%
  m = nvar - 1;
  h = 1.0 / ( m - 2 );
  lambda = x(nvar);

  fx(1) = x(3) - x(1);

  for i = 2 : m - 1

    t = ( i - 2 ) * h;
    tl = ( i - 2.5 ) * h;
    tr = ( i - 1.5 ) * h;
    ul = 0.5 * ( x(i-1) + x(i) );
    ur = 0.5 * ( x(i) + x(i+1) );

    fx(i) =   ( x(i) - x(i-1) ) * tl * tl * p14_fu ( lambda, ul ) ...
            + ( x(i) - x(i+1) ) * tr * tr * p14_fu ( lambda, ur ) ...
            + h * h * t * t * p14_gu ( x(i) );

  end

  fx(m) = x(m) - 1.0;

  return
end
