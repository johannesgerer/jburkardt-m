function n = kpu_order ( l )

%*****************************************************************************80
%
%% KPU_ORDER computes the order of a KPU rule from the level.
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
    fprintf ( 1, 'KPU_ORDER - Fatal error!\n' );
    fprintf ( 1, '  1 <= L <= 25 required.\n' );
    fprintf ( 1, '  Input L = %d\n', l );
    error ( 'KPU_ORDER - Fatal error!' );
  elseif ( l == 1 )
    n = 1;
  elseif ( l <= 3 )
    n = 3;
  elseif ( l <= 6 )
    n = 7;
  elseif ( l <= 12 )
    n = 15;
  elseif ( l <= 24 )
    n = 31;
  elseif ( l <= 25 )
    n = 63;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KPU_ORDER - Fatal error!\n' );
    fprintf ( 1, '  1 <= L <= 25 required.\n' );
    fprintf ( 1, '  Input L = %d\n', l );
    error ( 'KPU_ORDER - Fatal error!' );
  end

  return
end
