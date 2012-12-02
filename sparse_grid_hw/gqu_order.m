function n = gqu_order ( l )

%*****************************************************************************80
%
%% GQU_ORDER computes the order of a GQU rule from the level.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2012
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, integer L, the level of the rule.  
%    1 <= L.
%
%    Output, integer N, the order of the rule.
%
  if ( l < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GQU_ORDER - Fatal error!\n' );
    fprintf ( 1, '  1 <= L required.\n' );
    fprintf ( 1, '  Input L = %d\n', l );
    error (  'GQU_ORDER - Fatal error!' );
  elseif ( l <= 25 )
    n = l;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GQU_ORDER - Fatal error!\n' );
    fprintf ( 1, '  L <= 25 required.\n' );
    fprintf ( 1, '  Input L = %d\n', l );
    error (  'GQU_ORDER - Fatal error!' );
  end

  return
end
