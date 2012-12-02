function geometry_test0203 ( )

%*****************************************************************************80
%
%% TEST0203 tests CYLINDER_POINT_NEAR_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  test_num = 6;

  p_test = [ ...
      4.0,   0.5,  0.0; ...
     -0.5,  -1.0,  0.0; ...
      4.0,   6.0,  0.0; ...
      0.75, -10.0, 0.0; ...
      0.0,   0.0,  0.0; ...
      0.25,  1.75, 0.0 ]';
  p1 = [ 0.0; -2.0; 0.0 ];
  p2 = [ 0.0;  2.0; 0.0 ];
  pn_test = [ ...
      1.0,   0.5,  0.0; ...
     -1.0,  -1.0,  0.0; ...
      1.0,   2.0,  0.0; ...
      0.75, -2.0,  0.0; ...
      1.0,   0.0,  0.0; ...
      0.25,  2.0,  0.0 ]';
  r = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0203\n' );
  fprintf ( 1, '  CYLINDER_POINT_NEAR_3D computes the nearest point\n' );
  fprintf ( 1, '  on a cylinder.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Radius R = %f\n', r );
  fprintf ( 1, '  Center of bottom disk = %10f  %10f  %10f\n', p1(1:3,1) );
  fprintf ( 1, '  Center of top disk =    %10f  %10f  %10f\n', p2(1:3,1) );

  for test = 1 : test_num

    p(1:3,1) = p_test(1:3,test);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  P =    %10f  %10f  %10f\n', p(1:3,1) );

    pn = cylinder_point_near_3d ( p1, p2, r, p );

    fprintf ( 1, '  PN (computed) = %10f  %10f  %10f\n', pn(1:3,1) );
    fprintf ( 1, '  PN (exact) =    %10f  %10f  %10f\n', ...
      pn_test(1:3,test) );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  (Note that case 5 is ambiguous.  The set of nearest\n' );
  fprintf ( 1, '  points forms a circle, any of which will do.)\n' );

  return
end
