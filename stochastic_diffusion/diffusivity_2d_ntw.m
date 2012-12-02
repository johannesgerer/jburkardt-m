function a = diffusivity_2d_bnt ( n, omega, lc, x, y )

%*****************************************************************************80
%
%% DIFFUSIVITY_2D_NTW evaluates a 2D stochastic diffusivity function.
%
%  Discussion:
%
%    The 2D diffusion equation has the form
%
%      - Del ( A(X,Y) Del U(X,Y) ) = F(X,Y)
%
%    where A(X,Y) is a function called the diffusivity.
%
%    In the stochastic version of the problem, the diffusivity function
%    includes the influence of stochastic parameters:
%
%      - Del ( A(X,Y;OMEGA) Del U(X,Y;OMEGA) ) = F(X,Y).
%
%    In this function, the domain is the rectangle [0,D]x[0,D] where D = 1.
%
%    Note that in this problem the diffusivity has a one-dimensional
%    spatial dependence on X, not on Y.
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
%    06 January 2010
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
%    Input, integer N, the number of terms in the expansion.
%
%    Input, real OMEGA(N), the stochastic parameters.
%
%    Input, real LC, the desired phyiscal correlation length for the
%    coefficient a.
%
%    Input, real X(:), Y(:), the points where the diffusion coefficient is to 
%    be evaluated.
%
%    Output, real A(:), the value of the diffusion coefficient at (X,Y).
%
  d = 1.0;
  lp = max ( d, 2.0 * lc );
  l = lc / lp;

  a_arg = 1.0 + omega(1) * sqrt ( sqrt ( pi ) * l / 2.0 );

  for i = 2 : n

    arg_zeta = - ( floor ( i / 2 ) * pi * l )^2 / 8.0;
    zeta = sqrt ( sqrt ( pi ) * l ) * exp ( arg_zeta );

    if ( mod ( i, 2 ) == 0 )
      phi = sin ( floor ( i / 2 ) * pi * x / lp );
    else
      phi = cos ( floor ( i / 2 ) * pi * x / lp );
    end

    a_arg = a_arg + zeta * phi * omega(i);

  end

  a = 0.5D+00 + exp ( a_arg );

  return
end
