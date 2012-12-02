function suborder_num = keast_suborder_num ( rule )

%*****************************************************************************80
%
%% KEAST_SUBORDER_NUM returns the number of suborders for a Keast rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Patrick Keast,
%    Moderate Degree Tetrahedral Quadrature Formulas,
%    Computer Methods in Applied Mechanics and Engineering,
%    Volume 55, Number 3, May 1986, pages 339-348.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Output, integer SUBORDER_NUM, the number of suborders.
%
  if ( rule == 1 )
    suborder_num = 1;
  elseif ( rule == 2 )
    suborder_num = 1;
  elseif ( rule == 3 )
    suborder_num = 2;
  elseif ( rule == 4 )
    suborder_num = 2;
  elseif ( rule == 5 )
    suborder_num = 3;
  elseif ( rule == 6 )
    suborder_num = 3;
  elseif ( rule == 7 )
    suborder_num = 4;
  elseif ( rule == 8 )
    suborder_num = 4;
  elseif ( rule == 9 )
    suborder_num = 6;
  elseif ( rule == 10 )
    suborder_num = 7;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KEAST_SUBORDER_NUM - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of RULE = %d\n', rule );
    error ( 'KEAST_SUBORDER_NUM - Fatal error!' );
  end

  return
end
