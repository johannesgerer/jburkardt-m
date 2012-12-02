function stab_meansquare ( seed )

%*****************************************************************************80
%
%% STAB_MEANSQUARE examines mean-square stability.
%
%  Discussion:
%
%    The function tests the mean-square stability
%    of the Euler-Maruyama method applied to a stochastic differential
%    equation (SDE).
%
%    The SDE is
%
%      dX = lambda*X dt + mu*X dW,
%      X(0) = Xzero,
%
%    where 
%
%      lambda is a constant,
%      mu is a constant,
%      Xzero = 1.
%
%  Modified:
%
%    04 October 2006
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
%    In the reference, this value is set to 100.
%
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
  tmax = 20.0;
  m = 50000;
  xzero = 1;          
%
%  Set line types for the plot.
%
  ltype = { 'b-', 'r--', 'm-.' };
%
%  Problem parameters.
%
  lambda = -3.0;
  mu = sqrt ( 3.0 );
%
%  XMS is the mean square estimate of M paths.
%
  for k = 1 : 3

    dt = 2^(1-k);                      
    n = tmax / dt;
    xms = zeros(1,n);
    xtemp = xzero * ones(m,1);

    for j = 1 : n
      winc = sqrt ( dt ) * randn(m,1);  
      xtemp = xtemp + dt * lambda * xtemp + mu * xtemp .* winc;
      xms(j) = mean ( xtemp.^2 );
    end

    semilogy ( [0:dt:tmax], [xzero,xms], ltype{k}, 'Linewidth', 2 ), 
    hold on

  end

  legend ( '\Delta t = 1','\Delta t = 1/2','\Delta t = 1/4' )
  title ( 'Mean-Square: \lambda = -3, \mu = \surd 3', 'FontSize', 16 )
  ylabel ( 'E[X^2]','FontSize', 12 );
  xlabel ( '<---T--->' )
  axis ( [0,tmax,1e-20,1e+20] );
  grid on
  hold off

  filename = 'stab_meansquare.png';
  print ( '-dpng', filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'STAB_MEANSQUARE:\n' );
  fprintf ( 1, '  Plot saved as "%s".\n', filename );

  return
end
