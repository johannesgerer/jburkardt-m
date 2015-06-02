function seed = monte_carlo_rule ( m, n, seed )

%*****************************************************************************80
%
%% MONTE_CARLO_RULE creates a Monte Carlo quadrature rule.
%
%  Discussion:
%
%    MONTE_CARLO_RULE generates N points in the M-dimensional unit hypercube,
%    and writes out files so that the data can be regarded as a quadrature rule.
%
%  Usage:
%
%    monte_carlo_rule ( m, n, seed )
%
%    where
%
%    * M, the spatial dimension,
%    * N, the number of points to generate,
%    * SEED, the seed, a positive integer.
%
%  License:
%
%    This software is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONTE_CARLO_RULE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute the abscissas and weights of a quadrature rule\n' );
  fprintf ( 1, '  that is simply a Monte Carlo sampling.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Inputs to the program include:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    M, the spatial dimension.\n' );
  fprintf ( 1, '    N, the number of points to generate.\n' );
  fprintf ( 1, '    S, a positive integer used as the random number seed.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Output from the program includes:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    * A set of 3 files that define the quadrature rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    "mc_m?_n?_s?_r.txt", a file of the ranges.\n' );
  fprintf ( 1, '    "mc_m?_n?_s?_w.txt", a file of the weights;\n' );
  fprintf ( 1, '    "mc_m?_n?_s?_x.txt", a file of the abscissas;\n' );
%
%  Get the spatial dimension.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    m = input ( '  Enter the value of M (1 or greater): ' );
  elseif ( ischar ( m ) )
    m = str2num ( m );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M is = %d\n', m );
%
%  Get the number of points.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    n = input ( '  Enter the value of N (0 or greater): ' );
  elseif ( ischar ( n ) )
    n = str2num ( n );
  end

  fprintf ( 1, '  Number of points N = %d\n', n );
%
%  Get the seed.
%
  if ( nargin < 3 )
    fprintf ( 1, '\n' );
    seed = input ( '  Enter the value of SEED (1 or greater): ' );
  elseif ( ischar ( seed ) )
    seed = str2num ( seed );
  end

  fprintf ( 1, '  Random number seed SEED = %d\n', seed );
  seed_initial = seed;
%
%  The range R:
%
  r = zeros ( m, 2 );
  r(m,1) =  0.0;
  r(n,2) = +1.0;
%
%  The weights W:
%
  w = zeros ( n, 1 );
  w(1:n) = 1.0 / n;
%
%  The points X:
%
  [ x, seed ] = r8mat_uniform_01 ( m, n, seed );
%
%  Write the rule to files.
%
  r_filename = sprintf ( 'mc_m%d_n%d_s%d_r.txt', m, n, seed_initial );
  w_filename = sprintf ( 'mc_m%d_n%d_s%d_w.txt', m, n, seed_initial );
  x_filename = sprintf ( 'mc_m%d_n%d_s%d_x.txt', m, n, seed_initial );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Creating R file = "%s".\n', r_filename );

  r8mat_write ( r_filename, m, 2, r );

  fprintf ( 1, '  Creating W file = "%s".\n', w_filename );

  r8mat_write ( w_filename, n, 1, w );

  fprintf ( 1, '  Creating X file = "%s".\n', x_filename );

  r8mat_write ( x_filename, m, n, x );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONTE_CARLO_RULE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

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
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
%  For smaller data files, and less precision, try:
%
%     fprintf ( output_unit, '  %14.6f', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16f', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function timestamp ( )

%*******************************************************************************
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

