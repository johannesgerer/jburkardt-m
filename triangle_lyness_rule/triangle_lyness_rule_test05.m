function triangle_lyness_rule_test05 ( )

%*****************************************************************************80
%
%% TRIANGLE_LYNESS_RULE_TEST05 writes a rule created by LYNESS_RULE to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2010
%
%  Author:
%
%    John Burkardt
%
  r = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    0.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_LYNESS_RULE_TEST05\n' );
  fprintf ( 1, '  LYNESS_RULE returns the points and weights\n' );
  fprintf ( 1, '  of a Lyness rule for the triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we simply print a rule.\n' );

  rule = 18;
  order = lyness_order ( rule );
  precision = lyness_precision ( rule );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rule =      %d\n', rule );
  fprintf ( 1, '  Order =     %d\n', order );
  fprintf ( 1, '  Precision = %d\n', precision );

  [ w, x ] = lyness_rule ( rule, order );

  r8mat_write ( 'lyness_18_r.txt', 2, 3, r );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote the region file "lyness_18_r.txt".\n' );
  r8mat_write ( 'lyness_18_w.txt', 1, order, w );
  fprintf ( 1, '  Wrote the weight file "lyness_18_w.txt".\n' );
  r8mat_write ( 'lyness_18_x.txt', 2, order, x );
  fprintf ( 1, '  Wrote the point file "lyness_18_x.txt".\n' );

  return
end
