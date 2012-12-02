function r = latin_edge_dataset ( m, n, seed )

%*****************************************************************************80
%
%% LATIN_EDGE_DATASET generates a latin_edge dataset and writes it to a file.
%
%  Usage:
%
%    r = latin_edge_dataset ( m, n, seed )
%
%    where
%
%    * M, the spatial dimension,
%    * N, the number of points to generate,
%    * SEED, the seed, a positive integer.
%    * R is the M by N array created.
%
%    creates an M by N uniform random dataset and writes it to the
%    file "latin_edge_M_N.txt".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 December 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_EDGE_DATASET\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generate a Latin Edge Square dataset.\n' );
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

  fprintf ( 1, '  The seed = %d\n', seed );
%
%  Compute the data.
%
  [ r, seed ] = latin_edge ( m, n, seed );
%
%  Write it to a file.
%
  output_filename = ...
    strcat ( 'latin_edge_', num2str ( m ), '_', num2str ( n ), '.txt' );

  r8mat_write ( output_filename, m, n, r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to the file "%s".\n', ...
    output_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_EDGE_DATASET:\n' );
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
function [ c, seed ] = i4_uniform ( a, b, seed )

%*****************************************************************************80
%
%% I4_UNIFORM returns a scaled pseudorandom I4.
%
%  Discussion:
%
%    The pseudorandom number will be scaled to be uniformly distributed
%    between A and B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2006
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
%    Peter Lewis, Allen Goodman, James Miller
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, pages 136-143, 1969.
%
%  Parameters:
%
%    Input, integer A, B, the minimum and maximum acceptable values.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer C, the randomly chosen integer.
%
%    Output, integer SEED, the updated seed.
%
  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_UNIFORM - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'I4_UNIFORM - Fatal error!' );
  end

  seed = floor ( seed );
  a = round ( a );
  b = round ( b );

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
%
%  Scale R to lie between A-0.5 and B+0.5.
%
  r = ( 1.0 - r ) * ( min ( a, b ) - 0.5 ) ...
    +         r   * ( max ( a, b ) + 0.5 );
%
%  Use rounding to convert R to an integer between A and B.
%
  value = round ( r );

  value = max ( value, min ( a, b ) );
  value = min ( value, max ( a, b ) );

  c = value;

  return
end
function [ x, seed ] = latin_edge ( dim_num, point_num, seed )

%*****************************************************************************80
%
%% LATIN_EDGE returns edge points in a Latin square.
%
%  Discussion:
%
%    In each spatial dimension, there will be exactly one
%    point with the coordinate value
%
%      ( 0, 1, 2, ..., point_num-1 ) / ( point_num - 1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 March 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer dim_num, the spatial dimension.
%
%    Input, integer point_num, the number of points, which should be
%    at least 2!
%
%    Input, integer SEED, a seed for UNIFORM, the random number generator.
%
%    Output, real x(dim_num,point_num), the points.
%
%    Output, integer SEED, the updated random number seed.
%
  base = 1;

  if ( point_num == 1 )

    x(1:dim_num,1) = 0.5;

  else

    for i = 1: dim_num

      [ perm, seed ] = perm_uniform ( point_num, base, seed );

      for j = 1: point_num
        x(i,j) = ( perm(j) - 1 ) / ( point_num - 1 );
      end 

    end

  end

  return
end
function latin_edge_test ( )

%*****************************************************************************80
%
%% LATIN_EDGE_TEST tests LATIN_EDGE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 April 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_EDGE_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the Latin Edge Square routines.\n' );

  seed = 0;
  seed = get_seed ( seed );

  seed_save = seed;
  seed = latin_edge_test01 ( seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_EDGE_TEST:\n' );
  fprintf ( 1, '  Repeat test with different seed than run 1.\n' );

  seed = latin_edge_test01 ( seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_EDGE_TEST:\n' );
  fprintf ( 1, '  Repeat test with same seed as run 1.\n' );

  seed = seed_save;
  seed = latin_edge_test01 ( seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_EDGE_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function seed = latin_edge_test01 ( seed )

%*****************************************************************************80
%
%% LATIN_EDGE_TEST01 tests LATIN_EDGE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, an initial seed for the random number generator.
%
%    Output, integer SEED, the updated random number seed.
%
  dim_num = 2;
  point_num = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_EDGE_TEST01\n' );
  fprintf ( 1, '  LATIN_EDGE chooses a Latin cell arrangement,\n' );
  fprintf ( 1, '  which includes the edge points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension = %d\n', dim_num );
  fprintf ( 1, '  Number of points =  %d\n', point_num );
  fprintf ( 1, '  Using seed = %d\n', seed );

  [ x, seed ] = latin_edge ( dim_num, point_num, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The Latin Edge Square points:\n' );
  fprintf ( 1, '\n' );

  for j = 1: point_num
    for i = 1: dim_num
      fprintf ( 1, '%10f  ', x(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
function [ p, seed ] = perm_uniform ( n, base, seed )

%*****************************************************************************80
%
%% PERM_UNIFORM selects a random permutation of N objects.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 November 2008
%
%  Author:
%
%    John Burkardt.
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
%    Input, integer N, the number of objects to be permuted.
%
%    Input, integer BASE, is 0 for a 0-based permutation and 1 for 
%    a 1-based permutation.
!
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer P(N), a permutation of ( 1, 2, ..., N ), in standard
%    index form.
%
%    Output, integer SEED, the updated random number seed.
%
  p = ( 1 : n ) + base - 1;

  for i = 1: n

    [ j, seed ] = i4_uniform ( i, n, seed );

    temp = p(i);
    p(i) = p(j);
    p(j) = temp;

  end

  return
end
function [ r, seed ] = r4_uniform_01 ( seed )

%*****************************************************************************80
%
%% R4_UNIFORM_01 returns a unit pseudorandom R4.
%
%  Discussion:
%
%    This routine implements the recursion
%
%      seed = 16807 * seed mod ( 2**31 - 1 )
%      r = seed / ( 2**31 - 1 )
%
%    The integer arithmetic never requires more than 32 bits,
%    including a sign bit.
%
%    If the initial seed is 12345, then the first three computations are
%
%      Input     Output      R4_UNIFORM_01
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
  i4_huge = 2147483647;

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_UNIFORM_01 - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R4_UNIFORM_01 - Fatal error!' );
  end

  seed = floor ( seed );

  seed = mod ( seed, i4_huge );

  if ( seed < 0 ) 
    seed = seed + i4_huge;
  end 

  k = floor ( seed / 127773 );

  seed = 16807 * ( seed - k * 127773 ) - k * 2836;

  if ( seed < 0 )
    seed = seed + i4_huge;
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
    return;
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
