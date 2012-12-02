function suborder_num = wandzura_suborder_num ( rule )

%*****************************************************************************80
%
%% WANDZURA_SUBORDER_NUM returns the number of suborders for a Wandzura rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Stephen Wandzura, Hong Xiao,
%    Symmetric Quadrature Rules on a Triangle,
%    Computers and Mathematics with Applications,
%    Volume 45, Number 12, June 2003, pages 1829-1840.
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
    suborder_num = 26;
  elseif ( rule == 6 )
    suborder_num = 36;
  else

    suborder_num = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'WANDZURA_SUBORDER_NUM - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'WANDZURA_SUBORDER_NUM - Fatal error!\n' )

  end

  return
end
