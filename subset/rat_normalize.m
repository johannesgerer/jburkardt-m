function [ a, b ] = rat_normalize ( a, b )

%*****************************************************************************80
%
%% RAT_NORMALIZE normalizes a rational number.
%
%  Discussion:
%
%    If A = B = 0, return.
%
%    If A = 0 (and B nonzero) set B => 1 and return.
%
%    If A nonzero, and B = 0, then A => 1 and return.
%
%    If A = B, then set A => 1, B => 1 and return.
%
%    If B < 0, then A => -A, B => -B.
%
%    If 1 < C = GCD(|A|,|B|), A => A/C, B => B/C.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, B, the rational number.
%
%    Output, integer A, B, the normalized rational number.
%

%
%  Cases where one or both is 0.
%
  if ( a == 0 & b == 0 )
    return
  elseif ( a == 0 & b ~= 0 )
    b = 1;
    return
  elseif ( a ~= 0 & b == 0 )
    a = 1;
    return
  end

  if ( a == b )
    a = 1;
    b = 1;
    return
  end

  if ( b < 0 )
    a = -a;
    b = -b;
  end

  c = i4_gcd ( abs ( a ), abs ( b ) );

  if ( 1 < c )
    a = a / c;
    b = b / c;
  end

  return
end
