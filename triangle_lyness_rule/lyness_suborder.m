function suborder = lyness_suborder ( rule, suborder_num )

%*****************************************************************************80
%
%% LYNESS_SUBORDER returns the suborders for a Lyness rule.
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
%    Input, integer SUBORDER_NUM, the number of suborders
%    of the rule.
%
%    Output, integer SUBORDER(SUBORDER_NUM), the suborders
%    of the rule.
%
  if ( rule == 0 )
    suborder = [ 1 ]';
  elseif ( rule == 1 )
    suborder = [ 3 ]';
  elseif ( rule == 2 )
    suborder = [ 1, 3 ]';
  elseif ( rule == 3 )
    suborder = [ 1, 3 ]';
  elseif ( rule == 4 )
    suborder = [ 1, 3, 3 ]';
  elseif ( rule == 5 )
    suborder = [ 3, 3  ]';
  elseif ( rule == 6 )
    suborder = [ 1, 3, 6  ]';
  elseif ( rule == 7 )
    suborder = [ 3, 3, 3 ]';
  elseif ( rule == 8 )
    suborder = [ 1, 3, 3 ]';
  elseif ( rule == 9 )
    suborder = [ 1, 3, 3, 3 ]';
  elseif ( rule == 10 )
    suborder = [ 3, 3, 6 ]';
  elseif ( rule == 11 )
    suborder = [ 1, 3, 3, 3, 6 ]';
  elseif ( rule == 12 )
    suborder = [ 1, 3, 3, 6 ]';
  elseif ( rule == 13 )
    suborder = [ 1, 3, 3, 6 ]';
  elseif ( rule == 14 )
    suborder = [ 1, 3, 3, 3, 6 ]';
  elseif ( rule == 15 )
    suborder = [ 1, 3, 3, 3, 6 ]';
  elseif ( rule == 16 )
    suborder = [ 3, 3, 3, 3, 3, 6 ]';
  elseif ( rule == 17 )
    suborder = [ 1, 3, 3, 3, 6 ]';
  elseif ( rule == 18 )
    suborder = [ 1, 3, 3, 3, 3, 6 ]';
  elseif ( rule == 19 )
    suborder = [ 1, 3, 3, 3, 3, 3, 6 ]';
  elseif ( rule == 20 )
    suborder = [ 3, 3, 3, 3, 3, 6, 6 ]';
  elseif ( rule == 21 )
    suborder = [ 1, 3, 3, 3, 3, 3, 6, 6 ]';
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LYNESS_SUBORDER - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'LYNESS_SUBORDER - Fatal error!' );
  end

  return
end
