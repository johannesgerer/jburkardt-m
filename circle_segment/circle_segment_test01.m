function circle_segment_test01 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST01 tests CIRCLE_SEGMENT_AREA_FROM_HEIGHT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST01\n' );
  fprintf ( 1, '  CIRCLE_SEGMENT_AREA_FROM_HEIGHT computes the area of a circle segment.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '          R               H               Area\n' );
  fprintf ( 1, '\n' );
  r = 1.0;
  h = 1.0;
  for i = 0 : 10
    area = circle_segment_area_from_height ( r, h );
    fprintf ( 1, '  %14.6f  %14.6f  %14.6f\n', r, h, area );
    h = h / 2.0;
  end

  return
end
