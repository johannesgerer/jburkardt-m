function life_serial ( )

%*****************************************************************************80
%
%% MAIN is the main program for LIFE_SERIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Martin Gardner,
%    Mathematical Games:
%    The Fantastic Combinations of John Conway's new solitaire game "Life",
%    Scientific American,
%    Volume 223, Number 4, October 1970, pages 120-123.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LIFE_SERIAL\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Carry out a few steps of John Conway''s\n' );
  fprintf ( 1, '  Game of Life.\n' );
  fprintf ( 1, '\n' );

  filename = 'life_000.txt';
  it_max = 10;
  m = 10;
  n = 10;
  prob = 0.20;
  seed = 123456789;

  grid = zeros ( m + 2, n + 2 );

  for it = 0 : it_max
    if ( it == 0 )
      [ grid, seed ] = life_init ( prob, m, n, seed );
    else
      grid = life_update ( m, n, grid );
    end
    life_write ( filename, m, n, grid )
    fprintf ( 1, '  %s\n', filename );
    filename = filename_inc ( filename );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LIFE_SERIAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function filename = filename_inc ( filename )

%*****************************************************************************80
%
%% FILENAME_INC generates the next filename in a series.
%
%  Discussion:
%
%    It is assumed that the digits in the name, whether scattered or
%    connected, represent a number that is to be increased by 1 on
%    each call.  If this number is all 9's on input, the output number
%    is all 0's.  Non-numeric letters of the name are unaffected..
%
%    If the name is empty, then the routine stops.
%
%    If the name contains no digits, the empty string is returned.
%
%  Example:
%
%      Input            Output
%      -----            ------
%      'a7to11.txt'     'a7to12.txt'  (typical case.  Last digit incremented)
%      'a7to99.txt'     'a8to00.txt'  (last digit incremented, with carry.)
%      'a9to99.txt'     'a0to00.txt'  (wrap around)
%      'cat.txt'        ' '           (no digits in input name.)
%      ' '              STOP!         (error.)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the string to be incremented.
%
%    Output, string FILENAME, the incremented string.
%
  lens = length ( filename );

  if ( lens <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILENAME_INC - Fatal error!\n' );
    fprintf ( 1, '  The input filename is empty.\n' );
    error ( 'FILENAME_INC - Fatal error!' );
  end

  change = 0;

  for i = lens : -1 : 1

    c = filename(i);

    if ( '0' <= c && c <= '8' )

      c = c + 1;
      
      filename(i) = c;

      return

    elseif ( c == '9' )

      change = change + 1;

      c = '0';
      
      filename(i) = c;

    end

  end

  if ( change == 0 )
    filename = ' ';
  end

  return
end
function [ grid, seed ] = life_init ( prob, m, n, seed )

%*****************************************************************************80
%
%% LIFE_INIT initializes the life grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real PROB, the probability that a grid cell
%    should be alive.
%
%    Input, integer M, N, the number of rows and columns
%    of interior grid cells.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, integer GRID(1+M+1,1+N+1), the initial grid.
%
  for j = 0 : n + 1
    for i = 0 : m + 1
      grid(i+1,j+1) = 0;
    end
  end

  for j = 1 : n
    for i = 1 : m
      [ r, seed ] = r8_uniform_01 ( seed );
      if ( r <= prob )
        grid(i+1,j+1) = 1;
      end
    end
  end

  return
end
function grid = life_update (  m, n, grid )

%*****************************************************************************80
%
%% LIFE_UPDATE updates a Life grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns
%    of interior grid cells.
%
%    Input/output, integer GRID(1+M+1,1+N+1), the data.
%
  s = zeros ( m, n );

  for j = 1 : n
    for i = 1 : m
      s(i,j) = grid(i,  j) + grid(i,  j+1) + grid(i,  j+2) ...
             + grid(i+1,j)                 + grid(i+1,j+2) ...
             + grid(i+2,j) + grid(i+2,j+1) + grid(i+2,j+2);
    end
  end
%
%  Any dead cell with 3 live neighbors becomes alive.
%  Any living cell with less than 2 or more than 3 neighbors dies.
%
  for j = 1 : n
    for i = 1 : m
      if ( grid(i+1,j+1) == 0 )
        if ( s(i,j) == 3 )
          grid(i+1,j+1) = 1;
        end
      elseif ( grid(i+1,j+1) == 1 )
        if ( s(i,j) < 2 || 3 < s(i,j) )
          grid(i+1,j+1) = 0;
        end
      end

    end
  end

  return
end
function life_write ( output_filename, m, n, grid )

%*****************************************************************************80
%
%% LIFE_WRITE writes a grid to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output file name.
%
%    Input, integer M, N, the number of rows and columns
%    of interior grid cells.
%
%    Input, integer GRID(1+M+1,1+N+1), the data.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LIFE_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'LIFE_WRITE - Error!' );
  end

  for j = 0 : n + 1
    fprintf ( output_unit, ' %d', grid(1:m+2,j+1) );
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

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
