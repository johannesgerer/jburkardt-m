function value = arc_cosine ( c )

%*****************************************************************************80
%
%% ARC_COSINE computes the arc cosine function, with argument truncation.
%
%  Discussion:
%
%    If you call your system ACOS routine with an input argument that is
%    outside the range [-1.0, 1.0 ], you may get an unpleasant surprise.
%    This routine truncates arguments outside the range.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real C, the argument.
%
%    Output, real ARC_COSINE, an angle whose cosine is C.
%
  c = max ( c, -1.0 );
  c = min ( c, +1.0 );

  value = acos ( c );

  return
end
