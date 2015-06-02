function fire_serial ( forest_size, prob_spread )

%*****************************************************************************80
%
%% MAIN is the main program for FIRE_SERIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2013.
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer FOREST_SIZE, specifies the forest as a square of
%    FOREST_SIZE by FOREST_SIZE trees.  Default is 20.
%
%    Input, real PROB_SPREAD, the probability that fire will spread from
%    a burning tree to its neighbor.  Default is 0.5.
%
  if ( nargin < 1 )
    forest_size = 20;
  elseif ( ischar ( forest_size ) )
    forest_size = str2num ( forest_size );
  end

  if ( nargin < 2 )
    prob_spread = 0.5;
  elseif ( ischar ( prob_spread ) )
    prob_spread = str2num ( prob_spread );
  end

  SMOLDERING = 1;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FIRE_SERIAL\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  A probabilistic simulation of a forest fire.\n' );
  fprintf ( 1, '  The forest size is %d\n', forest_size );
  fprintf ( 1, '  The probability of tree-to-tree spread is %g\n', prob_spread );
%
%  Initialize the random number generator.
%
  seed = get_seed ( );
  fprintf ( 1, '  The random number generator is seeded by %d\n', seed );
%
%  Initialize the values in the forest.
%
  forest = forest_initialize ( forest_size );
%
%  Choose a tree at random where the fire will start.
%
  [ i_ignite, seed ] = i4_uniform_ab ( 1, forest_size, seed );
  [ j_ignite, seed ] = i4_uniform_ab ( 1, forest_size, seed );
  forest(i_ignite,j_ignite) = SMOLDERING;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Fire starts at tree(%d,%d)\n', i_ignite, j_ignite );
%
%  Let time run until nothing is burning any more.
%
  while ( forest_is_burning ( forest_size, forest ) )
    [ forest, seed ] = forest_burns ( forest_size, forest, seed, prob_spread );
  end
%
%  Display the final forest state.
%
  forest_print ( forest_size, forest, i_ignite, j_ignite );
%
%  Report the percentage of forest burned.
%
  percent = get_percent_burned ( forest_size, forest );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Percentage of forest burned = %g\n', percent );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FIRE_SERIAL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ value, seed ] = fire_spreads ( seed, prob_spread ) 

%*****************************************************************************80
%
%% FIRE_SPREADS determines whether the fire spreads.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2013
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Input, real PROB_SPREAD, the probability of spreading.
%
%    Output, logical VALUE, is TRUE if the fire spreads.
%
  [ u, seed ] = r8_uniform_01 ( seed );

  if ( u < prob_spread )
    value = 1;
  else
    value = 0;
  end
 
  return
end
function [ forest, seed ] = forest_burns ( forest_size, forest, seed, ...
  prob_spread )

%*****************************************************************************80
%
%% FOREST_BURNS models a single time step of the burning forest.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2013
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer FOREST_SIZE, the linear dimension of the forest.
%
%    Input/output, integer FOREST(FOREST_SIZE,FOREST_SIZE), an
%    array with an entry for each tree in the forest.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Input, real PROB_SPREAD, the probability that the fire will 
%    spread from a burning tree to an unburnt one.
%
  BURNING = 2;
  BURNT = 3;
  SMOLDERING = 1;
  UNBURNT = 0;
%
%  Burning trees burn down;
%  Smoldering trees ignite;
%
  for j = 1 : forest_size
    for i = 1 : forest_size
      if ( forest(i,j) == BURNING )
        forest(i,j) = BURNT;
      elseif ( forest(i,j) == SMOLDERING )
        forest(i,j) = BURNING;
      end
    end
  end
%
%  Unburnt trees might catch fire.
%
  for j = 1 : forest_size
    for i = 1 : forest_size

      if ( forest(i,j) == BURNING )
%
%  North.
%
        if ( 1 < i )
          if ( forest(i-1,j) == UNBURNT )
            [ value, seed ] = fire_spreads ( seed, prob_spread );
            if ( value )
              forest(i-1,j) = SMOLDERING;
            end
          end
        end
%
%  South.
%
        if ( i < forest_size )
          if ( forest(i+1,j) == UNBURNT )
            [ value, seed ] = fire_spreads ( seed, prob_spread );
            if ( value )
              forest(i+1,j) = SMOLDERING;
            end
          end
        end
%
%  West.
%
        if ( 1 < j )
          if ( forest(i,j-1) == UNBURNT )
            [ value, seed ] = fire_spreads ( seed, prob_spread );
            if ( value )
              forest(i,j-1) = SMOLDERING;
            end
          end
        end
%
%  East.
%
        if ( j < forest_size )
          if ( forest(i,j+1) == UNBURNT )
            [ value, seed ] = fire_spreads ( seed, prob_spread );
            if ( value )
              forest(i,j+1) = SMOLDERING;
            end
          end
        end

      end

    end
  end

  return
end
function forest = forest_initialize ( forest_size ) 

%*****************************************************************************80
%
%% FOREST_INITIALIZE initializes the forest values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2013
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer FOREST_SIZE, the linear dimension of the forest.
%
%    Output, integer FOREST(FOREST_SIZE,FOREST_SIZE), an array
%    with an entry for each tree in the forest.
%
  UNBURNT = 0;

  forest(1:forest_size,1:forest_size) = UNBURNT;

  return
end
function value = forest_is_burning ( forest_size, forest ) 

%*****************************************************************************80
%
%% FOREST_IS_BURNING reports whether any trees in the forest are burning.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2013
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer FOREST_SIZE, the linear dimension of the forest.
%
%    Input, integer FOREST(FOREST_SIZE,FOREST_SIZE), an array
%    with an entry for each tree in the forest.
%
%    Output, logical FOREST_IS_BURNING, is TRUE if any tree in the forest
%    is in the SMOLDERING or BURNING state.
%
  BURNING = 2;
  SMOLDERING = 1;

  value = 0;

  for j = 1 : forest_size
    for i = 1 : forest_size
      if ( forest(i,j) == SMOLDERING || forest(i,j) == BURNING )
        value = 1;
      end
    end
  end

  return
end
function forest_print ( forest_size, forest, i_ignite, j_ignite )

%*****************************************************************************80
%
%% FOREST_PRINT prints the state of the trees in the forest.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2013
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer FOREST_SIZE, the linear dimension of the forest.
%
%    Input, integer FOREST(FOREST_SIZE,FOREST_SIZE), an array
%    with an entry for each tree in the forest.
%
%    Input, integer I_IGNITE, J_IGNITE, the location of the start 
%    of the fire.
%
  BURNT = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Map of fire damage.\n' );
  fprintf ( 1, '  Fire started at "*".\n' );
  fprintf ( 1, '  Burned trees are indicated by ".".\n' );
  fprintf ( 1, '  Unburned trees are indicated by "X".\n' );
  fprintf ( 1, '\n' );

  for i = 1 : forest_size
    fprintf ( 1, '  ' );
    for j = 1 : forest_size
      if ( i == i_ignite && j == j_ignite )
        fprintf ( 1, '*' );
      elseif ( forest(i,j) == BURNT )
        fprintf ( 1, '.' );
      else
        fprintf ( 1, 'X' );
      end
    end
    fprintf ( 1, '\n' );
  end

  return
end
function percent = get_percent_burned ( forest_size, forest ) 

%*****************************************************************************80
%
%% GET_PERCENT_BURNED computes the percentage of the forest that burned.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2013
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer FOREST_SIZE, the linear dimension of the forest.
%
%   Input, integer FOREST(FOREST_SIZE,FOREST_SIZE), an array
%    with an entry for each tree in the forest.
%
%    Output, real PERCENT, the percentage of the forest
%    that burned.
%
  BURNT = 3;

  total = 0;
  for j = 1 : forest_size
    for i = 1 : forest_size
      if ( forest(i,j) == BURNT )
        total = total + 1;
      end
    end
  end

  percent = total / forest_size / forest_size;

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
function [ c, seed ] = i4_uniform_ab ( a, b, seed )

%*****************************************************************************80
%
%% I4_UNIFORM_AB returns a scaled pseudorandom I4.
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
%    Second Edition,
%    Springer, 1987,
%    ISBN: 0387964673,
%    LC: QA76.9.C65.B73.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, December 1986, pages 362-376.
%
%    Pierre L'Ecuyer,
%    Random Number Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley, 1998,
%    ISBN: 0471134031,
%    LC: T57.62.H37.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, Number 2, 1969, pages 136-143.
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
  i4_huge = 2147483647;

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_UNIFORM_AB - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'I4_UNIFORM_AB - Fatal error!' );
  end

  seed = floor ( seed );
  a = round ( a );
  b = round ( b );

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
function [ r, seed ] = r8_uniform_01 ( seed )

%*****************************************************************************80
%
%% R8_UNIFORM_01 returns a unit pseudorandom R8.
%
%  Discussion:
%
%    This routine implements the recursion
%
%      seed = 16807 * seed mod ( 2^31 - 1 )
%      r8_uniform_01 = seed / ( 2^31 - 1 )
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

