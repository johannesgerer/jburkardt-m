function value = i4_mach ( i )

%*****************************************************************************80
%
%% I4_MACH returns integer machine constants.
%
%  Discussion:
%
%    Input/output unit numbers.
%
%      I1MACH(1) = the standard input unit.
%      I1MACH(2) = the standard output unit.
%      I1MACH(3) = the standard punch unit.
%      I1MACH(4) = the standard error message unit.
%
%    Words.
%
%      I1MACH(5) = the number of bits per integer storage unit.
%      I1MACH(6) = the number of characters per integer storage unit.
%
%    Integers.
%
%    Assume integers are represented in the S digit base A form:
%
%      Sign * (X(S-1)*A**(S-1) + ... + X(1)*A + X(0))
%
%    where 0 <= X(1:S-1) < A.
%
%      I1MACH(7) = A, the base.
%      I1MACH(8) = S, the number of base A digits.
%      I1MACH(9) = A**S-1, the largest integer.
%
%    Floating point numbers
%
%    Assume floating point numbers are represented in the T digit
%    base B form:
%
%      Sign * (B**E) * ((X(1)/B) + ... + (X(T)/B**T) )
%
%    where 0 <= X(I) < B for I=1 to T, 0 < X(1) and EMIN <= E <= EMAX.
%
%      I1MACH(10) = B, the base.
%
%    Single precision
%
%      I1MACH(11) = T, the number of base B digits.
%      I1MACH(12) = EMIN, the smallest exponent E.
%      I1MACH(13) = EMAX, the largest exponent E.
%
%    Double precision
%
%      I1MACH(14) = T, the number of base B digits.
%      I1MACH(15) = EMIN, the smallest exponent E.
%      I1MACH(16) = EMAX, the largest exponent E.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 April 2007
%
%  Author:
%
%    Original FORTRAN77 version by Phyllis Fox, Andrew Hall, Norman Schryer
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Phyllis Fox, Andrew Hall, Norman Schryer,
%    Algorithm 528,
%    Framework for a Portable Library,
%    ACM Transactions on Mathematical Software,
%    Volume 4, Number 2, June 1978, page 176-188.
%
%  Parameters:
%
%    Input, integer I, chooses the parameter to be returned.
%    1 <= I <= 16.
%
%    Output, integer VALUE, the value of the chosen parameter.
%
  if ( i < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_MACH - Fatal error!\n' );
    fprintf ( 1, '  The input argument I is out of bounds.\n' );
    fprintf ( 1, '  Legal values satisfy 1 <= I <= 16.\n' );
    fprintf ( 1, '  I = %d\n', i );
    value = 0;
    error ( 'I4_MACH - Fatal error!' );
  elseif ( i == 1 )
    value = 5;
  elseif ( i == 2 )
    value = 6;
  elseif ( i == 3 )
    value = 7;
  elseif ( i == 4 )
    value = 6;
  elseif ( i == 5 )
    value = 32;
  elseif ( i == 6 )
    value = 4;
  elseif ( i == 7 )
    value = 2;
  elseif ( i == 8 )
    value = 31;
  elseif ( i == 9 )
    value = 2147483647;
  elseif ( i == 10 )
    value = 2;
  elseif ( i == 11 )
    value = 24;
  elseif ( i == 12 )
    value = -125;
  elseif ( i == 13 )
    value = 128;
  elseif ( i == 14 )
    value = 53;
  elseif ( i == 15 )
    value = -1021;
  elseif ( i == 16 )
    value = 1024;
  elseif ( 16 < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_MACH - Fatal error!\n' );
    fprintf ( 1, '  The input argument I is out of bounds.\n' );
    fprintf ( 1, '  Legal values satisfy 1 <= I <= 16.\n' );
    fprintf ( 1, '  I = %d\n', i );
    value = 0;
    error ( 'I4_MACH - Fatal error!' );
  end

  return
end
