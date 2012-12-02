%% RD_FEM solves a 1D reaction/diffusion problem using finite elements.
%
%  Discussion:
%
%    This script sets up and runs a finite element simulation code 
%    for a 1D reaction/diffusion equation.
%
%    The dynamics are given by the following reaction/diffusion equation
%    for the function W(T,X):
%
%      W_t = W_xx + NL(W,c),
%
%    where NL(W,c) is a polynomial in W:
%
%       NL(W,c) = c(1) + c(2) * W + c(3) * W^2 + c(4) * W^3
%
%    with Neumann boundary conditions at X = 0.0 and X = 1.0:
%
%      W_x(T,0.0) = 0.0
%      W_x(T,1.0) = 0.0
%
%    and initial condition at T = 0.0:
%
%      W(0,X) = sin ( pi * X ).
%
%    The problem is to be solved for 0.0 <= T <= 4.0, 0.0 <= X <= 1.0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 April 2011
%
%  Author:
%
%   Eugene Cliff
%
%  Reference:
%
%    Jeffrey Borggaard, John Burkardt, John Burns, Eugene Cliff,
%    Working Notes on a Reaction Diffusion Model: a Finite Element Formulation.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RD_FEM:\n' );
  fprintf ( 1, '  Solve a 1D time-dependent reaction/diffusion problem\n' );
  fprintf ( 1, '  with a nonlinear term and Neumann boundary conditions,\n' );
  fprintf ( 1, '  using Neumann boundary conditions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The equation is discretized using the finite element method.\n' );
%
%  Set initial condition.
%  The first option uses a centered hat.
%
  if ( 0 )
    w_0 = @(x) 1.0 + basic_hat ( 8.0 * x - 4.0 );
  else
    w_0 = @(x) sin(pi*x);
  end
%
%  Set the polynomial coefficients of the reaction term.
%  Here, c = -x + x^3 = x * ( x^2 - 1 )
%
  c = [ 0.0; -1.0; 0.0; 1.0 ];
%
%  Select 101 times for output.
%
  t = ( 0.0 : 0.04 : 4.0 );
%
%  The number of spatial grid points is N+1;
%
  n = 32;
  x = linspace ( 0.0, 1.0, n + 1 );
%
%  T is a vector of 101 times.
%  W is an array of 101x33 function values.
%
  [ T, W ] = rd_lin_spline ( w_0, t, n, c );
%
%  Plot the results.
%
  plot_rd ( t, x, W, c )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RD_FEM:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );
