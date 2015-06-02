function suborder_num = lyness_suborder_num ( rule )

%*****************************************************************************80
%
%% LYNESS_SUBORDER_NUM returns the number of suborders for a Lyness rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    James Lyness, Dennis Jespersen,
%    Moderate Degree Symmetric Quadrature Rules for the Triangle,
%    Journal of the Institute of Mathematics and its Applications,
%    Volume 15, Number 1, February 1975, pages 19-32.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Output, integer SUBORDER_NUM, the number of suborders
%    of the rule.
%
  if ( rule == 0 )
    suborder_num = 1;
  elseif ( rule == 1 )
    suborder_num = 1;
  elseif ( rule == 2 )
    suborder_num = 2;
  elseif ( rule == 3 )
    suborder_num = 2;
  elseif ( rule == 4 )
    suborder_num = 3;
  elseif ( rule == 5 )
    suborder_num = 2;
  elseif ( rule == 6 )
    suborder_num = 3;
  elseif ( rule == 7 )
    suborder_num = 3;
  elseif ( rule == 8 )
    suborder_num = 3;
  elseif ( rule == 9 )
    suborder_num = 4;
  elseif ( rule == 10 )
    suborder_num = 3;
  elseif ( rule == 11 )
    suborder_num = 5;
  elseif ( rule == 12 )
    suborder_num = 4;
  elseif ( rule == 13 )
    suborder_num = 4;
  elseif ( rule == 14 )
    suborder_num = 5;
  elseif ( rule == 15 )
    suborder_num = 5;
  elseif ( rule == 16 )
    suborder_num = 6;
  elseif ( rule == 17 )
    suborder_num = 5;
  elseif ( rule == 18 )
    suborder_num = 6;
  elseif ( rule == 19 )
    suborder_num = 7;
  elseif ( rule == 20 )
    suborder_num = 7;
  elseif ( rule == 21 )
    suborder_num = 8;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LYNESS_SUBORDER_NUM - Fatal error!\' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'LYNESS_SUBORDER_NUM - Fatal error!' );
  end

  return
end
