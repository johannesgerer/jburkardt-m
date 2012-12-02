function xval = r8vec_even_select ( n, xlo, xhi, ival )

%*****************************************************************************80
%
%% R8VEC_EVEN_SELECT returns the I-th of N evenly spaced values in [ XLO, XHI ].
%
%  Discussion:
%
%    XVAL = ( (N-IVAL) * XLO + (IVAL-1) * XHI ) / dble ( N - 1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 November 2004
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
%    IVAL is normally between 1 and N, but may be any
%    integer value.
%
%    Output, real XVAL, the IVAL-th of N evenly spaced values
%    between XLO and XHI.
%
%    Unless N = 1, X(1) = XLO and X(N) = XHI.
%
%    If N = 1, then X(1) = 0.5*(XLO+XHI).
%
  if ( n == 1 )

    xval = 0.5 * ( xlo + xhi );

  else

    xval = ( ( n - ival     ) * xlo   ...
           + (     ival - 1 ) * xhi ) ...
           / ( n        - 1 );

  end

  return
end
