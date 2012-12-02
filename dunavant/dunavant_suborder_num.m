function suborder_num = dunavant_suborder_num ( rule )

%*****************************************************************************80
%
%% DUNAVANT_SUBORDER_NUM returns the number of suborders for a Dunavant rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Dunavant,
%    High Degree Efficient Symmetrical Gaussian Quadrature Rules
%    for the Triangle, 
%    International Journal for Numerical Methods in Engineering,
%    Volume 21, 1985, pages 1129-1148.
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
%    Output, integer SUBORDER_NUM, the number of suborders of the rule.
%
  suborder = [ ...
     1,  1 , 2,  2,  3,  3,  4,  5,  6,  6, ...
     7,  8, 10, 10, 11, 13, 15, 17, 17, 19 ];

  if ( 1 <= rule & rule <= 20 )
    suborder_num = suborder(rule);
  else

    suborder_num = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DUNAVANT_SUBORDER_NUM - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'DUNAVANT_SUBORDER_NUM - Fatal error!\n' )

  end

  return
end
