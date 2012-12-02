function rule_test ( rule_fun, rule_title )

%*****************************************************************************80
%
%% RULE_TEST tests a rule simply by printing out some examples of it.
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
%  Parameter:
%
%    Input, function pointer [ X, W ] = RULE_FUN ( N );
%
%    Input, string RULE_TITLE, a description of the rule.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RULE_TEST\n' );
  fprintf ( 1, '  Compute and display points and weights of a rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rule is %s\n', rule_title );

  for n = 1 : 8
    [ x, w ] = rule_fun ( n );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Order = %d\n', n );
    fprintf ( 1, '\n' );
    for i = 1 : n
      fprintf ( 1, '  %2d  %10f  %10f\n', i, x(i), w(i) );
    end

  end

  return
end
