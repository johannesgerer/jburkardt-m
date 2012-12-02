function value = arc_sine ( s )

%*****************************************************************************80
%
%% ARC_SINE computes the arc sine function, with argument truncation.
%
%  Discussion:
%
%    If you call your system ASIN routine with an input argument that is
%    outside the range [-1.0, 1.0 ], you may get an unpleasant surprise.
%    This routine truncates arguments outside the range.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real S, the argument.
%
%    Output, real VALUE, an angle whose sine is S.
%
  s = max ( s, -1.0 );
  s = min ( s, +1.0 );

  value = asin ( s );

  return
end
