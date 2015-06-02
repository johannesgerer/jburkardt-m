function ising_2d_simulation ( m, n, iterations, thresh, seed )

%*****************************************************************************80
%
%% ISING_2D_SIMULATION carries out a 2D Ising simulation.
%
%  Discussion:
%
%    Note that, when all the cells are updated in a single cycle, there is
%    a mathematically stable checkerboard solution, in which all the reds
%    and blacks flip color repeatedly.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 November 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ISING_2D_SIMULATION\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Monte Carlo simulation of a 2D Ising model.\n' );
%
%  Arguments not supplied are set to default values.
%
  if ( nargin < 1 )
    m = 10;
  else
    m = str2num ( m );
  end

  if ( nargin < 2 )
    n = 10;
  else
    n = str2num ( n );
  end

  if ( nargin < 3 )
    iterations = 15;
  else
    iterations = str2num ( iterations );
  end

  if ( nargin < 4 )
    thresh = 0.50;
  else
    thresh = str2num ( thresh );
  end

  if ( nargin < 5 )
    seed = 123456789;
  else
    seed = str2num ( seed );
  end
%
%  Define the probability of flipping if you are in a neighborhood of
%  1, 2, 3, 4, or 5 of the same sign.
%
%  This should really be some kind of exponential dependent on "temperature".
%
  prob = [ 0.98, 0.85, 0.50, 0.15, 0.02 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The row dimension M = %d\n', m );
  fprintf ( 1, '  The column dimension N = %d\n', n );
  fprintf ( 1, '  The number of iterations taken is ITERATIONS = %d\n', iterations );
  fprintf ( 1, '  The threshhold THRESH = %f\n', thresh );
  fprintf ( 1, '  The seed SEED = %d\n', seed );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The transition probability table, based on the number of\n' );
  fprintf ( 1, '  neighbors with the same charge.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        1           2           3           4           5\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %10.4f  %10.4f  %10.4f  %10.4f  %10.4f\n', prob(1:5) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  An automatic pause of 2 seconds is imposed between \n;' );
  fprintf ( 1, '  successive displays.\n' );
%
%  Initialize C1.
%
  [ c1, seed ] = ising_2d_initialize ( m, n, thresh, seed );
%
%  Do the simulation.
%
  [ c1, seed ] = transition ( m, n, iterations, prob, seed, c1 );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ISING_2D_SIMULATION\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function i4mat_print ( m, n, a, title )

%*****************************************************************************80
%
%% I4MAT_PRINT prints an I4MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, integer A(M,N), an M by N matrix to be printed.
%
%    Input, string TITLE, a title.
%
  i4mat_print_some ( m, n, a, 1, 1, m, n, title );

  return
end
function i4mat_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% I4MAT_PRINT_SOME prints out a portion of an I4MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, integer A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, a title.
%
  incx = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  if ( m <= 0 || n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  (None)\n' );
    return
  end

  for j2lo = max ( jlo, 1 ): incx : min ( jhi, n )

    j2hi = j2lo + incx - 1;
    j2hi = min ( j2hi, n );
    j2hi = min ( j2hi, jhi );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col: ' );

    for j = j2lo : j2hi
      fprintf ( 1, '%7d  ', j );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row\n' );
    fprintf ( 1, '\n' );

    i2lo = max ( ilo, 1 );
    i2hi = min ( ihi, m );

    for i = i2lo : i2hi

      fprintf ( 1, '%5d: ', i );
      for j = j2lo : j2hi
        fprintf ( 1, '%7d  ', a(i,j) );
      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
function [ c, seed ] = i4mat_uniform ( m, n, a, b, seed )

%*****************************************************************************80
%
%% I4MAT_UNIFORM returns a scaled pseudorandom I4MAT.
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
%    Input, integer M, N, the row and column dimensions of the matrix.
%
%    Input, integer A, B, the minimum and maximum acceptable values.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer C(M,N), the randomly chosen integer vector.
%
%    Output, integer SEED, the updated seed.
%
  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_UNIFORM - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'I4MAT_UNIFORM - Fatal error!' );
  end

  seed = floor ( seed );
  a = round ( a );
  b = round ( b );

  for j = 1 : n

    for i = 1 : m

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

      c(i,j) = value;

    end
  end

  return
end
function c5 = ising_2d_agree ( m, n, c1 )

%*****************************************************************************80
%
%% ISING_2D_AGREE returns the number of neighbors agreeing with each cell.
%
%  Discussion:
%
%    The count includes the cell itself, so it is between 1 and 5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of cells in each spatial dimension.
%
%    Input, integer C1(M,N), an array of 1's and -1's.
%
%    Output, integer C5(M,N), the number of neighbors that agree.
%    1, 2, 3, 4, or 5.
%
  c5 = c1 ...
     + circshift ( c1, [ -1,  0 ] ) ...
     + circshift ( c1, [ +1,  0 ] ) ...
     + circshift ( c1, [  0, -1 ] ) ...
     + circshift ( c1, [  0, +1 ] );

  i = find ( 0 < c1 );
  c5(i) = ( 5 + c5(i) ) / 2;

  i = find ( c1 < 0 );
  c5(i) = ( 5 - c5(i) ) / 2;

  return
end
function ising_2d_display ( step, m, n, c1 )

%*****************************************************************************80
%
%% ISING_2D_DISPLAY displays the current Ising status.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer STEP, the step number.
%
%    Input, integer M, N, the number of rows and columnss.
%
%    Input, integer C1(M,N), the status of each cell:
%    -1, display as a shade of red.
%    +1, display as a shade of blue.
%
  figure ( 1 )
%
%  Clear the graphics frame.
%
  clf
%
%  Determine the plot range.
%
  margin = 0.05;

  x_axes_min = 1.0 - 0.5 - margin;
  x_axes_max = m   + 0.5 + margin;
  y_axes_min = 1.0 - 0.5 - margin;
  y_axes_max = n   + 0.5 + margin;
%
%  Fill in the background with black.
%
  x1 = x_axes_min;
  x2 = x_axes_max;
  y1 = y_axes_min;
  y2 = y_axes_max;

  rgb = [ 0.5, 0.5, 0.5 ];

  fill ( [ x1, x2, x2, x1 ], [ y1, y1, y2, y2 ], rgb );
  hold on
%
%  Draw a square, representing the bed,
%  with most of the length and width, centered at (I,J).
%
  for i = 1 : m
    for j = 1 : n

      x1 = j - 0.47;
      x2 = j + 0.47;
      y1 = ( m + 1 - i ) - 0.47;
      y2 = ( m + 1 - i ) + 0.47;

      if ( c1(i,j) == - 1 )
        rgb = [ 1.0, 0.0, 0.0 ];
      elseif ( c1(i,j) == + 1 )
        rgb = [ 0.0, 0.0, 1.0 ];
      end

      fill ( [ x1, x2, x2, x1 ], [ y1, y1, y2, y2 ], rgb );
      hold on

    end
  end
%
%  Make a title.
%
  title_string = sprintf ( 'Ising charges +1/-1 on step %d', step );

  title ( title_string )
%
%  Choose the aspect ratio and other plot details.
%
  axis ( [ x_axes_min, x_axes_max, y_axes_min, y_axes_max] );
  axis equal
  axis tight
  axis off

  hold off

  pause ( 2 )

  return
end
function [ c1, seed ] = ising_2d_initialize ( m, n, thresh, seed )

%*****************************************************************************80
%
%% ISING_2D_INITIALIZE initializes the Ising array.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real THRESH, the threshhold value, between 0 and 1.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer C1(M,N), an array of 1's and -1's.
%
%    Output, integer SEED, a seed for the random number generator.
%
  c1 = ones ( m, n );

  [ r, seed ] = r8mat_uniform_01 ( m, n, seed );
  
  i = find ( r <= thresh );

  c1(i) = -1;

  return
end
function ising_2d_stats ( step, m, n, c1 )

%*****************************************************************************80
%
%% ISING_2D_STATS prints information about the current step.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer STEP, the step number.
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer C1(M,N), the current state of the system.
%
  if ( step == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Step       Positives       Negatives\n' );
    fprintf ( 1, '             #    %%          #    %%\n' );
    fprintf ( 1, '\n' );
  end

  pos_count = sum ( sum ( 0 < c1 ) );
  neg_count = m * n - pos_count;
  pos_percent = ( 100 * pos_count ) / ( m * n );
  neg_percent = ( 100 * neg_count ) / ( m * n );

  fprintf ( 1, '  %4d  %6d  %6.2f  %6d  %6.2f\n', ...
    step, pos_count, pos_percent, neg_count, neg_percent );

  return
end
function neighbor_2d_display ( step, m, n, c1, c5 )

%*****************************************************************************80
%
%% NEIGHBOR_2D_DISPLAY displays the current Ising neighbor status.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer STEP, the step number.
%
%    Input, integer M, N, the number of rows and columnss.
%
%    Input, integer C1(M,N), the status of each cell:
%
%    Input, integer C5(M,N), the number of agreeable neighbors.
%
  figure ( 2 )
%
%  Clear the graphics frame.
%
  clf
%
%  Determine the plot range.
%
  margin = 0.05;

  x_axes_min = 1.0 - 0.5 - margin;
  x_axes_max = m   + 0.5 + margin;
  y_axes_min = 1.0 - 0.5 - margin;
  y_axes_max = n   + 0.5 + margin;
%
%  Fill in the background with black.
%
  x1 = x_axes_min;
  x2 = x_axes_max;
  y1 = y_axes_min;
  y2 = y_axes_max;

  rgb = [ 0.5, 0.5, 0.5 ];

  fill ( [ x1, x2, x2, x1 ], [ y1, y1, y2, y2 ], rgb );
  hold on
%
%  Draw a square, representing the bed,
%  with most of the length and width, centered at (I,J).
%
  for i = 1 : m
    for j = 1 : n

      x1 = j - 0.47;
      x2 = j + 0.47;
      y1 = ( m + 1 - i ) - 0.47;
      y2 = ( m + 1 - i ) + 0.47;

      c = c1(i,j) * c5(i,j);

      if ( c == - 5 )
        rgb = [ 1.0, 0.0, 0.0 ];
      elseif ( c == - 4 )
        rgb = [ 1.0, 0.2, 0.2 ];
      elseif ( c == - 3 )
        rgb = [ 1.0, 0.4, 0.4 ];
      elseif ( c == - 2 )
        rgb = [ 1.0, 0.7, 0.7 ];
      elseif ( c == - 1 )
        rgb = [ 1.0, 0.8, 0.8 ];
      elseif ( c == 0 )
        rgb = [ 1.0, 1.0, 1.0 ];
      elseif ( c == + 1 )
        rgb = [ 0.7, 0.7, 1.0 ];
      elseif ( c == + 2 )
        rgb = [ 0.6, 0.6, 1.0 ];
      elseif ( c == + 3 )
        rgb = [ 0.4, 0.4, 1.0 ];
      elseif ( c == + 4 )
        rgb = [ 0.2, 0.2, 1.0 ];
      elseif ( c == + 5 )
        rgb = [ 0.0, 0.0, 1.0 ];
      end

      fill ( [ x1, x2, x2, x1 ], [ y1, y1, y2, y2 ], rgb );
      hold on

    end
  end
%
%  Make a title.
%
  title_string = sprintf ( 'Ising neighborhoods -5 to +5, step %d to step %d', step-1, step );

  title ( title_string )
%
%  Choose the aspect ratio and other plot details.
%
  axis ( [ x_axes_min, x_axes_max, y_axes_min, y_axes_max] );
  axis equal
  axis tight
  axis off

  hold off

  pause ( 2 )

  return
end
function neighbor_2d_stats ( step, m, n, c1, c5 )

%*****************************************************************************80
%
%% NEIGHBOR_2D_STATS prints neighbor statistics about the current step.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer STEP, the step number.
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer C1(M,N), the current state of the system.
%
%    Input, integer C5(M,N), the number of agreeable neighbors.
%
  if ( step == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Step     Neighborhood Charge:\n' );
    fprintf ( 1, ...
      '           -5    -4    -3    -2    -1    +1    +2    +3    +4    +5\n' );
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '  %4d', step );

  for n = -5 : 5
    if ( n ~= 0 )
      c = sum ( sum ( c1 .* c5 == n ) );
      fprintf ( 1, '  %4d', c );
    end
  end
  fprintf ( 1, '\n' );
  
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
function [ c1, seed ] = transition ( m, n, iterations, prob, seed, c1 )

%*****************************************************************************80
%
%% TRANSITION carries out a Monte Carlo simulation of a 2D Ising model.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of cells in each spatial
%    dimension.
%
%    Input, integer ITERATIONS, the number of iterations to carry out.
%
%    Input, real PROB(1:5).  PROB(I) represents the probability
%    that the spin of a given cell will be reversed, given that it has I immediate
%    neighbors (including itself) with spin the same as its own.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Input/output, integer C1(M,N).  On input, the current state of the
%    system.  On output, the state of the system after the iterations.
%
  step = 0;
  ising_2d_stats ( step, m, n, c1 );
  ising_2d_display ( step, m, n, c1 );

  for step = 1 : iterations
%
%  C5 contains 1 through 5, the number of cells that agree with the center cell.
%
    c5 = ising_2d_agree ( m, n, c1 );

    if ( 0 )
      neighbor_2d_stats ( step, m, n, c1, c5 );
    end

    if ( 0 )
      neighbor_2d_display ( step, m, n, c1, c5 );
    end
%
%  Determine the chances of flipping cell (I,J).
%
    threshhold = zeros ( m, n );

    for j = 1 : 5
      i = find ( c5 == j );
      threshhold(i) = prob(j);
    end

    [ r, seed ] = r8mat_uniform_01 ( m, n, seed );

    i = find ( r < threshhold );

    c1(i) = - c1(i);

    ising_2d_stats ( step, m, n, c1 );
    ising_2d_display ( step, m, n, c1 );

  end

  return
end
