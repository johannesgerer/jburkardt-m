function geometry_test053 ( )

%*****************************************************************************80
%
%% TEST053 tests PLANE_EXP_PROJECT_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST053\n' );
  fprintf ( 1, '  PLANE_EXP_PROJECT_3D projects a point through\n' );
  fprintf ( 1, '    a focus point into a plane.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      PO,     PP,     IVIS\n' );
  fprintf ( 1, '\n' );
 
  p1(1:dim_num) = [ 1.0, 0.0, 0.0 ];
  p2(1:dim_num) = [ 0.0, 1.0, 0.0 ];
  p3(1:dim_num) = [ 0.0, 0.0, 1.0 ];
 
  pf(1:dim_num) = [ 0.0, 0.0, 0.0 ];
%
%  Projection   is ( 0, 0.5, 0.5 ), IVIS is 3.
%  Projection   is ( 4, 5, -8 ), IVIS is 2.
%  Projection   is ( 0.33, 0.33, 0.33), IVIS is 1.
%  "Projection" is ( 0, 0, 0 ), IVIS is 0.
%  Projection   is ( 1, 0, 0 ), IVIS is -1.
%
  po(1:dim_num,1:n) = [ ...
     0.00,  2.00,  2.00; ...
     4.00,  5.00, -8.00; ...
     0.25,  0.25,  0.25; ...
     5.00, -2.00, -3.00; ...
    -2.00,  0.00,  0.00 ]';
 
  [ pp, ivis ] = plane_exp_project_3d ( p1, p2, p3, pf, n, po );
 
  for i = 1 : n
    fprintf ( 1, '  %12f  %12f  %12f  %12f  %12f  %12f  %2d\n', ...
      po(1:dim_num,i), pp(1:dim_num,i), ivis(i) );
  end
 
  return
end
