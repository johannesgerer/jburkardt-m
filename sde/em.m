function em ( seed )

%*****************************************************************************80
%
%% EM applies the Euler-Maruyama method to a linear SDE.
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
%    The discretized Brownian path over [0,1] uses
%    a stepsize dt = 2^(-8).
%
%    The Euler-Maruyama method uses a larger timestep Dt = R*dt,
%    where R is an integer.  For an SDE of the form
%
%      dX = f(X(t)) dt + g(X(t)) dW(t)
%
%    it has the form
%
%      X(j) = X(j-1) + f(X(j-1)) * Dt + g(X(j-1)) * ( W(j*Dt) - W((j-1)*Dt) )
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
  lambda = 2.0;
  mu = 1.0;
  xzero = 1.0;
%
%  Set stepping parameters.
%
  tmax = 1.0;
  n = 2^8;
  dt = tmax / n;
%
%  Compute the Brownian increments.
%
  dw = sqrt ( dt ) * randn ( 1, n );
%
%  Sum the Brownian increments.
%
  w = cumsum ( dw );
%
%  Compute the discretized Brownian path.
%
  xtrue = xzero * exp ( ( lambda - 0.5 * mu^2 ) * ( [dt:dt:tmax] ) + mu * w ); 
%
%  Set:
%  R, the multiplier for the EM step, 
%  Dt, the EM stepsize,
%  L, the number of EM steps.
%
  r = 4;
  dt2 = r * dt;
  l = n / r;
%
%  Preallocate Xem for efficiency.
%
  xem = zeros ( 1, l );
  xtemp = xzero;
  for j = 1 : l
    winc = sum ( dw ( r*(j-1)+1 : r*j ) ); 
    xtemp = xtemp + dt2 * lambda * xtemp + mu * xtemp * winc;
    xem(j) = xtemp;
  end

  emerr = abs ( xem(end) - xtrue(end) );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EM:\n' );
  fprintf ( 1, '  Xem(Tfinal) - Xtrue(Tfinal) = %g\n', emerr );
%
%  Plotting.
%
  plot ( [0:dt:tmax], [xzero, xtrue ], 'b-' );
  hold on
  plot ( [0:dt2:tmax], [xzero,xem], 'r--*' )
  legend ( 'true', 'EM Approximation' )
  hold off
  xlabel ( 't', 'FontSize', 12 )
  ylabel ( 'X(t)', 'FontSize', 16, 'Rotation', 0, 'HorizontalAlignment', 'right' )
  title ( 'Euler-Maruyama solution of SDE' )
  grid on

  filename = 'em.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s"\n', filename );

  return
end
