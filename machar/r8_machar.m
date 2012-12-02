function [ ibeta, it, irnd, ngrd, machep, negep, iexp, minexp, ...
  maxexp, eps, epsneg, xmin, xmax ] = r8_machar ( )

%*****************************************************************************80
%
%% R8_MACHAR determines double precision real machine constants.
%
%  Discussion:
%
%    This routine determines the parameters of the double precision
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
%    01 October 2011
%
%  Author:
%
%    Original FORTRAN77 version by William Cody.
%    MATLAB version by John Burkardt.
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
%    Output, real EPS, the smallest positive floating-point number
%    such that
%      1.0 + EPS ~= 1.0.
%    in particular, if either IBETA = 2  or IRND = 0,
%      EPS = real ( IBETA )^MACHEP.
%    Otherwise,
%      EPS = ( real ( IBETA )^MACHEP ) / 2.
%
%    Output, real EPSNEG, a small positive floating-point number
%    such that
%      1.0 - EPSNEG < 1.0.
%    In particular, if IBETA = 2 or IRND = 0,
%      EPSNEG = real ( IBETA )^NEGEPS.
%    Otherwise,
%      EPSNEG = ( real ( IBETA )^NEGEPS ) / 2.
%    Because NEGEPS is bounded below by - ( IT + 3 ), EPSNEG might not be the
%    smallest number that can alter 1.0 by subtraction.
%
%    Output, real XMIN, the smallest non-vanishing normalized
%    floating-point power of the radix:
%      XMIN = real ( IBETA )^MINEXP
%
%    Output, real XMAX, the largest finite floating-point number.
%    In particular,
%      XMAX = ( 1.0 - EPSNEG ) * real ( IBETA )^MAXEXP
%    On some machines, the computed value of XMAX will be only the second,
%    or perhaps third, largest number, being too small by 1 or 2 units in
%    the last digit of the significand.
%
  one = 1;
  two = one + one;
  zero = one - one;
%
%  Determine IBETA and BETA ala Malcolm.
%
  a = one;

  while ( 1 )

    a = a + a;
    temp = a + one;
    temp1 = temp - a;

    if ( temp1 - one ~= zero )
      break
    end

  end

  b = one;

  while ( 1 )

    b = b + b;
    temp = a + b;
    itemp = floor ( temp - a );

    if ( itemp ~= 0 )
      break
    end

  end

  ibeta = itemp;
  beta = ibeta;
%
%  Determine IT and IRND.
%
  it = 0;
  b = one;

  while ( 1 )

    it = it + 1;
    b = b * beta;
    temp = b + one;
    temp1 = temp - b;

    if ( temp1 - one ~= zero )
      break
    end

  end

  irnd = 0;
  betah = beta / two;
  temp = a + betah;

  if ( temp - a ~= zero )
    irnd = 1;
  end

  tempa = a + beta;
  temp = tempa + betah;

  if ( irnd == 0 & temp - tempa ~= zero )
    irnd = 2;
  end
%
%  Determine NEGEP and EPSNEG.
%
  negep = it + 3;
  betain = one / beta;
  a = one;
  for i = 1 : negep
    a = a * betain;
  end

  b = a;

  while ( 1 )

    temp = one - a;

    if ( temp - one ~= zero )
      break
    end

    a = a * beta;
    negep = negep - 1;

  end

  negep = -negep;
  epsneg = a;

  if ( ibeta ~= 2 & irnd ~= 0 )

    a = ( a * ( one + a ) ) / two;
    temp = one - a;

    if ( temp - one ~= zero )
      epsneg = a;
    end

  end
%
%  Determine MACHEP and EPS.
%
  machep = -it - 3;
  a = b;

  while ( 1 )

    temp = one + a;

    if ( temp - one ~= zero ) 
      break
    end

    a = a * beta;
    machep = machep + 1;

  end

  eps = a;
  temp = tempa + beta * ( one + eps );

  if ( ibeta ~= 2 & irnd ~= 0 )

    a = ( a * ( one + a ) ) / two;
    temp = one + a;

    if ( temp - one ~= zero )
      eps = a;
    end

  end
%
%  Determine NGRD.
%
  ngrd = 0;
  temp = one + eps;

  if ( irnd == 0 & temp * one - one ~= zero )
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
  z = betain;
  t = one + eps;
  nxres = 0;

  while ( 1 )

    y = z;
    z = y * y;

    a = z * one;
    temp = z * t;

    if ( a + a == zero | y <= abs ( z ) )
      break
    end

    temp1 = temp * betain;

    if ( temp1 * beta == z )
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

    xmin = y;
    y = y * betain;

    a = y * one;
    temp = y * t;

    if ( a + a == zero | xmin <= abs ( y ) )
      break
    end

    k = k + 1;
    temp1 = temp * betain;

    if ( temp1 * beta == y )
      nxres = 3;
      xmin = y;
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

  xmax = one - epsneg;

  if ( xmax * one ~= xmax )
    xmax = one - beta * epsneg;
  end

  xmax = xmax / ( beta * beta * beta * xmin );

  i = maxexp + minexp + 3;

  for j = 1 : i

    if ( ibeta == 2 )
      xmax = xmax + xmax;
    else
      xmax = xmax * beta;
    end

  end

  return
end
