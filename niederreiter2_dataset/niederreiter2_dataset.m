function r = niederreiter2_dataset ( m, n, skip )

%*****************************************************************************80
%
%% NIEDERREITER2_DATASET generates a Niederreiter2 dataset and writes it to a file.
%
%  Usage:
%
%    r = niederreiter2_dataset ( m, n, skip )
%
%    where
%
%    * M, the spatial dimension,
%    * N, the number of points to generate,
%    * SKIP, number of initial values to skip.
%    * R is the M by N array created.
%
%    creates an M by N uniform random dataset and writes it to the
%    file "niederreiter2_M_N.txt".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2009
%
%  Author:
%
%    John Burkardt
%
  dim_max = 20;

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NIEDERREITER2_DATASET\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generate a Niederreiter quasirandom dataset\n' );
  fprintf ( 1, '  for a given spatial dimension and BASE = 2.\n' );
%
%  Get the spatial dimension M.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    m = input ( '  Enter the spatial dimension M: ' );
  else
    m = str2num ( m );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );

  if ( dim_max < m )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NIEDERREITER2_DATASET - Fatal error!\n' );
    fprintf ( 1, '  The dimension may not exceed %d\n', dim_max );
    error ( 'NIEDERREITER2 - Fatal error!\n' );
  end
%
%  Get N, the number of points.
%
%  The sequence length is the number of quasi-random points used to 
%  estimate the integral, excluding warm-up.
%
%  Some users may wish to rewrite the driver to test a [heuristic] 
%  "convergence" criterion, stopping the generation of points
%  when it is passed or when a specified number of points have been 
%  generated, whichever occurs first.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Choose the sequence length:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  If you do not have a preference, we\n' );
    fprintf ( 1, '  suggest using a large power of two, such as:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  2^10 = %d\n', 2^10 );
    fprintf ( 1, '  2^15 = %d\n', 2^15 );
    fprintf ( 1, '  2^20 = %d\n', 2^20 );
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    n = input ( '  Enter the number of points N: ' );
  else
    n = str2num ( n );
  end

  fprintf ( 1, '  Number of points N = %d\n', n );
%
%  Get SKIP
%
  if ( nargin < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Choose the number of values to skip:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  There is reason to believe that BASE**E,\n' );
    fprintf ( 1, '  where E is defined for example in\n' );
    fprintf ( 1, '  Bratley, Fox, and Niederreiter [1991],\n' );
    fprintf ( 1, '  would be a good choice.  Our formula has\n' );
    fprintf ( 1, '  has the form:\n' );
    fprintf ( 1, '    SKIP = 2^POWER,\n' );
    fprintf ( 1, '  where POWER is chosen so that SKIP comes nowhere\n' );
    fprintf ( 1, '  near the largest possible machine-representable\n' );
    fprintf ( 1, '  integer ( kind = 4 ).  It does not hurt to choose\n' );
    fprintf ( 1, '  POWER larger than E, because skipping is\n' );
    fprintf ( 1, '  done implicitly in O(1) time.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The maximum value of E for a fixed dimension\n' );
    fprintf ( 1, '  S grows like log S.  We allow some "fat" for\n' );
    fprintf ( 1, '  the implicit constant.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Numerically, 2^POWER = %d\n', 2^12 );
    fprintf ( 1, '\n' );
    skip = input ( '  Enter SKIP: ' );
  else
    skip = str2num ( skip );
  end

  fprintf ( 1, '  SKIP = %d\n', skip );
%
%  Compute the data.
%
  [ r, seed ] = niederreiter2_generate ( m, n, skip );
%
%  Write it to a file.
%
  output_filename = ...
    strcat ( 'niederreiter2_', num2str ( m ), '_', num2str ( n ), '.txt' );

  r8mat_write ( output_filename, m, n, r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to the file "%s".\n', ...
    output_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NIEDERREITER2_DATASET:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function cj = calcc2 ( dimen )

%*****************************************************************************80
%
%% CALCC2 computes the constants C(I,J,R).
%
%  Discussion:
%
%    As far as possible, Niederreiter's notation is used.
%
%    For each value of I, we first calculate all the corresponding
%    values of C.  These are held in the array CI.  All these
%    values are either 0 or 1.
%
%    Next we pack the values into the
%    array CJ, in such a way that CJ(I,R) holds the values of C
%    for the indicated values of I and R and for every value of
%    J from 1 to NBITS.  The most significant bit of CJ(I,R)
%    (not counting the sign bit) is C(I,1,R) and the least
%    significant bit is C(I,NBITS,R).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2003
%
%  Author:
%
%    Original FORTRAN77 version by Paul Bratley, Bennett Fox, Harald Niederreiter.
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    R Lidl and Harald Niederreiter,
%    Finite Fields,
%    Cambridge University Press, 1984, page 553.
%
%    Harald Niederreiter,
%    Low-discrepancy and low-dispersion sequences,
%    Journal of Number Theory,
%    Volume 30, 1988, pages 51-70.
%
%  Parameters:
%
%    Input, integer DIMEN, the dimension of the sequence to be generated.
%
%    Output, integer CJ(MAXDIM,0:NBITS-1), the packed values of
%    Niederreiter's C(I,J,R)
%
%  Local Parameters:
%
%    Local, integer MAXDIM, the maximum dimension that will be used.
%
%    Local, integer MAXE; we need MAXDIM irreducible polynomials over Z2.
%    MAXE is the highest degree among these.
%
%    Local, integer MAXV, the maximum possible index used in V.
%
%    Local, integer NBITS, the number of bits (not counting the sign) in a
%    fixed-point integer.
%
  maxdim = 20;
  maxe = 6;
  nbits = 31;

  maxv = nbits + maxe;
%
%  Here we supply the coefficients and the
%  degrees of the first MAXDIM irreducible polynomials over Z2.
%
  irred_deg(1:maxdim) = ...
    [ 1, 1, 2, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6 ];

  irred(1:maxdim,1:maxe+1) = [ ...
    0,1,0,0,0,0,0; ...
    1,1,0,0,0,0,0; ...
    1,1,1,0,0,0,0; ...
    1,1,0,1,0,0,0; ...
    1,0,1,1,0,0,0; ...
    1,1,0,0,1,0,0; ...
    1,0,0,1,1,0,0; ...
    1,1,1,1,1,0,0; ...
    1,0,1,0,0,1,0; ...
    1,0,0,1,0,1,0; ...
    1,1,1,1,0,1,0; ...
    1,1,1,0,1,1,0; ...
    1,1,0,1,1,1,0; ...
    1,0,1,1,1,1,0; ...
    1,1,0,0,0,0,1; ...
    1,0,0,1,0,0,1; ...
    1,1,1,0,1,0,1; ...
    1,1,0,1,1,0,1; ...
    1,0,0,0,0,1,1; ...
    1,1,1,0,0,1,1];
%
%  Prepare to work in Z2.
%
  [ add, mul, sub ] = setfld2 ( 0 );

  for i = 1 : dimen
%
%  For each dimension, we need to calculate powers of an
%  appropriate irreducible polynomial:  see Niederreiter
%  page 65, just below equation (19).
%
%  Copy the appropriate irreducible polynomial into PX,
%  and its degree into E.  Set polynomial B = PX ** 0 = 1.
%  M is the degree of B.  Subsequently B will hold higher
%  powers of PX.
%
    e = irred_deg(i);

    px_deg = irred_deg(i);

    for j = 0 : e
      px(j+1) = irred(i,j+1);
    end

    b_deg = 0;
    b(0+1) = 1;
%
%  Niederreiter (page 56, after equation (7), defines two
%  variables Q and U.  We do not need Q explicitly, but we do need U.
%
    u = 0;

    for j = 1 : nbits
%
%  If U = 0, we need to set B to the next power of PX
%  and recalculate V.  This is done by subroutine CALCV2.
%
      if ( u == 0 )
        [ b_deg, b, v ] = calcv2 ( maxv, px_deg, px, add, mul, sub, b_deg, b );
      end
%
%  Now C is obtained from V.  Niederreiter obtains A from V (page 65,
%  near the bottom), and then gets C from A (page 56, equation (7)).
%  However this can be done in one step.  Here CI(J,R) corresponds to
%  Niederreiter's C(I,J,R).
%
      for r = 0 : nbits-1
        ci(j,r+1) = v(r+u+1);
      end
%
%  Increment U.
%
%  If U = E, then U = 0 and in Niederreiter's
%  paper Q = Q + 1.  Here, however, Q is not used explicitly.
%
      u = u + 1;
      if ( u == e )
        u = 0;
      end

    end
%
%  The array CI now holds the values of C(I,J,R) for this value
%  of I.  We pack them into array CJ so that CJ(I,R) holds all
%  the values of C(I,J,R) for J from 1 to NBITS.
%
    for r = 0 : nbits-1
      term = 0;
      for j = 1 : nbits
        term = 2 * term + ci(j,r+1);
      end
      cj(i,r+1) = term;
    end

  end

  return
end
function [ pc_deg, pc, v ] = calcv2 ( maxv, px_deg, px, add, mul, sub, b_deg, b )

%*****************************************************************************80
%
%% CALCV2 calculates the constants V(J,R).
%
%  Discussion:
%
%    This program calculates the values of the constants V(J,R) as
%    described in the reference (BFN) section 3.3.  It is called from
%    either CALCC or CALCC2.
%
%    Polynomials stored as arrays have the coefficient of degree N
%    in POLY(N+1).
%
%    A polynomial which is identically 0 is given degree -1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2003
%
%  Author:
%
%    Original FORTRAN77 version by Paul Bratley, Bennett Fox, Harald Niederreiter.
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Harald Niederreiter,
%    Algorithm 738:
%    Programs to Generate Niederreiter's Low-Discrepancy Sequences,
%    ACM Transactions on Mathematical Software,
%    Volume 20, Number 4, pages 494-495, 1994.
%
%  Parameters:
%
%    Input, integer MAXV gives the dimension of the array V.
%
%    Input, integer PX_DEG, the degree of polynomial PX.
%
%    Input, integer PX(PXDEG+1), the appropriate irreducible polynomial
%    for the dimension currently being considered.  The degree of PX
%    will be called E.
%
%    Input, integer ADD(2,2), MUL(2,2), SUB(2,2), the addition, multiplication, 
%    and subtraction tables, mod 2.
%
%    Input, integer B_DEG, the degree of the polynomial B.
%
%    Input, integer B(B_DEG+1), the polynomial defined in section 2.3 of BFN.  
%    The degree of B implicitly define the parameter J of section 3.3, 
%    by degree(B) = E*(J-1).  On output,
%    B has been multiplied by PX, so its degree is now E * J.
%
%    Output, integer PC_DEG, the degree of the polynomial C = B * PX.
%
%    Output, integer PC(PC_DEG+1), the polynomial C = B * PX.
%
%    Output, integer V(MAXV+1), the computed V array.
%
%  Local Parameters:
%
%    Local, integer ARBIT, indicates where the user can place
%    an arbitrary element of the field of order 2.  This means
%    0 <= ARBIT < 2.
%
%    Local, integer BIGM, is the M used in section 3.3.
%    It differs from the [little] m used in section 2.3,
%    denoted here by M.
%
%    Local, integer NONZER, shows where the user must put an arbitrary
%    non-zero element of the field.  For the code, this means
%    0 < NONZER < 2.
%
  arbit = 1;
  nonzer = 1;

  e = px_deg;
%
%  The polynomial B is PX**(J-1).
%
%  In section 3.3, the values of Hi are defined with a minus sign:
%  don't forget this if you use them later!
%
  bigm = b_deg;
%
%  Multiply B by PX to compute PC = PX**J.
%  In section 2.3, the values of Bi are defined with a minus sign:
%  don't forget this if you use them later!
%
  [ pc_deg, pc ] = plymul2 ( add, mul, px_deg, px, b_deg, b );

  m = pc_deg;
%
%  We don't use J explicitly anywhere, but here it is just in case.
%
  j = m / e;
%
%  Now choose a value of Kj as defined in section 3.3.
%  We must have 0 <= Kj < E*J = M.
%  The limit condition on Kj does not seem very relevant
%  in this program.
%
  kj = bigm;
%
%  Choose values of V in accordance with the conditions in section 3.3.
%
  for r = 0 : kj-1
    v(r+1) = 0;
  end
  v(kj+1) = 1;

  if ( kj < bigm )

    term = sub ( 0+1, b(kj+1)+1 );
%
%  Check the condition of section 3.3,
%  remembering that the B's have the opposite sign.
%
    for r = kj+1 : bigm-1
      v(r+1) = arbit;
      term = sub ( term+1, mul ( b(r+1)+1, v(r+1)+1 )+1 );
    end
%
%  Now V(BIGM) is anything but TERM.
%
    v(bigm+1) = add ( nonzer+1, term+1 );

    for r = bigm+1 : m-1
      v(r+1) = arbit;
    end

  else

    for r = kj+1 : m-1
      v(r+1) = arbit;
    end

  end
%
%  Calculate the remaining V's using the recursion of section 2.3,
%  remembering that the PC's have the opposite sign.
%
  for r = 0 : maxv-m
    term = 0;
    for i = 0 : m-1
      term = sub ( term+1, mul ( pc(i+1)+1, v(r+i+1)+1 )+1 );
    end
    v(r+m+1) = term;
  end

  return
end
function k = exor ( i, j )

%*****************************************************************************80
%
%% EXOR calculates the exclusive OR of two integers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2003
%
%  Author:
%
%   John Burkardt
%
%  Reference:
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom 
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, pages 362-376, 1986.
%
%  Parameters:
%
%    Input, integer I, J, two values whose exclusive OR is needed.
%
%    Output, integer K, the exclusive OR of I and J.
%
  k = 0;
  l = 1;

  i = floor ( i );
  j = floor ( j );

  while ( i ~= 0 | j ~= 0 )
%
%  Check the current right-hand bits of I and J.
%  If they differ, set the appropriate bit of K.
%
    i2 = floor ( i / 2 );
    j2 = floor ( j / 2 );

    if ( ...
      ( ( i == 2 * i2 ) & ( j ~= 2 * j2 ) ) | ...
      ( ( i ~= 2 * i2 ) & ( j == 2 * j2 ) ) )
      k = k + l;
    end

    i = i2;
    j = j2;
    l = 2 * l;

  end

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
    fprintf ( 1, 'I4_UNIFORM - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'I4_UNIFORM - Fatal error!' );
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
function [ quasi, seed_new ] = niederreiter2 ( dim, seed )

%*****************************************************************************80
%
%% NIEDERREITER2 returns an element of the Niederreiter sequence base 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2003
%
%  Author:
%
%    Original FORTRAN77 version by Paul Bratley, Bennett Fox, Harald Niederreiter.
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Harald Niederreiter,
%    Low-discrepancy and low-dispersion sequences,
%    Journal of Number Theory,
%    Volume 30, 1988, pages 51-70.
%
%  Parameters:
%
%    Input, integer DIM, the dimension of the sequence to be generated.
%
%    Input, integer SEED, the index of the element to compute.
%
%    Output, real QUASI(DIM), the next quasirandom vector.
%
%    Output, integer SEED_NEW, the next value of the SEED.
%
%  Local Parameters:
%
%    Local, integer MAXDIM, the maximum dimension that will be used.
%
%    Local, integer NBITS, the number of bits (not counting the sign) in a
%    fixed-point integer.
%
%    Local, real RECIP is the multiplier which changes the
%    integers in NEXTQ into the required real values in QUASI.
%
%    Local, integer NR_cj(MAXDIM,NBITS), the packed values of
%    Niederreiter's C(I,J,R).
%
%    Local, integer NR_dim, the spatial dimension of the sequence
%    as specified on an initialization call.
%
%    Local, integer NR_nextq(MAXDIM), the numerators of the next item in the
%    series.  These are like Niederreiter's XI(N) (page 54) except that
%    N is implicit, and the NR_nextq are integers.  To obtain
%    the values of XI(N), multiply by RECIP.
%
  global NR_cj;
  global NR_dim;
  global NR_nextq;
  global NR_seed;

  maxdim = 20;
  nbits = 31;
  recip = 2.0E+00^(-nbits);
%
%  Initialization.
%
  if ( isempty ( NR_dim ) | dim ~= NR_dim | seed <= 0 )

    if ( dim <= 0 | maxdim < dim )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'NIEDERREITER2 - Fatal error!\n' );
      fprintf ( 1, '  Bad spatial dimension.\n' );
      error ( 'Fatal error in NIEDERREITER2!' );
    end

    NR_dim = dim;

    if ( seed < 0 )
      seed = 0;
    end

    NR_seed = seed;
%
%  Calculate the C array.
%
    NR_cj(1:dim,1:nbits) = calcc2 ( dim );

  end
%
%  Set up NEXTQ appropriately, depending on the Gray code of SEED.
%
%  You can do this every time, starting NEXTQ back at 0,
%  or you can do it once, and then carry the value of NEXTQ
%  around from the previous computation.
%
  if ( seed ~= NR_seed + 1 )

    gray = exor ( seed, seed / 2 );

    NR_nextq(1:dim) = 0;

    r = 0;

    while ( gray ~= 0 )

      if ( rem ( gray, 2 ) ~= 0 )
        for i = 1 : dim
          NR_nextq(i) = exor ( NR_nextq(i), NR_cj(i,r+1) );
        end
      end

      gray = floor ( gray / 2 );
      r = r + 1;

    end

  end
%
%  Multiply the numerators in NEXTQ by RECIP to get the next
%  quasi-random vector.
%
  quasi(1:dim) = NR_nextq(1:dim) * recip;
%
%  Find the position of the right-hand zero in SEED.  This
%  is the bit that changes in the Gray-code representation as
%  we go from SEED to SEED+1.
%
  r = 0;
  i = seed;

  while ( rem ( i, 2 ) ~= 0 )
    r = r + 1;
    i = floor ( i / 2 );
  end
%
%  Check that we have not passed 2**NBITS calls.
%
  if ( nbits <= r )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NIEDERREITER2 - Fatal error!\n' );
    fprintf ( 1, '  Too many calls!\n' );
    error ( 'Fatal error in NIEDERREITER2!' );
  end
%
%  Compute the new numerators in vector NEXTQ.
%
  for i = 1 : dim
    NR_nextq(i) = exor ( NR_nextq(i), NR_cj(i,r+1) );
  end

  NR_seed = seed;
  seed_new = seed + 1;

  return
end
function [ r, seed ] = niederreiter2_generate ( dim_num, n, seed )

%*****************************************************************************80
%
%% NIEDERREITER2_GENERATE generates a set of Niederreiter values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points desired.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real R(DIM_NUM,N), the points.
%
  r = zeros(dim_num,n);

  for j = 1 : n
    [ r(1:dim_num,j), seed ] = niederreiter2 ( dim_num, seed );
  end

  return
end
function [ pc_deg, pc ] = plymul2 ( add, mul, pa_deg, pa, pb_deg, pb )

%*****************************************************************************80
%
%% PLYMUL2 multiplies two polynomials in the field of order 2.
%
%  Discussion:
%
%    Polynomials stored as arrays have the coefficient of degree N in POLY(N+1).
%
%    A polynomial which is identically 0 is given degree -1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2003
%
%  Author:
%
%    Original FORTRAN77 version by Paul Bratley, Bennett Fox, Harald Niederreiter.
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer ADD(2,2), MUL(2,2), the addition and multiplication 
%    tables, mod 2.
%
%    Input, integer PA_DEG, the degree of polynomial A.
%
%    Input, integer PA(PA_DEG+1), the coefficients of polynomial A.
%
%    Input, integer PB_DEG, the degree of polynomial B.
%
%    Input, integer PB(PB_DEG+1), the coefficients of polynomial B.
%
%    Output, integer PC_DEG, the degree of polynomial C.
%
%    Output, integer PC(PC_DEG+1), the product polynomial, C = A * B mod 2.
%
  if ( pa_deg == -1 | pb_deg == -1 )
    pc_deg = -1;
  else
    pc_deg = pa_deg + pb_deg;
  end

  for i = 0 : pc_deg
    term = 0;
    for j = max ( 0, i-pa_deg ) : min ( pb_deg, i )
      term = add ( term+1, mul ( pa(i-j+1)+1, pb(j+1)+1 ) + 1 );
    end
    pt(i+1) = term;
  end

  for i = 0 : pc_deg
    pc(i+1) = pt(i+1);
  end

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
function [ add, mul, sub ] = setfld2 ( dummy )

%*****************************************************************************80
%
%% SETFLD2 sets up arithmetic tables for the finite field of order 2.
%
%  Discussion:
%
%    SETFLD2 sets up addition, multiplication, and subtraction tables
%    for the finite field of order 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2003
%
%  Author:
%
%    Original FORTRAN77 version by Paul Bratley, Bennett Fox, Harald Niederreiter.
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer DUMMY, a dummy argument.
%
%    Output, integer ADD(2,2), MUL(2,2), SUB(2,2), the addition, 
%    multiplication, and subtraction tables, mod 2.
%
  q = 2;

  p = 2;

  for i = 0 : 1
    for j = 0 : 1
      add(i+1,j+1) = mod ( i + j, p );
    end
  end

  for i = 0 : 1
    for j = 0 : 1
      mul(i+1,j+1) = mod ( i * j, p );
    end
  end

  for i = 0 : 1
    for j = 0 : 1
      sub(add(i+1,j+1)+1, i+1) = j;
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
