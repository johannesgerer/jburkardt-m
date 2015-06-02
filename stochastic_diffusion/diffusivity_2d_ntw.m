function dc = diffusivity_2d_ntw ( cl, dc0, m, omega, n, x, y )

%*****************************************************************************80
%
%% DIFFUSIVITY_2D_NTW evaluates a 2D stochastic diffusivity function.
%
%  Discussion:
%
%    The 2D diffusion equation has the form
%
%      - Del ( DC(X,Y) Del U(X,Y) ) = F(X,Y)
%
%    where DC(X,Y) is a function called the diffusivity.
%
%    In the stochastic version of the problem, the diffusivity function
%    includes the influence of stochastic parameters:
%
%      - Del ( DC(X,Y;OMEGA) Del U(X,Y;OMEGA) ) = F(X,Y).
%
%    In this function, the domain is the rectangle [0,D]x[0,D] where D = 1.
%
%    Note that in this problem the diffusivity has a one-dimensional
%    spatial dependence on X, but not on Y!
%
%    The random variables OMEGA are independent, have zero mean and unit
%    variance, and are uniformly distributed in [-sqrt(3),+sqrt(3)].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Xiang Ma, Nicholas Zabaras,
%    An adaptive hierarchical sparse grid collocation algorithm for the solution
%    of stochastic differential equations,
%    Journal of Computational Physics,
%    Volume 228, pages 3084-3113, 2009.
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, real CL, the desired physical correlation length for the
%    coefficient.
%
%    Input, real DC0, the constant term in the expansion of the 
%    diffusion coefficient.  Take DC0 = 0.5.
%
%    Input, integer M, the number of terms in the expansion.
%
%    Input, real OMEGA(M), the stochastic parameters.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), Y(N), the points where the diffusion coefficient is to 
%    be evaluated.
%
%    Output, real DC(N), the value of the diffusion coefficient at (X,Y).
%
  d = 1.0;
  lp = max ( d, 2.0 * cl );
  l = cl / lp;

  dc_arg = 1.0 + omega(1) * sqrt ( sqrt ( pi ) * l / 2.0 );

  for i = 2 : m

    zeta_arg = - ( floor ( i / 2 ) * pi * l )^2 / 8.0;
    zeta = sqrt ( sqrt ( pi ) * l ) * exp ( zeta_arg );

    if ( mod ( i, 2 ) == 0 )
      phi = sin ( floor ( i / 2 ) * pi * x / lp );
    else
      phi = cos ( floor ( i / 2 ) * pi * x / lp );
    end

    dc_arg = dc_arg + zeta * phi * omega(i);

  end

  dc = dc0 + exp ( dc_arg );

  return
end
