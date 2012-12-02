function suborder = fekete_suborder ( rule, suborder_num )

%*****************************************************************************80
%
%% FEKETE_SUBORDER returns the suborders for a Fekete rule.
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
%    Input, integer SUBORDER_NUM, the number of suborders of the rule.
%
%    Output, integer SUBORDER(SUBORDER_NUM), the suborders of the rule.
%
  if ( rule == 1 )
    suborder(1:suborder_num) = [ ...
      1, 3, 6 ];
  elseif ( rule == 2 )
    suborder(1:suborder_num) = [ ...
      1, 3, 3, 3, 6, 6, 6 ];
  elseif ( rule == 3 )
    suborder(1:suborder_num) = [ ...
      1, 3, 3, 3, 3, 6, 6, 6, 6, 6, ...
      6, 6 ];
  elseif ( rule == 4 )
    suborder(1:suborder_num) = [ ...
      1, 3, 3, 3, 3, 3, 3, 6, 6, 6, ...
      6, 6, 6, 6, 6, 6, 6, 6, 6 ];
  elseif ( rule == 5 )
    suborder(1:suborder_num) = [ ...
      1, 3, 3, 3, 3, 3, 3, 3, 3, 3, ...
      3, 6, 6, 6, 6, 6, 6, 6, 6, 6, ...
      6  ];
  elseif ( rule == 6 )
    suborder(1:suborder_num) = [ ...
      1, 3, 3, 3, 3, 3, 3, 3, 3, 3, ...
      6, 6, 6, 6, 6, 6, 6, 6, 6, 6, ...
      6, 6, 6, 6, 6, 6, 6, 6  ];
  elseif ( rule == 7 )
    suborder(1:suborder_num) = [ ...
      1, 3, 3, 3, 3, 3, 3, 3, 3, 3, ...
      3, 3, 6, 6, 6, 6, 6, 6, 6, 6, ...
      6, 6, 6, 6, 6, 6, 6, 6, 6, 6, ...
      6, 6, 6, 6, 6, 6, 6, 6  ];
  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEKETE_SUBORDER - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'FEKETE_SUBORDER - Fatal error!' )

  end

  return
end
