function dsq = brownian_displacement_simulation ( k, n, m, d, t )

%*****************************************************************************80
%
%% BROWNIAN_DISPLACEMENT_SIMULATION simulates Brownian displacement.
%
%  Discussion:
%
%    This function computes the square of the distance of the Brownian
%    particle from the starting point, repeating this calculation 
%    several times.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer K, the number of repetitions.
%    The default is 20;
%
%    Input, integer N, the number of time steps to take, plus 1.
%    This might be 1001.
%
%    Input, integer M, the spatial dimension.  Typically, this is 2.
%
%    Input, real D, the diffusion coefficient.  This might be 10.0.
%    Computationally, this is simply a scale factor between time and space.
%
%    Input, real T, the total time, which defaults to 1.0.
%
%    Output, real DSQ(K,N), the displacements over time for each repetition.
%    DSQ(:,1) is 0.0, because we include the displacement at the initial time. 
%

%
%  Supply default values if necessary.
%
  if ( nargin < 5 )
    t = 1.0;
  end

  if ( nargin < 4 )
    d = 10.0;
  end

  if ( nargin < 3 )
    m = 2;
  end

  if ( nargin < 2 )
    n = 1001;
  end

  if ( nargin < 1 )
    k = 20;
  end
%
%  Set the time step.
%
  dt = t / ( n - 1 );

  dsq = zeros ( k, n );

  for i = 1 : k
%
%  Compute the individual steps.
%
    x = zeros ( m, n + 1 );
%
%  Stepsize is normal.
%
    s = sqrt ( d * dt ) * randn ( 1, n - 1 );
%
%  Direction is random.
%
    if ( m == 1 )
      dx(1:m,1:n - 1) = s;
    else
      a = randn ( m, n - 1 );
      v = s ./ sqrt ( sum ( a.^2 ) );
      b = spdiags ( v', 0, n - 1, n - 1 );
      dx(1:m,1:n-1) = a * b;
    end
%
%  Each position is the sum of the previous steps.
%
    x(1:m,2:n) = cumsum ( dx(1:m,1:n-1), 2 );

    if ( m == 1 )
      dsq(i,1:n) = x(1,1:n).^2;
    else
      dsq(i,1:n) = sum ( x(1:m,1:n).^2 );
    end

  end

  return
end
