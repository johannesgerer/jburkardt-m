function suborder = keast_suborder ( rule, suborder_num )

%*****************************************************************************80
%
%% KEAST_SUBORDER returns the suborders for a Keast rule.
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
%    Input, integer SUBORDER_NUM, the number of suborders.
%
%    Output, integer SUBORDER(SUBORDER_NUM), the suborders.
%
  if ( rule == 1 )
    suborder(1:suborder_num) = [ 1 ];
  elseif ( rule == 2 )
    suborder(1:suborder_num) = [ 4 ];
  elseif ( rule == 3 )
    suborder(1:suborder_num) = [ 1, 4 ];
  elseif ( rule == 4 )
    suborder(1:suborder_num) = [ 4, 6 ];
  elseif ( rule == 5 )
    suborder(1:suborder_num) = [ 1, 4, 6 ];
  elseif ( rule == 6 )
    suborder(1:suborder_num) = [ 6, 4, 4 ];
  elseif ( rule == 7 )
    suborder(1:suborder_num) = [ 1, 4, 4, 6 ];
  elseif ( rule == 8 )
    suborder(1:suborder_num) = [ 4, 4, 4, 12 ];
  elseif ( rule == 9 )
    suborder(1:suborder_num) = [ 1, 4, 4, 4, 6, 12 ];
  elseif ( rule == 10 )
    suborder(1:suborder_num) = [ 1, 4, 4, 6, 6, 12, 12 ];
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KEAST_SUBORDER - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of RULE = %d\n', rule );
    error ( 'KEAST_SUBORDER - Fatal error!' );
  end

  return
end
