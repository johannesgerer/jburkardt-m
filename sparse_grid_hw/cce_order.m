function n = cce_order ( l )

%*****************************************************************************80
%
%% CCE_ORDER: order of a Clenshaw-Curtis Exponential rule from the level.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2014
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
    fprintf ( 1, 'CCE_ORDER - Fatal error!\n' );
    fprintf ( 1, '  1 <= L required.\n' );
    fprintf ( 1, '  Input L = %d\n', l );
    error ( 'CCE_ORDER - Fatal error!' );
  elseif ( l == 1 )
    n = 1;
  else
    n = 2 ^ ( l - 1 ) + 1;
  end

  return
end
