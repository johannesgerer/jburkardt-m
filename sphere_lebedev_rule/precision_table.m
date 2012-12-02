function precision = precision_table ( rule )

%*****************************************************************************80
%
%% PRECISION_TABLE returns the precision of a Lebedev rule.
%
%  Modified:
%
%    15 September 2010
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
%    Output, integer PRECISION, the precision of the rule.
%
  rule_max = 65;

  table = [ ...
      3,   5,   7,   9,  11,  13,  15,  17,  19,  21, ...
     23,  25,  27,  29,  31,  33,  35,  37,  39,  41, ...
     43,  45,  47,  49,  51,  53,  55,  57,  59,  61, ...
     63,  65,  67,  69,  71,  73,  75,  77,  79,  81, ...
     83,  85,  87,  89,  91,  93,  95,  97,  99, 101, ...
    103, 105, 107, 109, 111, 113, 115, 117, 119, 121, ...
    123, 125, 127, 129, 131 ]';

  if ( rule < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PRECISION_TABLE - Fatal error!\n' );
    fprintf ( 1, '  RULE < 1.\n' );
    error ( 'PRECISION_TABLE - Fatal error!' );
  elseif ( rule_max < rule )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PRECISION_TABLE - Fatal error!\n' );
    fprintf ( 1, '  RULE_MAX < RULE.\n' );
    error ( 'PRECISION_TABLE - Fatal error!' );
  end

  precision = table(rule);

  return
end
