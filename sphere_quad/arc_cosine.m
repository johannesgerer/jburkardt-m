function value = arc_cosine ( c )

%*******************************************************************************
%
%% ARC_COSINE computes the arc cosine function, with argument truncation.
%
%  Discussion:
%
%    If you call your system ACOS routine with an input argument that is
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
%    Input, real C, the argument.
%
%    Output, real VALUE, an angle whose cosine is C.
%
  c2 = c;
  c2 = max ( c2, -1.0 );
  c2 = min ( c2, +1.0 );

  value = acos ( c2 );

  return
end
