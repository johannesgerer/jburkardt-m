function x = brownian_motion_simulation ( m, n, d, t )

%*****************************************************************************80
%
%% BROWNIAN_MOTION_SIMULATION simulates Brownian motion.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%    This defaults to 2.
%
%    Input, integer N, the number of time steps to take, plus 1. 
%    This defaults to 1001.
%
%    Input, real D, the diffusion coefficient.  
%    This defaults to 10.0.
%
%    Input, real T, the total time.
%    This defaults to 1.0;
%
%    Output, real X(M,N), the initial position at time 0.0, and 
%    the N-1 successive locations of the particle.
%

%
%  Supply default values if necessary.
%
  if ( nargin < 4 )
    t = 1.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default total time T = %g\n', t );
  end

  if ( nargin < 3 )
    d = 10.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default diffusion coefficient D = %g\n', d );
  end

  if ( nargin < 2 )
    n = 1001;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default number of steps N = %g\n', n );
  end

  if ( nargin < 1 )
    m = 2;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using default spatial dimension M = %g\n', m );
  end
%
%  Set the time step.
%
  dt = t / ( n - 1 );
%
%  Compute the individual steps.
%
  x = zeros ( m, n );
%
%  Stepsize is normal.
%
  s = sqrt ( d * dt ) * randn ( 1, n - 1 );
%
%  Direction is random.
%
  if ( m == 1 )
    dx(1:m,1:n-1) = s(1:n-1);
  else
    a = randn ( m, n - 1 );
    v = s ./ sqrt ( sum ( a.^2 ) );
    b = spdiags ( v', 0, n-1, n-1 );
    dx(1:m,1:n-1) = a * b;
  end
%
%  Each position is the sum of the previous steps.
%
  x(1:m,2:n) = cumsum ( dx(1:m,1:n-1), 2 );

  return
end
