function stroud_test31 ( )

%*****************************************************************************80
%
%% TEST31 tests SPHERE_UNIT_**_ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  global FUNC_ND_INDEX;

  num = function_nd_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST31\n' );
  fprintf ( 1, '  For integrals on the unit sphere in ND:\n' );
  fprintf ( 1, '  SPHERE_UNIT_03_ND uses a formula of degree 3;\n' );
  fprintf ( 1, '  SPHERE_UNIT_04_ND uses a formula of degree 4;\n' );
  fprintf ( 1, '  SPHERE_UNIT_05_ND uses a formula of degree 5.\n' );
  fprintf ( 1, '  SPHERE_UNIT_07_1_ND uses a formula of degree 7.\n' );
  fprintf ( 1, '  SPHERE_UNIT_07_2_ND uses a formula of degree 7.\n' );
  fprintf ( 1, '  SPHERE_UNIT_11_ND uses a formula of degree 11.\n' );
  fprintf ( 1, '\n' );

  for n = 3 : 10

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension N = %d\n', n );
    fprintf ( 1, '  Unit sphere area = %f\n', sphere_unit_area_nd ( n ) );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    Rule:     #3            #4            #5\n' );
    fprintf ( 1, '  	        #7.1          #7.2          #11\n' );
    fprintf ( 1, '    Function\n' );
    fprintf ( 1, '\n' );

    for i = 1 : num

      FUNC_ND_INDEX = i;

      result1 = sphere_unit_03_nd ( 'function_nd', n );
      result2 = sphere_unit_04_nd ( 'function_nd', n );
      result3 = sphere_unit_05_nd ( 'function_nd', n );
      result4 = sphere_unit_07_1_nd ( 'function_nd', n );
      result5 = sphere_unit_07_2_nd ( 'function_nd', n );
      result6 = sphere_unit_11_nd ( 'function_nd', n );

      fname = function_nd_name ( i );

      fprintf ( 1, '  %s  %12f  %12f  %12f\n', fname, result1, result2, result3 );
      fprintf ( 1, '           %12f  %12f  %12f\n', result4, result5, result6 );

    end

  end

  return
end
