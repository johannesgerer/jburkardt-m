function [ r, s, area ] = node_reference ( code )

%*****************************************************************************80
%
%% NODE_REFERENCE returns the basis nodes for any available element.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character CODE(*), identifies the element desired.
%    Legal values include 'Q4', 'Q8', 'Q9', 'Q12', 'Q16', 'QL',
%    'T3', 'T4', 'T6' and 'T10'.
%
%    Output, real R(N), S(N), the coordinates of the basis nodes.
%
%    Output, real AREA, the area of the element.
%
  if ( s_eqi ( code, 'Q4' ) )
    [ r, s, area ] = node_reference_q4 ( );
  elseif ( s_eqi ( code, 'Q8' ) )
    [ r, s, area ] = node_reference_q8 ( );
  elseif ( s_eqi ( code, 'Q9' ) )
    [ r, s, area ] = node_reference_q9 ( );
  elseif ( s_eqi ( code, 'Q12' ) )
    [ r, s, area ] = node_reference_q12 ( );
  elseif ( s_eqi ( code, 'Q16' ) )
    [ r, s, area ] = node_reference_q16 ( );
  elseif ( s_eqi ( code, 'QL' ) )
    [ r, s, area ] = node_reference_ql ( );
  elseif ( s_eqi ( code, 'T3' ) )
    [ r, s, area ] = node_reference_t3 ( );
  elseif ( s_eqi ( code, 'T4' ) )
    [ r, s, area ] = node_reference_t4 ( );
  elseif ( s_eqi ( code, 'T6' ) )
    [ r, s, area ] = node_reference_t6 ( );
  elseif ( s_eqi ( code, 'T10' ) )
    [ r, s, area ] = node_reference_t10 ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NODE_REFERENCE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of CODE = "%s"\n', code );
    error ( 'NODE_REFERENCE - Fatal error!' );
  end

  return
end
