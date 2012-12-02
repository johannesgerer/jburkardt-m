function [ ibeta, it, irnd, ngrd, machep, negep, iexp, minexp, ...
  maxexp, eps, epsneg, xmin, xmax ] = r4_machar ( dummy )

%*****************************************************************************80
%
%% R4_MACHAR determines single precision real machine constants.
%
%  Discussion:
%
%    This routine determines the parameters of the single precision
%    real arithmetic system.  The determination of the first
%    three uses an extension of an algorithm due to Malcolm,
%    incorporating some of the improvements suggested by Gentleman and
%    Marovich.
%
%    This routine appeared as ACM algorithm 665.
%
%    An earlier version of this program was published in Cody and Waite.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 November 2006
%
%  Author:
%
%    Original FORTRAN77 version by William Cody
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    William Cody,
%    ACM Algorithm 665, MACHAR, a routine to dynamically determine
%    machine parameters,
%    ACM Transactions on Mathematical Software,
%    Volume 14, Number 4, pages 303-311, 1988.
%
%    William Cody, William Waite,
%    Software Manual for the Elementary Functions,
%    Prentice Hall, 1980.
%
%    Morvern Gentleman, Scott Marovich,
%    Communications of the ACM,
%    Volume 17, pages 276-277, 1974.
%
%    Michael Malcolm,
%    Communications of the ACM,
%    Volume 15, pages 949-951, 1972.
%
%  Parameters:
%
%    Output, integer IBETA, the radix for the floating-point representation.
%
%    Output, integer IT, the number of base IBETA digits in the floating-point
%    significand.
%
%    Output, integer IRND:
%    0, if floating-point addition chops.
%    1, if floating-point addition rounds, but not in the IEEE style.
%    2, if floating-point addition rounds in the IEEE style.
%    3, if floating-point addition chops, and there is partial underflow.
%    4, if floating-point addition rounds, but not in the IEEE style, and
%      there is partial underflow.
%    5, if floating-point addition rounds in the IEEE style, and there is
%      partial underflow.
%
%    Output, integer NGRD, the number of guard digits for multiplication with
%    truncating arithmetic.  It is
%    0, if floating-point arithmetic rounds, or if it truncates and only
%      IT base IBETA digits participate in the post-normalization shift of the
%      floating-point significand in multiplication;
%    1, if floating-point arithmetic truncates and more than IT base IBETA
%      digits participate in the post-normalization shift of the floating-point
%      significand in multiplication.
%
%    Output, integer MACHEP, the largest negative integer such that
%      1.0 < 1.0 + real ( IBETA )^MACHEP,
%    except that MACHEP is bounded below by - ( IT + 3 ).
%
%    Output, integer NEGEPS, the largest negative integer such that
%      1.0 - real ( IBETA )^NEGEPS < 1.0,
%    except that NEGEPS is bounded below by - ( IT + 3 ).
%
%    Output, integer IEXP, the number of bits (decimal places if IBETA = 10)
%    reserved for the representation of the exponent (including the bias or
%    sign) of a floating-point number.
%
%    Output, integer MINEXP, the largest in magnitude negative integer such
%    that
%      real ( IBETA )^MINEXP
%    is positive and normalized.
%
%    Output, integer MAXEXP, the smallest positive power of BETA that overflows.
%
%    Output, single precision real EPS, the smallest positive floating-point
%    number such that
%      1.0 + EPS ~= 1.0.
%    in particular, if either IBETA = 2  or IRND = 0,
%      EPS = real ( IBETA )^MACHEP.
%    Otherwise,
%      EPS = ( real ( IBETA )^MACHEP ) / 2.
%
%    Output, single precision real EPSNEG, a small positive floating-point 
%    number such that
%      1.0 - EPSNEG < 1.0.
%    In particular, if IBETA = 2 or IRND = 0,
%      EPSNEG = real ( IBETA )^NEGEPS.
%    Otherwise,
%      EPSNEG = ( real ( IBETA )^NEGEPS ) / 2.
%    Because NEGEPS is bounded below by - ( IT + 3 ), EPSNEG might not be the
%    smallest number that can alter 1.0 by subtraction.
%
%    Output, single precision real XMIN, the smallest non-vanishing normalized
%    floating-point power of the radix:
%      XMIN = real ( IBETA )^MINEXP
%
%    Output, single precision real XMAX, the largest finite floating-point 
%    number.  In particular,
%      XMAX = ( 1.0 - EPSNEG ) * real ( IBETA )^MAXEXP
%    On some machines, the computed value of XMAX will be only the second,
%    or perhaps third, largest number, being too small by 1 or 2 units in
%    the last digit of the significand.
%

%
%  To enforce the single precision arithmetic, we essentially have
%  to "declare" our real variables, by creating them with the SINGLE
%  function.
%
  a = single ( 0.0 );
  b = single ( 0.0 );
  beta = single ( 0.0 );
  betah = single ( 0.0 );
  betain = single ( 0.0 );
  eps = single ( 0.0 );
  epsneg = single ( 0.0 );
  one = single ( 0.0 );
  t = single ( 0.0 );
  temp = single ( 0.0 );
  temp1 = single ( 0.0 );
  tempa = single ( 0.0 );
  two = single ( 0.0 );
  xmax = single ( 0.0 );
  xmin = single ( 0.0 );
  y = single ( 0.0 );
  z = single ( 0.0 );
  zero = single ( 0.0 );

  one = single ( 1 );
  two = single ( one + one );
  zero = single ( one - one );
%
%  Determine IBETA and BETA ala Malcolm.
%
  a = single ( one );

  while ( 1 )

    a = single ( a + a );
    temp = single ( a + one );
    temp1 = single ( temp - a );

    if ( single ( temp1 - one ) ~= zero )
      break
    end

  end

  b = single ( one );

  while ( 1 )

    b = single ( b + b );
    temp = single ( a + b );
    itemp = floor ( temp - a );

    if ( itemp ~= 0 )
      break
    end

  end

  ibeta = itemp;
  beta = single ( ibeta );
%
%  Determine IT and IRND.
%
  it = 0;
  b = single ( one );

  while ( 1 )

    it = it + 1;
    b = single ( b * beta );
    temp = single ( b + one );
    temp1 = single ( temp - b );

    if ( single ( temp1 - one ) ~= zero )
      break
    end

  end

  irnd = 0;
  betah = single ( beta / two );
  temp = single ( a + betah );

  if ( single ( temp - a ) ~= zero )
    irnd = 1;
  end

  tempa = single ( a + beta );
  temp = single ( tempa + betah );

  if ( irnd == 0 & single ( temp - tempa ) ~= zero )
    irnd = 2;
  end
%
%  Determine NEGEP and EPSNEG.
%
  negep = it + 3;
  betain = single ( one / beta );
  a = single ( one );
  for i = 1 : negep
    a = single ( a * betain );
  end

  b = single ( a );

  while ( 1 )

    temp = single ( one - a );

    if ( single ( temp - one ) ~= zero )
      break
    end

    a = single ( a * beta );
    negep = negep - 1;

  end

  negep = -negep;
  epsneg = single ( a );

  if ( ibeta ~= 2 & irnd ~= 0 )

    a = single ( ( a * ( one + a ) ) / two );
    temp = single ( one - a );

    if ( single ( temp - one ) ~= zero )
      epsneg = single ( a );
    end

  end
%
%  Determine MACHEP and EPS.
%
  machep = - it - 3;
  a = single ( b );

  while ( 1 )

    temp = single ( one + a );

    if ( single ( temp - one ) ~= zero ) 
      break
    end

    a = single ( a * beta );
    machep = machep + 1;

  end

  eps = single ( a );
  temp = single ( tempa + beta * ( one + eps ) );

  if ( ibeta ~= 2 & irnd ~= 0 )

    a = single ( ( a * ( one + a ) ) / two );
    temp = single ( one + a );

    if ( single ( temp - one ) ~= zero )
      eps = a;
    end

  end
%
%  Determine NGRD.
%
  ngrd = 0;
  temp = single ( one + eps );

  if ( irnd == 0 & single ( temp * one - one ) ~= zero )
    ngrd = 1;
  end
%
%  Determine IEXP, MINEXP and XMIN.
%
%  Loop to determine largest I and K = 2^I such that (1/BETA)^(2^(I))
%  does not underflow.  Exit from loop is signaled by an underflow.
%
  i = 0;
  k = 1;
  z = single ( betain );
  t = single ( one + eps );
  nxres = 0;

  while ( 1 )

    y = single ( z );
    z = single ( y * y );

    a = single ( z * one );
    temp = single ( z * t );

    if ( single ( a + a ) == zero | y <= abs ( z ) )
      break
    end

    temp1 = single ( temp * betain );

    if ( single ( temp1 * beta ) == z )
      break
    end

    i = i + 1;
    k = k + k;

  end
%
%  This segment is for nondecimal machines.
%
  if ( ibeta ~= 10 )

    iexp = i + 1;
    mx = k + k;
%
%  This segment is for decimal machines only.
%
  else

    iexp = 2;
    iz = ibeta;

    while ( 1 )

      if ( k < iz )
        break
      end

      iz = iz * ibeta;
      iexp = iexp + 1;

    end

    mx = iz + iz - 1;

  end
%
%  Loop to determine MINEXP, XMIN.
%  Exit from loop is signaled by an underflow.
%
  while ( 1 )

    xmin = single ( y );
    y = single ( y * betain );

    a = single ( y * one );
    temp = single ( y * t );

    if ( single ( a + a ) == zero | xmin <= abs ( y ) )
      break
    end

    k = k + 1;
    temp1 = single ( temp * betain );

    if ( single ( temp1 * beta ) == y )
      nxres = 3;
      xmin = single ( y );
      break
    end

  end

  minexp = -k;
%
%  Determine MAXEXP and XMAX.
%
  if ( mx <= k + k - 3 & ibeta ~= 10 )
    mx = mx + mx;
    iexp = iexp + 1;
  end

  maxexp = mx + minexp;
%
%  Adjust IRND to reflect partial underflow.
%
  irnd = irnd + nxres;
%
%  Adjust for IEEE-style machines.
%
  if ( irnd == 2 | irnd == 5 )
    maxexp = maxexp - 2;
  end
%
%  Adjust for non-IEEE machines with partial underflow.
%
  if ( irnd == 3 | irnd == 4 )
    maxexp = maxexp - it;
  end
%
%  Adjust for machines with implicit leading bit in binary significand,
%  and machines with radix point at extreme right of significand.
%
  i = maxexp + minexp;

  if ( ibeta == 2 & i == 0 )
    maxexp = maxexp - 1;
  end

  if ( 20 < i )
    maxexp = maxexp - 1;
  end

  if ( a ~= y )
    maxexp = maxexp - 2;
  end

  xmax = single ( one - epsneg );

  if ( single ( xmax * one ) ~= xmax )
    xmax = single ( one - beta * epsneg );
  end

  xmax = single ( xmax / ( beta * beta * beta * xmin ) );

  i = maxexp + minexp + 3;

  for j = 1 : i

    if ( ibeta == 2 )
      xmax = single ( xmax + xmax );
    else
      xmax = single ( xmax * beta );
    end

  end

  return
end
