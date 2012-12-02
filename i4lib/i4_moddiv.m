function [ m, r ] = i4_moddiv ( n, d )

%*****************************************************************************80
%
%% I4_MODDIV breaks a number into a multiple of a divisor and remainder.
%
%  Discussion:
%
%    N = M * D + R
%
%    0 <= || R || < || D ||
%
%    R has the sign of N.
%
%  Example:
%
%    N         D       M      R
%
%   107       50      2      7
%   107      -50     -2      7
%  -107       50     -2     -7
%  -107      -50      2     -7
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number to be decomposed.
%
%    Input, integer D, the divisor.  D may not be zero.
%
%    Output, integer M, the number of times N
%    is evenly divided by D.
%
%    Output, integer R, a remainder.
%
  if ( d == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_MODDIV - Fatal error!\n' );
    fprintf ( 1, '  Input divisor D = 0\n' );
    error ( 'I4_MODDIV - Fatal error!' );
  end

  m = floor ( n / d );
  r = n - d * m;

  return
end
