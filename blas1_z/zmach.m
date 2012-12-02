function value = zmach ( job )

%*****************************************************************************80
%
%% ZMACH computes machine parameters for complex arithmetic.
%
%  Discussion:
%
%    Assume the computer has
%
%      B = base of arithmetic;
%      T = number of base B digits;
%      L = smallest possible exponent;
%      U = largest possible exponent;
%
%    then
%
%      EPS = B**(1-T)
%      TINY = 100.0 * B**(-L+T)
%      HUGE = 0.01 * B**(U-T)
%
%    If complex division is done by
%
%      1 / (X+i*Y) = (X-i*Y) / (X**2+Y**2)
%
%    then
%
%      TINY = sqrt ( TINY )
%      HUGE = sqrt ( HUGE )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2009
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
%
%    Charles Lawson, Richard Hanson, David Kincaid, Fred Krogh,
%    Basic Linear Algebra Subprograms for FORTRAN usage,
%    ACM Transactions on Mathematical Software,
%    Volume 5, Number 3, pages 308-323, 1979.
%
%  Parameters:
%
%    Input, integer JOB:
%    1, EPS is desired;
%    2, TINY is desired;
%    3, HUGE is desired.
%
%    Output, real VALUE, the requested value.
%
  epsilon = 1.0;

  while ( 1 )

    epsilon = epsilon / 2.0;
    s = 1.0 + epsilon;
    if ( s <= 1.0 )
      break
    end

  end

  epsilon = 2.0 * epsilon;

  s = 1.0;

  while ( 1 )

    tiny = s;
    s = s / 16.0;

    if ( s * 1.0 == 0.0 )
      break
    end

  end

  tiny = ( tiny / eps ) * 100.0;

  s = ( 1 + i ) / ( tiny + tiny * i );

  if ( s ~= 1.0 / tiny )
    tiny = sqrt ( tiny );
  end

  huge = 1.0 / tiny;

  if ( job == 1 )
    value = epsilon;
  elseif ( job == 2 )
    value = tiny;
  elseif ( job == 3 )
    value = huge;
  else
    value = 0.0;
  end

  return
end
