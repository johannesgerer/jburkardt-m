function sparse_grid_open_dataset ( dim_num, level_max, rule )

%*****************************************************************************80
%
%% SPARSE_GRID_OPEN_DATASET is the main program for SPARSE_GRID_OPEN_DATASET.
%
%  Discussion:
%
%    This program computes a quadrature rule and writes it to a file.
%
%    The quadrature rule is associated with a sparse grid derived from
%    a Smolyak construction using an open 1D quadrature rule. 
%
%  Usage:
%
%    sparse_grid_open_dataset ( dim_num, level_max, rule )
%
%    where
%
%    * dim_num is the spatial dimension of the quadrature region,
%    * level_max is the level that defines the Smolyak grid.
%    * rule is the index of the open 1D quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 December 2009
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
  fprintf ( 1, 'SPARSE_GRID_OPEN_DATASET\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute the abscissas and weights of a quadrature rule\n' );
  fprintf ( 1, '  associated with a sparse grid derived from a Smolyak\n' );
  fprintf ( 1, '  construction based on an open 1D quadrature rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Inputs to the program include:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    DIM_NUM, the spatial dimension.\n' );
  fprintf ( 1, '    (typically in the range of 2 to 10)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    LEVEL_MAX, the "level" of the sparse grid.\n' );
  fprintf ( 1, '    (typically in the range of 0, 1, 2, 3, ...\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    RULE, the 1D quadrature rule\n' );
  fprintf ( 1, '    2: Fejer Type 2 ("F2"),\n' );
  fprintf ( 1, '    3: Gauss-Patterson ("GP"),\n' );
  fprintf ( 1, '    4: Newton-Cotes Open ("NCO"),\n' );
  fprintf ( 1, '    5: Tanh-Sinh ("TS"),\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Output from the program includes:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    A printed table of the abscissas and weights.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    A set of files defining the quadrature rule:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    "cc_d?_level?_x.txt", a file of the abscissas;\n' );
  fprintf ( 1, '    "cc_d?_level?_w.txt", a file of the weights;\n' );
  fprintf ( 1, '    "cc_d?_level?_r.txt", a file of the ranges.\n' );
%
%  Get the spatial dimension.
%
  if ( nargin < 1)
    fprintf ( 1, '\n' );
    dim_num = input ( '  Enter the value of DIM_NUM: ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension requested is = %d\n', dim_num );
%
%  Get the level.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    level_max = input ( '  Enter the value of LEVEL_MAX: ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The sparse grid level is = %d\n', level_max );
%
%  Get the rule.
%
  if ( nargin < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Choices for the 1D quadrature rule:\n' );
    fprintf ( 1, '  2 = F2   = Fejer Type 2 Rule,\n' );
    fprintf ( 1, '  3 = GP   = Gauss-Patterson,\n' );
    fprintf ( 1, '  4 = NCO  = Newton-Cotes Open \n' );
    fprintf ( 1, '  5 = TS   = Tanh-Sinh \n' );
    fprintf ( 1, '\n' );
    rule = input ( '  Enter the value of RULE: ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The 1D quadrature rule index is = %d\n', rule );
  if ( rule == 2 )
    fprintf ( 1, '  F2   = Fejer Type 2 Rule.\n' );
  elseif ( rule == 3 )
    fprintf ( 1, '  GP   = Gauss-Patterson.\n' );
  elseif ( rule == 4 )
    fprintf ( 1, '  NCO  = Newton-Cotes Open.\n' );
  elseif ( rule == 5 )
    fprintf ( 1, '  TS  = Tanh-Sinh.\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPARSE_GRID_OPEN_DATASET - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of RULE.\n' );
    error ( 'SPARSE_GRID_OPEN_DATASET - Fatal error!' );
  end
%
%  How many distinct points will there be?
%
  point_num = sparse_grid_ofn_size ( dim_num, level_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of distinct abscissas in the\n' );
  fprintf ( 1, '  quadrature rule is determined from the spatial\n' );
  fprintf ( 1, '  dimension DIM_NUM and the level LEVEL_MAX.\n' );
  fprintf ( 1, '  For the given input, this value will be = %d\n', point_num );
%
%  Determine the index vector, relative to the full product grid,
%  that identifies the points in the sparse grid.
%
  grid_index = spgrid_open_index ( dim_num, level_max, point_num );

  i4mat_transpose_print_some ( dim_num, point_num, grid_index, 1, 1, ...
    dim_num, 10, '  First 10 entries of grid index:' );
%
%  Compute the physical coordinates of the abscissas.
%
  order_max = 2^( level_max + 1 ) - 1;

  if ( rule == 5 )

    m = level_max - 3;
    order_max = 2^( m + 4 ) - 1;
    n = ( ( order_max + 1 ) / 2 ) - 1;
    h = 4.0D+00 / ( order_max + 1 );

    fprintf ( 1, '  M = %d  ORDER_MAX = %d  N = %d  H = %e\n', m, order_max, n, h );

  end

  if ( rule == 2 )
    for point = 1 : point_num
      for dim = 1 : dim_num
        grid_point(dim,point) = ...
          f2_abscissa ( order_max, grid_index(dim,point) );
      end
    end
  elseif ( rule == 3 )
    for point = 1 : point_num
      for dim = 1 : dim_num
        grid_point(dim,point) = ...
          gp_abscissa ( order_max, grid_index(dim,point) );
      end
    end
  elseif ( rule == 4 )
    for point = 1 : point_num
      for dim = 1 : dim_num
        grid_point(dim,point) = ...
          nco_abscissa ( order_max, grid_index(dim,point) );
      end
    end
  elseif ( rule == 5 )
    for point = 1 : point_num
      for dim = 1 : dim_num
        grid_point(dim,point) = ...
          ts_abscissa ( order_max, grid_index(dim,point) );
      end
    end
  end

  r8mat_transpose_print_some ( dim_num, point_num, grid_point, 1, 1, ...
    dim_num, 10, '  First 10 entries of grid point:' );
%
%  Gather the weights.
%
  grid_weight = spgrid_open_weights ( dim_num, level_max, point_num, ...
    rule, grid_index );

  r8vec_print_some ( point_num, grid_weight, 1, 10, ...
    '  First 10 entries of grid weight:' );

  weight_sum = sum ( grid_weight(1:point_num) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Weights sum to   %24.16f\n', weight_sum );
  fprintf ( 1, '  Correct value is %24.16f\n', 2.0^dim_num );
%
%  Write the rule to files.
%
  if ( rule == 2 )
    x_filename = sprintf ( 'f2_d%d_level%d_x.txt', dim_num, level_max );
    w_filename = sprintf ( 'f2_d%d_level%d_w.txt', dim_num, level_max );
    r_filename = sprintf ( 'f2_d%d_level%d_r.txt', dim_num, level_max );
  elseif ( rule == 3 )
    x_filename = sprintf ( 'gp_d%d_level%d_x.txt', dim_num, level_max );
    w_filename = sprintf ( 'gp_d%d_level%d_w.txt', dim_num, level_max );
    r_filename = sprintf ( 'gp_d%d_level%d_r.txt', dim_num, level_max );
  elseif ( rule == 4 )
    x_filename = sprintf ( 'nco_d%d_level%d_x.txt', dim_num, level_max );
    w_filename = sprintf ( 'nco_d%d_level%d_w.txt', dim_num, level_max );
    r_filename = sprintf ( 'nco_d%d_level%d_r.txt', dim_num, level_max );
  elseif ( rule == 5 )
    x_filename = sprintf ( 'ts_d%d_level%d_x.txt', dim_num, level_max );
    w_filename = sprintf ( 'ts_d%d_level%d_w.txt', dim_num, level_max );
    r_filename = sprintf ( 'ts_d%d_level%d_r.txt', dim_num, level_max );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Creating X file = "%s".\n', x_filename );

  r8mat_write ( x_filename, dim_num, point_num, grid_point );

  fprintf ( 1, '  Creating W file = "%s".\n', w_filename );

  r8mat_write ( w_filename, 1, point_num, grid_weight );

  fprintf ( 1, '  Creating R file = "%s".\n', r_filename );

  grid_region(1:dim_num,1) = -1.0;
  grid_region(1:dim_num,2) = +1.0;

  r8mat_write ( r_filename, dim_num, 2, grid_region );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_OPEN_DATASET\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function test_level = abscissa_level_open_nd ( level_max, dim_num, ...
  test_num, test_val )

%*****************************************************************************80
%
%% ABSCISSA_LEVEL_OPEN_ND: first level at which given abscissa is generated.
%
%  Discussion:
%
%    We assume an underlying product grid.  In each dimension, this product
%    grid has order 2**(LEVEL_MAX+1) - 1.
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
%    orders (total number of points ) 1, 3, 7, 15, 31 and so on,
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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2007
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
%    to be tested.  Normally, each index would be between 
%    0 and 2**(LEVEL_MAX+1).
%
%    Output, integer TEST_LEVEL(TEST_NUM), the value of LEVEL at which the
%    point would first be generated, assuming that a standard sequence of
%    nested grids is used.
%

%
%  Special case: LEVEL_MAX = 0.
%
  if ( level_max == 0 )
    test_level(1:test_num) = 0;
    return
  end

  order = 2^( level_max + 1 ) - 1;

  for j = 1 : test_num

    test_level(j) = index_to_level_open ( dim_num, test_val(1:dim_num,j), ...
      order, level_max );

  end

  return
end
function [ a, more, h, t ] = comp_next ( n, k, a, more, h, t )

%*****************************************************************************80
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
%    variables H and T.  I have decided that it is safer
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
function value = f2_abscissa ( order, i )

%*****************************************************************************80
%
%% F2_ABSCISSA returns the I-th abscissa for the Fejer type 2 rule.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to
%    right.
%
%    This rule is defined on [-1,1].
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
%    Input, integer ORDER, the order of the rule.
%
%    Input, integer I, the index of the desired abscissa.  1 <= I <= ORDER.
%
%    Output, real VALUE, the value of the I-th abscissa in the 
%    rule of order ORDER.
%
  if ( order < 1 )
    value = - Inf;
  elseif ( i < 1 | order < i )
    value = - Inf;
  elseif ( order == 1 )
    value = 0.0;
  elseif ( 2 * ( order + 1 - i ) == order + 1 )
    value = 0.0;
  else
    value = cos ( ( order + 1 - i ) * pi / ( order + 1 ) );
  end

  return
end
function w = f2_weights ( order )

%*****************************************************************************80
%
%% F2_WEIGHTS computes weights for a Fejer type 2 rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%    Walter Gautschi,
%    Numerical Quadrature in the Presence of a Singularity,
%    SIAM Journal on Numerical Analysis,
%    Volume 4, Number 3, 1967, pages 357-362.
%
%    Joerg Waldvogel,
%    Fast Construction of the Fejer and Clenshaw-Curtis Quadrature Rules,
%    BIT Numerical Mathematics,
%    Volume 43, Number 1, 2003, pages 1-18.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Output, real W(ORDER), the weights of the rule.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F2_WEIGHTS - Fatal error!\n' );
    fprintf ( 1, '  ORDER < 1.\n' );
    error ( 'F2_WEIGHTS - Fatal error!' )
  end

  if ( order == 1 )
    w(1) = 2.0;
    return
  elseif ( order == 2 )
    w(1:2) = 1.0;
    return
  end

  for i = 1 : order
    theta(i) = ( order + 1 - i ) * pi / ( order + 1 );
  end

  for i = 1 : order

    w(i) = 1.0;

    for j = 1 : floor ( ( order - 1 ) / 2 )
      w(i) = w(i) - 2.0 * cos ( 2.0 * j * theta(i) ) / ( 4 * j * j - 1 );
    end

    if ( 2 < order )
      p = 2.0 * ( floor ( ( order + 1 ) / 2 ) ) - 1.0;
      w(i) = w(i) - cos ( ( p + 1.0 ) * theta(i) ) / p;
    end

  end

  w(1:order) = 2.0 * w(1:order) / ( order + 1 );

  return
end
function grid_point = gl_abscissa ( dim_num, point_num, grid_index )

%*****************************************************************************80
%
%% GL_ABSCISSA sets abscissas for "nested" Gauss-Legendre quadrature.
%
%  Discussion:
%
%    The "nesting" as it occurs for Gauss-Legendre sparse grids simply
%    involves the use of a specified set of permissible orders for the
%    rule.
%
%    The XTAB array lists the Gauss-Legendre abscissas for rules of order
%    1, 3, 5, 9, 17, 33 and 65, in order.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer GRID_INDEX(DIM_NUM,POINT_NUM), indices that
%    indicate the Gauss-Legendre abscissa to be used for each component
%    of each point.  Each index should be between 1 and 133, indicating
%    a particular abscissa.
%
%    Output, real GRID_POINT(DIM_NUM), the grid points of
%    Gauss-Legendre abscissas.
%
  xtab = [ ...
       0.0, ...
     - 0.774596669241483377035853079956, ...
       0.0, ...
       0.774596669241483377035853079956, ...
     - 0.906179845938663992797626878299, ...
     - 0.538469310105683091036314420700, ...
       0.0, ...
       0.538469310105683091036314420700, ...
       0.906179845938663992797626878299, ...
     - 0.968160239507626089835576202904, ...
     - 0.836031107326635794299429788070, ...
     - 0.613371432700590397308702039341, ...
     - 0.324253423403808929038538014643, ...
       0.0, ...
       0.324253423403808929038538014643, ...
       0.613371432700590397308702039341, ...
       0.836031107326635794299429788070, ...
       0.968160239507626089835576202904, ...
     - 0.990575475314417335675434019941, ...
     - 0.950675521768767761222716957896, ...
     - 0.880239153726985902122955694488, ...
     - 0.781514003896801406925230055520, ...
     - 0.657671159216690765850302216643, ...
     - 0.512690537086476967886246568630, ...
     - 0.351231763453876315297185517095, ...
     - 0.178484181495847855850677493654, ...
       0.0, ...
       0.178484181495847855850677493654, ...
       0.351231763453876315297185517095, ...
       0.512690537086476967886246568630, ...
       0.657671159216690765850302216643, ...
       0.781514003896801406925230055520, ...
       0.880239153726985902122955694488, ...
       0.950675521768767761222716957896, ...
       0.990575475314417335675434019941, ...
      -0.9974246942464552, ...
      -0.9864557262306425, ...
      -0.9668229096899927, ...
      -0.9386943726111684, ...
      -0.9023167677434336, ...
      -0.8580096526765041, ...
      -0.8061623562741665, ...
      -0.7472304964495622, ...
      -0.6817319599697428, ...
      -0.6102423458363790, ...
      -0.5333899047863476, ...
      -0.4518500172724507, ...
      -0.3663392577480734, ...
      -0.2776090971524970, ...
      -0.1864392988279916, ...
      -0.09363106585473338, ...
       0.0, ...
       0.09363106585473338, ...
       0.1864392988279916, ...
       0.2776090971524970, ...
       0.3663392577480734, ...
       0.4518500172724507, ...
       0.5333899047863476, ...
       0.6102423458363790, ...
       0.6817319599697428, ...
       0.7472304964495622, ...
       0.8061623562741665, ...
       0.8580096526765041, ...
       0.9023167677434336, ...
       0.9386943726111684, ...
       0.9668229096899927, ...
       0.9864557262306425, ...
       0.9974246942464552, ...
      -0.9993260970754129, ...
      -0.9964509480618492, ...
      -0.9912852761768016, ...
      -0.9838398121870350, ...
      -0.9741315398335512, ...
      -0.9621827547180553, ...
      -0.9480209281684076, ...
      -0.9316786282287494, ...
      -0.9131934405428462, ...
      -0.8926078805047389, ...
      -0.8699692949264071, ...
      -0.8453297528999303, ...
      -0.8187459259226514, ...
      -0.7902789574921218, ...
      -0.7599943224419998, ...
      -0.7279616763294247, ...
      -0.6942546952139916, ...
      -0.6589509061936252, ...
      -0.6221315090854003, ...
      -0.5838811896604873, ...
      -0.5442879248622271, ...
      -0.5034427804550069, ...
      -0.4614397015691450, ...
      -0.4183752966234090, ...
      -0.3743486151220660, ...
      -0.3294609198374864, ...
      -0.2838154539022487, ...
      -0.2375172033464168, ...
      -0.1906726556261428, ...
      -0.1433895546989752, ...
      -0.9577665320919751E-01, ...
      -0.4794346235317186E-01, ...
       0.0, ...
       0.4794346235317186E-01, ...
       0.9577665320919751E-01, ...
       0.1433895546989752, ...
       0.1906726556261428, ...
       0.2375172033464168, ...
       0.2838154539022487, ...
       0.3294609198374864, ...
       0.3743486151220660, ...
       0.4183752966234090, ...
       0.4614397015691450, ...
       0.5034427804550069, ...
       0.5442879248622271, ...
       0.5838811896604873, ...
       0.6221315090854003, ...
       0.6589509061936252, ...
       0.6942546952139916, ...
       0.7279616763294247, ...
       0.7599943224419998, ...
       0.7902789574921218, ...
       0.8187459259226514, ...
       0.8453297528999303, ...
       0.8699692949264071, ...
       0.8926078805047389, ...
       0.9131934405428462, ...
       0.9316786282287494, ...
       0.9480209281684076, ...
       0.9621827547180553, ...
       0.9741315398335512, ...
       0.9838398121870350, ...
       0.9912852761768016, ...
       0.9964509480618492, ...
       0.9993260970754129 ];

  if ( any ( grid_index(1:dim_num,1:point_num) < 1 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GL_ABSCISSA - Fatal error!\n' );
    fprintf ( 1, '  Some index values are less than 1.\n' );
    error ( 'GL_ABSCISSA - Fatal error!' );
  elseif ( any ( 127 < grid_index(1:dim_num,1:point_num) ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GL_ABSCISSA - Fatal error!\n' );
    fprintf ( 1, '  Some index values are greater than 127.\n' );
    error ( 'GL_ABSCISSA - Fatal error!' );
  end

  for dim = 1 : dim_num
    grid_point(dim,1:point_num) = xtab ( grid_index(dim,1:point_num) )
  end

  return
end
function value = gp_abscissa ( order, i )

%*****************************************************************************80
%
%% GP_ABSCISSA returns the I-th abscissa for a Gauss-Patterson rule.
%
%  Discussion:
%
%    The rule is specified by its order.
%
%    The number of points in the rule, known as the order, is
%    related to the level by the formula:
%
%      ORDER = 2^(LEVEL+1)-1.
%
%    Only rules of order 1, 3, 7, 15, 31, 63, 127 and 255 are allowed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Prem Kythe, Michael Schaeferkotter,
%    Handbook of Computational Methods for Integration,
%    Chapman and Hall, 2004,
%    ISBN: 1-58488-428-2,
%    LC: QA299.3.K98.
%
%    Thomas Patterson,
%    The Optimal Addition of Points to Quadrature Formulae,
%    Mathematics of Computation,
%    Volume 22, Number 104, October 1968, pages 847-856.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%    ORDER must be 1, 3, 7, 15, 31, 63, 127 and 255.
%
%    Input, integer I, the index of the point in the rule.
%
%    Output, real VALUE, the value of the I-th
%    abscissa in the rule of level LEVEL and order ORDER.
%
  order_pointer = [ 0, 1, 4, 11, 26, 57, 120, 247 ];

  xtab = [ ...
     0.0, ...
    -0.77459666924148337704, ...
     0.0, ...
     0.77459666924148337704, ...
    -0.96049126870802028342, ...
    -0.77459666924148337704, ...
    -0.43424374934680255800, ...
     0.0, ...
     0.43424374934680255800, ...
     0.77459666924148337704, ...
     0.96049126870802028342, ...
    -0.99383196321275502221, ...
    -0.96049126870802028342, ...
    -0.88845923287225699889, ...
    -0.77459666924148337704, ...
    -0.62110294673722640294, ...
    -0.43424374934680255800, ...
    -0.22338668642896688163, ...
     0.0, ...
     0.22338668642896688163, ...
     0.43424374934680255800, ...
     0.62110294673722640294, ...
     0.77459666924148337704, ...
     0.88845923287225699889, ...
     0.96049126870802028342, ...
     0.99383196321275502221, ...
    -0.99909812496766759766, ...
    -0.99383196321275502221, ...
    -0.98153114955374010687, ...
    -0.96049126870802028342, ...
    -0.92965485742974005667, ...
    -0.88845923287225699889, ...
    -0.83672593816886873550, ...
    -0.77459666924148337704, ...
    -0.70249620649152707861, ...
    -0.62110294673722640294, ...
    -0.53131974364437562397, ...
    -0.43424374934680255800, ...
    -0.33113539325797683309, ...
    -0.22338668642896688163, ...
    -0.11248894313318662575, ...
     0.0, ...
     0.11248894313318662575, ...
     0.22338668642896688163, ...
     0.33113539325797683309, ...
     0.43424374934680255800, ...
     0.53131974364437562397, ...
     0.62110294673722640294, ...
     0.70249620649152707861, ...
     0.77459666924148337704, ...
     0.83672593816886873550, ...
     0.88845923287225699889, ...
     0.92965485742974005667, ...
     0.96049126870802028342, ...
     0.98153114955374010687, ...
     0.99383196321275502221, ...
     0.99909812496766759766, ...
    -0.99987288812035761194, ...
    -0.99909812496766759766, ...
    -0.99720625937222195908, ...
    -0.99383196321275502221, ...
    -0.98868475754742947994, ...
    -0.98153114955374010687, ...
    -0.97218287474858179658, ...
    -0.96049126870802028342, ...
    -0.94634285837340290515, ...
    -0.92965485742974005667, ...
    -0.91037115695700429250, ...
    -0.88845923287225699889, ...
    -0.86390793819369047715, ...
    -0.83672593816886873550, ...
    -0.80694053195021761186, ...
    -0.77459666924148337704, ...
    -0.73975604435269475868, ...
    -0.70249620649152707861, ...
    -0.66290966002478059546, ...
    -0.62110294673722640294, ...
    -0.57719571005204581484, ...
    -0.53131974364437562397, ...
    -0.48361802694584102756, ...
    -0.43424374934680255800, ...
    -0.38335932419873034692, ...
    -0.33113539325797683309, ...
    -0.27774982202182431507, ...
    -0.22338668642896688163, ...
    -0.16823525155220746498, ...
    -0.11248894313318662575, ...
    -0.056344313046592789972, ...
     0.0, ...
     0.056344313046592789972, ...
     0.11248894313318662575, ...
     0.16823525155220746498, ...
     0.22338668642896688163, ...
     0.27774982202182431507, ...
     0.33113539325797683309, ...
     0.38335932419873034692, ...
     0.43424374934680255800, ...
     0.48361802694584102756, ...
     0.53131974364437562397, ...
     0.57719571005204581484, ...
     0.62110294673722640294, ...
     0.66290966002478059546, ...
     0.70249620649152707861, ...
     0.73975604435269475868, ...
     0.77459666924148337704, ...
     0.80694053195021761186, ...
     0.83672593816886873550, ...
     0.86390793819369047715, ...
     0.88845923287225699889, ...
     0.91037115695700429250, ...
     0.92965485742974005667, ...
     0.94634285837340290515, ...
     0.96049126870802028342, ...
     0.97218287474858179658, ...
     0.98153114955374010687, ...
     0.98868475754742947994, ...
     0.99383196321275502221, ...
     0.99720625937222195908, ...
     0.99909812496766759766, ...
     0.99987288812035761194, ...
    -0.99998243035489159858, ...
    -0.99987288812035761194, ...
    -0.99959879967191068325, ...
    -0.99909812496766759766, ...
    -0.99831663531840739253, ...
    -0.99720625937222195908, ...
    -0.99572410469840718851, ...
    -0.99383196321275502221, ...
    -0.99149572117810613240, ...
    -0.98868475754742947994, ...
    -0.98537149959852037111, ...
    -0.98153114955374010687, ...
    -0.97714151463970571416, ...
    -0.97218287474858179658, ...
    -0.96663785155841656709, ...
    -0.96049126870802028342, ...
    -0.95373000642576113641, ...
    -0.94634285837340290515, ...
    -0.93832039777959288365, ...
    -0.92965485742974005667, ...
    -0.92034002547001242073, ...
    -0.91037115695700429250, ...
    -0.89974489977694003664, ...
    -0.88845923287225699889, ...
    -0.87651341448470526974, ...
    -0.86390793819369047715, ...
    -0.85064449476835027976, ...
    -0.83672593816886873550, ...
    -0.82215625436498040737, ...
    -0.80694053195021761186, ...
    -0.79108493379984836143, ...
    -0.77459666924148337704, ...
    -0.75748396638051363793, ...
    -0.73975604435269475868, ...
    -0.72142308537009891548, ...
    -0.70249620649152707861, ...
    -0.68298743109107922809, ...
    -0.66290966002478059546, ...
    -0.64227664250975951377, ...
    -0.62110294673722640294, ...
    -0.59940393024224289297, ...
    -0.57719571005204581484, ...
    -0.55449513263193254887, ...
    -0.53131974364437562397, ...
    -0.50768775753371660215, ...
    -0.48361802694584102756, ...
    -0.45913001198983233287, ...
    -0.43424374934680255800, ...
    -0.40897982122988867241, ...
    -0.38335932419873034692, ...
    -0.35740383783153215238, ...
    -0.33113539325797683309, ...
    -0.30457644155671404334, ...
    -0.27774982202182431507, ...
    -0.25067873030348317661, ...
    -0.22338668642896688163, ...
    -0.19589750271110015392, ...
    -0.16823525155220746498, ...
    -0.14042423315256017459, ...
    -0.11248894313318662575, ...
    -0.084454040083710883710, ...
    -0.056344313046592789972, ...
    -0.028184648949745694339, ...
     0.0, ...
     0.028184648949745694339, ...
     0.056344313046592789972, ...
     0.084454040083710883710, ...
     0.11248894313318662575, ...
     0.14042423315256017459, ...
     0.16823525155220746498, ...
     0.19589750271110015392, ...
     0.22338668642896688163, ...
     0.25067873030348317661, ...
     0.27774982202182431507, ...
     0.30457644155671404334, ...
     0.33113539325797683309, ...
     0.35740383783153215238, ...
     0.38335932419873034692, ...
     0.40897982122988867241, ...
     0.43424374934680255800, ...
     0.45913001198983233287, ...
     0.48361802694584102756, ...
     0.50768775753371660215, ...
     0.53131974364437562397, ...
     0.55449513263193254887, ...
     0.57719571005204581484, ...
     0.59940393024224289297, ...
     0.62110294673722640294, ...
     0.64227664250975951377, ...
     0.66290966002478059546, ...
     0.68298743109107922809, ...
     0.70249620649152707861, ...
     0.72142308537009891548, ...
     0.73975604435269475868, ...
     0.75748396638051363793, ...
     0.77459666924148337704, ...
     0.79108493379984836143, ...
     0.80694053195021761186, ...
     0.82215625436498040737, ...
     0.83672593816886873550, ...
     0.85064449476835027976, ...
     0.86390793819369047715, ...
     0.87651341448470526974, ...
     0.88845923287225699889, ...
     0.89974489977694003664, ...
     0.91037115695700429250, ...
     0.92034002547001242073, ...
     0.92965485742974005667, ...
     0.93832039777959288365, ...
     0.94634285837340290515, ...
     0.95373000642576113641, ...
     0.96049126870802028342, ...
     0.96663785155841656709, ...
     0.97218287474858179658, ...
     0.97714151463970571416, ...
     0.98153114955374010687, ...
     0.98537149959852037111, ...
     0.98868475754742947994, ...
     0.99149572117810613240, ...
     0.99383196321275502221, ...
     0.99572410469840718851, ...
     0.99720625937222195908, ...
     0.99831663531840739253, ...
     0.99909812496766759766, ...
     0.99959879967191068325, ...
     0.99987288812035761194, ...
     0.99998243035489159858, ...
    -0.99999759637974846462, ...
    -0.99998243035489159858, ...
    -0.99994399620705437576, ...
    -0.99987288812035761194, ...
    -0.99976049092443204733, ...
    -0.99959879967191068325, ...
    -0.99938033802502358193, ...
    -0.99909812496766759766, ...
    -0.99874561446809511470, ...
    -0.99831663531840739253, ...
    -0.99780535449595727456, ...
    -0.99720625937222195908, ...
    -0.99651414591489027385, ...
    -0.99572410469840718851, ...
    -0.99483150280062100052, ...
    -0.99383196321275502221, ...
    -0.99272134428278861533, ...
    -0.99149572117810613240, ...
    -0.99015137040077015918, ...
    -0.98868475754742947994, ...
    -0.98709252795403406719, ...
    -0.98537149959852037111, ...
    -0.98351865757863272876, ...
    -0.98153114955374010687, ...
    -0.97940628167086268381, ...
    -0.97714151463970571416, ...
    -0.97473445975240266776, ...
    -0.97218287474858179658, ...
    -0.96948465950245923177, ...
    -0.96663785155841656709, ...
    -0.96364062156981213252, ...
    -0.96049126870802028342, ...
    -0.95718821610986096274, ...
    -0.95373000642576113641, ...
    -0.95011529752129487656, ...
    -0.94634285837340290515, ...
    -0.94241156519108305981, ...
    -0.93832039777959288365, ...
    -0.93406843615772578800, ...
    -0.92965485742974005667, ...
    -0.92507893290707565236, ...
    -0.92034002547001242073, ...
    -0.91543758715576504064, ...
    -0.91037115695700429250, ...
    -0.90514035881326159519, ...
    -0.89974489977694003664, ...
    -0.89418456833555902286, ...
    -0.88845923287225699889, ...
    -0.88256884024734190684, ...
    -0.87651341448470526974, ...
    -0.87029305554811390585, ...
    -0.86390793819369047715, ...
    -0.85735831088623215653, ...
    -0.85064449476835027976, ...
    -0.84376688267270860104, ...
    -0.83672593816886873550, ...
    -0.82952219463740140018, ...
    -0.82215625436498040737, ...
    -0.81462878765513741344, ...
    -0.80694053195021761186, ...
    -0.79909229096084140180, ...
    -0.79108493379984836143, ...
    -0.78291939411828301639, ...
    -0.77459666924148337704, ...
    -0.76611781930376009072, ...
    -0.75748396638051363793, ...
    -0.74869629361693660282, ...
    -0.73975604435269475868, ...
    -0.73066452124218126133, ...
    -0.72142308537009891548, ...
    -0.71203315536225203459, ...
    -0.70249620649152707861, ...
    -0.69281376977911470289, ...
    -0.68298743109107922809, ...
    -0.67301883023041847920, ...
    -0.66290966002478059546, ...
    -0.65266166541001749610, ...
    -0.64227664250975951377, ...
    -0.63175643771119423041, ...
    -0.62110294673722640294, ...
    -0.61031811371518640016, ...
    -0.59940393024224289297, ...
    -0.58836243444766254143, ...
    -0.57719571005204581484, ...
    -0.56590588542365442262, ...
    -0.55449513263193254887, ...
    -0.54296566649831149049, ...
    -0.53131974364437562397, ...
    -0.51955966153745702199, ...
    -0.50768775753371660215, ...
    -0.49570640791876146017, ...
    -0.48361802694584102756, ...
    -0.47142506587165887693, ...
    -0.45913001198983233287, ...
    -0.44673538766202847374, ...
    -0.43424374934680255800, ...
    -0.42165768662616330006, ...
    -0.40897982122988867241, ...
    -0.39621280605761593918, ...
    -0.38335932419873034692, ...
    -0.37042208795007823014, ...
    -0.35740383783153215238, ...
    -0.34430734159943802278, ...
    -0.33113539325797683309, ...
    -0.31789081206847668318, ...
    -0.30457644155671404334, ...
    -0.29119514851824668196, ...
    -0.27774982202182431507, ...
    -0.26424337241092676194, ...
    -0.25067873030348317661, ...
    -0.23705884558982972721, ...
    -0.22338668642896688163, ...
    -0.20966523824318119477, ...
    -0.19589750271110015392, ...
    -0.18208649675925219825, ...
    -0.16823525155220746498, ...
    -0.15434681148137810869, ...
    -0.14042423315256017459, ...
    -0.12647058437230196685, ...
    -0.11248894313318662575, ...
    -0.098482396598119202090, ...
    -0.084454040083710883710, ...
    -0.070406976042855179063, ...
    -0.056344313046592789972, ...
    -0.042269164765363603212, ...
    -0.028184648949745694339, ...
    -0.014093886410782462614, ...
    0.0, ...
    0.014093886410782462614, ...
    0.028184648949745694339, ...
    0.042269164765363603212, ...
    0.056344313046592789972, ...
    0.070406976042855179063, ...
    0.084454040083710883710, ...
    0.098482396598119202090, ...
    0.11248894313318662575, ...
    0.12647058437230196685, ...
    0.14042423315256017459, ...
    0.15434681148137810869, ...
    0.16823525155220746498, ...
    0.18208649675925219825, ...
    0.19589750271110015392, ...
    0.20966523824318119477, ...
    0.22338668642896688163, ...
    0.23705884558982972721, ...
    0.25067873030348317661, ...
    0.26424337241092676194, ...
    0.27774982202182431507, ...
    0.29119514851824668196, ...
    0.30457644155671404334, ...
    0.31789081206847668318, ...
    0.33113539325797683309, ...
    0.34430734159943802278, ...
    0.35740383783153215238, ...
    0.37042208795007823014, ...
    0.38335932419873034692, ...
    0.39621280605761593918, ...
    0.40897982122988867241, ...
    0.42165768662616330006, ...
    0.43424374934680255800, ...
    0.44673538766202847374, ...
    0.45913001198983233287, ...
    0.47142506587165887693, ...
    0.48361802694584102756, ...
    0.49570640791876146017, ...
    0.50768775753371660215, ...
    0.51955966153745702199, ...
    0.53131974364437562397, ...
    0.54296566649831149049, ...
    0.55449513263193254887, ...
    0.56590588542365442262, ...
    0.57719571005204581484, ...
    0.58836243444766254143, ...
    0.59940393024224289297, ...
    0.61031811371518640016, ...
    0.62110294673722640294, ...
    0.63175643771119423041, ...
    0.64227664250975951377, ...
    0.65266166541001749610, ...
    0.66290966002478059546, ...
    0.67301883023041847920, ...
    0.68298743109107922809, ...
    0.69281376977911470289, ...
    0.70249620649152707861, ...
    0.71203315536225203459, ...
    0.72142308537009891548, ...
    0.73066452124218126133, ...
    0.73975604435269475868, ...
    0.74869629361693660282, ...
    0.75748396638051363793, ...
    0.76611781930376009072, ...
    0.77459666924148337704, ...
    0.78291939411828301639, ...
    0.79108493379984836143, ...
    0.79909229096084140180, ...
    0.80694053195021761186, ...
    0.81462878765513741344, ...
    0.82215625436498040737, ...
    0.82952219463740140018, ...
    0.83672593816886873550, ...
    0.84376688267270860104, ...
    0.85064449476835027976, ...
    0.85735831088623215653, ...
    0.86390793819369047715, ...
    0.87029305554811390585, ...
    0.87651341448470526974, ...
    0.88256884024734190684, ...
    0.88845923287225699889, ...
    0.89418456833555902286, ...
    0.89974489977694003664, ...
    0.90514035881326159519, ...
    0.91037115695700429250, ...
    0.91543758715576504064, ...
    0.92034002547001242073, ...
    0.92507893290707565236, ...
    0.92965485742974005667, ...
    0.93406843615772578800, ...
    0.93832039777959288365, ...
    0.94241156519108305981, ...
    0.94634285837340290515, ...
    0.95011529752129487656, ...
    0.95373000642576113641, ...
    0.95718821610986096274, ...
    0.96049126870802028342, ...
    0.96364062156981213252, ...
    0.96663785155841656709, ...
    0.96948465950245923177, ...
    0.97218287474858179658, ...
    0.97473445975240266776, ...
    0.97714151463970571416, ...
    0.97940628167086268381, ...
    0.98153114955374010687, ...
    0.98351865757863272876, ...
    0.98537149959852037111, ...
    0.98709252795403406719, ...
    0.98868475754742947994, ...
    0.99015137040077015918, ...
    0.99149572117810613240, ...
    0.99272134428278861533, ...
    0.99383196321275502221, ...
    0.99483150280062100052, ...
    0.99572410469840718851, ...
    0.99651414591489027385, ...
    0.99720625937222195908, ...
    0.99780535449595727456, ...
    0.99831663531840739253, ...
    0.99874561446809511470, ...
    0.99909812496766759766, ...
    0.99938033802502358193, ...
    0.99959879967191068325, ...
    0.99976049092443204733, ...
    0.99987288812035761194, ...
    0.99994399620705437576, ...
    0.99998243035489159858, ...
    0.99999759637974846462 ];

  if ( i < 1 | order < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GP_ABSCISSA - Fatal error!\n' );
    fprintf ( 1, '  I < 1 or ORDER < I.\n' );
    fprintf ( 1, '  I = %d\n', i );
    fprintf ( 1, '  ORDER = %d\n', order );
    error ( 'GP_ABSCISSA - Fatal error!' );
  end
%
%  Assuming ORDER is one of the expected values, this
%  will retrieve the value of LEVEL.
%
  level = 0;
  j = floor ( ( order + 1 ) / 2 );

  while ( 1 < j )
    level = level + 1;
    j = floor ( j / 2 );
  end

  j = order_pointer(level+1) + i;

  value = xtab(j);

  return
end
function w = gp_weights ( order )

%*****************************************************************************80
%
%% GP_WEIGHTS sets weights for a Patterson rule.
%
%  Discussion:
%
%    The zeroth rule, of order 1, is the standard Gauss-Legendre rule.
%
%    The first rule, of order 3, is the standard Gauss-Legendre rule.
%
%    The second rule, of order 7, includes the abscissas of the previous
%    rule.
%
%    Each subsequent rule is nested in a similar way.  Rules are available
%    of orders 1, 3, 7, 15, 31, 63, 127 and 255.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Prem Kythe, Michael Schaeferkotter,
%    Handbook of Computational Methods for Integration,
%    Chapman and Hall, 2004,
%    ISBN: 1-58488-428-2,
%    LC: QA299.3.K98.
%
%    Thomas Patterson,
%    The Optimal Addition of Points to Quadrature Formulae,
%    Mathematics of Computation,
%    Volume 22, Number 104, October 1968, pages 847-856.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%    ORDER must be 1, 3, 7, 15, 31, 63, 127 or 255.
%
%    Output, real W(ORDER), the weights of the rule.
%    The weights are positive, symmetric and should sum to 2.
%
  if ( order == 1 )

    w(1) = 2.0;

  elseif ( order == 3 )

    w(1) = 0.555555555555555555556;
    w(2) = 0.888888888888888888889;
    w(3) = 0.555555555555555555556;

  elseif ( order == 7 )

    w(1) = 0.104656226026467265194;
    w(2) = 0.268488089868333440729;
    w(3) = 0.401397414775962222905;
    w(4) = 0.450916538658474142345;
    w(5) = 0.401397414775962222905;
    w(6) = 0.268488089868333440729;
    w(7) = 0.104656226026467265194;

  elseif ( order == 15 )

    w( 1) = 0.0170017196299402603390;
    w( 2) = 0.0516032829970797396969;
    w( 3) = 0.0929271953151245376859;
    w( 4) = 0.134415255243784220360;
    w( 5) = 0.171511909136391380787;
    w( 6) = 0.200628529376989021034;
    w( 7) = 0.219156858401587496404;
    w( 8) = 0.225510499798206687386;
    w( 9) = 0.219156858401587496404;
    w(10) = 0.200628529376989021034;
    w(11) = 0.171511909136391380787;
    w(12) = 0.134415255243784220360;
    w(13) = 0.0929271953151245376859;
    w(14) = 0.0516032829970797396969;
    w(15) = 0.0170017196299402603390;

  elseif ( order == 31 )

    w( 1) = 0.00254478079156187441540;
    w( 2) = 0.00843456573932110624631;
    w( 3) = 0.0164460498543878109338;
    w( 4) = 0.0258075980961766535646;
    w( 5) = 0.0359571033071293220968;
    w( 6) = 0.0464628932617579865414;
    w( 7) = 0.0569795094941233574122;
    w( 8) = 0.0672077542959907035404;
    w( 9) = 0.0768796204990035310427;
    w(10) = 0.0857559200499903511542;
    w(11) = 0.0936271099812644736167;
    w(12) = 0.100314278611795578771;
    w(13) = 0.105669893580234809744;
    w(14) = 0.109578421055924638237;
    w(15) = 0.111956873020953456880;
    w(16) = 0.112755256720768691607;
    w(17) = 0.111956873020953456880;
    w(18) = 0.109578421055924638237;
    w(19) = 0.105669893580234809744;
    w(20) = 0.100314278611795578771;
    w(21) = 0.0936271099812644736167;
    w(22) = 0.0857559200499903511542;
    w(23) = 0.0768796204990035310427;
    w(24) = 0.0672077542959907035404;
    w(25) = 0.0569795094941233574122;
    w(26) = 0.0464628932617579865414;
    w(27) = 0.0359571033071293220968;
    w(28) = 0.0258075980961766535646;
    w(29) = 0.0164460498543878109338;
    w(30) = 0.00843456573932110624631;
    w(31) = 0.00254478079156187441540;

  elseif ( order == 63 )

    w( 1) = 0.000363221481845530659694;
    w( 2) = 0.00126515655623006801137;
    w( 3) = 0.00257904979468568827243;
    w( 4) = 0.00421763044155885483908;
    w( 5) = 0.00611550682211724633968;
    w( 6) = 0.00822300795723592966926;
    w( 7) = 0.0104982469096213218983;
    w( 8) = 0.0129038001003512656260;
    w( 9) = 0.0154067504665594978021;
    w(10) = 0.0179785515681282703329;
    w(11) = 0.0205942339159127111492;
    w(12) = 0.0232314466399102694433;
    w(13) = 0.0258696793272147469108;
    w(14) = 0.0284897547458335486125;
    w(15) = 0.0310735511116879648799;
    w(16) = 0.0336038771482077305417;
    w(17) = 0.0360644327807825726401;
    w(18) = 0.0384398102494555320386;
    w(19) = 0.0407155101169443189339;
    w(20) = 0.0428779600250077344929;
    w(21) = 0.0449145316536321974143;
    w(22) = 0.0468135549906280124026;
    w(23) = 0.0485643304066731987159;
    w(24) = 0.0501571393058995374137;
    w(25) = 0.0515832539520484587768;
    w(26) = 0.0528349467901165198621;
    w(27) = 0.0539054993352660639269;
    w(28) = 0.0547892105279628650322;
    w(29) = 0.0554814043565593639878;
    w(30) = 0.0559784365104763194076;
    w(31) = 0.0562776998312543012726;
    w(32) = 0.0563776283603847173877;
    w(33) = 0.0562776998312543012726;
    w(34) = 0.0559784365104763194076;
    w(35) = 0.0554814043565593639878;
    w(36) = 0.0547892105279628650322;
    w(37) = 0.0539054993352660639269;
    w(38) = 0.0528349467901165198621;
    w(39) = 0.0515832539520484587768;
    w(40) = 0.0501571393058995374137;
    w(41) = 0.0485643304066731987159;
    w(42) = 0.0468135549906280124026;
    w(43) = 0.0449145316536321974143;
    w(44) = 0.0428779600250077344929;
    w(45) = 0.0407155101169443189339;
    w(46) = 0.0384398102494555320386;
    w(47) = 0.0360644327807825726401;
    w(48) = 0.0336038771482077305417;
    w(49) = 0.0310735511116879648799;
    w(50) = 0.0284897547458335486125;
    w(51) = 0.0258696793272147469108;
    w(52) = 0.0232314466399102694433;
    w(53) = 0.0205942339159127111492;
    w(54) = 0.0179785515681282703329;
    w(55) = 0.0154067504665594978021;
    w(56) = 0.0129038001003512656260;
    w(57) = 0.0104982469096213218983;
    w(58) = 0.00822300795723592966926;
    w(59) = 0.00611550682211724633968;
    w(60) = 0.00421763044155885483908;
    w(61) = 0.00257904979468568827243;
    w(62) = 0.00126515655623006801137;
    w(63) = 0.000363221481845530659694;

  elseif ( order == 127 )

    w(  1) = 0.0000505360952078625176247;
    w(  2) = 0.000180739564445388357820;
    w(  3) = 0.000377746646326984660274;
    w(  4) = 0.000632607319362633544219;
    w(  5) = 0.000938369848542381500794;
    w(  6) = 0.00128952408261041739210;
    w(  7) = 0.00168114286542146990631;
    w(  8) = 0.00210881524572663287933;
    w(  9) = 0.00256876494379402037313;
    w( 10) = 0.00305775341017553113613;
    w( 11) = 0.00357289278351729964938;
    w( 12) = 0.00411150397865469304717;
    w( 13) = 0.00467105037211432174741;
    w( 14) = 0.00524912345480885912513;
    w( 15) = 0.00584344987583563950756;
    w( 16) = 0.00645190005017573692280;
    w( 17) = 0.00707248999543355546805;
    w( 18) = 0.00770337523327974184817;
    w( 19) = 0.00834283875396815770558;
    w( 20) = 0.00898927578406413572328;
    w( 21) = 0.00964117772970253669530;
    w( 22) = 0.0102971169579563555237;
    w( 23) = 0.0109557333878379016480;
    w( 24) = 0.0116157233199551347270;
    w( 25) = 0.0122758305600827700870;
    w( 26) = 0.0129348396636073734547;
    w( 27) = 0.0135915710097655467896;
    w( 28) = 0.0142448773729167743063;
    w( 29) = 0.0148936416648151820348;
    w( 30) = 0.0155367755558439824399;
    w( 31) = 0.0161732187295777199419;
    w( 32) = 0.0168019385741038652709;
    w( 33) = 0.0174219301594641737472;
    w( 34) = 0.0180322163903912863201;
    w( 35) = 0.0186318482561387901863;
    w( 36) = 0.0192199051247277660193;
    w( 37) = 0.0197954950480974994880;
    w( 38) = 0.0203577550584721594669;
    w( 39) = 0.0209058514458120238522;
    w( 40) = 0.0214389800125038672465;
    w( 41) = 0.0219563663053178249393;
    w( 42) = 0.0224572658268160987071;
    w( 43) = 0.0229409642293877487608;
    w( 44) = 0.0234067774953140062013;
    w( 45) = 0.0238540521060385400804;
    w( 46) = 0.0242821652033365993580;
    w( 47) = 0.0246905247444876769091;
    w( 48) = 0.0250785696529497687068;
    w( 49) = 0.0254457699654647658126;
    w( 50) = 0.0257916269760242293884;
    w( 51) = 0.0261156733767060976805;
    w( 52) = 0.0264174733950582599310;
    w( 53) = 0.0266966229274503599062;
    w( 54) = 0.0269527496676330319634;
    w( 55) = 0.0271855132296247918192;
    w( 56) = 0.0273946052639814325161;
    w( 57) = 0.0275797495664818730349;
    w( 58) = 0.0277407021782796819939;
    w( 59) = 0.0278772514766137016085;
    w( 60) = 0.0279892182552381597038;
    w( 61) = 0.0280764557938172466068;
    w( 62) = 0.0281388499156271506363;
    w( 63) = 0.0281763190330166021307;
    w( 64) = 0.0281888141801923586938;
    w( 65) = 0.0281763190330166021307;
    w( 66) = 0.0281388499156271506363;
    w( 67) = 0.0280764557938172466068;
    w( 68) = 0.0279892182552381597038;
    w( 69) = 0.0278772514766137016085;
    w( 70) = 0.0277407021782796819939;
    w( 71) = 0.0275797495664818730349;
    w( 72) = 0.0273946052639814325161;
    w( 73) = 0.0271855132296247918192;
    w( 74) = 0.0269527496676330319634;
    w( 75) = 0.0266966229274503599062;
    w( 76) = 0.0264174733950582599310;
    w( 77) = 0.0261156733767060976805;
    w( 78) = 0.0257916269760242293884;
    w( 79) = 0.0254457699654647658126;
    w( 80) = 0.0250785696529497687068;
    w( 81) = 0.0246905247444876769091;
    w( 82) = 0.0242821652033365993580;
    w( 83) = 0.0238540521060385400804;
    w( 84) = 0.0234067774953140062013;
    w( 85) = 0.0229409642293877487608;
    w( 86) = 0.0224572658268160987071;
    w( 87) = 0.0219563663053178249393;
    w( 88) = 0.0214389800125038672465;
    w( 89) = 0.0209058514458120238522;
    w( 90) = 0.0203577550584721594669;
    w( 91) = 0.0197954950480974994880;
    w( 92) = 0.0192199051247277660193;
    w( 93) = 0.0186318482561387901863;
    w( 94) = 0.0180322163903912863201;
    w( 95) = 0.0174219301594641737472;
    w( 96) = 0.0168019385741038652709;
    w( 97) = 0.0161732187295777199419;
    w( 98) = 0.0155367755558439824399;
    w( 99) = 0.0148936416648151820348;
    w(100) = 0.0142448773729167743063;
    w(101) = 0.0135915710097655467896;
    w(102) = 0.0129348396636073734547;
    w(103) = 0.0122758305600827700870;
    w(104) = 0.0116157233199551347270;
    w(105) = 0.0109557333878379016480;
    w(106) = 0.0102971169579563555237;
    w(107) = 0.00964117772970253669530;
    w(108) = 0.00898927578406413572328;
    w(109) = 0.00834283875396815770558;
    w(110) = 0.00770337523327974184817;
    w(111) = 0.00707248999543355546805;
    w(112) = 0.00645190005017573692280;
    w(113) = 0.00584344987583563950756;
    w(114) = 0.00524912345480885912513;
    w(115) = 0.00467105037211432174741;
    w(116) = 0.00411150397865469304717;
    w(117) = 0.00357289278351729964938;
    w(118) = 0.00305775341017553113613;
    w(119) = 0.00256876494379402037313;
    w(120) = 0.00210881524572663287933;
    w(121) = 0.00168114286542146990631;
    w(122) = 0.00128952408261041739210;
    w(123) = 0.000938369848542381500794;
    w(124) = 0.000632607319362633544219;
    w(125) = 0.000377746646326984660274;
    w(126) = 0.000180739564445388357820;
    w(127) = 0.0000505360952078625176247;

  elseif ( order == 255 )

    w(  1) = 0.69379364324108267170E-05;
    w(  2) = 0.25157870384280661489E-04;
    w(  3) = 0.53275293669780613125E-04;
    w(  4) = 0.90372734658751149261E-04;
    w(  5) = 0.13575491094922871973E-03;
    w(  6) = 0.18887326450650491366E-03;
    w(  7) = 0.24921240048299729402E-03;
    w(  8) = 0.31630366082226447689E-03;
    w(  9) = 0.38974528447328229322E-03;
    w( 10) = 0.46918492424785040975E-03;
    w( 11) = 0.55429531493037471492E-03;
    w( 12) = 0.64476204130572477933E-03;
    w( 13) = 0.74028280424450333046E-03;
    w( 14) = 0.84057143271072246365E-03;
    w( 15) = 0.94536151685852538246E-03;
    w( 16) = 0.10544076228633167722E-02;
    w( 17) = 0.11674841174299594077E-02;
    w( 18) = 0.12843824718970101768E-02;
    w( 19) = 0.14049079956551446427E-02;
    w( 20) = 0.15288767050877655684E-02;
    w( 21) = 0.16561127281544526052E-02;
    w( 22) = 0.17864463917586498247E-02;
    w( 23) = 0.19197129710138724125E-02;
    w( 24) = 0.20557519893273465236E-02;
    w( 25) = 0.21944069253638388388E-02;
    w( 26) = 0.23355251860571608737E-02;
    w( 27) = 0.24789582266575679307E-02;
    w( 28) = 0.26245617274044295626E-02;
    w( 29) = 0.27721957645934509940E-02;
    w( 30) = 0.29217249379178197538E-02;
    w( 31) = 0.30730184347025783234E-02;
    w( 32) = 0.32259500250878684614E-02;
    w( 33) = 0.33803979910869203823E-02;
    w( 34) = 0.35362449977167777340E-02;
    w( 35) = 0.36933779170256508183E-02;
    w( 36) = 0.38516876166398709241E-02;
    w( 37) = 0.40110687240750233989E-02;
    w( 38) = 0.41714193769840788528E-02;
    w( 39) = 0.43326409680929828545E-02;
    w( 40) = 0.44946378920320678616E-02;
    w( 41) = 0.46573172997568547773E-02;
    w( 42) = 0.48205888648512683476E-02;
    w( 43) = 0.49843645647655386012E-02;
    w( 44) = 0.51485584789781777618E-02;
    w( 45) = 0.53130866051870565663E-02;
    w( 46) = 0.54778666939189508240E-02;
    w( 47) = 0.56428181013844441585E-02;
    w( 48) = 0.58078616599775673635E-02;
    w( 49) = 0.59729195655081658049E-02;
    w( 50) = 0.61379152800413850435E-02;
    w( 51) = 0.63027734490857587172E-02;
    w( 52) = 0.64674198318036867274E-02;
    w( 53) = 0.66317812429018878941E-02;
    w( 54) = 0.67957855048827733948E-02;
    w( 55) = 0.69593614093904229394E-02;
    w( 56) = 0.71224386864583871532E-02;
    w( 57) = 0.72849479805538070639E-02;
    w( 58) = 0.74468208324075910174E-02;
    w( 59) = 0.76079896657190565832E-02;
    w( 60) = 0.77683877779219912200E-02;
    w( 61) = 0.79279493342948491103E-02;
    w( 62) = 0.80866093647888599710E-02;
    w( 63) = 0.82443037630328680306E-02;
    w( 64) = 0.84009692870519326354E-02;
    w( 65) = 0.85565435613076896192E-02;
    w( 66) = 0.87109650797320868736E-02;
    w( 67) = 0.88641732094824942641E-02;
    w( 68) = 0.90161081951956431600E-02;
    w( 69) = 0.91667111635607884067E-02;
    w( 70) = 0.93159241280693950932E-02;
    w( 71) = 0.94636899938300652943E-02;
    w( 72) = 0.96099525623638830097E-02;
    w( 73) = 0.97546565363174114611E-02;
    w( 74) = 0.98977475240487497440E-02;
    w( 75) = 0.10039172044056840798E-01;
    w( 76) = 0.10178877529236079733E-01;
    w( 77) = 0.10316812330947621682E-01;
    w( 78) = 0.10452925722906011926E-01;
    w( 79) = 0.10587167904885197931E-01;
    w( 80) = 0.10719490006251933623E-01;
    w( 81) = 0.10849844089337314099E-01;
    w( 82) = 0.10978183152658912470E-01;
    w( 83) = 0.11104461134006926537E-01;
    w( 84) = 0.11228632913408049354E-01;
    w( 85) = 0.11350654315980596602E-01;
    w( 86) = 0.11470482114693874380E-01;
    w( 87) = 0.11588074033043952568E-01;
    w( 88) = 0.11703388747657003101E-01;
    w( 89) = 0.11816385890830235763E-01;
    w( 90) = 0.11927026053019270040E-01;
    w( 91) = 0.12035270785279562630E-01;
    w( 92) = 0.12141082601668299679E-01;
    w( 93) = 0.12244424981611985899E-01;
    w( 94) = 0.12345262372243838455E-01;
    w( 95) = 0.12443560190714035263E-01;
    w( 96) = 0.12539284826474884353E-01;
    w( 97) = 0.12632403643542078765E-01;
    w( 98) = 0.12722884982732382906E-01;
    w( 99) = 0.12810698163877361967E-01;
    w(100) = 0.12895813488012114694E-01;
    w(101) = 0.12978202239537399286E-01;
    w(102) = 0.13057836688353048840E-01;
    w(103) = 0.13134690091960152836E-01;
    w(104) = 0.13208736697529129966E-01;
    w(105) = 0.13279951743930530650E-01;
    w(106) = 0.13348311463725179953E-01;
    w(107) = 0.13413793085110098513E-01;
    w(108) = 0.13476374833816515982E-01;
    w(109) = 0.13536035934956213614E-01;
    w(110) = 0.13592756614812395910E-01;
    w(111) = 0.13646518102571291428E-01;
    w(112) = 0.13697302631990716258E-01;
    w(113) = 0.13745093443001896632E-01;
    w(114) = 0.13789874783240936517E-01;
    w(115) = 0.13831631909506428676E-01;
    w(116) = 0.13870351089139840997E-01;
    w(117) = 0.13906019601325461264E-01;
    w(118) = 0.13938625738306850804E-01;
    w(119) = 0.13968158806516938516E-01;
    w(120) = 0.13994609127619079852E-01;
    w(121) = 0.14017968039456608810E-01;
    w(122) = 0.14038227896908623303E-01;
    w(123) = 0.14055382072649964277E-01;
    w(124) = 0.14069424957813575318E-01;
    w(125) = 0.14080351962553661325E-01;
    w(126) = 0.14088159516508301065E-01;
    w(127) = 0.14092845069160408355E-01;
    w(128) = 0.14094407090096179347E-01;
    w(129) = 0.14092845069160408355E-01;
    w(130) = 0.14088159516508301065E-01;
    w(131) = 0.14080351962553661325E-01;
    w(132) = 0.14069424957813575318E-01;
    w(133) = 0.14055382072649964277E-01;
    w(134) = 0.14038227896908623303E-01;
    w(135) = 0.14017968039456608810E-01;
    w(136) = 0.13994609127619079852E-01;
    w(137) = 0.13968158806516938516E-01;
    w(138) = 0.13938625738306850804E-01;
    w(139) = 0.13906019601325461264E-01;
    w(140) = 0.13870351089139840997E-01;
    w(141) = 0.13831631909506428676E-01;
    w(142) = 0.13789874783240936517E-01;
    w(143) = 0.13745093443001896632E-01;
    w(144) = 0.13697302631990716258E-01;
    w(145) = 0.13646518102571291428E-01;
    w(146) = 0.13592756614812395910E-01;
    w(147) = 0.13536035934956213614E-01;
    w(148) = 0.13476374833816515982E-01;
    w(149) = 0.13413793085110098513E-01;
    w(150) = 0.13348311463725179953E-01;
    w(151) = 0.13279951743930530650E-01;
    w(152) = 0.13208736697529129966E-01;
    w(153) = 0.13134690091960152836E-01;
    w(154) = 0.13057836688353048840E-01;
    w(155) = 0.12978202239537399286E-01;
    w(156) = 0.12895813488012114694E-01;
    w(157) = 0.12810698163877361967E-01;
    w(158) = 0.12722884982732382906E-01;
    w(159) = 0.12632403643542078765E-01;
    w(160) = 0.12539284826474884353E-01;
    w(161) = 0.12443560190714035263E-01;
    w(162) = 0.12345262372243838455E-01;
    w(163) = 0.12244424981611985899E-01;
    w(164) = 0.12141082601668299679E-01;
    w(165) = 0.12035270785279562630E-01;
    w(166) = 0.11927026053019270040E-01;
    w(167) = 0.11816385890830235763E-01;
    w(168) = 0.11703388747657003101E-01;
    w(169) = 0.11588074033043952568E-01;
    w(170) = 0.11470482114693874380E-01;
    w(171) = 0.11350654315980596602E-01;
    w(172) = 0.11228632913408049354E-01;
    w(173) = 0.11104461134006926537E-01;
    w(174) = 0.10978183152658912470E-01;
    w(175) = 0.10849844089337314099E-01;
    w(176) = 0.10719490006251933623E-01;
    w(177) = 0.10587167904885197931E-01;
    w(178) = 0.10452925722906011926E-01;
    w(179) = 0.10316812330947621682E-01;
    w(180) = 0.10178877529236079733E-01;
    w(181) = 0.10039172044056840798E-01;
    w(182) = 0.98977475240487497440E-02;
    w(183) = 0.97546565363174114611E-02;
    w(184) = 0.96099525623638830097E-02;
    w(185) = 0.94636899938300652943E-02;
    w(186) = 0.93159241280693950932E-02;
    w(187) = 0.91667111635607884067E-02;
    w(188) = 0.90161081951956431600E-02;
    w(189) = 0.88641732094824942641E-02;
    w(190) = 0.87109650797320868736E-02;
    w(191) = 0.85565435613076896192E-02;
    w(192) = 0.84009692870519326354E-02;
    w(193) = 0.82443037630328680306E-02;
    w(194) = 0.80866093647888599710E-02;
    w(195) = 0.79279493342948491103E-02;
    w(196) = 0.77683877779219912200E-02;
    w(197) = 0.76079896657190565832E-02;
    w(198) = 0.74468208324075910174E-02;
    w(199) = 0.72849479805538070639E-02;
    w(200) = 0.71224386864583871532E-02;
    w(201) = 0.69593614093904229394E-02;
    w(202) = 0.67957855048827733948E-02;
    w(203) = 0.66317812429018878941E-02;
    w(204) = 0.64674198318036867274E-02;
    w(205) = 0.63027734490857587172E-02;
    w(206) = 0.61379152800413850435E-02;
    w(207) = 0.59729195655081658049E-02;
    w(208) = 0.58078616599775673635E-02;
    w(209) = 0.56428181013844441585E-02;
    w(210) = 0.54778666939189508240E-02;
    w(211) = 0.53130866051870565663E-02;
    w(212) = 0.51485584789781777618E-02;
    w(213) = 0.49843645647655386012E-02;
    w(214) = 0.48205888648512683476E-02;
    w(215) = 0.46573172997568547773E-02;
    w(216) = 0.44946378920320678616E-02;
    w(217) = 0.43326409680929828545E-02;
    w(218) = 0.41714193769840788528E-02;
    w(219) = 0.40110687240750233989E-02;
    w(220) = 0.38516876166398709241E-02;
    w(221) = 0.36933779170256508183E-02;
    w(222) = 0.35362449977167777340E-02;
    w(223) = 0.33803979910869203823E-02;
    w(224) = 0.32259500250878684614E-02;
    w(225) = 0.30730184347025783234E-02;
    w(226) = 0.29217249379178197538E-02;
    w(227) = 0.27721957645934509940E-02;
    w(228) = 0.26245617274044295626E-02;
    w(229) = 0.24789582266575679307E-02;
    w(230) = 0.23355251860571608737E-02;
    w(231) = 0.21944069253638388388E-02;
    w(232) = 0.20557519893273465236E-02;
    w(233) = 0.19197129710138724125E-02;
    w(234) = 0.17864463917586498247E-02;
    w(235) = 0.16561127281544526052E-02;
    w(236) = 0.15288767050877655684E-02;
    w(237) = 0.14049079956551446427E-02;
    w(238) = 0.12843824718970101768E-02;
    w(239) = 0.11674841174299594077E-02;
    w(240) = 0.10544076228633167722E-02;
    w(241) = 0.94536151685852538246E-03;
    w(242) = 0.84057143271072246365E-03;
    w(243) = 0.74028280424450333046E-03;
    w(244) = 0.64476204130572477933E-03;
    w(245) = 0.55429531493037471492E-03;
    w(246) = 0.46918492424785040975E-03;
    w(247) = 0.38974528447328229322E-03;
    w(248) = 0.31630366082226447689E-03;
    w(249) = 0.24921240048299729402E-03;
    w(250) = 0.18887326450650491366E-03;
    w(251) = 0.13575491094922871973E-03;
    w(252) = 0.90372734658751149261E-04;
    w(253) = 0.53275293669780613125E-04;
    w(254) = 0.25157870384280661489E-04;
    w(255) = 0.69379364324108267170E-05;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'GP_WEIGHTS - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of ORDER.\n' );
    fprintf ( 1, '  Order must be 1, 3, 7, 15, 31, 63, 127 or 255.\n' );
    error ( 'GP_WEIGHTS - Fatal error!' )

  end

  return
end
function value = i4_choose ( n, k )

%*****************************************************************************80
%
%% I4_CHOOSE computes the binomial coefficient C(N,K).
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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2007
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
function value = i4_modp ( i, j )

%*****************************************************************************80
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
function i4mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% I4MAT_TRANSPOSE_PRINT_SOME prints some of an I4MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, an optional title.
%
  incx = 10;

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
      fprintf ( 1, '%7d  ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );
    fprintf ( 1, '\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d  ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%7d  ', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
function value = index_to_level_open ( dim_num, t, order, level_max )

%*****************************************************************************80
%
%% INDEX_TO_LEVEL_OPEN determines the level of a point given its index.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2007
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
%    Input, integer T(DIM_NUM), the grid index of a point.
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

    s = round ( t(dim) );

    s = i4_modp ( t, order );

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
function order = level_to_order_open ( dim_num, level )

%*****************************************************************************80
%
%% LEVEL_TO_ORDER converts a level to an order for open rules.
%
%  Discussion:
%
%    Sparse grids can naturally be nested.  A natural scheme is to use
%    a series of one-dimensional rules arranged in a series of "levels"
%    whose order roughly doubles with each step.
%
%    The arrangement described here works naturally for the 
%    Fejer Type 2, Newton Cotes Open, 
%    and Gauss-Patterson rules.  It also can be used, partially, to describe
%    the growth of Gauss-Legendre rules.
%
%    The idea is that we start with LEVEL = 0, ORDER = 1 indicating the single 
%    point at the center, and for all values afterwards, we use the relationship
%
%      ORDER = 2**(LEVEL+1) - 1.
%
%    The following table shows how the growth will occur:
%
%    Level    Order
%
%    0          1
%    1          3 =  4 - 1
%    2          7 =  8 - 1
%    3         15 = 16 - 1
%    4         31 = 32 - 1
%    5         63 = 64 - 1
%
%    For the Fejer Type 2, Newton Cotes Open, 
%    and Gauss-Patterson rules, the point growth is
%    nested.  If we have ORDER points on a particular LEVEL, the next level 
%    includes all these old points, plus ORDER+1 new points, formed in the 
%    gaps between successive pairs of old points plus an extra point at each 
%    end.
%
%    Level    Order = New + Old
%
%    0          1   =  1  +  0
%    1          3   =  2  +  1
%    2          7   =  4  +  3
%    3         15   =  8  +  7
%    4         31   = 16  + 15
%    5         63   = 32  + 31
%
%    If we use a series of Gauss-Legendre rules, then there is almost no 
%    nesting, except that the central point is shared.  If we insist on 
%    producing a comparable series of such points, then the "nesting" behavior
%    is as follows:
%
%    Level    Order = New + Old
%
%    0          1   =  1  +  0
%    1          3   =  2  +  1
%    2          7   =  6  +  1
%    3         15   = 14  +  1
%    4         31   = 30  +  1
%    5         63   = 62  +  1
%
%    Moreover, if we consider ALL the points used in such a set of "nested" 
%    Gauss-Legendre rules, then we must sum the "NEW" column, and we see that
%    we get roughly twice as many points as for the truly nested rules.
%
%    In this routine, we assume that a vector of levels is given,
%    and the corresponding orders are desired.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2007
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
  for dim = 1 : dim_num

    if ( level(dim) < 0 )
      order(dim) = -1;
    elseif ( level(dim) == 0 )
      order(dim) = 1;
    else
      order(dim) = 2^( level(dim) + 1 ) - 1;
    end

  end

  return
end
function indx = multigrid_index1 ( dim_num, order_1d, order_nd )

%*****************************************************************************80
%
%% MULTIGRID_INDEX1 returns an indexed multidimensional grid.
%
%  Discussion:
%
%    For dimension DIM, the second index of INDX may vary from 
%    1 to ORDER_1D(DIM).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 May 2007
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

    indx(1:dim_num,p) = a(1:dim_num)' + 1;

  end

  return
end
function grid_index = multigrid_scale_open ( dim_num, order_nd, level_max, ...
  level_1d, grid_index )

%*****************************************************************************80
%
%% MULTIGRID_SCALE_OPEN renumbers a grid as a subgrid on a higher level.
%
%  Discussion:
%
%    This routine takes a grid associated with a given value of
%    LEVEL, and multiplies all the indices by a power of 2, so that
%    the indices reflect the position of the same points, but in
%    a grid of level LEVEL_MAX.
%
%    For an open grid, going from one level to the next, a set of indices
%    will be rescaled by 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2007
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

    factor = 2^( level_max - level_1d(dim) );

    grid_index(dim,1:order_nd) = grid_index(dim,1:order_nd) * factor;

  end

  return
end
function value = nco_abscissa ( order, i )

%*****************************************************************************80
%
%% NCO_ABSCISSA returns the I-th abscissa for the Newton Cotes open rule.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to
%    right.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%    1 <= ORDER.
%
%    Input, integer I, the index of the desired abscissa.  
%    1 <= I <= ORDER.
%
%    Output, real VALUE, the value of the I-th 
%    abscissa in the Newton Cotes open rule of order ORDER.
%
  x_min = -1.0;
  x_max = +1.0;

  if ( order < 1 )
    value = - Inf;
    return
  end

  if ( i < 1 | order < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NCO_ABSCISSA - Fatal error!\n' );
    fprintf ( 1, '  1 <= I <= ORDER is required.\n' );
    error ( 'NCO_ABSCISSA - Fatal error!' );
  end

  value = ( ( order - i + 1 ) * x_min   ...
          + (         i     ) * x_max ) ...
          / ( order     + 1 );
 
  return
end
function w = nco_weights ( order )

%*****************************************************************************80
%
%% NCO_WEIGHTS computes weights for a Newton-Cotes Open rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Output, real W(ORDER), the weights of the rule.
%
  x_max = +1.0;
  x_min = -1.0;

  for i = 1 : order
    x(i) = ( ( order + 1 - i ) * x_min   ...
           + (             i ) * x_max ) ...
           / ( order + 1     );
  end

  for i = 1 : order
%
%  Compute the Lagrange basis polynomial which is 1 at X(I),
%  and zero at the other nodes.
%
    diftab(1:order) = 0.0;
    diftab(i) = 1.0;

    for j = 2 : order
      for k = j : order
        diftab(order+j-k) = ( diftab(order+j-k-1) - diftab(order+j-k) ) ...
          / ( x(order+1-k) - x(order+j-k) );
      end
    end

    for j = 1 : order-1
      for k = 1 : order-j
        diftab(order-k) = diftab(order-k) - x(order-k-j+1) ...
          * diftab(order-k+1);
      end
    end
%
%  Evaluate the antiderivative of the polynomial at the left and
%  right endpoints.
%
    yvala = diftab(order) / order;
    for j = order-1 : -1 : 1
      yvala = yvala * x_min + diftab(j) / j;
    end
    yvala = yvala * x_min;

    yvalb = diftab(order) / order;
    for j = order-1 : -1 : 1
      yvalb = yvalb * x_max + diftab(j) / j;
    end
    yvalb = yvalb * x_max;

    w(i) = yvalb - yvala;

  end

  return
end
function w_nd = product_weights_open ( dim_num, order_1d, order_nd, rule )

%*****************************************************************************80
%
%% PRODUCT_WEIGHTS_OPEN: product rule weights.
%
%  Discussion:
%
%    This routine computes the weights for a quadrature rule which is
%    a product of 1D open rules of varying order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 May 2007
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
%    Input, integer RULE, the index of the rule.
%    2, Fejer Type 2 Rule;
%    3, Gauss-Patterson Rule,
%    4, Newton-Cotes Open Rule,
%
%    Output, real W_ND(DIM_NUM,ORDER_ND), the product rule weights.
%
  w_nd(1:order_nd) = 1.0;

  for dim = 1 : dim_num

    if ( rule == 2 )
      w_1d = f2_weights ( order_1d(dim) );
    elseif ( rule == 3 )
      w_1d = gp_weights ( order_1d(dim) );
    elseif ( rule == 4 )
      w_1d = nco_weights ( order_1d(dim) );
    elseif ( rule == 5 )
      w_1d = ts_weights ( order_1d(dim) );
    end

    w_nd = r8vec_direct_product2 ( dim, order_1d(dim), w_1d, dim_num, ...
      order_nd, w_nd );
 
  end

  return
end
function r8mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
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
function w = r8vec_direct_product2 ( factor_index, factor_order, ...
  factor_value, factor_num, point_num, w )

%*****************************************************************************80
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

%*****************************************************************************80
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

%*****************************************************************************80
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
function point_num = sparse_grid_ofn_size ( dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_OFN_SIZE sizes a sparse grid using Open Fully Nested rules.
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
%    23 December 2009
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

  for l = 1 : level_max
    new_1d(l+1) = 2 * new_1d(l);
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
function grid_index = spgrid_open_index ( dim_num, level_max, point_num )

%*****************************************************************************80
%
%% SPGRID_OPEN_INDEX computes open grids with 0 <= LEVEL <= LEVEL_MAX.
%
%  Discussion:
%
%    The necessary dimensions of GRID_INDEX can be determined by 
%    calling SPGRID_OPEN_SIZE first.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 July 2008
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
      order_1d = level_to_order_open ( dim_num, level_1d );
%
%  The product of the 1D orders gives us the number of points in this grid.
%
      order_nd = prod ( order_1d(1:dim_num) );
%
%  The inner (hidden) loop generates all points corresponding to given grid.
%
      grid_index2 = multigrid_index1 ( dim_num, order_1d, order_nd );
%
%  Only keep those points which first appear on this level.
%  If you keep a point, it is necessary to rescale each of its components
%  so that we save the coordinates as they apply on the final grid.
%
      for point = 1 : order_nd

        if ( all ( mod ( grid_index2(1:dim_num,point), 2 ) == 1 ) )

          point_num2 = point_num2 + 1;

          for dim = 1 : dim_num
            grid_index(dim,point_num2) = ...
              2^( level_max - level_1d(dim) ) * grid_index2(dim,point);
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
function grid_weight = spgrid_open_weights ( dim_num, level_max, point_num, ...
  rule, grid_index )

%*****************************************************************************80
%
%% SPGRID_OPEN_WEIGHTS gathers the weights.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 July 2008
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
%    Input, integer RULE, the index of the rule.
%    2, Fejer Type 2 Rule;
%    3, Gauss-Patterson Rule,
%    4, Newton-Cotes Open Rule,
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
      order_1d = level_to_order_open ( dim_num, level_1d );
%
%  The product of the 1D orders gives us the number of points in this grid.
%
      order_nd = prod ( order_1d(1:dim_num) );
%
%  Generate the indices of the points corresponding to the grid.
%
      grid_index2 = multigrid_index1 ( dim_num, order_1d, order_nd );
%
%  Compute the weights for this grid.
%
      grid_weight2 = product_weights_open ( dim_num, order_1d, order_nd, ...
        rule );
%
%  Adjust the grid indices to reflect LEVEL_MAX.
%
      grid_index2 = multigrid_scale_open ( dim_num, order_nd, level_max, ...
        level_1d, grid_index2 );
%
%  Now determine the coefficient.
%
      coeff = (-1)^( level_max - level ) ...
        * i4_choose ( dim_num - 1, level_max - level );

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
function value = ts_abscissa ( order, i )

%*****************************************************************************80
%
%% TS_ABSCISSA returns the I-th abscissa for the tanh-sinh rule.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to
%    right.
%
%    This rule is defined on [-1,1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Input, integer I, the index of the desired abscissa.  1 <= I <= ORDER.
%
%    Output, real VALUE, the value of the I-th abscissa in the 
%    rule of order ORDER.
%
  if ( order < 1 )
    value = - Inf;
  elseif ( i < 1 | order < i )
    value = - Inf;
  elseif ( order == 1 )
    value = 0.0;
  elseif ( 2 * i - order - 1 == 0 )
    value = 0.0;
  else

    h = 4.0 / ( order + 1 );

    t = ( 2 * i - order - 1 ) * h / 2.0;

    ct = cosh ( t );
    st = sinh ( t );
    ct2 = cosh ( 0.5 * pi * st );

    value = tanh ( 0.5 * pi * st );

  end

  return
end
function w = ts_weights ( order )

%*****************************************************************************80
%
%% TS_WEIGHTS computes weights for a tanh-sinh rule.
%
%  Discussion:
%
%    In the 1D case, a sequence of rules is used of increasing order.
%    For low order, the weights do not sum to 2, but with increasing 
%    order, the sum quickly converges to 2.
%
%    However, for sparse grid applications, the lowest order rules are
%    involved in every grid, so it seems it might be useful to force
%    the weights to sum to 2 immediately.  This addresses only one very
%    obvious defect of the lower order rules.  I am not sure what to do
%    about the fact the none of the rules have a definable precision,
%    and the family of rules has not precision but asymptotic accuracy.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Output, real W(ORDER), the weights of the rule.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TS_WEIGHTS - Fatal error!\n' );
    fprintf ( 1, '  ORDER < 1.\n' );
    error ( 'TS_WEIGHTS - Fatal error!' )
  end

  h = 4.0 / ( order + 1 );

  i = [ 1 : order ];

  t = ( 2 * i - order - 1 ) * h / 2.0;

  ct = cosh ( t );
  st = sinh ( t );
  ct2 = cosh ( 0.5 * pi * st );

  w(i) = 0.5 * pi * h * ct ./ ct2 ./ ct2;
%
%  Normalize the weights so that they sum to 2.0.
%
  w_sum = sum ( w(1:order) );

  w(1:order) = 2.0 * w(1:order) / w_sum;

  return
end
function [ a, more ] = vec_colex_next2 ( dim_num, base, a, more )

%*****************************************************************************80
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
