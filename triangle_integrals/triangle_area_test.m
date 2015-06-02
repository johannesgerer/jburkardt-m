function triangle_area_test ( )

%*****************************************************************************80
%
%% TRIANGLE_AREA_TEST tests TRIANGLE_AREA_MAP.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/triangle_area_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_AREA_TEST:\n' );
  fprintf ( 1, '  TRIANGLE_AREA determines the (signed) area of a triangle.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle vertices are:\n' );
  fprintf ( 1, '    (X1,Y1) = (0,0)\n' );
  fprintf ( 1, '    (X2,Y2) = 2*(cos(angle),sin(angle))\n' );
  fprintf ( 1, '    (X3,Y3) = (0,1)\n' );
  fprintf ( 1, '  where angle will sweep from 0 to 360 degrees.\n' );

  t = [ ...
    0.0, 0.0;
    2.0, 0.0;
    0.0, 1.0 ]';

  r = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '   I      Angle         X2          Y2           Area\n' );
  fprintf ( 1, '        (degrees)\n' );
  fprintf ( 1, '\n' );
  for i = 0 : 24
    angled = i * 180.0 / 12.0;
    angler = i * pi / 12.0;
    t(1,2) = r * cos ( angler );
    t(2,2) = r * sin ( angler );
    area = triangle_area ( t );
    fprintf ( 1, '  %2d  %10.4f  %10.4f  %10.4f  %14.6g\n', ...
      i, angled, t(1,2), t(2,2), area );
  end

  return
end
