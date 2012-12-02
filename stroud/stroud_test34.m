function stroud_test34 ( )

%*****************************************************************************80
%
%% TEST34 tests SPHERE_UNIT_AREA_ND.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST34\n' );
  fprintf ( 1, '  In N dimensions:\n' );
  fprintf ( 1, '  SPHERE_UNIT_AREA_ND computes the area of \n' );
  fprintf ( 1, '  the unit sphere;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N    Area\n' );
  fprintf ( 1, '\n' );

  for n = 2 : 10
    fprintf ( 1, '  %2d  %12f\n', n, sphere_unit_area_nd ( n ) );
  end

  return
end
