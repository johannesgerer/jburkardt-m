function [ t, u ] = pce_ode_hermite ( ti, tf, nt, ui, np, alpha_mu, alpha_sigma )

%*****************************************************************************80
%
%% PCE_ODE_HERMITE applies the polynomial chaos expansion to a scalar ODE.
%
%  Discussion:
%
%    The deterministic equation is
%
%      du/dt = - alpha * u,
%      u(0) = u0
%
%    In the stochastic version, it is assumed that the decay coefficient
%    ALPHA is a Gaussian random variable with mean value ALPHA_MU and variance
%    ALPHA_SIGMA^2.
%
%    The exact expected value of the stochastic equation will be
%
%      u(t) = u0 * exp ( t^2/2)
%
%    This should be matched by the first component of the polynomial chaos
%    expansion.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TI, TF, the initial and final times.
%
%    Input, integer NT, the number of output points.
%
%    Input, real UI, the initial condition.
%
%    Input, integer NP, the degree of the expansion.  Polynomials of degree
%    0 through NP will be used.
%
%    Input, real ALPHA_MU, ALPHA_SIGMA, the mean and standard deviation
%    of the decay coefficient.
%
%    Output, real T(NT+1,1), U(NT+1,NP+1), the times and the PCE coefficients
%    at the successive time steps.
%
  alpha = [ alpha_mu, alpha_sigma ];
  dt = ( tf - ti ) / nt;
%
%  Allocate the output arrays.
%
  t = zeros ( nt + 1, 1 );
  u = zeros ( nt + 1, np + 1 );
%
%  Set the PCE coefficients for the initial time.
%
  t1 = ti;
  u1(0+1) = ui;
  u1(1+1:np+1) = 0.0;
%
%  Copy into the output arrays, and optionally print.
%
  t(0+1) = t1;
  u(0+1,0+1:np+1) = u1(0+1:np+1);

  if ( 0 )
    fprintf ( 1, '  %g:', t1 );
    for i = 0 : np
      fprintf ( 1, '  %g', u1(i+1) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Time integration.
%
  for it = 1 : nt

    t2 = ( ( nt - it ) * ti   ...
         + (      it ) * tf ) ...
         / ( nt      );

    for k = 0 : np

      dp = he_double_product_integral ( k, k );

      term = - alpha(0+1) * u1(k+1);

      i = 1;
      for j = 0 : np
        tp = he_triple_product_integral ( i, j, k );
        term = term - alpha(1+1) * u1(j+1) * tp / dp;
      end

      u2(k+1) = u1(k+1) + dt * term;

    end
%
%  Prepare for next step.
%
    t1 = t2;
    u1(0+1:np+1) = u2(0+1:np+1);
%
%  Copy into the output arrays, and optionally print.
%
    t(it+1) = t1;
    u(it+1,0+1:np+1) = u1(0+1:np+1);

    if ( 0 )
      fprintf ( 1, '  %g:', t1 );
      for i = 0 : np
        fprintf ( 1, '  %g', u1(i+1) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
