function point_num = gm_rule_size ( rule, dim_num )

%*****************************************************************************80
%
%% GM_RULE_SIZE determines the size of a Grundmann-Moeller rule.
%
%  Discussion:
%
%    This rule returns the value of POINT_NUM, the number of points associated
%    with a GM rule of given index.
%
%    After calling this rule, the user can use the value of POINT_NUM to
%    allocate space for the weight vector as W(POINT_NUM) and the abscissa
%    vector as X(DIM_NUM,POINT_NUM), and then call GM_RULE_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Axel Grundmann, Michael Moeller,
%    Invariant Integration Formulas for the N-Simplex
%    by Combinatorial Methods,
%    SIAM Journal on Numerical Analysis,
%    Volume 15, Number 2, April 1978, pages 282-290.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%    0 <= RULE.
%
%    Input, integer DIM_NUM, the spatial dimension.
%    1 <= DIM_NUM.
%
%    Output, integer POINT_NUM, the number of points in the rule.
%
  arg1 = dim_num + rule + 1;

  point_num = i4_choose ( arg1, rule );

  return
end
