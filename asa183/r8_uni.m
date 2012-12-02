function [ r, s1, s2 ] = r8_uni ( s1, s2 )

%*****************************************************************************80
%
%% R8_UNI returns a pseudorandom number between 0 and 1.
%
%  Discussion:
%
%    This function generates uniformly distributed pseudorandom numbers
%    between 0 and 1, using the 32-bit generator from figure 3 of
%    the article by L'Ecuyer.
%
%    The cycle length is claimed to be 2.30584E+18.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 July 2008
%
%  Author:
%
%    Original PASCAL version by Pierre L'Ecuyer.
%    Modifications by John Burkardt.
%
%  Reference:
%
%    Pierre LEcuyer,
%    Efficient and Portable Combined Random Number Generators,
%    Communications of the ACM,
%    Volume 31, Number 6, June 1988, pages 742-751.
%
%  Parameters:
%
%    Input, integer S1, S2, two values used as the
%    seed for the sequence.  On first call, the user should initialize
%    S1 to a value between 1 and 2147483562;  S2 should be initialized
%    to a value between 1 and 2147483398.
%
%    Output, real R, the next value in the sequence.
%
%    Output, integer S1, S2, updated seed values.
%
  k = floor ( s1 / 53668 );
  s1 = 40014 * ( s1 - k * 53668 ) - k * 12211;
  if ( s1 < 0 )
    s1 = s1 + 2147483563;
  end

  k = floor ( s2 / 52774 );
  s2 = 40692 * ( s2 - k * 52774 ) - k * 3791;
  if ( s2 < 0 )
    s2 = s2 + 2147483399;
  end

  z = s1 - s2;
  if ( z < 1 )
    z = z + 2147483562;
  end

  r = z / 2147483563.0;

  return
end
