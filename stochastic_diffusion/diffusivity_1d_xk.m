function dc = diffusivity_1d_xk ( dc0, omega, x )

%*****************************************************************************80
%
%% DIFFUSIVITY_1D_XK evaluates a 1D stochastic diffusivity function.
%
%  Discussion:
%
%    The 1D diffusion equation has the form
%
%      - d/dx ( DC(X) Del U(X) ) = F(X)
%
%    where DC(X) is a function called the diffusivity.
%
%    In the stochastic version of the problem, the diffusivity function
%    includes the influence of stochastic parameters:
%
%      - d/dx ( DC(X;OMEGA) d/dx U(X) ) = F(X).
%
%    In this function, the domain is assumed to be the unit interval [0.1].
%
%
%    For DC0 = 1 and F(X) = 0, with boundary conditions U(0:OMEGA) = 0,
%    U(1;OMEGA) = 1, the exact solution is
%
%    If OMEGA ~= 0:
%
%      U(X;OMEGA) = log ( 1 + OMEGA * X ) / log ( 1 + OMEGA )
%
%    If OMEGA = 0:
%
%      U(X;OMEGA) = X
%
%    In the numerical experiments described in the paper, OMEGA was taken
%    to be a  random variable with a Beta, or Uniform, or Gaussian or 
%    Poisson or Binomial distribution.
%
%    For the Gaussian and Poisson distributions, the positivity requirement could not
%    be guaranteed, and the experiments were simply made with a "small"
%    variance of 0.1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dongbin Xiu, George Karniadakis,
%    Modeling uncertainty in steady state diffusion problems via
%    generalized polynomial chaos,
%    Computer Methods in Applied Mechanics and Engineering,
%    Volume 191, 2002, pages 4927-4948.
%
%  Parameters:
%
%    Input, real DC0, the constant term in the expansion of the 
%    diffusion coefficient.  Take DC0 = 1.
%
%    Input, real OMEGA, the stochastic parameters.  
%    0 < DC0 + OMEGA.
%
%    Input, real X, the point where the diffusion coefficient is to 
%    be evaluated.
%
%    Output, real DC, the value of the diffusion coefficient at X.
%
  dc = dc0 + omega * x;

  return
end
