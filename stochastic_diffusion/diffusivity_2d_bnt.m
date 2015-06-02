function dc = diffusivity_2d_bnt ( dc0, omega, n, x, y )

%*****************************************************************************80
%
%% DIFFUSIVITY_2D_BNT evaluates a 2D stochastic diffusivity function.
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
%    In this function, the domain is the rectangle [-1.5,0]x[-0.4,0.8].
%
%    The four stochastic parameters OMEGA(1:4) are assumed to be independent
%    identically distributed random variables with mean value zero and 
%    variance 1.  The distribution is typically taken to be Gaussian or
%    uniform.
%
%    A collocation approach to this problem would then use the roots of
%    Hermite or Legendre polynomials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ivo Babuska, Fabio Nobile, Raul Tempone,
%    A stochastic collocation method for elliptic partial differential equations
%    with random input data,
%    SIAM Journal on Numerical Analysis,
%    Volume 45, Number 3, 2007, pages 1005-1034.
%
%  Parameters:
%
%    Input, real DC0, the constant term in the expansion of the 
%    diffusion coefficient.  Take DC0 = 10.
%
%    Input, real OMEGA(4), the stochastic parameters.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), Y(N), the points where the diffusion coefficient is to 
%    be evaluated.
%
%    Output, real DC(N), the value of the diffusion coefficient at (X,Y).
%
  arg = omega(1) * cos ( pi * x ) ...
      + omega(2) * sin ( pi * x ) ...
      + omega(3) * cos ( pi * y ) ...
      + omega(4) * sin ( pi * y );

  arg = exp ( - 0.125 ) * arg;

  dc = dc0 + exp ( arg );

  return
end
