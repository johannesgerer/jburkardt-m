function hyperball_volume_monte_carlo ( m, seed )

%*****************************************************************************80
%
%% MAIN is the main program for HYPERBALL_VOLUME_MONTE_CARLO.
%
%  Discussion:
%
%    M = 6 is a reasonable test.
%
%    The original value N_LOG2_MAX = 25 would not run on my version
%    of MATLAB because of memory problems, and so I reduced it to 24.
%
%    To solve bigger problems, it would be better to compute the new points
%    in batches whose maximum size is limited.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2014
%
%  Author:
%
%    John Burkardt
%
  n_log2_max = 24;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERBALL_VOLUME_MONTE_CARLO:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Use a Monte Carlo approach to estimate the volume of\n' );
  fprintf ( 1, '  the unit hyperball in M dimensions.\n' );
%
%  Get the spatial dimension:
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HYPERBALL_VOLUME_MONTE_CARLO:\n' );
    m = input ( '  Enter the spatial dimension: ' );
  elseif ( ischar ( m ) )
    m = str2num ( m );
  end
%
%  Get the random number seed if it was supplied on the command line.
%
  if ( nargin < 2 )
    seed = 123456789
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HYPERBALL_VOLUME_MONTE_CARLO:\n' );
    fprintf ( 1, '  Using default seed for random number generator.\n' );
  elseif ( ischar ( seed ) )
    seed = str2num ( seed );
  end
%
%  Report user input.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension is  %d\n', m );
  fprintf ( 1, '  The random number seed is %d\n', seed );
%
%  Begin computation.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Log(N)         N      Estimate         Error\n' );
  fprintf ( 1, '\n' );

  quad = 0.0;
  volume = 2.0 ^ m;

  for n_log2 = 0 : n_log2_max

    if ( n_log2 == 0 )
      quad = 0.0;
      n_more = 1;
      n = 0;
    elseif ( n_log2 == 1 )
      n_more = 1;
    else
      n_more = 2 * n_more;
    end

    [ x, seed ] = r8mat_uniform_01 ( m, n_more, seed );
%
%  Rescale X from [0,1] to [-1,1].
%
    x(1:m,1:n_more) = 2.0 * x(1:m,1:n_more) - 1.0;

    fx = hyperball01_indicator ( m, n_more, x );

    quad_more = sum ( fx(1:n_more) );
%
%  Incorporate the new data into the totals.
%
    n = n + n_more;
    quad = quad + quad_more;

    estimate = volume * quad / n;
    exact = hyperball01_volume ( m );
    error = abs ( exact - estimate );
    fprintf ( 1, '  %8d  %8d  %16.8g  %10.2g\n', n_log2, n, estimate, error );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '        oo        oo  %16.8g  %10.2g\n', exact, 0.0 );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERBALL_VOLUME_MONTE_CARLO:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function fx = hyperball01_indicator ( dim_num, point_num, x )

%*****************************************************************************80
%
%% HYPERBALL01_INDICATOR evaluates the unit hyperball indicator function.
%
%  Discussion:
%
%    F(X) = 1 if X is inside the unit hyperball, and 0 elsewhere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points to evaluate.
%
%    Input, real X(DIM_NUM,POINT_NUM), the points.
%
%    Output, real FX(POINT_NUM), the indicator value.
%
  x = x.^2;
  fx = ones ( 1, dim_num ) * x;
  fx = ( fx <= 1.0 );

  return
end
function volume = hyperball01_volume ( dim_num )

%*****************************************************************************80
%
%% HYPERBALL01_VOLUME computes the volume of the unit hyperball.
%
%  Discussion:
%
%    Results for the first few values of DIM_NUM are:
%
%     DIM_NUM  Volume
%
%     1    2
%     2    1        * PI
%     3  ( 4 /   3) * PI
%     4  ( 1 /   2) * PI^2
%     5  ( 8 /  15) * PI^2
%     6  ( 1 /   6) * PI^3
%     7  (16 / 105) * PI^3
%     8  ( 1 /  24) * PI^4
%     9  (32 / 945) * PI^4
%    10  ( 1 / 120) * PI^5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Output, real VOLUME, the volume of the sphere.
%
  if ( mod ( dim_num, 2 ) == 0 )
    m = dim_num / 2;
    volume = pi^m;
    for i = 1 : m
      volume = volume / i;
    end
  else
    m = ( dim_num - 1 ) / 2;
    volume = pi^m * 2.0^dim_num;
    for i = m+1 : 2*m+1
      volume = volume / i;
    end
  end

  return
end
function [ r, seed ] = r8mat_uniform_01 ( m, n, seed )

%*****************************************************************************80
%
%% R8MAT_UNIFORM_01 returns a unit pseudorandom R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Linus Schrage,
%    A Guide to Simulation,
%    Springer Verlag, pages 201-202, 1983.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, pages 362-376, 1986.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, pages 136-143, 1969.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, integer SEED, the integer "seed" used to generate
%    the output random number.
%
%    Output, real R(M,N), an array of random values between 0 and 1.
%
%    Output, integer SEED, the updated seed.  This would
%    normally be used as the input seed on the next call.
%
  r = zeros ( m, n );

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_UNIFORM_01 - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8MAT_UNIFORM_01 - Fatal error!' );
  end

  for j = 1 : n
    for i = 1 : m

      seed = floor ( seed );

      seed = mod ( seed, 2147483647 );

      if ( seed < 0 ) 
        seed = seed + 2147483647;
      end 

      k = floor ( seed / 127773 );

      seed = 16807 * ( seed - k * 127773 ) - k * 2836;

      if ( seed < 0 )
        seed = seed + 2147483647;
      end

      r(i,j) = seed * 4.656612875E-10;

    end
  end

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
