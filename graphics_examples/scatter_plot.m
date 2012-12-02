function scatter_plot ( )

%*****************************************************************************80
%
%% SCATTER_PLOT uses MATLAB to draw a scatter plot of X Y data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SCATTER_PLOT:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Make a scatterplot of XY data.\n' );

  n = 500;
%
%  Generate the data.  
%  We average 4 random values to get data that tends to cluster
%  near (0.5,0.5).
%
  seed = 123456789;

  xvec = zeros ( n, 1 );

  for i = 1 : n
    s = 0.0;
    for j = 1 : 4
      [ r, seed ] = r4_uniform_01 ( seed );
      s = s + r;
    end
    xvec(i) = s / 4.0;
  end

  yvec = zeros ( n, 1 );

  for i = 1 : n
    s = 0.0;
    for j = 1 : 4
      [ r, seed ] = r4_uniform_01 ( seed );
      s = s + r;
    end
    yvec(i) = s / 4.0;
  end
%
%  Save a copy of the data for reference.
%
  xy = zeros ( n, 2 );
  xy(:,1) = xvec(:);
  xy(:,2) = yvec(:);
  save ( 'scatter_plot.txt', '-ASCII', 'xy' );
%
%  Plot the data.
%
  plot ( xvec, yvec, 'b.' );
  grid on
  axis ( [ 0.0, 1.0, 0.0, 1.0 ] )
  axis equal
  axis square
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( 'Scatter Plot' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SCATTER_PLOT:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

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
