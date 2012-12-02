function order = order_table ( rule )

%*****************************************************************************80
%
%% ORDER_TABLE returns the order of a Lebedev rule.
%
%  Modified:
%
%    13 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Vyacheslav Lebedev, Dmitri Laikov,
%    A quadrature formula for the sphere of the 131st
%    algebraic order of accuracy,
%    Russian Academy of Sciences Doklady Mathematics,
%    Volume 59, Number 3, 1999, pages 477-481.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule, between 1 and 65.
%
%    Output, integer ORDER, the order of the rule.
%
  rule_max = 65;

  table = [ ...
       6,   14,   26,   38,   50,   74,   86,  110,  146,  170, ...
     194,  230,  266,  302,  350,  386,  434,  482,  530,  590, ...
     650,  698,  770,  830,  890,  974, 1046, 1118, 1202, 1274, ...
    1358, 1454, 1538, 1622, 1730, 1814, 1910, 2030, 2126, 2222, ...
    2354, 2450, 2558, 2702, 2810, 2930, 3074, 3182, 3314, 3470, ...
    3590, 3722, 3890, 4010, 4154, 4334, 4466, 4610, 4802, 4934, ...
    5090, 5294, 5438, 5606, 5810 ]';

  if ( rule < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ORDER_TABLE - Fatal error!\n' );
    fprintf ( 1, '  RULE < 1.\n' );
    error ( 'ORDER_TABLE - Fatal error!' );
  elseif ( rule_max < rule )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ORDER_TABLE - Fatal error!\n' );
    fprintf ( 1, '  RULE_MAX < RULE.\n' );
    error ( 'ORDER_TABLE - Fatal error!' );
  end

  order = table(rule);

  return
end
