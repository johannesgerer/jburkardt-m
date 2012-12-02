function geometry_test188 ( )

%*****************************************************************************80
%
%% TEST188 tests SPHERE_IMP_POINT_PROJECT_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  ntest = 4;

  ptest = [ ...
    2.0, 0.0,  0.0; ...
    0.0, 4.0,  0.0; ...
    2.0, 4.0, 10.0; ...
    3.0, 5.0,  0.0 ]';
  r = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST188\n' );
  fprintf ( 1, '  SPHERE_IMP_POINT_PROJECT_3D projects a 3D point\n' );
  fprintf ( 1, '    onto a sphere.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        P1       projection P2\n' );
  fprintf ( 1, '\n' );
 
  center(1:dim_num) = [ 2.0, 4.0, 0.0 ];
    
  for i = 1 : ntest

    p1(1:dim_num) = ptest(1:dim_num,i);

    p2 = sphere_imp_point_project_3d ( r, center, p1 );

    fprintf ( 1, '  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
      p1(1:dim_num), p2(1:dim_num) );

  end

  return
end
