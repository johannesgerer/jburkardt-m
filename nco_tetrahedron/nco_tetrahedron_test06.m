function nco_tetrahedron_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests NCO_TETRAHEDRON_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2007
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  NCO_TETRAHEDRON_RULE returns the points and weights\n' );
  fprintf ( 1, '  of an NCO rule for the tetrahedron.\n' );

  rule = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we simply print rule %d\n', rule );

  suborder_num = nco_tetrahedron_suborder_num ( rule );

  suborder = nco_tetrahedron_suborder ( rule, suborder_num );

  [ suborder_xyz, suborder_w ] = nco_tetrahedron_subrule ( rule, suborder_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The compressed rule:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of suborders = %d\n', suborder_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     S   Sub     Weight     Xsi1      Xsi2      Xsi3      Xsi4\n' );
  fprintf ( 1, '\n' );
  
  for s = 1 : suborder_num
    fprintf ( 1, '  %4d  %4d  %8f  %8f  %8f  %8f  %8f\n', ...
      s, suborder(s), suborder_w(s), suborder_xyz(1:4,s) );
  end

  order_num = nco_tetrahedron_order_num ( rule );

  [ xyz, w ] = nco_tetrahedron_rule ( rule, order_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The full rule:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Order = %4d\n', order_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     O    Weight      X         Y         Z\n' );
  fprintf ( 1, '\n' );
  
  for o = 1 : order_num
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8f\n', o, w(o), xyz(1:dim_num,o) );
  end

  suborder = [];
  suborder_w = [];
  suborder_xyz = [];
  w = [];
  xyz = [];

  return
end
