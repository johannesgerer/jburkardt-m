function suborder_num = triangle_ncc_suborder_num ( rule )

%*****************************************************************************80
%
%% TRIANGLE_NCC_SUBORDER_NUM returns the number of suborders for an NCC rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2007
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
%    Output, integer SUBORDER_NUM, the number of suborders of the rule.
%
  if ( rule == 1 )
    suborder_num = 1;
  elseif ( rule == 2 )
    suborder_num = 1;
  elseif ( rule == 3 )
    suborder_num = 1;
  elseif ( rule == 4 )
    suborder_num = 3;
  elseif ( rule == 5 )
    suborder_num = 3;
  elseif ( rule == 6 )
    suborder_num = 5;
  elseif ( rule == 7 )
    suborder_num = 6;
  elseif ( rule == 8 )
    suborder_num = 8;
  elseif ( rule == 9 )
    suborder_num = 9;

  else

    suborder_num = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_NCC_SUBORDER_NUM - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'TRIANGLE_NCC_SUBORDER_NUM - Fatal error!\n' )

  end

  return
end
