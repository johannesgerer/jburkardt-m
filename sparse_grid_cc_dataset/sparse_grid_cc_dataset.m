function sparse_grid_cc_dataset ( dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_CC_DATASET is the main program for SPARSE_GRID_CC_DATASET.
%
%  Discussion:
%
%    This program computes a sparse grid quadrature rule based on 1D
%    Clenshaw-Curtis rules and writes it to a file.. 
%
%    The user specifies:
%    * the spatial dimension of the quadrature region,
%    * the level that defines the Smolyak grid.
%
%  License:
%
%    This software is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_CC_DATASET\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute the abscissas and weights of a quadrature rule\n' );
  fprintf ( 1, '  associated with a sparse grid derived from a Smolyak\n' );
  fprintf ( 1, '  construction based on 1D Clenshaw-Curtis rules.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Inputs to the program include:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    DIM_NUM, the spatial dimension.\n' );
  fprintf ( 1, '    (typically in the range of 2 to 10)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    LEVEL_MAX, the "level" of the sparse grid.\n' );
  fprintf ( 1, '    (typically in the range of 0, 1, 2, 3, ...\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Output from the program includes:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    A printed table of the abscissas and weights.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    * A set of 3 files that define the quadrature rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    "cc_d?_level?_r.txt", a file of the ranges.\n' );
  fprintf ( 1, '    "cc_d?_level?_w.txt", a file of the weights;\n' );
  fprintf ( 1, '    "cc_d?_level?_x.txt", a file of the abscissas;\n' );
%
%  Get the spatial dimension.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    dim_num = input ( '  Enter the value of DIM_NUM (1 or greater): ' );
  elseif ( ischar ( dim_num ) )
    dim_num = str2num ( dim_num );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension requested is = %d\n', dim_num );
%
%  Get the level.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    level_max = input ( '  Enter the value of LEVEL_MAX (0 or greater): ' );
  elseif ( ischar ( level_max ) )
    level_max = str2num ( level_max );
  end

  level_min = max ( 0, level_max + 1 - dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEVEL_MIN = %d\n', level_min );
  fprintf ( 1, '  LEVEL_MAX = %d\n', level_max );
%
%  How many distinct points will there be?
%
  point_num = sparse_grid_cfn_size ( dim_num, level_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of distinct abscissas in the\n' );
  fprintf ( 1, '  quadrature rule is determined from the spatial\n' );
  fprintf ( 1, '  dimension DIM_NUM and the level LEVEL_MAX.\n' );
  fprintf ( 1, '  For the given input, this value will be = %d\n', point_num );

  r = zeros ( dim_num, 2 );
%
%  Compute the weights and points.
%
  r(1:dim_num,1) = -1.0;
  r(1:dim_num,2) = +1.0;

  [ w, x ] = sparse_grid_cc ( dim_num, level_max, point_num );

  r8mat_transpose_print_some ( dim_num, point_num, x, 1, 1, ...
    dim_num, 10, '  First 10 grid points:' );

  r8vec_print_some ( point_num, w, 1, 10, '  First 10 weights:' );

  weight_sum = sum ( w(1:point_num) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Weights sum to   %24.16f\n', weight_sum );
  fprintf ( 1, '  Correct value is %24.16f\n', 2.0^dim_num );
%
%  Write the rule to files.
%
  r_filename = sprintf ( 'cc_d%d_level%d_r.txt', dim_num, level_max );
  w_filename = sprintf ( 'cc_d%d_level%d_w.txt', dim_num, level_max );
  x_filename = sprintf ( 'cc_d%d_level%d_x.txt', dim_num, level_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Creating R file = "%s".\n', r_filename );

  r8mat_write ( r_filename, dim_num, 2, r );

  fprintf ( 1, '  Creating W file = "%s".\n', w_filename );

  r8mat_write ( w_filename, 1, point_num, w );

  fprintf ( 1, '  Creating X file = "%s".\n', x_filename );

  r8mat_write ( x_filename, dim_num, point_num, x );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_CC_DATASET:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function test_level = abscissa_level_closed_nd ( level_max, dim_num, ...
  test_num, test_val )

%*******************************************************************************
%
%% ABSCISSA_LEVEL_CLOSED_ND: first level at which given abscissa is generated.
%
%  Discussion:
%
%    We assume an underlying product grid.  In each dimension, this product
%    grid has order 2^LEVEL_MAX + 1.
%
%    We will say a sparse grid has total level LEVEL if each point in the
%    grid has a total level of LEVEL or less.
%
%    The "level" of a point is determined as the sum of the levels of the
%    point in each spatial dimension.
%
%    The level of a point in a single spatial dimension I is determined as
%    the level, between 0 and LEVEL_MAX, at which the point's I'th index
%    would have been generated.
%
%
%    This description is terse and perhaps unenlightening.  Keep in mind
%    that the product grid is the product of 1D grids,
%    that the 1D grids are built up by levels, having
%    orders (total number of points ) 1, 3, 5, 9, 17, 33 and so on,
%    and that these 1D grids are nested, so that each point in a 1D grid
%    has a first level at which it appears.
%
%    Our procedure for generating the points of a sparse grid, then, is
%    to choose a value LEVEL_MAX, to generate the full product grid,
%    but then only to keep those points on the full product grid whose
%    LEVEL is less than or equal to LEVEL_MAX.  
%
%
%    Note that this routine is really just testing out the idea of
%    determining the level.  Our true desire is to be able to start
%    with a value LEVEL, and determine, in a straightforward manner,
%    all the points that are generated exactly at that level, or
%    all the points that are generated up to and including that level.
%
%    This allows us to generate the new points to be added to one sparse
%    grid to get the next, or to generate a particular sparse grid at once.
%
%  License:
%
%    This software is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer LEVEL_MAX, controls the size of the final sparse grid.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer TEST_NUM, the number of points to be tested.
%
%    Input, integer TEST_VAL(DIM_NUM,TEST_NUM), the indices of the points 
%    to be tested.  Normally, each index would be between 0 and 2^LEVEL_MAX.
%
%    Output, integer TEST_LEVEL(TEST_NUM), the value of LEVEL at which the
%    point would first be generated, assuming that a standard sequence of
%    nested grids is used.
%
  test_level = zeros ( test_num, 1 );
  
  if ( level_max == 0 )
    test_level(1:test_num) = 0;
    return
  end

  order = 2^level_max + 1;

  for j = 1 : test_num

    test_level(j) = index_to_level_closed ( dim_num, test_val(1:dim_num,j), ...
      order, level_max );

  end

  return
end
function value = cc_abscissa ( n, i )

%*******************************************************************************
%
%% CC_ABSCISSA returns the I-th abscissa of the Clenshaw Curtis rule.
%
%  Discussion:
%
%    The abscissas are numbered from left to right.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%
%    Input, integer I, the index of the desired abscissa.  1 <= I <= N.
%
%    Output, real VALUE, the value of the I-th abscissa in the 
%    rule of order N.
%
  if ( n < 1 )
    value = - Inf;
  elseif ( i < 1 || n < i )
    value = - Inf;
  elseif ( n == 1 )
    value = 0.0;
  elseif ( 2 * ( n - i ) == n - 1 )
    value = 0.0;
  else
    value = cos ( ( n - i ) * pi / ( n - 1 ) );
  end

  return
end
function w = cc_weights ( n )

%*******************************************************************************
%
%% CC_WEIGHTS computes Clenshaw Curtis weights.
%
%  License:
%
%    This software is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Charles Clenshaw, Alan Curtis,
%    A Method for Numerical Integration on an Automatic Computer,
%    Numerische Mathematik,
%    Volume 2, Number 1, December 1960, pages 197-205.
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%
%    Output, real W(N), the weights of the rule.
%
  w = zeros ( n, 1 );
  
  if ( n == 1 )
    w(1) = 2.0;
    return
  end

  theta = zeros ( n, 1 );
  
  for i = 1 : n
    theta(i) = ( i - 1 ) * pi / ( n - 1 );
  end

  for i = 1 : n

    w(i) = 1.0;

    for j = 1 : floor ( ( n - 1 ) / 2 )

      if ( 2 * j == ( n - 1 ) )
        b = 1.0;
      else
        b = 2.0;
      end

      w(i) = w(i) - b * cos ( 2.0 * j * theta(i) ) / ( 4 * j * j - 1 );

    end

  end

  w(1)     =       w(1)     / ( n - 1 );
  w(2:n-1) = 2.0 * w(2:n-1) / ( n - 1 );
  w(n)     =       w(n)     / ( n - 1 );

  return
end
function value = choose ( n, k )

%*******************************************************************************
%
%% CHOOSE computes the binomial coefficient C(N,K).
%
%  Discussion:
%
%    The value is calculated in such a way as to avoid overflow and
%    roundoff.  The calculation is done in integer arithmetic.
%
%    The formula used is:
%
%      C(N,K) = N! / ( K! * (N-K)! )
%
%  License:
%
%    This software is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    ML Wolfson, HV Wright,
%    Algorithm 160:
%    Combinatorial of M Things Taken N at a Time,
%    Communications of the ACM,
%    Volume 6, Number 4, April 1963, page 161.
%
%  Parameters:
%
%    Input, integer N, K, are the values of N and K.
%
%    Output, integer VALUE, the number of combinations of N
%    things taken K at a time.
%
  mn = min ( k, n - k );

  if ( mn < 0 )

    value = 0;

  elseif ( mn == 0 )

    value = 1;

  else

    mx = max ( k, n - k );
    value = mx + 1;

    for i = 2 : mn
      value = ( value * ( mx + i ) ) / i;
    end

  end

  return
end
function [ a, more, h, t ] = comp_next ( n, k, a, more, h, t )

%*******************************************************************************
%
%% COMP_NEXT computes the compositions of the integer N into K parts.
%
%  Discussion:
%
%    A composition of the integer N into K parts is an ordered sequence
%    of K nonnegative integers which sum to N.  The compositions (1,2,1)
%    and (1,1,2) are considered to be distinct.
%
%    The routine computes one composition on each call until there are no more.
%    For instance, one composition of 6 into 3 parts is
%    3+2+1, another would be 6+0+0.
%
%    On the first call to this routine, set MORE = FALSE.  The routine
%    will compute the first element in the sequence of compositions, and
%    return it, as well as setting MORE = TRUE.  If more compositions
%    are desired, call again, and again.  Each time, the routine will
%    return with a new composition.
%
%    However, when the LAST composition in the sequence is computed 
%    and returned, the routine will reset MORE to FALSE, signaling that
%    the end of the sequence has been reached.
%
%    This routine originally used a SAVE statement to maintain the
%    variables H and T.  I have decided (based on an wasting an
%    entire morning trying to track down a problem) that it is safer
%    to pass these variables as arguments, even though the user should
%    never alter them.  This allows this routine to safely shuffle
%    between several ongoing calculations.
%
%    There are 28 compositions of 6 into three parts.  This routine will
%    produce those compositions in the following order:
%
%     I         A
%     -     ---------
%     1     6   0   0
%     2     5   1   0
%     3     4   2   0
%     4     3   3   0
%     5     2   4   0
%     6     1   5   0
%     7     0   6   0
%     8     5   0   1
%     9     4   1   1
%    10     3   2   1
%    11     2   3   1
%    12     1   4   1
%    13     0   5   1
%    14     4   0   2
%    15     3   1   2
%    16     2   2   2
%    17     1   3   2
%    18     0   4   2
%    19     3   0   3
%    20     2   1   3
%    21     1   2   3
%    22     0   3   3
%    23     2   0   4
%    24     1   1   4
%    25     0   2   4
%    26     1   0   5
%    27     0   1   5
%    28     0   0   6
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 July 2008
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms for Computers and Calculators,
%    Second Edition,
%    Academic Press, 1978,
%    ISBN: 0-12-519260-6,
%    LC: QA164.N54.
%
%  Parameters:
%
%    Input, integer N, the integer whose compositions are desired.
%
%    Input, integer K, the number of parts in the composition.
%
%    Input, integer A(K), the previous composition.  On the first call,
%    with MORE = FALSE, set A = [].  Thereafter, A should be the 
%    value of A output from the previous call.
%
%    Input, logical MORE.  The input value of MORE on the first
%    call should be FALSE, which tells the program to initialize.
%    On subsequent calls, MORE should be TRUE, or simply the
%    output value of MORE from the previous call.
%
%    Input, integer H, T, two internal parameters needed for the
%    computation.  The user may need to initialize these before the
%    very first call, but these initial values are not important.
%    The user should not alter these parameters once the computation
%    begins.
%
%    Output, integer A(K), the next composition.
%
%    Output, logical MORE, will be TRUE unless the composition 
%    that is being returned is the final one in the sequence.
%
%    Output, integer H, T, the updated values of the two internal 
%    parameters.
%
  if ( ~more )

    t = n;
    h = 0;
    a(1) = n;
    a(2:k) = 0;

  else
      
    if ( 1 < t )
      h = 0;
    end

    h = h + 1;
    t = a(h);
    a(h) = 0;
    a(1) = t - 1;
    a(h+1) = a(h+1) + 1;

  end

  more = ( a(k) ~= n );

  return
end
function value = i4_modp ( i, j )

%*******************************************************************************
%
%% I4_MODP returns the nonnegative remainder of I4 division.
%
%  Discussion:
%
%    If
%      NREM = I4_MODP ( I, J )
%      NMULT = ( I - NREM ) / J
%    then
%      I = J * NMULT + NREM
%    where NREM is always nonnegative.
%
%    The MOD function computes a result with the same sign as the
%    quantity being divided.  Thus, suppose you had an angle A,
%    and you wanted to ensure that it was between 0 and 360.
%    Then mod(A,360) would do, if A was positive, but if A
%    was negative, your result would be between -360 and 0.
%
%    On the other hand, I4_MODP(A,360) is between 0 and 360, always.
%
%  Example:
%
%        I     J     MOD  I4_MODP    Factorization
%
%      107    50       7       7    107 =  2 *  50 + 7
%      107   -50       7       7    107 = -2 * -50 + 7
%     -107    50      -7      43   -107 = -3 *  50 + 43
%     -107   -50      -7      43   -107 =  3 * -50 + 43
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number to be divided.
%
%    Input, integer J, the number that divides I.
%
%    Output, integer VALUE, the nonnegative remainder when I is
%    divided by J.
%
  if ( j == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_MODP - Fatal error!\n' );
    fprintf ( 1, '  Illegal divisor J = %d\n', j );
    error ( 'I4_MODP - Fatal error!' );
  end

  value = mod ( i, j );

  if ( value < 0 )
    value = value + abs ( j );
  end

  return
end
function value = index_to_level_closed ( dim_num, t, order, level_max )

%*******************************************************************************
%
%% INDEX_TO_LEVEL_CLOSED determines the level of a point given its index.
%
%  License:
%
%    This software is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer T(DIM_NUM), the grid indices of a point in a 1D closed rule.
%    0 <= T(I) <= ORDER.
%
%    Input, integer ORDER, the order of the rule.
%
%    Input, integer LEVEL_MAX, the level with respect to which the
%    index applies.
%
%    Output, integer VALUE, the first level on which
%    the point associated with the given index will appear.
%
  value = 0;
  
  for dim = 1 : dim_num

    s = i4_modp ( t(dim), order );

    if ( s == 0 )

      level = 0;

    else

      level = level_max;

      while ( mod ( s, 2 ) == 0 )
        s = floor ( s / 2 );
        level = level - 1;
      end

    end

    if ( level == 0 )
      level = 1;
    elseif ( level == 1 )
      level = 0;
    end

    value = value + level;

  end

  return
end
function order = level_to_order_closed ( dim_num, level )

%*******************************************************************************
%
%% LEVEL_TO_ORDER_CLOSED converts a level to an order for closed rules.
%
%  Discussion:
%
%    Sparse grids can naturally be nested.  A natural scheme is to use
%    a series of one-dimensional rules arranged in a series of "levels"
%    whose order roughly doubles with each step.
%
%    The arrangement described here works naturally for the Clenshaw Curtis
%    and Newton Cotes closed rules.  
%
%    The following table shows how the growth will occur:
%
%    Level    Order
%
%    0          1
%    1          3 =  2 + 1
%    2          5 =  4 + 1
%    3          9 =  8 + 1
%    4         17 = 16 + 1
%    5         33 = 32 + 1
%
%    For the Clenshaw Curtis and Newton Cotes Closed rules, the point growth
%    is nested.  If we have ORDER points on a particular LEVEL, the next
%    level includes all these old points, plus ORDER-1 new points, formed
%    in the gaps between successive pairs of old points.
%
%    Level    Order = New + Old
%
%    0          1   =  1  +  0
%    1          3   =  2  +  1
%    2          5   =  2  +  3
%    3          9   =  4  +  5
%    4         17   =  8  +  9
%    5         33   = 16  + 17
%
%    In this routine, we assume that a vector of levels is given,
%    and the corresponding orders are desired.
%
%  License:
%
%    This software is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL(DIM_NUM), the nesting level.
%
%    Output, integer ORDER(DIM_NUM), the order (number of points) of the rule.
%
  order = zeros ( dim_num, 1 );
  
  for dim = 1 : dim_num

    if ( level(dim) < 0 )
      order(dim) = -1;
    elseif ( level(dim) == 0 )
      order(dim) = 1;
    else
      order(dim) = ( 2^level(dim) ) + 1;
    end

  end

  return
end
function indx = multigrid_index0 ( dim_num, order_1d, order_nd )

%*******************************************************************************
%
%% MULTIGRID_INDEX0 returns an indexed multidimensional grid.
%
%  Discussion:
%
%    For dimension DIM, the second index of INDX may vary from 
%    0 to ORDER_1D(DIM)-1.
%
%  License:
%
%    This software is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension of the points.
%
%    Input, integer ORDER_1D(DIM_NUM), the order of the
%    rule in each dimension.
%
%    Input, integer ORDER_ND, the product of the entries of ORDER_1D.
%
%    Output, integer INDX(DIM_NUM,ORDER_ND), the indices of the points in
%    the grid.  The second dimension of this array is equal to the
%    product of the entries of ORDER_1D.
%
  p = 0;
  indx = zeros(dim_num,order_nd);

  a = [];
  more = 0;

  while ( 1 )

    [ a, more ] = vec_colex_next2 ( dim_num, order_1d, a, more );

    if ( ~more )
      break
    end

    p = p + 1;

    indx(1:dim_num,p) = a(1:dim_num)';

  end

  return
end
function grid_index = multigrid_scale_closed ( dim_num, order_nd, level_max, ...
  level_1d, grid_index )

%*******************************************************************************
%
%% MULTIGRID_SCALE_CLOSED renumbers a grid as a subgrid on a higher level.
%
%  Discussion:
%
%    This routine takes a grid associated with a given value of
%    LEVEL, and multiplies all the indices by a power of 2, so that
%    the indices reflect the position of the same points, but in
%    a grid of level LEVEL_MAX.
%
%  License:
%
%    This software is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer ORDER_ND, the number of points in the grid.
%
%    Input, integer LEVEL_MAX, the maximum value of LEVEL.
%
%    Input, integer LEVEL_1D(DIM_NUM), the level in each dimension.
%
%    Input, integer GRID_INDEX(DIM_NUM,POINT_NUM), the index
%    values for each grid point, based in the level for which the grid 
%    was generated.
%
%    Output, integer GRID_INDEX(DIM_NUM,POINT_NUM), the index
%    values for each grid point, appropriate for the grid as a subgrid 
%    of a grid of level LEVEL_MAX.
%
  for dim = 1 : dim_num

    if ( level_1d(dim) == 0 )

      if ( 0 == level_max )
        order_max = 1;
      else
        order_max = 2^level_max + 1;
      end

      grid_index(dim,1:order_nd) = floor ( ( order_max - 1 ) / 2 );

    else

      factor = 2^( level_max - level_1d(dim) );

      grid_index(dim,1:order_nd) = grid_index(dim,1:order_nd) * factor;

    end

  end

  return
end
function w_nd = product_weights_cc ( dim_num, order_1d, order_nd )

%*******************************************************************************
%
%% PRODUCT_WEIGHTS_CC computes weights for a Clenshaw Curtis product rule.
%
%  Discussion:
%
%    This routine computes the weights for a quadrature rule which is
%    a product of 1D closed rules of varying order.
%
%  License:
%
%    This software is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer ORDER_1D(DIM_NUM), the order of the 1D rules.
%
%    Input, integer ORDER_ND, the order of the product rule.
%
%    Output, real W_ND(DIM_NUM,ORDER_ND), the product rule weights.
%
  w_nd(1:order_nd) = 1.0;

  for dim = 1 : dim_num

    w_1d = cc_weights ( order_1d(dim) );

    w_nd = r8vec_direct_product2 ( dim, order_1d(dim), w_1d, dim_num, ...
      order_nd, w_nd );
 
  end

  return
end
function r8mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*******************************************************************************
%
%% R8MAT_TRANSPOSE_PRINT_SOME prints some of an R8MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, an optional title.
%
  incx = 5;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  for i2lo = max ( ilo, 1 ) : incx : min ( ihi, m )

    i2hi = i2lo + incx - 1;
    i2hi = min ( i2hi, m );
    i2hi = min ( i2hi, ihi );

    inc = i2hi + 1 - i2lo;
    
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row: ' );
    for i = i2lo : i2hi
      fprintf ( 1, '%7d       ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%12f', a(i,j) );
      end
      fprintf ( 1, '\n' );

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
function w = r8vec_direct_product2 ( factor_index, factor_order, ...
  factor_value, factor_num, point_num, w )

%*******************************************************************************
%
%% R8VEC_DIRECT_PRODUCT2 creates a direct product of R8VEC's.
%
%  Discussion:
%
%    To explain what is going on here, suppose we had to construct
%    a multidimensional quadrature rule as the product of K rules
%    for 1D quadrature.
%
%    The product rule will be represented as a list of points and weights.
%
%    The J-th item in the product rule will be associated with
%      item J1 of 1D rule 1,
%      item J2 of 1D rule 2, 
%      ..., 
%      item JK of 1D rule K.
%
%    In particular, 
%      X(J) = ( X(1,J1), X(2,J2), ..., X(K,JK))
%    and
%      W(J) = W(1,J1) * W(2,J2) * ... * W(K,JK)
%
%    So we can construct the quadrature rule if we can properly
%    distribute the information in the 1D quadrature rules.
%
%    This routine carries out that task for the weights W.
%
%    Another way to do this would be to compute, one by one, the
%    set of all possible indices (J1,J2,...,JK), and then index
%    the appropriate information.  An advantage of the method shown
%    here is that you can process the K-th set of information and
%    then discard it.
%
%  Example:
%
%    Rule 1: 
%      Order = 4
%      W(1:4) = ( 2, 3, 5, 7 )
%
%    Rule 2:
%      Order = 3
%      W(1:3) = ( 11, 13, 17 )
%
%    Rule 3:
%      Order = 2
%      W(1:2) = ( 19, 23 )
%
%    Product Rule:
%      Order = 24
%      W(1:24) =
%        ( 2 * 11 * 19 )
%        ( 3 * 11 * 19 )
%        ( 4 * 11 * 19 )
%        ( 7 * 11 * 19 )
%        ( 2 * 13 * 19 )
%        ( 3 * 13 * 19 )
%        ( 5 * 13 * 19 )
%        ( 7 * 13 * 19 )
%        ( 2 * 17 * 19 )
%        ( 3 * 17 * 19 )
%        ( 5 * 17 * 19 )
%        ( 7 * 17 * 19 )
%        ( 2 * 11 * 23 )
%        ( 3 * 11 * 23 )
%        ( 5 * 11 * 23 )
%        ( 7 * 11 * 23 )
%        ( 2 * 13 * 23 )
%        ( 3 * 13 * 23 )
%        ( 5 * 13 * 23 )
%        ( 7 * 13 * 23 )
%        ( 2 * 17 * 23 )
%        ( 3 * 17 * 23 )
%        ( 5 * 17 * 23 )
%        ( 7 * 17 * 23 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FACTOR_INDEX, the index of the factor being processed.
%    The first factor processed must be factor 1.
%
%    Input, integer FACTOR_ORDER, the order of the factor.
%
%    Input, real FACTOR_VALUE(FACTOR_ORDER), the factor values for
%    factor FACTOR_INDEX.
%
%    Input, integer FACTOR_NUM, the number of factors.
%
%    Input, integer POINT_NUM, the number of elements in the direct product.
%
%    Input/output, real W(POINT_NUM), the elements of the
%    direct product, updated by the latest factor.
%
%  Local Parameters:
%
%    Local, integer START, the first location of a block of values to set.
%
%    Local, integer CONTIG, the number of consecutive values to set.
%
%    Local, integer SKIP, the distance from the current value of START
%    to the next location of a block of values to set.
%
%    Local, integer REP, the number of blocks of values to set.
%
  persistent contig;
  persistent rep;
  persistent skip;

  if ( factor_index == 1 )
    contig = 1;
    skip = 1;
    rep = point_num;
    w(1:point_num) = 1.0;
  end

  rep = rep / factor_order;
  skip = skip * factor_order;

  for j = 1 : factor_order

    start = 1 + ( j - 1 ) * contig;

    for k = 1 : rep
      w(start:start+contig-1) = w(start:start+contig-1) * factor_value(j);
      start = start + skip;
    end

  end

  contig = contig * factor_order;

  return
end
function r8vec_print_some ( n, a, i_lo, i_hi, title )

%*******************************************************************************
%
%% R8VEC_PRINT_SOME prints "some" of an R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, real A(N), the vector to be printed.
%
%    Input, integer MAX_PRINT, the maximum number of lines to print.
%
%    Input, string TITLE, an optional title.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );

  for i = max ( 1, i_lo ) : min ( n, i_hi )
    fprintf ( 1, '  %8d  %12f\n', i, a(i) );
  end

  return
end
function len = s_len_trim ( s )

%*******************************************************************************
%
%% S_LEN_TRIM returns the length of a character string to the last nonblank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be measured.
%
%    Output, integer LEN, the length of the string up to the last nonblank.
%
  len = length ( s );

  while ( 0 < len )
    if ( s(len) ~= ' ' )
      return
    end
    len = len - 1;
  end

  return
end
 function [ grid_weight, grid_point ] = sparse_grid_cc ( dim_num, ...
   level_max, point_num  )

%*******************************************************************************
%
%% SPARSE_GRID_CC computes a sparse grid of Clenshaw Curtis points.
%
%  Discussion:
%
%    This program computes a quadrature rule and writes it to a file.
%
%    The quadrature rule is associated with a sparse grid derived from
%    a Smolyak construction using a closed 1D quadrature rule. 
%
%    The user specifies:
%    * the spatial dimension of the quadrature region,
%    * the level that defines the Smolyak grid.
%    * the closed 1D quadrature rule (Clenshaw-Curtis or Newton-Cotes Closed).
%
%  License:
%
%    This software is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, controls the size of the final sparse grid.
%
%    Input, integer POINT_NUM, the number of points in the grid, as determined
%    by SPARSE_GRID_CC_SIZE.
%
%    Output, real GRID_WEIGHTS(POINT_NUM), the weights.
%
%    Output, real GRID_POINTS(DIM_NUM,POINT_NUM), the points.
%

%
%  Determine the index vector, relative to the full product grid,
%  that identifies the points in the sparse grid.
%
  grid_index = sparse_grid_cc_index ( dim_num, level_max, point_num );
%
%  Compute the physical coordinates of the abscissas.
%
  if ( 0 == level_max )
    order_max = 1;
  else
    order_max = 2^level_max + 1;
  end

  grid_point = zeros ( dim_num, point_num );
  
  for point = 1 : point_num
    for dim = 1 : dim_num
      grid_point(dim,point) = ... 
        cc_abscissa ( order_max, grid_index(dim,point) + 1 );
    end
  end
%
%  Gather the weights.
%
  grid_weight = sparse_grid_cc_weights ( dim_num, level_max, point_num, ...
    grid_index );

  return
end
function grid_index = sparse_grid_cc_index ( dim_num, level_max, point_num )

%*******************************************************************************
%
%% SPARSE_GRID_CC_INDEX indexes the points forming a sparse grid.
%
%  Discussion:
%
%    The points forming the sparse grid are guaranteed to be a subset
%    of a certain product grid.  The product grid is formed by DIM_NUM
%    copies of a 1D rule of fixed order.  The orders of the 1D rule,
%    (called ORDER_1D) and the order of the product grid, (called ORDER)
%    are determined from the value LEVEL_MAX.
%
%    Thus, any point in the product grid can be identified by its grid index,
%    a set of DIM_NUM indices, each between 1 and ORDER_1D.
%
%    This routine creates the GRID_INDEX array, listing (uniquely) the
%    points of the sparse grid.  
%
%    An assumption has been made that the 1D rule is closed (includes
%    the interval endpoints) and nested (points that are part of a rule
%    of a given level will be part of every rule of higher level).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the maximum value of LEVEL.
%
%    Input, integer POINT_NUM, the total number of points in the grids.
%
%    Output, integer GRID_INDEX(DIM_NUM,POINT_NUM), a list of point indices,
%    representing a subset of the product grid of level LEVEL_MAX,
%    representing (exactly once) each point that will show up in a
%    sparse grid of level LEVEL_MAX.
%
  grid_index = zeros ( dim_num, point_num );
%
%  The outer loop generates LEVELs from 0 to LEVEL_MAX.
%
  point_num2 = 0;

  for level = 0 : level_max
%
%  The middle loop generates the next partition LEVEL_1D(1:DIM_NUM)
%  that adds up to LEVEL.
%
    level_1d = [];
    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more, h, t ] = comp_next ( level, dim_num, level_1d, more, h, t );
%
%  Transform each 1D level to a corresponding 1D order.
%
      order_1d = level_to_order_closed ( dim_num, level_1d );
%
%  The product of the 1D orders gives us the number of points in this grid.
%
      order_nd = prod ( order_1d(1:dim_num) );
%
%  The inner (hidden) loop generates all points corresponding to given grid.
%
      grid_index2 = multigrid_index0 ( dim_num, order_1d, order_nd );
%
%  Adjust these grid indices to reflect LEVEL_MAX.
%
      grid_index2 = multigrid_scale_closed ( dim_num, order_nd, level_max, level_1d, ...
        grid_index2 );
%
%  Determine the first level of appearance of each of the points.
%
      grid_level = abscissa_level_closed_nd ( level_max, dim_num, order_nd, ....
        grid_index2 );
%
%  Only keep those points which first appear on this level.
%
      for point = 1 : order_nd

        if ( grid_level(point) == level )

          point_num2 = point_num2 + 1;

          grid_index(1:dim_num,point_num2) = grid_index2(1:dim_num,point);

        end

      end

      if ( ~more )
        break
      end

    end

  end

  return
end
function point_num = sparse_grid_cfn_size ( dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_CFN_SIZE sizes a sparse grid using Closed Fully Nested rules.
%
%  Discussion:
%
%    The grid is defined as the sum of the product rules whose LEVEL
%    satisfies:
%
%      0 <= LEVEL <= LEVEL_MAX.
%
%    This calculation is much faster than a previous method.  It simply
%    computes the number of new points that are added at each level in the
%    1D rule, and then counts the new points at a given DIM_NUM dimensional
%    level vector as the product of the new points added in each dimension.
%
%    This approach will work for nested families, and may be extensible
%    to other families, and to mixed rules.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the maximum value of LEVEL.
%
%    Output, integer POINT_NUM, the total number of unique 
%    points in the grids.
%

%
%  Special case.
%
  if ( level_max < 0 )
    point_num = 0;
    return
  end

  if ( level_max == 0 )
    point_num = 1;
    return
  end
%
%  Construct the vector that counts the new points in the 1D rule.
%
  new_1d = zeros ( level_max+1, 1 );

  new_1d(0+1) = 1;
  new_1d(1+1) = 2;

  j = 1;
  for i = 2 : level_max
    j = j * 2;
    new_1d(i+1) = j;
  end
%
%  Count the number of points by counting the number of new points 
%  associated with each level vector.
%
  level_1d = zeros ( dim_num, 1 );

  point_num = 0;

  for level = 0 : level_max

    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more, h, t ] = comp_next ( level, dim_num, level_1d, more, h, t );

      point_num = point_num + prod ( new_1d(level_1d(1:dim_num)+1) );

      if ( ~more )
        break
      end

    end

  end

  return
end
function grid_weight = sparse_grid_cc_weights ( dim_num, level_max, point_num, ...
  grid_index )

%*******************************************************************************
%
%% SPARSE_GRID_CC_WEIGHTS gathers the weights.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the maximum value of LEVEL.
%
%    Input, integer POINT_NUM, the total number of points in the grids.
%
%    Input, integer GRID_INDEX(DIM_NUM,POINT_NUM), a list of point indices,
%    representing a subset of the product grid of level LEVEL_MAX,
%    representing (exactly once) each point that will show up in a
%    sparse grid of level LEVEL_MAX.
%
%    Output, real GRID_WEIGHT(POINT_NUM), the weights
%    associated with the sparse grid points.
%
  if ( level_max == 0 )
    grid_weight(1:point_num) = 2.0^dim_num;
    return
  end

  grid_weight(1:point_num) = 0.0;

  level_min = max ( 0, level_max + 1 - dim_num );

  for level = level_min : level_max
%
%  The middle loop generates the next partition LEVEL_1D(1:DIM_NUM)
%  that adds up to LEVEL.
%
    level_1d = [];
    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more, h, t ] = comp_next ( level, dim_num, level_1d, more, h, t );
%
%  Transform each 1D level to a corresponding 1D order.
%
      order_1d = level_to_order_closed ( dim_num, level_1d );
%
%  The product of the 1D orders gives us the number of points in this grid.
%
      order_nd = prod ( order_1d(1:dim_num) );
%
%  Generate the indices of the points corresponding to the grid.
%
      grid_index2 = multigrid_index0 ( dim_num, order_1d, order_nd );
%
%  Compute the weights for this grid.
%
      grid_weight2 = product_weights_cc ( dim_num, order_1d, order_nd );
%
%  Adjust the grid indices to reflect LEVEL_MAX.
%
      grid_index2 = multigrid_scale_closed ( dim_num, order_nd, level_max, ...
        level_1d, grid_index2 );
%
%  Now determine the coefficient.
%
      coeff = (-1)^( level_max - level ) ...
        * choose ( dim_num - 1, level_max - level );

      for point2 = 1 : order_nd

        for point = 1 : point_num

          if ( all ( ...
            grid_index2(1:dim_num,point2) == grid_index(1:dim_num,point) ...
          ) )
            grid_weight(point) = grid_weight(point) ...
              + coeff * grid_weight2(point2);
            break
          end

        end

      end

      if ( ~more )
        break
      end

    end

  end

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
function [ a, more ] = vec_colex_next2 ( dim_num, base, a, more )

%*******************************************************************************
%
%% VEC_COLEX_NEXT2 generates vectors in colex order.
%
%  Discussion:
%
%    The vectors are produced in colexical order, starting with
%    (0,0,...,0),
%    (1,0,...,0),
%    ...
%    (BASE(1)-1,BASE(2)-1,...,BASE(DIM_NUM)-1).
%
%  Example:
%
%    DIM_NUM = 2, 
%    BASE = [ 3, 3]
%
%    0   0
%    1   0
%    2   0
%    0   1
%    1   1
%    2   1
%    0   2
%    1   2
%    2   2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dennis Stanton, Dennis White,
%    Constructive Combinatorics,
%    Springer, 1986,
%    ISBN: 0387963472,
%    LC: QA164.S79.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer BASE(DIM_NUM), the base to be used in each dimension.
%
%    Input, integer A(DIM_NUM), except on the first call, this should
%    be the output value of A on the last call.
%
%    Input, logical MORE, should be FALSE on the first call, and
%    thereafter should be the output value of MORE from the previous call.  
%
%    Output, integer A(DIM_NUM), the next vector.
%
%    Output, logical MORE, is TRUE if another vector was computed.
%    If MORE is FALSE on return, then ignore the output value A, and
%    stop calling the routine.
%
  if ( ~more )

    a(1:dim_num) = 0;
    more = 1;

  else
      
    for i = 1 : dim_num

      a(i) = a(i) + 1;

      if ( a(i) < base(i) )
        return
      end

      a(i) = 0;

    end

    more = 0;

  end

  return
end
