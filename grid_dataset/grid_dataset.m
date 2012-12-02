function r = grid_dataset ( m, n, seed, center )

%*****************************************************************************80
%
%% GRID_DATASET generates a grid dataset and writes it to a file.
%
%  Discussion:
%
%    Interesting features of this problem are the determination
%    of the side of a grid that will generate "about" N points,
%    the method of dropping the extra points at random, and the
%    ability to center the grid inside the unit hypercube in a
%    number of ways.
%
%    The program requests input values from the user:
%
%  Usage:
%
%    grid_dataset ( m, n, seed, center )
%
%    where
%
%    * M, the spatial dimension,
%    * N, the number of points to generate,
%    * SEED, the seed, a positive integer.
%    * CENTER, the grid centering option.
%      1: 0/(  N-1) ... (  N-1)/(  N-1)
%      2: 1/(  N+1) ...    N   /(  N+1)
%      3: 0/   N    ... (  N-1)/   N
%      4: 1/   N    ...    N   /   N
%      5: 1/(2*N)   ... (2*N-1)/(2*N  )
%    * R, the M by N computed dataset.
%
%    The program generates the data, writes it to the file
%
%      grid_M_N_CENTER.txt
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 December 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRID_DATASET\n' );
  fprintf ( 1, '  MATLAB version)\n' );
  fprintf ( 1, '  Generate a grid dataset.\n' );
%
%  Get the spatial dimension.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    m = input ( '  Enter the spatial dimension M: ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
%
%  Get the number of points.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    n = input ( '  Enter the number of points N: ' );
  end

  fprintf ( 1, '  Number of points N = %d\n', n );
%
%  Get the seed.
%
  if ( nargin < 3 )
    fprintf ( 1, '\n' );
    seed = input ( '  Enter the seed: ' );
  end

  fprintf ( 1, '  SEED = %d\n', seed );

  if ( seed == 0 )
    seed = get_seed ( );
    fprintf ( 1, '  Recomputed SEED = %d\n', seed );
  end
%
%  Get CENTER.
%
  if ( nargin < 4 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Enter CENTER, the grid centering option.\n' );
    fprintf ( 1, '  Normal values are between 1 and 5:\n' );
    fprintf ( 1, '  1: 0/(  N-1) ... (  N-1)/(  N-1)\n' );
    fprintf ( 1, '  2: 1/(  N+1) ...    N   /(  N+1)\n' );
    fprintf ( 1, '  3: 0/   N    ... (  N-1)/   N\n' );
    fprintf ( 1, '  4: 1/   N    ...    N   /   N\n' );
    fprintf ( 1, '  5: 1/(2*N)   ... (2*N-1)/(2*N  )\n' );
    center = input ( 'Enter CENTER:  ' );
  end
%
%  Compute the data.
%
  r = grid_generate ( m, n, center, seed );
%
%  Write the data to a file.
%
  output_filename = ...
  strcat ( 'grid_', num2str ( m ), '_', num2str ( n ), ...
             '_', num2str ( center ), '.txt' );

  r8mat_write ( output_filename, m, n, r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to the file "%s".\n', ...
     output_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRID_DATASET:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function seed = get_seed ( )

%*****************************************************************************80
%
%% GET_SEED returns a seed for the random number generator.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer SEED, a random seed value.
%
  I_MAX = 2147483647;

  time_array = clock;

  hour = time_array(4);
  minute = time_array(5);
  second = time_array(6);

  temp = ( second + 60 * ( minute + 60 * hour ) ) / ( 60.0 * 60.0 * 24.0 );

  if ( temp <= 0.0 ) 
    temp = temp + 1.0;
  end

  if ( 1.0 < temp )
    temp = temp - 1.0;
  end

  seed = 1 + floor ( I_MAX * temp );

  return
end
function [ r, seed ] = grid_generate ( m, n, center, seed )

%*****************************************************************************80
%
%% GRID_GENERATE generates a grid dataset.
%
%  Discussion:
%
%    N points are needed in an M dimensional space.
%
%    The points are to lie on a uniform grid of side N_SIDE.
%
%    Unless the N = N_SIDE**M for some N_SIDE, we can't use all the
%    points on a grid.  What we do is find the smallest N_SIDE
%    that's big enough, and randomly omit some points.
%
%    If N_SIDE is 4, then the choices in 1D are:
%
%    A: 0,   1/3, 2/3, 1
%    B: 1/5, 2/5, 3/5, 4/5
%    C: 0,   1/4, 2/4, 3/4
%    D: 1/4, 2/4, 3/4, 1
%    E: 1/8, 3/8, 5/8, 7/8
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points to generate.
%
%    Input, integer CENTER, specifies the 1D grid centering:
%    1: first point is 0.0, last point is 1.0;
%    2: first point is 1/(N+1), last point is N/(N+1);
%    3: first point is 0, last point is (N-1)/N;
%    4: first point is 1/N, last point is 1;
%    5: first point is 1/(2*N), last point is (2*N-1)/(2*N);
%
%    Input, integer SEED, the random number seed.
%
%    Output, real R(M,N), the points.
%
%    Output, integer SEED, the updated random number seed.
%
  r = zeros ( m, n );
%
%  Find the dimension of the smallest grid with N points.
%
  n_side = grid_side ( m, n );
%
%  We need to select N points out of N_SIDE**M set.
%
  n_grid = n_side .^ m;
%
%  Generate a random subset of N items from a set of size N_GRID.
%
  [ rank_list, seed ] = ksub_random2 ( n_grid, n, seed );
%
%  Must make one dummy call to TUPLE_NEXT_FAST with RANK = 0.
%
  rank = 0;
  tuple_next_fast ( n_side, m, rank );
%
%  Now generate the appropriate indices, and "center" them.
%
  for j = 1 : n

    rank = rank_list(j) - 1;

    tuple = tuple_next_fast ( n_side, m, rank );

    if ( center == 1 )
      r(1:m,j) = ( tuple(1:m)' - 1 ) / ( n_side - 1 );
    elseif ( center == 2 )
      r(1:m,j) = ( tuple(1:m)' ) / ( n_side + 1 );
    elseif ( center == 3 )
      r(1:m,j) = ( tuple(1:m)' - 1 ) / ( n_side );
    elseif ( center == 4 )
      r(1:m,j) = ( tuple(1:m)' ) / ( n_side );
    elseif ( center == 5 )
      r(1:m,j) = ( 2 * tuple(1:m)' - 1 ) / ( 2 * n_side );
    end

  end

  return
end
function n_side = grid_side ( m, n )

%*****************************************************************************80
%
%% GRID_SIDE finds the smallest M-D grid containing at least N points.
%
%  Discussion:
%
%    Each coordinate of the grid will have N_SIDE distinct values.
%    Thus the total number of points in the grid is N_SIDE**M.
%    This routine seeks the smallest N_SIDE such that N <= N_SIDE**M.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 December 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points to generate.
%
%    Output, integer N_SIDE, the length of one side of the smallest
%    grid in M dimensions that contains at least N points.
%
  if ( n <= 0 )
    n_side = 0;
    return;
  end

  if ( m <= 0 )
    n_side = -1;
    return;
  end

  exponent = 1.0 / m;

  n_side = floor ( ( real ( n ) ) .^ exponent );

  if ( ( n_side^m ) < n )
    n_side = n_side + 1;
  end

  return
end
function [ a, seed ] = ksub_random2 ( n, k, seed )

%*****************************************************************************80
%
%% KSUB_RANDOM2 selects a random subset of size K from a set of size N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 December 2003
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the size of the set.
%
%    Input, integer K, the size of the subset, between 0 and N.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer A(K), the indices of the selected elements.
%
%    Output, integer SEED, the updated seed for the random number generator.
%
  if ( k < 0 || n < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUB_RANDOM2 - Fatal error!\n' );
    fprintf ( 1, '  N = %d\n', n );
    fprintf ( 1, '  K = %d\n', k );
    fprintf ( 1, '  but 0 <= K <= N is required!\n' );
    error ( 'KSUB_RANDOM2 - Fatal error: Illegal K.' );
  end

  if ( k == 0 )
    a = [];
    return;
  end

  a = zeros ( k, 1 );
  
  need = k;
  have = 0;

  available = n;
  candidate = 0;

  while ( 1 )

    candidate = candidate + 1;

    [ r, seed ] = r8_uniform_01 ( seed );

    if ( available * r <= need )

      need = need - 1;
      have = have + 1;
      a(have) = candidate;

      if ( need <= 0 )
        break;
      end

    end

    available = available - 1;

  end

  return
end
function [ r, seed ] = r8_uniform_01 ( seed )

%*****************************************************************************80
%
%% R8_UNIFORM_01 returns a unit pseudorandom R8.
%
%  Discussion:
%
%    This routine implements the recursion
%
%      seed = 16807 * seed mod ( 2**31 - 1 )
%      r8_uniform_01 = seed / ( 2**31 - 1 )
%
%    The integer arithmetic never requires more than 32 bits,
%    including a sign bit.
%
%    If the initial seed is 12345, then the first three computations are
%
%      Input     Output      R8_UNIFORM_01
%      SEED      SEED
%
%         12345   207482415  0.096616
%     207482415  1790989824  0.833995
%    1790989824  2035175616  0.947702
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
%    Pierre L'Ecuyer,
%    Random Number Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley Interscience, page 95, 1998.
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
%    Input, integer SEED, the integer "seed" used to generate
%    the output random number.  SEED should not be 0.
%
%    Output, real R, a random value between 0 and 1.
%
%    Output, integer SEED, the updated seed.  This would
%    normally be used as the input seed on the next call.
%
  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_UNIFORM_01 - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8_UNIFORM_01 - Fatal error!' );
  end

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

  r = seed * 4.656612875E-10;

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
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
function x = tuple_next_fast ( m, n, rank )

%*****************************************************************************80
%
%% TUPLE_NEXT_FAST computes the next element of a tuple space, "fast".
%
%  Discussion:
%
%    The elements are N vectors.  Each entry is constrained to lie
%    between 1 and M.  The elements are produced one at a time.
%    The first element is
%      (1,1,...,1)
%    and the last element is
%      (M,M,...,M)
%    Intermediate elements are produced in lexicographic order.
%
%    This code was written as a possibly faster version of TUPLE_NEXT.
%
%  Example:
%
%    N = 2,
%    M = 3
%
%    INPUT      OUTPUT
%    -----      -------
%    Rank       X
%    ----       ---
%    0          1 1
%    1          1 2
%    2          1 3
%    3          2 1
%    4          2 2
%    5          2 3
%    6          3 1
%    7          3 2
%    8          3 3
%    9          0 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the maximum entry.
%
%    Input, integer N, the number of components.
%
%    Input, integer RANK, indicates the rank of the tuples.
%    Before the very first call only, it is necessary that
%    the user set RANK = 0. 
%
%    Output, integer X(N), the next tuple of the given rank.
%
  global tuple_next_fast_BASE

  if ( rank == 0 )

    tuple_next_fast_BASE(n) = 1;
    for i = n-1 : -1 : 1
      tuple_next_fast_BASE(i) = tuple_next_fast_BASE(i+1) * m;
    end

    x(1:n) = 1;

  else

    x(1:n) = mod ( floor ( rank ./ tuple_next_fast_BASE(1:n) ), m ) + 1;

  end

  return
end
