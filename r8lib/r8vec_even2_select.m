function xval = r8vec_even2_select ( n, xlo, xhi, ival )

%*****************************************************************************80
%
%% R8VEC_EVEN2_SELECT returns the I-th of N evenly spaced midpoint values.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    This function returns the I-th of N evenly spaced midpoints of N
%    equal subintervals of [XLO,XHI].
%
%    XVAL = ( ( 2 * N - 2 * IVAL + 1 ) * XLO 
%           + (         2 * IVAL - 1 ) * XHI ) 
%           / ( 2 * N                )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of values.
%
%    Input, real XLO, XHI, the low and high values.
%
%    Input, integer IVAL, the index of the desired point.
%    IVAL is normally between 1 and N, but may be any integer value.
%
%    Output, real XVAL, the IVAL-th of N evenly spaced midpoints
%    between XLO and XHI.
%
  xval = ( ( 2 * n - 2 * ival + 1 ) * xlo   ...
         + (         2 * ival - 1 ) * xhi ) ...
         / ( 2 * n );

  return
end
