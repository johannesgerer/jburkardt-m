function rules_test ( )

%*****************************************************************************80
%
%% RULES_TEST calls RULE_TEST for each of a series of rules.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2011
%
%  Author:
%
%    John Burkardt
%
  rule_test ( @ccc_rule,         'Clenshaw Curtis Closed' );
  rule_test ( @ccc_nested_rule,  'Clenshaw Curtis Closed Nested' );
  rule_test ( @cco_rule,         'Clenshaw Curtis Open' );
  rule_test ( @cco_nested_rule,  'Clenshaw Curtis Open Nested' );
  rule_test ( @ccoh_rule,        'Clenshaw Curtis Open Half' );
  rule_test ( @ccoh_nested_rule, 'Clenshaw Curtis Open Half Nested' );

  rule_test ( @ncc_rule,         'Newton Cotes Closed' );
  rule_test ( @ncc_nested_rule,  'Newton Cotes Closed Nested' );
  rule_test ( @nco_rule,         'Newton Cotes Open' );
  rule_test ( @nco_nested_rule,  'Newton Cotes Open Nested' );
  rule_test ( @ncoh_rule,        'Newton Cotes Open Half' );
  rule_test ( @ncoh_nested_rule, 'Newton Cotes Open Half Nested' );

  return
end
