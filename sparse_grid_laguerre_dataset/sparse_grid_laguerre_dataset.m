function sparse_grid_hermite_dataset ( dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_LAGUERRE_DATASET is the main program.
%
%  Discussion:
%
%    This program computes a sparse grid quadrature rule based on a 1D
%    Gauss-Laguerre rule and writes it to a file.. 
%
%    The user specifies:
%    * the spatial dimension of the quadrature region,
%    * the level that defines the Smolyak grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
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
  fprintf ( 1, 'SPARSE_GRID_LAGUERRE_DATASET\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute the abscissas and weights of a quadrature rule\n' );
  fprintf ( 1, '  associated with a sparse grid derived from a Smolyak\n' );
  fprintf ( 1, '  construction based on 1D Gauss-Laguerre rules.\n' );
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
  fprintf ( 1, '    "lag_d?_level?_r.txt", a file of the ranges.\n' );
  fprintf ( 1, '    "lag_d?_level?_w.txt", a file of the weights;\n' );
  fprintf ( 1, '    "lag_d?_level?_x.txt", a file of the abscissas;\n' );
%
%  Get the spatial dimension.
%
  if ( nargin < 1)
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
  point_num = sparse_grid_laguerre_size ( dim_num, level_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of distinct abscissas in the\n' );
  fprintf ( 1, '  quadrature rule is determined from the spatial\n' );
  fprintf ( 1, '  dimension DIM_NUM and the level LEVEL_MAX.\n' );
  fprintf ( 1, '  For the given input, this value will be = %d\n', point_num );

  r = zeros ( dim_num, 2 );
%
%  Compute the weights and points.
%
  r(1:dim_num,1) = 0.0E+00;
  r(1:dim_num,2) = + r8_huge ( );

  [ w, x ] = sparse_grid_laguerre ( dim_num, level_max, point_num );

  r8mat_transpose_print_some ( dim_num, point_num, x, 1, 1, ...
    dim_num, 10, '  First 10 grid points:' );

  r8vec_print_some ( point_num, w, 1, 10, '  First 10 weights:' );

  weight_sum = sum ( w(1:point_num) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Weights sum to   %24.16f\n', weight_sum );
  fprintf ( 1, '  Correct value is %24.16f\n', 1.0 );
%
%  Write the rule to files.
%
  r_filename = sprintf ( 'lag_d%d_level%d_r.txt', dim_num, level_max );
  w_filename = sprintf ( 'lag_d%d_level%d_w.txt', dim_num, level_max );
  x_filename = sprintf ( 'lag_d%d_level%d_x.txt', dim_num, level_max );

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
  fprintf ( 1, 'SPARSE_GRID_LAGUERRE_DATASET:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

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
function value = i4_log_2 ( i )

%*****************************************************************************80
%
%% I4_LOG_2 returns the integer part of the logarithm base 2 of |I|.
%
%  Discussion:
%
%    For positive I4_LOG_2(I), it should be true that
%      2**I4_LOG_2(X) <= |I| < 2**(I4_LOG_2(I)+1).
%    The special case of I4_LOG_2(0) returns -HUGE().
%
%  Example:
%
%     I  Value
%
%     0  -1
%     1,  0
%     2,  1
%     3,  1
%     4,  2
%     5,  2
%     6,  2
%     7,  2
%     8,  3
%     9,  3
%    10,  3
%   127,  6
%   128,  7
%   129,  7
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number whose logarithm base 2 is desired.
%
%    Output, integer VALUE, the integer part of the logarithm base 2 of
%    the absolute value of I.
%
  i = floor ( i );

  if ( i == 0 )

    value = -inf;

  else

    value = 0;

    i = abs ( i );

    while ( 2 <= i )
      i = i / 2;
      value = value + 1;
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
function grid_point = laguerre_abscissa ( dim_num, point_num, grid_index, ...
  grid_base )

%*****************************************************************************80
%
%% LAGUERRE_ABSCISSA sets abscissas for multidimensional Gauss-Laguerre quadrature.
%
%  Discussion:
%
%    The "nesting" as it occurs for Gauss-Laguerre sparse grids simply
%    involves the use of a specified set of permissible orders for the
%    rule.  
%
%    The X array lists the (complete) Gauss-Laguerre abscissas for rules 
%    of order 1, 3, 7, 15, 31, 63 and 127, in order. 
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 October 2007
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
%    Input, integer GRID_INDEX(DIM_NUM,POINT_NUM), for each
%    point and dimension, the index of the abscissa.
%
%    Input, integer GRID_BASE(DIM_NUM), the order of the 
%    rule being used in each dimension.
%
%    Output, real GRID_POINT(DIM_NUM), the grid points of abscissas.
%
  skip = [ 0, 1, 4, 11, 26, 57, 120, 247 ];
  x = [ ...
    1.0E+00, ...
    0.415774556783479083311533873128E+00, ...
    0.229428036027904171982205036136E+01, ...
    0.628994508293747919686641576551E+01, ...
    0.193043676560362413838247885004E+00, ...
    0.102666489533919195034519944317E+01, ...
    0.256787674495074620690778622666E+01, ...
    0.490035308452648456810171437810E+01, ...
    0.818215344456286079108182755123E+01, ...
    0.127341802917978137580126424582E+02, ...
    0.193957278622625403117125820576E+02, ...
    0.933078120172818047629030383672E-01, ...
    0.492691740301883908960101791412E+00, ...
    0.121559541207094946372992716488E+01, ...
    0.226994952620374320247421741375E+01, ...
    0.366762272175143727724905959436E+01, ...
    0.542533662741355316534358132596E+01, ...
    0.756591622661306786049739555812E+01, ...
    0.101202285680191127347927394568E+02, ...
    0.131302824821757235640991204176E+02, ...
    0.166544077083299578225202408430E+02, ...
    0.207764788994487667729157175676E+02, ...
    0.256238942267287801445868285977E+02, ...
    0.314075191697539385152432196202E+02, ...
    0.385306833064860094162515167595E+02, ...
    0.480260855726857943465734308508E+02, ...
    0.45901947621108290743496080275224E-01, ...
    0.24198016382477204890408974151714E+00, ...
    0.59525389422235073707330165005414E+00, ...
    1.1066894995329987162111308789792E+00, ...
    1.7775956928747727211593727482675E+00, ...
    2.6097034152566806503893375925315E+00, ...
    3.6051968023400442698805817554243E+00, ...
    4.7667470844717611313629127271123E+00, ...
    6.0975545671817409269925429328463E+00, ...
    7.6014009492331374229360106942867E+00, ...
    9.2827143134708894182536695297710E+00, ...
    11.146649755619291358993815629587E+00, ...
    13.199189576244998522464925028637E+00, ...
    15.447268315549310075809325891801E+00, ...
    17.898929826644757646725793817752E+00, ...
    20.563526336715822170743048968779E+00, ...
    23.451973482011858591050255575933E+00, ...
    26.577081352118260459975876986478E+00, ...
    29.953990872346445506951917840024E+00, ...
    33.600759532902202735410313885784E+00, ...
    37.539164407330440882887902558001E+00, ...
    41.795830870182219981347945853330E+00, ...
    46.403866806411123136029227604386E+00, ...
    51.405314476797755161861461088395E+00, ...
    56.854992868715843620511922055660E+00, ...
    62.826855908786321453677523304806E+00, ...
    69.425277191080345623322251656443E+00, ...
    76.807047763862732837609972285484E+00, ...
    85.230358607545669169387065607043E+00, ...
    95.188939891525629981308606853957E+00, ...
    107.95224382757871475002440117666E+00, ...
    0.22768893732576153785994330248562E-01, ...
    0.11998325242727824715771416426383E+00, ...
    0.29494185444770149577427738517405E+00, ...
    0.54779087896237725363865073775856E+00, ...
    0.87869061179931901673895567052285E+00, ...
    1.2878464335919706302309207788611E+00, ...
    1.7755123815388553763979463268728E+00, ...
    2.3419925567085989256055628337716E+00, ...
    2.9876423223246473939976731053629E+00, ...
    3.7128695992018000346299637413422E+00, ...
    4.5181363349503584391105568561550E+00, ...
    5.4039601781825946286902599782736E+00, ...
    6.3709163787865330220392250891777E+00, ...
    7.4196399339311711154888493199004E+00, ...
    8.5508280008403328312589048722235E+00, ...
    9.7652425999245366807004592977996E+00, ...
    11.063713635140661736220550410604E+00, ...
    12.447142262356492749798687569289E+00, ...
    13.916504641057818562912967008183E+00, ...
    15.472856110036296424777143607779E+00, ...
    17.117335833863588753116900303886E+00, ...
    18.851171974154856850873483787506E+00, ...
    20.675687448056515660377265667433E+00, ...
    22.592306346311528381292277759986E+00, ...
    24.602561094972638883700642760037E+00, ...
    26.708100458737343969779087998829E+00, ...
    28.910698500451382640177718103234E+00, ...
    31.212264631175912885477773820802E+00, ...
    33.614854909101154836598842888345E+00, ...
    36.120684774484823056306328740825E+00, ...
    38.732143442933582145626041607663E+00, ...
    41.451810222318741191114726181363E+00, ...
    44.282473071479233839358857134636E+00, ...
    47.227149784295686898935095231536E+00, ...
    50.289112264240695761749021839419E+00, ...
    53.471914456788652808348280619542E+00, ...
    56.779424636342062213099781057119E+00, ...
    60.215862909019862886417550114424E+00, ...
    63.785845004235974631701139601836E+00, ...
    67.494433702293885830374325695045E+00, ...
    71.347199604295266286654803376075E+00, ...
    75.350293425653234254290504744279E+00, ...
    79.510532629986309149555391354778E+00, ...
    83.835506080872257843339817658508E+00, ...
    88.333701570354369086112766326498E+00, ...
    93.014662728558547405303399037100E+00, ...
    97.889184147578140043386727677112E+00, ...
    102.96955690741381650783952746778E+00, ...
    108.26988161961595392226350967206E+00, ...
    113.80647350287462738934485955901E+00, ...
    119.59839538830458666962452963285E+00, ...
    125.66817255856119431291196303280E+00, ...
    132.04277272091165746585590583045E+00, ...
    138.75498418103789078167590567526E+00, ...
    145.84541318313540358283994248439E+00, ...
    153.36548459497863623710815962660E+00, ...
    161.38215194813761243562172669592E+00, ...
    169.98570600665839438795175301156E+00, ...
    179.30366247401580910251827858515E+00, ...
    189.52789596532475473668721332981E+00, ...
    200.97521159924656741628671841018E+00, ...
    214.25368536638788642698056296400E+00, ...
    230.93465747089703971246562985079E+00, ...
    0.11339635298518611691893169631306E-01, ...
    0.59749753435726620281348237057387E-01, ...
    0.14685098690746167612388223687431E+00, ...
    0.27267590735859553131378008278900E+00, ...
    0.43724600644192665554577035869932E+00, ...
    0.64058688222566929533576416399983E+00, ...
    0.88272968639058364481487653650042E+00, ...
    1.1637114160166537661560584700951E+00, ...
    1.4835750152834613891313584861012E+00, ...
    1.8423694351613565380686320809853E+00, ...
    2.2401496839579024244513315656522E+00, ...
    2.6769768780141303692167869961238E+00, ...
    3.1529182957082825565771508308846E+00, ...
    3.6680474360304752540226339926515E+00, ...
    4.2224440823301888455977876667425E+00, ...
    4.8161943715870502475665535087286E+00, ...
    5.4493908694559416755862178908416E+00, ...
    6.1221326512997254193944584763155E+00, ...
    6.8345253894122668112237994973336E+00, ...
    7.5866814466367472174205986836847E+00, ...
    8.3787199765932725254842120659452E+00, ...
    9.2107670307426558777922506102445E+00, ...
    10.082955672528643809166439353647E+00, ...
    10.995426098858125429803147358780E+00, ...
    11.948325769197725997610605127857E+00, ...
    12.941809542585531053723381098192E+00, ...
    13.976039822878506520014405668679E+00, ...
    15.051186712579523631574796365435E+00, ...
    16.167428175612852922977395051768E+00, ...
    17.324950209443673446561163712616E+00, ...
    18.523947026965688560811711309349E+00, ...
    19.764621248611504104071669386884E+00, ...
    21.047184105173183606877044020054E+00, ...
    22.371855651855542817648123918101E+00, ...
    23.738864994122497183652313788712E+00, ...
    25.148450525937368234077278385644E+00, ...
    26.600860181041749607253384279755E+00, ...
    28.096351697964619201753961292129E+00, ...
    29.635192899504178910610227138642E+00, ...
    31.217661987479759144214467152615E+00, ...
    32.844047853610430460522951341338E+00, ...
    34.514650407441149149105635947422E+00, ...
    36.229780922306804019615388508885E+00, ...
    37.989762400399956435968780140278E+00, ...
    39.794929958089961778396437141707E+00, ...
    41.645631232730180705153990897484E+00, ...
    43.542226812286859549950892993822E+00, ...
    45.485090689228791137996151336673E+00, ...
    47.474610740231964719468766599146E+00, ...
    49.511189233379087716728884584381E+00, ...
    51.595243364671244443182771266934E+00, ...
    53.727205825819316758288140069145E+00, ...
    55.907525405447553305830605991732E+00, ...
    58.136667626022439197077526025660E+00, ...
    60.415115419018590295707192053805E+00, ...
    62.743369841051809700207126742685E+00, ...
    65.121950833949996311956025417139E+00, ...
    67.551398031997886314411872443149E+00, ...
    70.032271619884584511229871192030E+00, ...
    72.565153245206849090888669416801E+00, ...
    75.150646989739935299354362325096E+00, ...
    77.789380404085816000647405462136E+00, ...
    80.482005610750729205803962926758E+00, ...
    83.229200481195914886796120019048E+00, ...
    86.031669892953582966798238732643E+00, ...
    88.890147073512051099652518544282E+00, ...
    91.805395038358177994971250170499E+00, ...
    94.778208131331583205387031034825E+00, ...
    97.809413676305116411054110115424E+00, ...
    100.89987375017285940371939762172E+00, ...
    104.05048708821598934704076845022E+00, ...
    107.26219113414600428423116401414E+00, ...
    110.53596424851500530602771351277E+00, ...
    113.87282809075839485348376187652E+00, ...
    117.27385019192517774095477886379E+00, ...
    120.74014673718880106173978002719E+00, ...
    124.27288557955698354259506446928E+00, ...
    127.87328950885942645093841745425E+00, ...
    131.54263980314366921809377742137E+00, ...
    135.28228009311836970132738106369E+00, ...
    139.09362057432970013964422086977E+00, ...
    142.97814260643601776808227753574E+00, ...
    146.93740374437366549441080969072E+00, ...
    150.97304325252187127492511437460E+00, ...
    155.08678816034612572229641420609E+00, ...
    159.28045992663288235401956989889E+00, ...
    163.55598178957571104015967182053E+00, ...
    167.91538689194360134245547184721E+00, ...
    172.36082728473812536838156191681E+00, ...
    176.89458392960192176311674993508E+00, ...
    181.51907784036813069227528834025E+00, ...
    186.23688252828112373861202530357E+00, ...
    191.05073794450929196790836610789E+00, ...
    195.96356614879879837839002542988E+00, ...
    200.97848897600025153696475526130E+00, ...
    206.09884802468871112127283042753E+00, ...
    211.32822735671655260572377256981E+00, ...
    216.67047937658230323477089465777E+00, ...
    222.12975445929687246267304963754E+00, ...
    227.71053502072232419089132431317E+00, ...
    233.41767488282602453367775322563E+00, ...
    239.25644498830308620018749667089E+00, ...
    245.23258677871567172531254018984E+00, ...
    251.35237488718128030005500991754E+00, ...
    257.62269123792061413076191882313E+00, ...
    264.05111322908240551754377241831E+00, ...
    270.64601945722796749299111718606E+00, ...
    277.41671750163651071798388218104E+00, ...
    284.37359974220870326674402873120E+00, ...
    291.52833521346495719581282021650E+00, ...
    298.89410837028248600878895615414E+00, ...
    306.48591978262611320418112423947E+00, ...
    314.32096986471177487400007507615E+00, ...
    322.41915589128679683349440361344E+00, ...
    330.80372663802405651933847334878E+00, ...
    339.50216127832433747735367595958E+00, ...
    348.54737559472697355480761787441E+00, ...
    357.97942028029845454049007443090E+00, ...
    367.84794520076004578858341422871E+00, ...
    378.21590623135532818332979188889E+00, ...
    389.16539141251004101579475325153E+00, ...
    400.80729331451702589996361286427E+00, ...
    413.29853681779384418008260081859E+00, ...
    426.87579153663675538288509017051E+00, ...
    441.93085485310841412460309271842E+00, ...
    459.21804639888429981971267313224E+00, ...
    480.69378263388373859704269229304E+00  ...
  ];

  if ( any ( grid_base(1:dim_num) < 1 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LAGUERRE_ABSCISSA - Fatal error!\n' );
    fprintf ( 1, '  Some base values are less than 1.\n' );
    error ( 'LAGUERRE_ABSCISSA - Fatal error!' );
  end

  if ( any ( 127 < grid_base(1:dim_num) ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LAGUERRE_ABSCISSA - Fatal error!\n' );
    fprintf ( 1, '  Some base values are greater than 127.\n' );
    error ( 'LAGUERRE_ABSCISSA - Fatal error!' );
  end

  for point = 1 : point_num
    for dim = 1 : dim_num

      level = i4_log_2 ( grid_base(dim) + 1 ) - 1;

      pointer = skip(level+1) + grid_index(dim,point);

      grid_point(dim,point) = x(pointer);

    end
  end

  return
end
function weight = laguerre_weights ( order )

%*****************************************************************************80
%
%% LAGUERRE_WEIGHTS returns weights for certain Gauss-Laguerre quadrature rules.
%
%  Discussion:
%
%    The allowed orders are 1, 3, 7, 15, 31, 63 or 127.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%    Arthur Stroud, Don Secrest,
%    Gaussian Quadrature Formulas,
%    Prentice Hall, 1966,
%    LC: QA299.4G3S7.
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%    ORDER must be 1, 3, 7, 15, 31, 63, or 127.
%
%    Output, real WEIGHT(ORDER), the weights.
%    The weights are positive, symmetric and should sum to 1.
%
  if ( order == 1 )

    weight(1) = 1.0E+00;

  elseif ( order == 3 )

    weight(1) =  0.711093009929173015449590191143E+00;
    weight(2) =  0.278517733569240848801444888457E+00;
    weight(3) =  0.103892565015861357489649204007E-01;

  elseif ( order == 7 )

    weight(1) =  0.409318951701273902130432880018E+00;
    weight(2) =  0.421831277861719779929281005417E+00;
    weight(3) =  0.147126348657505278395374184637E+00;
    weight(4) =  0.206335144687169398657056149642E-01;
    weight(5) =  0.107401014328074552213195962843E-02;
    weight(6) =  0.158654643485642012687326223234E-04;
    weight(7) =  0.317031547899558056227132215385E-07;

  elseif ( order == 15 )

    weight(1) =  0.218234885940086889856413236448E+00;
    weight(2) =  0.342210177922883329638948956807E+00;
    weight(3) =  0.263027577941680097414812275022E+00;
    weight(4) =  0.126425818105930535843030549378E+00;
    weight(5) =  0.402068649210009148415854789871E-01;
    weight(6) =  0.856387780361183836391575987649E-02;
    weight(7) =  0.121243614721425207621920522467E-02;
    weight(8) =  0.111674392344251941992578595518E-03;
    weight(9) =  0.645992676202290092465319025312E-05;
    weight(10) = 0.222631690709627263033182809179E-06;
    weight(11) = 0.422743038497936500735127949331E-08;
    weight(12) = 0.392189726704108929038460981949E-10;
    weight(13) = 0.145651526407312640633273963455E-12;
    weight(14) = 0.148302705111330133546164737187E-15;
    weight(15) = 0.160059490621113323104997812370E-19;

  elseif ( order == 31 )

    weight(  1) =   0.11252789550372583820847728082801E+00;
    weight(  2) =   0.21552760818089123795222505285045E+00;
    weight(  3) =   0.23830825164569654731905788089234E+00;
    weight(  4) =   0.19538830929790229249915303390711E+00;
    weight(  5) =   0.12698283289306190143635272904602E+00;
    weight(  6) =   0.67186168923899300670929441993508E-01;
    weight(  7) =   0.29303224993879487404888669311974E-01;
    weight(  8) =   0.10597569915295736089529380314433E-01;
    weight(  9) =   0.31851272582386980320974842433019E-02;
    weight( 10) =   0.79549548307940382922092149012477E-03;
    weight( 11) =   0.16480052126636687317862967116412E-03;
    weight( 12) =   0.28229237864310816393860971468993E-04;
    weight( 13) =   0.39802902551008580387116174900106E-05;
    weight( 14) =   0.45931839841801061673729694510289E-06;
    weight( 15) =   0.43075545187731100930131457465897E-07;
    weight( 16) =   0.32551249938271570855175749257884E-08;
    weight( 17) =   0.19620246675410594996247151593142E-09;
    weight( 18) =   0.93190499086617587129534716431331E-11;
    weight( 19) =   0.34377541819411620520312597898311E-12;
    weight( 20) =   0.96795247130446716997405035776206E-14;
    weight( 21) =   0.20368066110115247398010624219291E-15;
    weight( 22) =   0.31212687280713526831765358632585E-17;
    weight( 23) =   0.33729581704161052453395678308350E-19;
    weight( 24) =   0.24672796386616696011038363242541E-21;
    weight( 25) =   0.11582201904525643634834564576593E-23;
    weight( 26) =   0.32472922591425422434798022809020E-26;
    weight( 27) =   0.49143017308057432740820076259666E-29;
    weight( 28) =   0.34500071104808394132223135953806E-32;
    weight( 29) =   0.87663710117162041472932760732881E-36;
    weight( 30) =   0.50363643921161490411297172316582E-40;
    weight( 31) =   0.19909984582531456482439549080330E-45;

  elseif ( order == 63 )

    weight(  1) =   0.57118633213868979811587283390476E-01;
    weight(  2) =   0.12067476090640395283319932036351E+00;
    weight(  3) =   0.15925001096581873723870561096472E+00;
    weight(  4) =   0.16875178327560799234596192963585E+00;
    weight(  5) =   0.15366641977668956696193711310131E+00;
    weight(  6) =   0.12368770614716481641086652261948E+00;
    weight(  7) =   0.89275098854848671545279150057422E-01;
    weight(  8) =   0.58258485446105944957571825725160E-01;
    weight(  9) =   0.34546657545992580874717085812508E-01;
    weight( 10) =   0.18675685985714656798286552591203E-01;
    weight( 11) =   0.92233449044093536528490075241649E-02;
    weight( 12) =   0.41671250684839592762582663470209E-02;
    weight( 13) =   0.17238120299900582715386728541955E-02;
    weight( 14) =   0.65320845029716311169340559359043E-03;
    weight( 15) =   0.22677644670909586952405173207471E-03;
    weight( 16) =   0.72127674154810668410750270234861E-04;
    weight( 17) =   0.21011261180466484598811536851241E-04;
    weight( 18) =   0.56035500893357212749181536071292E-05;
    weight( 19) =   0.13673642785604888017836641282292E-05;
    weight( 20) =   0.30507263930195817240736097189550E-06;
    weight( 21) =   0.62180061839309763559981775409241E-07;
    weight( 22) =   0.11566529551931711260022448996296E-07;
    weight( 23) =   0.19614588267565478081534781863335E-08;
    weight( 24) =   0.30286171195709411244334756404054E-09;
    weight( 25) =   0.42521344539400686769012963452599E-10;
    weight( 26) =   0.54202220578073819334698791381873E-11;
    weight( 27) =   0.62627306838597672554166850420603E-12;
    weight( 28) =   0.65474443156573322992307089591924E-13;
    weight( 29) =   0.61815575808729181846302500000047E-14;
    weight( 30) =   0.52592721363507381404263991342633E-15;
    weight( 31) =   0.40230920092646484015391506025408E-16;
    weight( 32) =   0.27600740511819536505013824207729E-17;
    weight( 33) =   0.16936946756968296053322009855265E-18;
    weight( 34) =   0.92689146872177087314963772462726E-20;
    weight( 35) =   0.45093739060365632939780140603959E-21;
    weight( 36) =   0.19435162876132376573629962695374E-22;
    weight( 37) =   0.73926270895169207037999639194513E-24;
    weight( 38) =   0.24714364154434632615980126000066E-25;
    weight( 39) =   0.72288649446741597655145390616476E-27;
    weight( 40) =   0.18407617292614039362985209905608E-28;
    weight( 41) =   0.40583498566841960105759537058880E-30;
    weight( 42) =   0.77000496416438368114463925286343E-32;
    weight( 43) =   0.12488505764999334328843314866038E-33;
    weight( 44) =   0.17185000226767010697663950619912E-35;
    weight( 45) =   0.19896372636672396938013975755522E-37;
    weight( 46) =   0.19199671378804058267713164416870E-39;
    weight( 47) =   0.15278588285522166920459714708240E-41;
    weight( 48) =   0.99054752688842142955854138884590E-44;
    weight( 49) =   0.51597523673029211884228858692990E-46;
    weight( 50) =   0.21249846664084111245693912887783E-48;
    weight( 51) =   0.67903852766852910591172042494884E-51;
    weight( 52) =   0.16466654148296177467908300517887E-53;
    weight( 53) =   0.29509065402691055027053659375033E-56;
    weight( 54) =   0.37838420647571051984882241014675E-59;
    weight( 55) =   0.33358130068542431878174667995217E-62;
    weight( 56) =   0.19223461022273880981363303073329E-65;
    weight( 57) =   0.67812696961083016872779388922288E-69;
    weight( 58) =   0.13404752802440604607620468935693E-72;
    weight( 59) =   0.13109745101805029757648048223928E-76;
    weight( 60) =   0.52624863881401787388694579143866E-81;
    weight( 61) =   0.63780013856587414257760666006511E-86;
    weight( 62) =   0.12997078942372924566347473916943E-91;
    weight( 63) =   0.10008511496968754063443740168421E-98;

  elseif ( order == 127 )

    weight(  1) =   0.28773246692000124355770010301506E-01;
    weight(  2) =   0.63817468175134649363480949265236E-01;
    weight(  3) =   0.91919669721570571389864194652717E-01;
    weight(  4) =   0.11054167914413766381245463002967E+00;
    weight(  5) =   0.11879771633375850188328329422643E+00;
    weight(  6) =   0.11737818530052695148804451630074E+00;
    weight(  7) =   0.10819305984180551488335145581193E+00;
    weight(  8) =   0.93827075290489628080377261401107E-01;
    weight(  9) =   0.76966450960588843995822485928431E-01;
    weight( 10) =   0.59934903912939714332570730063476E-01;
    weight( 11) =   0.44417742073889001371708316272923E-01;
    weight( 12) =   0.31385080966252320983009372215062E-01;
    weight( 13) =   0.21172316041924506411370709025015E-01;
    weight( 14) =   0.13650145364230541652171185564626E-01;
    weight( 15) =   0.84172852710599172279366657385445E-02;
    weight( 16) =   0.49674990059882760515912858620175E-02;
    weight( 17) =   0.28069903895001884631961957446400E-02;
    weight( 18) =   0.15192951003941952460445341057817E-02;
    weight( 19) =   0.78789028751796084086217287140548E-03;
    weight( 20) =   0.39156751064868450584507324648999E-03;
    weight( 21) =   0.18652434268825860550093566260060E-03;
    weight( 22) =   0.85173160415576621908809828160247E-04;
    weight( 23) =   0.37285639197853037712145321577724E-04;
    weight( 24) =   0.15648416791712993947447805296768E-04;
    weight( 25) =   0.62964340695224829035692735524979E-05;
    weight( 26) =   0.24288929711328724574541379938222E-05;
    weight( 27) =   0.89824607890051007201922871545035E-06;
    weight( 28) =   0.31844174740760353710742966328091E-06;
    weight( 29) =   0.10821272905566839211861807542741E-06;
    weight( 30) =   0.35245076750635536015902779085340E-07;
    weight( 31) =   0.11001224365719347407063839761738E-07;
    weight( 32) =   0.32904079616717932125329343003261E-08;
    weight( 33) =   0.94289145237889976419772700772988E-09;
    weight( 34) =   0.25882578904668318184050195309296E-09;
    weight( 35) =   0.68047437103370762630942259017560E-10;
    weight( 36) =   0.17131398805120837835399564475632E-10;
    weight( 37) =   0.41291744524052865469443922304935E-11;
    weight( 38) =   0.95264189718807273220707664873469E-12;
    weight( 39) =   0.21032604432442425932962942047474E-12;
    weight( 40) =   0.44427151938729352860940434285789E-13;
    weight( 41) =   0.89760500362833703323319846405449E-14;
    weight( 42) =   0.17341511407769287074627948346848E-14;
    weight( 43) =   0.32028099548988356631494379835210E-15;
    weight( 44) =   0.56531388950793682022660742095189E-16;
    weight( 45) =   0.95329672799026591234588044025896E-17;
    weight( 46) =   0.15353453477310142565288509437552E-17;
    weight( 47) =   0.23608962179467365686057842132176E-18;
    weight( 48) =   0.34648742794456611332193876653230E-19;
    weight( 49) =   0.48515241897086461320126957663545E-20;
    weight( 50) =   0.64786228633519813428137373790678E-21;
    weight( 51) =   0.82476020965403242936448553126316E-22;
    weight( 52) =   0.10005361880214719793491658282977E-22;
    weight( 53) =   0.11561395116207304954233181263632E-23;
    weight( 54) =   0.12719342731167922655612134264961E-24;
    weight( 55) =   0.13316584714165372967340004160814E-25;
    weight( 56) =   0.13261218454678944033646108509198E-26;
    weight( 57) =   0.12554995447643949807286074138324E-27;
    weight( 58) =   0.11294412178579462703240913107219E-28;
    weight( 59) =   0.96491020279562119228500608131696E-30;
    weight( 60) =   0.78241846768302099396733076955632E-31;
    weight( 61) =   0.60181503542219626658249939076636E-32;
    weight( 62) =   0.43882482704961741551510518054138E-33;
    weight( 63) =   0.30314137647517256304035802501863E-34;
    weight( 64) =   0.19826016543944539545224676057020E-35;
    weight( 65) =   0.12267623373665926559013654872402E-36;
    weight( 66) =   0.71763931692508888943812834967620E-38;
    weight( 67) =   0.39659378833836963584113716149270E-39;
    weight( 68) =   0.20688970553868040099581951696677E-40;
    weight( 69) =   0.10179587017979517245268418427523E-41;
    weight( 70) =   0.47200827745986374625714293679649E-43;
    weight( 71) =   0.20606828985553374825744353490744E-44;
    weight( 72) =   0.84627575907305987245899032156188E-46;
    weight( 73) =   0.32661123687088798658026998931647E-47;
    weight( 74) =   0.11833939207883162380564134612682E-48;
    weight( 75) =   0.40211209123895013807243250164050E-50;
    weight( 76) =   0.12799824394111125389430292847476E-51;
    weight( 77) =   0.38123877747548846504399051365162E-53;
    weight( 78) =   0.10612057542701156767898551949650E-54;
    weight( 79) =   0.27571446947200403594113572720812E-56;
    weight( 80) =   0.66772544240928492881306904862856E-58;
    weight( 81) =   0.15052438383868234954068178600268E-59;
    weight( 82) =   0.31538986800113758526689068500772E-61;
    weight( 83) =   0.61326614299483180785237418887960E-63;
    weight( 84) =   0.11048510030324810567549119229368E-64;
    weight( 85) =   0.18410563538091348076979665543900E-66;
    weight( 86) =   0.28323926570052832195543883237652E-68;
    weight( 87) =   0.40154409843763655508670978777418E-70;
    weight( 88) =   0.52351530215683708779772201956106E-72;
    weight( 89) =   0.62634476665005100555787696642851E-74;
    weight( 90) =   0.68612210535666530365348093803922E-76;
    weight( 91) =   0.68651298840956019297134099761855E-78;
    weight( 92) =   0.62581388433728084867318704240915E-80;
    weight( 93) =   0.51833271237514904046803469968027E-82;
    weight( 94) =   0.38893621571918443533108973497673E-84;
    weight( 95) =   0.26357711379476932781525533730623E-86;
    weight( 96) =   0.16078851293917979699005509638883E-88;
    weight( 97) =   0.87978042070968939637972577886624E-91;
    weight( 98) =   0.43013405077495109903408697802188E-93;
    weight( 99) =   0.18713435881342838527144321803729E-95;
    weight(100) =   0.72125744708060471675805761366523E-98;
    weight(101) =   0.24508746062177874383231742333023E-100;
    weight(102) =   0.73042094619470875777647865078327E-103;
    weight(103) =   0.18983290818383463537886818579820E-105;
    weight(104) =   0.42757400244246684123093264825902E-108;
    weight(105) =   0.82894681420515755691423485228897E-111;
    weight(106) =   0.13729432219324400013067050156048E-113;
    weight(107) =   0.19265464126404973222043166489406E-116;
    weight(108) =   0.22693344503301354826140809941334E-119;
    weight(109) =   0.22209290603717355061909071271535E-122;
    weight(110) =   0.17851087685544512662856555121755E-125;
    weight(111) =   0.11630931990387164467431190485525E-128;
    weight(112) =   0.60524443584652392290952805077893E-132;
    weight(113) =   0.24729569115063528647628375096400E-135;
    weight(114) =   0.77789065006489410364997205809045E-139;
    weight(115) =   0.18409738662712607039570678274636E-142;
    weight(116) =   0.31900921131079114970179071968597E-146;
    weight(117) =   0.39179487139174199737617666077555E-150;
    weight(118) =   0.32782158394188697053774429820559E-154;
    weight(119) =   0.17793590713138888062819640128739E-158;
    weight(120) =   0.58882353408932623157467835381214E-163;
    weight(121) =   0.10957236509071169877747203273886E-167;
    weight(122) =   0.10281621114867000898285076975760E-172;
    weight(123) =   0.41704725557697758145816510853967E-178;
    weight(124) =   0.58002877720316101774638319601971E-184;
    weight(125) =   0.18873507745825517106171619101120E-190;
    weight(126) =   0.69106601826730911682786705950895E-198;
    weight(127) =   0.43506813201105855628383313334402E-207;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'LAGUERRE_WEIGHTS - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    fprintf ( 1, '  Legal values are 1, 3, 7, 15, 31, 63 or 127.\n' );
    error ( 'LAGUERRE_WEIGHTS - Fatal error!' );

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
%    The arrangement described here works naturally for the Fejer Type 2,
%    Newton Cotes Open,  and Gauss-Patterson rules.  It also can be used, partially, 
%    to describe the growth of Gauss-Legendre rules.
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
function indx = multigrid_index_one ( dim_num, order_1d, order_nd )

%*****************************************************************************80
%
%% MULTIGRID_INDEX_ONE returns an indexed multidimensional grid.
%
%  Discussion:
%
%    For dimension DIM, the number of points is ORDER_1D(DIM).
%
%    We index the points as
%      1,   2,   3,   ...,  ORDER_1D(DIM).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 October 2007
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
  a = [];
  more = 0;
  p = 0;

  while ( 1 )

    [ a, more ] = vec_colex_next2 ( dim_num, order_1d, a, more );

    if ( ~more )
      break
    end

    p = p + 1;
%
%  The values of A(DIM) are between 0 and ORDER_1D(DIM)-1 = N - 1 = 2 * M.
%  Subtracting M sets the range to -M to +M, as we wish.
%
    indx(1:dim_num,p) = a(1:dim_num) + 1;

  end

  return
end
function w_nd = product_weight_laguerre ( dim_num, order_1d, order_nd )

%*****************************************************************************80
%
%% PRODUCT_WEIGHT_LAGUERRE: weights for a product Gauss-Laguerre rule.
%
%  Discussion:
%
%    This routine computes the weights for a quadrature rule which is
%    a product of 1D Gauss-Laguerre rules of varying order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 October 2007
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
%    Output, real W_ND(ORDER_ND), the product rule weights.
%
  w_nd(1:order_nd) = 1.0;

  for dim = 1 : dim_num

    w_1d = laguerre_weights ( order_1d(dim) );

    w_nd = r8vec_direct_product2 ( dim, order_1d(dim), w_1d, dim_num, ...
      order_nd, w_nd );
 
  end

  return
end
function value = r8_huge ( )

%*****************************************************************************80
%
%% R8_HUGE returns a "huge" real number.
%
%  Discussion:
%
%    The value returned by this function is NOT required to be the
%    maximum representable R8.  This value varies from machine to machine,
%    from compiler to compiler, and may cause problems when being printed.
%    We simply want a "very large" but non-infinite number.
%
%    MATLAB provides a built-in symbolic constant "inf" that can be used
%    if a huge number is really what you want!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, a huge number.
%
  value = 1.0E+30;

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
%    09 August 2009
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
%  For greater precision, try:
%
%     fprintf ( output_unit, '  %24,16f', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %14f', table(i,j) );
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
function [ grid_weight, grid_point ] = sparse_grid_laguerre ( dim_num, ...
  level_max, point_num )
  
%*****************************************************************************80
%
%% SPARSE_GRID_LAGUERRE computes a sparse grid of Gauss-Laguerre points. 
% 
%  Discussion: 
% 
%    The quadrature rule is associated with a sparse grid derived from 
%    a Smolyak construction using a 1D Gauss-Laguerre quadrature rule.  
% 
%    The user specifies: 
%    * the spatial dimension of the quadrature region, 
%    * the level that defines the Smolyak grid. 
% 
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 July 2008
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
%    Input, integer LEVEL_MAX, controls the size of the 
%    sparse grid. 
% 
%    Input, integer POINT_NUM, the number of points in the grid, 
%    as determined by SPARSE_GRID_LAGUERRE_SIZE. 
% 
%    Output, real GRID_WEIGHT(POINT_NUM), the weights. 
% 
%    Output, real GRID_POINT(DIM_NUM,POINT_NUM), the points. 
% 
  grid_weight(1:point_num) = 0.0;
%
%  The outer loop generates LEVELs from LEVEL_MIN to LEVEL_MAX.
%
  point_num2 = 0;

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
%  The relationship is the same as for other OPEN rules.
%
      order_1d = level_to_order_open ( dim_num, level_1d );

      grid_base2(1:dim_num) = order_1d(1:dim_num);
%
%  The product of the 1D orders gives us the number of points in this subgrid.
%
      order_nd = prod ( order_1d(1:dim_num) );
%
%  Compute the weights for this product grid.
%
      grid_weight2 = product_weight_laguerre ( dim_num, order_1d, order_nd );
%
%  Now determine the coefficient of the weight.
%
      coeff = (-1)^( level_max - level ) ...
        * i4_choose ( dim_num - 1, level_max - level );
%
%  The inner (hidden) loop generates all points corresponding to given grid.
%  The grid indices will be between 1 and ORDER_1D(DIM).
%
      grid_index2 = multigrid_index_one ( dim_num, order_1d, order_nd );

      for point = 1 : order_nd

        point_num2 = point_num2 + 1;

        grid_point(1:dim_num,point_num2) = laguerre_abscissa ( dim_num, 1, ...
          grid_index2(1:dim_num,point), grid_base2(1:dim_num) );

        grid_weight(point_num2) = coeff * grid_weight2(point);

      end

      if ( ~more )
        break
      end

    end

  end

  return
end
function [ grid_index, grid_base ] = sparse_grid_laguerre_index ( dim_num, ...
  level_max, point_num )

%*****************************************************************************80
%
%% SPARSE_GRID_LAGUERRE_INDEX: index sparse grid Gauss-Laguerre points.
%
%  Discussion:
%
%    The sparse grid is assumed to be formed from 1D Gauss-Laguerre rules.
%
%    The necessary dimensions of GRID_INDEX can be determined by 
%    calling SPARSE_GRID_LAGUERRE_SIZE first.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 July 2008
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
%    Input, integer POINT_NUM, the total number of points in 
%    the grids.
%
%    Output, integer GRID_INDEX(DIM_NUM,POINT_NUM), a list of 
%    point indices, representing a subset of the product grid of level 
%    LEVEL_MAX, representing (exactly once) each point that will show up in a
%    sparse grid of level LEVEL_MAX.
%
%    Output, integer GRID_BASE(DIM_NUM,POINT_NUM), a list of 
%    the orders of the rules associated with each point 
%    and dimension.
%

%
%  The outer loop generates LEVELs from LEVEL_MIN to LEVEL_MAX.
%
  point_num2 = 0;

  level_min = max ( 0, level_max + 1 - dim_num );
  
  for level = level_min : level_max
%
%  The middle loop generates the next partition LEVEL_1D(1:DIM_NUM)
%  that adds up to LEVEL.
%
    level_1d = [];
    more = false;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more, h, t ] = comp_next ( level, dim_num, level_1d, more, h, t );
%
%  Transform each 1D level to a corresponding 1D order.
%  The relationship is the same as for other OPEN rules.
%  The Gauss-Hermite rule differs from the other OPEN rules only in the nesting behavior.
%
      order_1d = level_to_order_open ( dim_num, level_1d );

      grid_base2(1:dim_num) = order_1d(1:dim_num);
%
%  The product of the 1D orders gives us the number of points in this subgrid.
%
      order_nd = prod ( order_1d(1:dim_num) );
%
%  The inner (hidden) loop generates all points corresponding to given grid.
%  The grid indices will be between 1 and ORDER_1D(DIM).
%
      grid_index2 = multigrid_index_one ( dim_num, order_1d, order_nd );

      for point = 1 : order_nd

        point_num2 = point_num2 + 1;

        grid_index(1:dim_num,point_num2) = grid_index2(1:dim_num,point);
        grid_base(1:dim_num,point_num2) = grid_base2(1:dim_num);

      end

      if ( ~more )
        break
      end

    end

  end

  return
end
function point_num = sparse_grid_laguerre_size ( dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_LAGUERRE_SIZE sizes a sparse grid of Gauss-Laguerre points.
%
%  Discussion:
%
%    The grid is defined as the sum of the product rules whose LEVEL
%    satisfies:
%
%      LEVEL_MIN <= LEVEL <= LEVEL_MAX.
%
%    where LEVEL_MAX is user specified, and 
%
%      LEVEL_MIN = max ( 0, LEVEL_MAX + 1 - DIM_NUM ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 July 2008
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
%    Output, integer POINT_NUM, the number of points in the grid.
%

%
%  Special case.
%
  if ( level_max == 0 )
    point_num = 1;
    return;
  end
%
%  The outer loop generates LEVELs from LEVEL_MIN to LEVEL_MAX.
%
  point_num = 0;

  level_min = max ( 0, level_max + 1 - dim_num );
  
  for level = level_min : level_max
%
%  The middle loop generates the next partition that adds up to LEVEL.
%
    level_1d = [];
    more = false;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more, h, t ] = comp_next ( level, dim_num, level_1d, more, h, t );
%
%  Transform each 1D level to a corresponding 1D order.
%
      order_1d = level_to_order_open ( dim_num, level_1d );

      point_num = point_num + prod ( order_1d(1:dim_num) );

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
