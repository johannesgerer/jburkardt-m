function xround = r8_roundb ( ibase, nplace, x )

%*****************************************************************************80
%
%% R8_ROUNDB rounds a number to a given number of digits in a given base.
%
%  Discussion:
%
%    The code does not seem to do a good job of rounding when
%    the base is negative!
%
%    Assume that the input quantity X has the form
%
%      X = S * J * IBASE**L
%
%    where S is plus or minus 1, L is an integer, and J is a
%    mantissa base IBASE which is either exactly zero, or greater
%    than or equal to (1/IBASE) and less than 1.0.
%
%    Then on return, XROUND will satisfy
%
%      XROUND = S * K * IBASE**L
%
%    where S and L are unchanged, and K is a mantissa base IBASE
%    which agrees with J in the first NPLACE digits and is zero
%    thereafter.
%
%    Note that because of rounding, for most bases, most numbers
%    with a fractional quantities cannot be stored exactly in the
%    computer, and hence will have trailing "bogus" digits.
%
%    If NPLACE is 0, XROUND will always be zero.
%
%    If NPLACE is 1, the mantissa of XROUND will be 0,
%    1/IBASE, 2/IBASE, ..., (IBASE-1)/IBASE.
%
%    If NPLACE is 2, the mantissa of XROUND will be 0,
%    IBASE/IBASE**2, (IBASE+1)/IBASE**2, ...,
%    IBASE**2-2/IBASE**2, IBASE**2-1/IBASE**2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer IBASE, the base of the arithmetic.
%    IBASE must not be zero.  Theoretically, IBASE may be negative.
%
%    Input, integer NPLACE, the number of digits base IBASE to
%    preserve.  NPLACE should be 0 or positive.
%
%    Input, real X, the number to be decomposed.
%
%    Output, real XROUND, the rounded value of X.
%
  xround = 0.0;
%
%  0: Error checks.
%
  if ( ibase == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_ROUNDB - Fatal error!\n' );
    fprintf ( 1, '  The base IBASE cannot be zero.\n' );
    error ( 'R8_ROUNDB - Fatal error!' );
  end
%
%  1: Handle the special case of 0.
%
  if ( x == 0.0 )
    return
  end

  if ( nplace <= 0 )
    return
  end
%
%  2: Determine the sign IS.
%
  if ( 0.0 < x )
    is = 1;
    xtemp = x;
  else
    is = -1;
    xtemp = -x;
  end
%
%  3: Force XTEMP to lie between 1 and ABS(IBASE), and compute the
%  logarithm L.
%
  l = 0;

  while ( abs ( ibase ) <= abs ( xtemp ) )

    xtemp = xtemp / ibase;

    if ( xtemp < 0.0 )
      is = -is;
      xtemp = -xtemp;
    end

    l = l + 1;

  end

  while ( abs ( xtemp ) < 1.0 )

    xtemp = xtemp * ibase;

    if ( xtemp < 0.0 ) 
      is = -is;
      xtemp = -xtemp;
    end

    l = l - 1;

  end
%
%  4: Now strip out the digits of the mantissa as XMANT, and
%  decrease L.
%
  xmant = 0.0;
  iplace = 0;
  js = is;

  while ( 1 )

    xmant = ibase * xmant;

    if ( xmant < 0.0 )
      js = -js;
      xmant = -xmant;
    end

    if ( 1.0 <= xtemp )
      xmant = xmant + floor ( xtemp );
      xtemp = xtemp - floor ( xtemp );
    end

    iplace = iplace + 1;

    if ( xtemp == 0.0 || nplace <= iplace )
      xround = js * xmant * ibase ^ l;
      break
    end

    l = l - 1;
    xtemp = xtemp * ibase;

    if ( xtemp < 0.0 )
      is = -is;
      xtemp = -xtemp;
    end

  end

  return
end
