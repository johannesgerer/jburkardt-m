function emweak ( seed, method )

%*****************************************************************************80
%
%% EMWEAK tests the weak convergence of the Euler-Maruyama method.
%
%  Discussion:
%
%    The SDE is 
%
%      dX = lambda * X dt + mu * X dW,   
%      X(0) = Xzero,
%
%    where 
%
%      lambda = 2,
%      mu = 1,
%      Xzero = 1.
%
%    The discretized Brownian path over [0,1] has dt = 2^(-9).
%
%    The Euler-Maruyama method will use 5 different timesteps:
%
%      2^(p-10),  p = 1,2,3,4,5.
%
%    We examine weak convergence at T=1:
%
%      | E (X_L) - E (X(T)) |.
%
%  Modified:
%
%    26 September 2006
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
%    Volume 43, Number 3, September 2001, pages 525-546
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Input, integer METHOD.
%    0, use the standard Euler-Maruyama method;
%    1, use the weak Euler-Maruyama method.
%
  if ( nargin < 1 )
    seed = 123456789;
    fprintf ( 1, '  Using default value of SEED = %d\n', seed );
  end
%
%  Initialize the random number generator.
%
  rng ( seed );  
%
%  Problem parameters;
%
  lambda = 2.0;
  mu = 0.1;
  xzero = 1.0;
%
%  Stepping parameters.
%
  tmax = 1.0;
  dtvals = 2.^([1:5]-10); 
%
%  The number of paths to sample.
%
  m = 50000;
%
%  Take various Euler timesteps.
%  For stepsize dt, we will need to take L Euler steps to reach time TMAX.
%
  xem = zeros(5,1);

  for p = 1 : 5

    dt = dtvals(p);
    l = tmax / dt;
    xtemp = xzero * ones(m,1);            

    for j = 1 : l

      if ( method == 0 )
        winc = sqrt ( dt ) * randn(m,1);
      else
        winc = sqrt ( dt ) * sign ( randn(m,1) );
      end

      xtemp = xtemp + dt * lambda * xtemp + mu * xtemp .* winc;

    end
%
%  Average the M results for this stepsize.
%
    xem(p) = mean ( xtemp );

  end
%
%  Compute the error in the estimates for each stepsize.
%
  xerr = abs ( xem - exp ( lambda ) );
%
%  Least squares fit of error = C * dt^q
%
  A = [ ones(p,1), ( log ( dtvals ) )' ];
  rhs = log ( xerr );
  sol = A \ rhs;
  q = sol(2);

  fprintf ( 1, '\n' );
  fprintf ( 1, 'EMWEAK:\n' );
  if ( method == 0 )
    fprintf ( 1, '  Using standard Euler-Maruyama method.\n' );
  else
    fprintf ( 1, '  Using weak Euler-Maruyama method.\n' );
  end
  fprintf ( 1, '  Least squares solution to Error = c * dt ^ q\n' );
  fprintf ( 1, '  Expecting a value near 1\n' );
  fprintf ( 1, '  q = %g\n', q );
  resid = norm ( A * sol - rhs );
  fprintf ( 1, '  Residual is %g\n', resid );
%
%  Plotting.
%  Include a reference slope of 1.
%      
  loglog(dtvals,xerr,'b*-', 'Linewidth', 2 )
  hold on
  loglog(dtvals,dtvals,'r--', 'Linewidth', 2)
  hold off
  axis([1e-3 1e-1 1e-4 1])
  xlabel('\Delta t')
  ylabel('| E(X(T)) - Sample average of X_L |')
  if ( method == 0 )
    title ( 'Weak convergence of Euler-Maruyama method','FontSize',10)
  else
    title ( 'Weak convergence of weak Euler-Maruyama method','FontSize',10)
  end
  grid on

  if ( method == 0 )
    filename = 'emweak0.png';
  else
    filename = 'emweak1.png';
  end
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s"\n', filename );

  return
end
