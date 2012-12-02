function suborder = wandzura_suborder ( rule, suborder_num )

%*****************************************************************************80
%
%% WANDZURA_SUBORDER returns the suborders for a Wandzura rule.
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
%    Input, integer SUBORDER_NUM, the number of suborders of the rule.
%
%    Output, integer SUBORDER(SUBORDER_NUM), the suborders of the rule.
%
  if ( rule == 1 )
    suborder(1:suborder_num) = [ ...
      1, 3, 3 ];
  elseif ( rule == 2 )
    suborder(1:suborder_num) = [ ...
      1, 3, 3, 3, 3, 6, 6 ];
  elseif ( rule == 3 )
    suborder(1:suborder_num) = [ ...
      3, 3, 3, 3, 3, 3, 6, 6, 6, 6, ...
      6, 6 ];
  elseif ( rule == 4 )
    suborder(1:suborder_num) = [ ...
      1, 3, 3, 3, 3, 3, 3, 3, 3, 6, ...
      6, 6, 6, 6, 6, 6, 6, 6, 6 ];
  elseif ( rule == 5 )
    suborder(1:suborder_num) = [ ...
      3, 3, 3, 3, 3, 3, 3, 3, 3, 3, ...
      6, 6, 6, 6, 6, 6, 6, 6, 6, 6, ...
      6, 6, 6, 6, 6, 6 ];
  elseif ( rule == 6 )
    suborder(1:suborder_num) = [ ...
      1, 3, 3, 3, 3, 3, 3, 3, 3, 3, ...
      3, 3, 3, 6, 6, 6, 6, 6, 6, 6, ...
      6, 6, 6, 6, 6, 6, 6, 6, 6, 6, ...
      6, 6, 6, 6, 6, 6 ];
  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'WANDZURA_SUBORDER - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'WANDZURA_SUBORDER - Fatal error!' )

  end

  return
end
