function available = available_table ( rule )

%*****************************************************************************80
%
%% AVAILABLE_TABLE returns the availability of a Lebedev rule.
%
%  Modified:
%
%    12 September 2010
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
%    Output, integer AVAILABLE, the availability of the rule.
%    * -1, there is no such rule;
%    *  0, there is such a rule, but it is not available in this library.
%    *  1, the rule is available in this library.
%
  rule_max = 65;

  table = [ ...
       1,    1,    1,    1,    1,    1,    1,    1,    1,    1, ...
       1,    1,    1,    1,    1,    0,    1,    0,    0,    1, ...
       0,    0,    1,    0,    0,    1,    0,    0,    1,    0, ...
       0,    1,    0,    0,    1,    0,    0,    1,    0,    0, ...
       1,    0,    0,    1,    0,    0,    1,    0,    0,    1, ...
       0,    0,    1,    0,    0,    1,    0,    0,    1,    0, ...
       0,    1,    0,    0,    1 ]';

  if ( rule < 1 )
    available = - 1;
  elseif ( rule_max < rule )
    available = - 1;
  else
    available = table(rule);
  end

  return
end