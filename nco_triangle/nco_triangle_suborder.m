function suborder = nco_triangle_suborder ( rule, suborder_num )

%*****************************************************************************80
%
%% NCO_TRIANGLE_SUBORDER returns the suborders for an NCO rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Peter Silvester,
%    Symmetric Quadrature Formulae for Simplexes,
%    Mathematics of Computation,
%    Volume 24, Number 109, January 1970, pages 95-100.
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
      1 ];
  elseif ( rule == 2 )
    suborder(1:suborder_num) = [ ...
      3 ];
  elseif ( rule == 3 )
    suborder(1:suborder_num) = [ ...
      3, 3 ];
  elseif ( rule == 4 )
    suborder(1:suborder_num) = [ ...
      3, 6, 1 ];
  elseif ( rule == 5 )
    suborder(1:suborder_num) = [ ...
      3, 6, 3, 3 ];
  elseif ( rule == 6 )
    suborder(1:suborder_num) = [ ...
      3, 6, 6, 3, 3 ];
  elseif ( rule == 7 )
    suborder(1:suborder_num) = [ ...
      3, 6, 6, 3, 3, 6, 1 ];
  elseif ( rule == 8 )
    suborder(1:suborder_num) = [ ...
      3, 6, 6, 3, 6, 6, 3, 3 ];
  elseif ( rule == 9 )
    suborder(1:suborder_num) = [ ...
      3, 6, 6, 3, 6, 6, 3, 6, 3, 3  ];

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'NCO_TRIANGLE_SUBORDER - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'NCO_TRIANGLE_SUBORDER - Fatal error!' )

  end

  return
end
