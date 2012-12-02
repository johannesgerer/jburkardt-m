function stroud_test085 ( )

%*****************************************************************************80
%
%% TEST085 tests CIRCLE_ANNULUS_AREA_2D.
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
  ntest = 3;

  radius1_test = [ 0.0, 1.0, 1.0 ];
  radius2_test = [ 1.0, 2.0, 3.0 ];
  xc_test = [ 0.0, 1.0, 3.0 ];
  yc_test = [ 0.0, 0.0, 4.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST085\n' );
  fprintf ( 1, '  CIRCLE_ANNULUS_AREA_2D computes the area of a \n' );
  fprintf ( 1, '    circular annulus.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     XC        YC          Radius1    Radius2    Area\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    xc = xc_test(i);
    yc = yc_test(i);

    radius1 = radius1_test(i);
    radius2 = radius2_test(i);

    area = circle_annulus_area_2d ( radius1, radius2 );

    fprintf ( 1, '  %9f  %9f  %9f  %9f  %9f\n', xc, yc, radius1, radius2, area );

  end

  return
end
