function value = smach ( job )

%*****************************************************************************80
%
%% SMACH computes machine parameters of floating point arithmetic.
%
%  Discussion:
%
%    This routine is for testing only.  It is not required by LINPACK.
%
%    If there is trouble with the automatic computation of these quantities,
%    they can be set by direct assignment statements.
%    We assume the computer has
%
%      B = base of arithmetic
%      T = number of base B digits
%      L = smallest possible exponent
%      u = largest possible exponent
%
%    then
%
%      EPS = B**(1-T)
%      TINY = 100.0D+00 *B**(-L+T)
%      HUGE = 0.01D+00 *B**(U-T)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2005
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch and Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
%
%    Charles Lawson, Richard Hanson, David Kincaid, Fred Krogh,
%    Basic Linear Algebra Subprograms for Fortran Usage,
%    Algorithm 539,
%    ACM Transactions on Mathematical Software,
%    Volume 5, Number 3, September 1979, pages 308-323.
%
%  Parameters:
%
%    Input, integer JOB:
%    1: requests EPSILON;
%    2: requests TINY;
%    3: requests HUGE.
%
%    Output, real VALUE, the requested value.
%
  s = 1.0;

  while ( 1 )

    tiny = s;
    s = s / 2.0;

    if ( s * 1.0 == 0.0 | s == 0.0 )
      break
    end

  end

  tiny = ( tiny / eps ) * 100.0;
  huge = 1.0 / tiny;

  if ( job == 1 )
    value = eps;
  elseif ( job == 2 )
    value = tiny;
  elseif ( job == 3 )
    value = huge;
  else
    xerbla ( 'SMACH', 1 );
  end

  return
end
