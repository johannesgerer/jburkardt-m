function stab_asymptotic ( seed )

%*****************************************************************************80
%
%% STAB_ASYMPTOTIC examines asymptotic stability.
%
%  Discussion:
%
%    The function tests the asymptotic stability
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STAB_ASYMPTOTIC:\n' );
  fprintf ( 1, '  Investigate asymptotic stability of Euler-Maruyama\n' );
  fprintf ( 1, '  solution with stepsize DT and MU.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SDE is asymptotically stable if\n' );
  fprintf ( 1, '    Real ( lambda - 1/2 mu^2 ) < 0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  EM with DT is asymptotically stable if\n' );
  fprintf ( 1, '    E log ( 1 + lambda dt - sqrt(dt) mu n(0,1) ) < 0.\n' );
  fprintf ( 1, '  where n(0,1) is a normal random value.\n' );

  if ( nargin < 1 )
    seed = 123456789;
    fprintf ( 1, '  Using default value of SEED = %d\n', seed );
  end
%
%  Initialize the random number generator.
%
% rng ( seed )
  rand ( 'state', seed );
%
%  Set line types for the plot.
%
  ltype = { 'b-', 'r--', 'm-.' };
%
%  Step parameters.
%
  tmax = 500.0;
%
%  Problem parameters.
%
  lambda = 0.5;
  mu = sqrt ( 6.0 );
  xzero = 1.0;
%
%  Test the SDE.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Lambda = %g\n', lambda );
  fprintf ( 1, '  Mu =     %g\n', mu );
  test = lambda - 0.5 * mu * mu;
  fprintf ( 1, '  SDE asymptotic test = %g\n', test );

  for k = 1 : 3

    dt = 2^(1-k);
%
%  Test the EM for this DT.
%
    fprintf ( 1, '\n' );      
    fprintf ( 1, '  dt = %g\n', dt );
    u = randn ( 1000, 1 );
    u = log ( 1.0 + lambda * dt - sqrt ( dt ) * mu * u );
    test = sum ( u ) / 1000.0;
    fprintf ( 1, '  EM asymptotic test = %g\n', test );
  
    n = tmax / dt;
    xemabs = zeros(1,n);
    xtemp = xzero;

    for j = 1 : n
      winc = sqrt ( dt ) * randn;      
      xtemp = xtemp + dt * lambda * xtemp + mu * xtemp * winc;
      xemabs(j) = abs ( xtemp );
    end

    semilogy ( [0:dt:tmax], [xzero,xemabs], ltype{k}, 'Linewidth', 2 );
    hold on

  end

  legend ( '\Delta t = 1','\Delta t = 1/2','\Delta t = 1/4' )
  title ( 'Single Path: \lambda = 1/2, \mu = \surd 6','FontSize',16 )
  ylabel ( '|X|','FontSize',12 );
  xlabel ( '<---T--->' )
  axis ( [0,tmax,1e-50,1e+100] );
  grid on
  hold off

  filename = 'stab_asymptotic.png';
  print ( '-dpng', filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s".\n', filename );

  return
end
