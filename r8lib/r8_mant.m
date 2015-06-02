function [ s, r, l ] = r8_mant ( x )

%*****************************************************************************80
%
%% R8_MANT computes the "mantissa" or "fraction part" of X.
%
%  Formula:
%
%    X = S * R * 2^L
%
%    S is +1 or -1,
%    R is a real value between 1.0 and 2.0,
%    L is an integer.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number to be decomposed.
%
%    Output, integer S, the "sign" of the number.
%    S will be -1 if X is less than 0, and +1 if X is greater
%    than or equal to zero.
%
%    Output, real R, the mantissa of X.  R will be greater
%    than or equal to 1, and strictly less than 2.  The one
%    exception occurs if X is zero, in which case R will also
%    be zero.
%
%    Output, integer L, the integer part of the logarithm (base 2) of X.
%

%
%  Determine the sign.
%
  if ( x < 0.0 )
    s = -1;
  else
    s = 1;
  end
%
%  Set R to the absolute value of X, and L to zero.
%  Then force R to lie between 1 and 2.
%
  if ( x < 0.0 )
    r = -x;
  else
    r = x;
  end

  l = 0;
%
%  Time to bail out if X is zero.
%
  if ( x == 0.0 )
    return
  end

  while ( 2.0 <= r )
    r = r / 2.0;
    l = l + 1;
  end

  while ( r < 1.0 )
    r = r * 2.0;
    l = l - 1;
  end

  return
end

