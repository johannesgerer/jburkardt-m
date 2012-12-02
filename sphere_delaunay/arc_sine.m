function value = arc_sine ( s )

%*****************************************************************************80
%
%% ARC_SINE computes the arc sine function, with argument truncation.
%
%  Discussion:
%
%    If you call your system ASIN routine with an input argument that is
%    even slightly outside the range [-1.0, 1.0 ], you may get an unpleasant 
%    surprise (I did).
%
%    This routine simply truncates arguments outside the range.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2005
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
  s2 = s;
  s2 = max ( s2, -1.0 );
  s2 = min ( s2, +1.0 );

  value = asin ( s2 );

  return
end
