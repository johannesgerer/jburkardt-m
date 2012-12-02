function chain ( seed )

%*****************************************************************************80
%
%% CHAIN tests the stochastic Chain Rule.
%
%  Discussion:
%
%    This function solves a stochastic differential equation for 
%
%      V = sqrt(X) 
%
%    where X satisfies the stochastic differential equation:
% 
%      dX = ( alpha - X ) * dt + beta * sqrt(X) dW,
%      X(0) = Xzero,
%
%    with 
%
%      alpha = 2,
%      beta = 1,
%      Xzero = 1.
%
%    From the stochastic Chain Rule, the SDE for V is therefore:
%
%      dV = ( ( 4 * alpha - beta^2 ) / ( 8 * V ) - 1/2 V ) dt + 1/2 beta dW
%      V(0) = sqrt ( Xzero ).
%
%    Xem is the Euler-Maruyama solution for X. 
%
%    Vem is the Euler-Maruyama solution of the SDE for V from
%    the stochastic Chain Rule.
%
%    Hence, we compare sqrt(Xem) and Vem.
%
%  Modified:
%
%    05 October 2006
%
%  Author:
%
%    Desmond Higham
%
%  Reference:
%
%    Desmond Higham,
%    An Algorithmic Introduction to Numerical Simulation of
%    Stochastic Differential Equations,
%    SIAM Review,
%    Volume 43, Number 3, September 2001, pages 525-546.
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHAIN\n' );
  fprintf ( 1, '  Solve a stochastic differential equation involving a function\n' );
  fprintf ( 1, '  of a stochastic variable X.\n' );
  fprintf ( 1, '  We can solve for X(t), and then evaluate V(X(t)).\n' );
  fprintf ( 1, '  Or, we can apply the stochastic chain rule to derive an\n' );
  fprintf ( 1, '  an SDE for V, and solve that.\n' );
 
  if ( nargin < 1 )
    seed = 123456789;
    fprintf ( 1, '  Using default value of SEED = %d\n', seed );
  end
%
%  Initialize the random number generator.
%
  rng ( seed )
%
%  Set problem parameters.
%
  alpha = 2.0; 
  beta = 1.0;
%
%  Stepping parameters.
%  dt2 is the size of the Euler-Maruyama steps.
%
  tmax = 1.0;
  n = 200;
  dt = tmax / n;
  dt2 = dt;
%
%  Define the increments dW.
%
  dw = sqrt ( dt ) * randn ( 1, n );
%
%  Solve for X(t).
%
  xzero = 1.0; 
  xem = zeros(1,n);
  xtemp = xzero;

  for j = 1 : n
    f1 = ( alpha - xtemp );
    g1 = beta * sqrt ( abs ( xtemp ) );
    xtemp = xtemp + dt2 * f1 + dw(j) * g1;
    xem(j) = xtemp;
  end
%
%  Solve for V(t).
%
  vzero = sqrt ( xzero );
  vem = zeros(1,n);
  vtemp = vzero;

  for j = 1 : n
    f2 = ( 4 * alpha - beta^2 ) / ( 8 * vtemp ) - vtemp / 2;
    g2 = beta / 2;
    vtemp = vtemp + dt2 * f2 + dw(j) * g2;
    vem(j) = vtemp;
  end
%
%  Compare sqrt(X) and V.
%
  xdiff = norm ( sqrt ( xem ) - vem, 'inf' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum difference = %g\n', xdiff );
%
%  Plot the results.
%
  plot ( [0:dt2:tmax], [sqrt([xzero,abs(xem)])], 'b-', ...
         [0:dt2:tmax], [vzero,vem], 'ro' )

  legend ( 'Direct Solution', 'Solution via Chain Rule', 2 )
  xlabel ( 't', 'FontSize', 12 ) 
  ylabel ( 'V(X)', 'FontSize', 16, 'Rotation', 0, 'HorizontalAlignment', 'right' )
  title ( 'Stochastic Differential Equation Solution by CHAIN' )
  grid on

  filename = 'chain.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s"\n', filename );

  return
end
