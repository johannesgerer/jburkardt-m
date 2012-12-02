function n = ccu_order ( l )

%*****************************************************************************80
%
%% CCU_ORDER computes the order of a CCU rule from the level.
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
    fprintf ( 1, 'CCU_ORDER - Fatal error!\n' );
    fprintf ( 1, '  1 <= L required.\n' );
    fprintf ( 1, '  Input L = %d\n', l );
    error ( 'CCU_ORDER - Fatal error!' );
  elseif ( l == 1 )
    n = 1;
  else
    n = 2 ^ ( l - 1 ) + 1;
  end

  return
end
