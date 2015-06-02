function suborder_num = fekete_suborder_num ( rule )

%*****************************************************************************80
%
%% FEKETE_SUBORDER_NUM returns the number of suborders for a Fekete rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Mark Taylor, Beth Wingate, Rachel Vincent,
%    An Algorithm for Computing Fekete Points in the Triangle,
%    SIAM Journal on Numerical Analysis,
%    Volume 38, Number 5, 2000, pages 1707-1720.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Output, integer SUBORDER_NUM, the number of suborders of the rule.
%
  if ( rule == 1 )
    suborder_num = 3;
  elseif ( rule == 2 )
    suborder_num = 7;
  elseif ( rule == 3 )
    suborder_num = 12;
  elseif ( rule == 4 )
    suborder_num = 19;
  elseif ( rule == 5 )
    suborder_num = 21;
  elseif ( rule == 6 )
    suborder_num = 28;
  elseif ( rule == 7 )
    suborder_num = 38;
  else

    suborder_num = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEKETE_SUBORDER_NUM - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'FEKETE_SUBORDER_NUM - Fatal error!\n' )

  end

  return
end
