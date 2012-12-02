function [ t, dtdr, dtds ] = shape ( code, r, s )

%*****************************************************************************80
%
%% SHAPE evaluates shape functions for any available reference element.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string CODE, identifies the element.
%    Legal values include 'Q4', 'Q8', 'Q9', 'Q12', 'Q16', 'QL',
%    'T3', 'T4', 'T6' and 'T10'.
%
%    Input, real R, S, the reference coordinates of a point.
%
%    Output, real T(ELEMENT_ORDER), the basis functions at the point.
%
%    Output, real DTDR(ELEMENT_ORDER), the R basis derivatives at the point.
%
%    Output, real DTDS(ELEMENT_ORDER), the S basis derivatives at the point.
%
  if ( s_eqi ( code, 'Q4' ) )
    [ t, dtdr, dtds ] = shape_q4 ( r, s );
  elseif( s_eqi ( code, 'Q8' ) )
    [ t, dtdr, dtds ] = shape_q8 ( r, s );
  elseif ( s_eqi ( code, 'Q9' ) )
    [ t, dtdr, dtds ] = shape_q9 ( r, s );
  elseif ( s_eqi ( code, 'Q12' ) )
    [ t, dtdr, dtds ] = shape_q12 ( r, s );
  elseif ( s_eqi ( code, 'Q16' ) )
    [ t, dtdr, dtds ] = shape_q16 ( r, s );
  elseif ( s_eqi ( code, 'QL' ) )
    [ t, dtdr, dtds ] = shape_ql ( r, s );
  elseif ( s_eqi ( code, 'T3' ) )
    [ t, dtdr, dtds ] = shape_t3 ( r, s );
  elseif ( s_eqi ( code, 'T4' ) )
    [ t, dtdr, dtds ] = shape_t4 ( r, s );
  elseif ( s_eqi ( code, 'T6' ) )
    [ t, dtdr, dtds ] = shape_t6 ( r, s );
  elseif ( s_eqi ( code, 'T10' ) )
    [ t, dtdr, dtds ] = shape_t10 ( r, s );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SHAPE - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized code = "%s"\n', code );
    error ( 'SHAPE - Fatal error!' );
  end

  return
end
