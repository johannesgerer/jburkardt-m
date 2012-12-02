function bpath ( seed )

%*****************************************************************************80
%
%% BPATH performs a Brownian path simulation.
%
%  Discussion:
%
%    This routine computes one simulation of discretized Brownian 
%    motion over the time interval [0,1] using 500 time steps.
%    The user specifies a random number seed.  Different values of
%    the seed will result in different realizations of the path.
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
%    Volume 43, Number 3, September 2001, pages 525-546.
%
%  Parameters:
%
%    Input/output, integer SEED, a seed for the random number generator.
%    The default value is 123456789.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BPATH\n' );
  fprintf ( 1, '  Brownian path simulation\n' );

  if ( nargin < 1 )
    seed = 123456789;
    fprintf ( 1, '  Using default value of SEED = %d\n', seed );
  end
%
%  Initialize the random number generator.
%
  rng ( seed )

  tmax = 1.0; 
  n = 500; 
  dt = tmax / n;
%
%  Begin timing.
%
  tic
%
%  Define the increments dW.
%
  dw = sqrt ( dt ) * randn ( 1, n );
%
%  W is the sum of the previous increments.
%
%  MATLAB does not allow zero-based indexing.
%  Otherwise, we would set W(0) = 0.  We
%  can fake it with a variable called W0, however!
%
  w = zeros(1,n);

  w0 = 0.0;
  
  for j = 1 : n

    if ( j == 1 )
      w(j) = w0 + dw(j);
    else
      w(j) = w(j-1) + dw(j); 
    end

  end
%
%  End timing.
%
  toc
%
%  Plot t, W(t).
%
  clf
  hold on
  plot ( [0:dt:tmax], [w0,w], 'LineWidth', 3, 'Color', 'b' )
  plot ( [0, tmax], [0.0, 0.0], 'LineWidth', 2, 'Color', 'k' )
  grid on
  title ( 'Brownian motion realization by BPATH' )
  xlabel ( 't', 'FontSize', 16 ) 
  ylabel ( 'W_t', 'FontSize', 16, 'Rotation', 0 )
  hold off

  filename = 'bpath.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot stored as "%s"\n', filename );

  return
end
