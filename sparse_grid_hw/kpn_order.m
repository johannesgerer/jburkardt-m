function n = kpn_order ( l )

%*****************************************************************************80
%
%% KPN_ORDER computes the order of a KPN rule from the level.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 May 2012
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, integer L, the level of the rule.
%    1 <= L <= 25
%
%    Output, integer N, the order of the rule.
%
  if ( l < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KPN_ORDER - Fatal error!\n' );
    fprintf ( 1, '  1 <= L <= 25 required.\n' );
    fprintf ( 1, '  Input L = %d\n', l );
    error ( 'KPN_ORDER - Fatal error!' );
  elseif ( l == 1 )
    n = 1;
  elseif ( l <= 3 )
    n = 3;
  elseif ( l == 4 )
    n = 7;
  else if ( l <= 8 )
    n = 9;
  elseif ( l == 9 )
    n = 17;
  elseif ( l <= 15 )
    n = 19;
  elseif ( l == 16 )
    n = 31;
  elseif ( l == 17 )
    n = 33;
  elseif ( l <= 25 )
    n = 35;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KPN_ORDER - Fatal error!\n' );
    fprintf ( 1, '  1 <= L <= 25 required.\n' );
    fprintf ( 1, '  Input L = %d\n', l );
    error ( 'KPN_ORDER - Fatal error!' );
  end

  return
end
