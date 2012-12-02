function cvt_1d_nonuniform ( )

%*****************************************************************************80
%
%% CVT_1D_NONUNIFORM computes a CVT using a nonuniform density.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension, which must be 1
%    for this code.
%
%    Input, integer N, the number of generators.
%    A nice value to start with is 10.
%
%    Input, integer DENSITY_FUNCTION,
%    0: s -> s
%    1: s -> sqrt(s)
%    2: s -> s^(1/3)
%    3: s -> s^(1/4)
%    4: s -> log ( e / ( e - s * ( e - 1 ) ) );
%    5: s -> 0.5+atan(50*(x-0.5))/pi;
%
%    Input, integer SAMPLE_FUNCTION_INIT,
%    0: initialize generators using the MATLAB RAND function;
%    1: initialize generators to a uniform grid;
%    2: initialize all generators to zero.
%
%    Input, integer SAMPLE_NUM_CVT, the number of sample points
%    generated on each iteration.  This should be much more than
%    the number of generator points, say 20 to 100 times as much.
%
%    Input, integer SAMPLE_NUM_STEPS, the number of CVT iterations
%    carried out.  Things should have settled down after 100 steps.
%
%    Input, integer SEED, a seed for the random number generator.
%
  m = 1;
  n = 10;
  density_function = 5;
  sample_function_init = 0;
  sample_num_cvt = 10000;
  sample_num_steps = 100;
  seed = 123456789;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_1D_NONUNIFORM\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M =        %d\n', m );
  fprintf ( 1, '  Number of generators N =     %d\n', n );

  if ( density_function == 0 )
    fprintf ( 1, '  s -> s.\n' );
  elseif ( density_function == 1 )
    fprintf ( 1, '  s -> sqrt(s).\n' );
  elseif ( density_function == 2 )
    fprintf ( 1, '  s -> s^(1/3).\n' );
  elseif ( density_function == 3 )
    fprintf ( 1, '  s -> s^(1/4).\n' );
  elseif ( density_function == 4 )
    euler = exp ( 1 );
    fprintf ( 1, '  s -> log ( e / ( e - s * ( e - 1 ) ) ).\n' );
  elseif ( density_function == 5 )
    fprintf ( 1, '  s -> 0.5+atan(50*(x-0.5))/pi.\n' );
  end 

  if ( sample_function_init == 0 )
    fprintf ( 1, '  Initialize using RAND (MATLAB intrinsic).\n' );
    generator(1:n,1) = rand ( 1, n )';
  elseif ( sample_function_init == 1 )
    fprintf ( 1, '  Initialize using uniform grid.\n' );
    generator(1:n,1) = linspace ( 0, 1, n )';
  elseif ( sample_function_init == 2 )
    fprintf ( 1, '  Initialize all points to 0.\n' );
    generator(1:n,1) = 0;
  end

  fprintf ( 1, '  The number of sampling points per iteration = %d\n', ...
    sample_num_cvt );
  fprintf ( 1, '  The number of iterations = %d\n', sample_num_steps );
  fprintf ( 1, '  Initial random number seed = %d\n', seed );
  fprintf ( 1, '\n' );
%
%  Initialize the plotting arrays.
%
  x(1:n,1:sample_num_steps+1) = zeros ( n, sample_num_steps+1 );

  x(1:n,1) = generator(1:n,1);

  y = ( 0 : sample_num_steps );

  for step = 1 : sample_num_steps

    generator_new(1:n,1) = zeros ( n, 1 );
    tally(1:n) = 0;

    for j = 1 : sample_num_cvt
%
%  Generate a random sampling point S.
%  Unless the density function is #0, the sampling point will be
%  biased by a nonuniform density function.
%
      s = rand ( 1, 1 );

      if ( density_function == 0 )

      elseif ( density_function == 1 )
        s = sqrt ( s );
      elseif ( density_function == 2 )
        s = s^(1.0/3.0);
      elseif ( density_function == 3 )
        s = s^(1.0/4.0);
      elseif ( density_function == 4 )
        s = log ( euler / ( euler - s * ( euler - 1 ) ) );
      elseif ( density_function == 5 )
        s = 0.5+atan(50*(s-0.5))/pi;
      end 
%
%  Find the nearest cell generator.
%
      nearest = 1;
      dist = abs ( generator(1,1) - s );
     
      for k = 2 : n
        if ( abs ( generator(k,1) - s ) < dist )
          nearest = k;
          dist = abs ( generator(k,1) - s );
        end 
      end
%
%  Add S to the sum of all points in its generator.
%
      generator_new(nearest,1) = generator_new(nearest,1) + s;
      tally(nearest) = tally(nearest) + 1;

    end
%
%  Dividing each generator's sum by the number of points in the sum
%  produces the updated position of the generator.
%
    for j = 1 : n
      if ( tally(j) ~= 0 )
        generator(j,1) = generator_new(j,1) / tally(j);
      end
    end

    x(1:n,step+1) = generator(1:n,1);
  
  end
%
%  Plot the evolution of the locations of the generators.
%
  clf;

  for k = 1 : n
    plot ( x(k,1:sample_num_steps+1), y )
    hold on;
  end

  hold off;

  title ( 'Evolution of generator locations during iteration.' );
  xlabel ( 'Generator positions' );
  ylabel ( 'Iterations' ); 

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_1D_NONUNIFORM\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

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
