function geometry_test009 ( )

%*****************************************************************************80
%
%% TEST009 tests BOX_SEGMENT_CLIP_2D.
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
  dim_num = 2;
  ntest = 5;

  p1 = [ -10.0, 10.0 ];
  p2 = [  10.0, 20.0 ];
  x1_test = [  1.0, -3.0, -20.0, -20.0, 10.0 ];
  x2_test = [  8.0,  5.0,  7.0,    0.0, 20.0 ];
  y1_test = [  2.0, 12.0,  20.0,  40.0, 40.0 ];
  y2_test = [ 16.0, 12.0,  20.0,   0.0, 30.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST009\n' );
  fprintf ( 1, '  BOX_SEGMENT_CLIP_2D clips a line with respect to a box.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The lower left box corner is:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %8f  %8f\n', p1(1:dim_num) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The upper right box corner is:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %8f  %8f\n', p2(1:dim_num) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We list the points PA and PB, and then\n' );
  fprintf ( 1, '  the clipped values.\n' );
  fprintf ( 1, '\n' );

  for itest = 1 : ntest

    pa(1) = x1_test(itest);
    pa(2) = y1_test(itest);
    pb(1) = x2_test(itest);
    pb(2) = y2_test(itest);

    [ qa, qb, ival ] = box_segment_clip_2d ( p1, p2, pa, pb );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %8f  %8f    %8f  %8f\n', pa(1:dim_num), pb(1:dim_num) );
    if ( ival == -1 )
      fprintf ( 1, '  Line is outside the box.\n' );
    elseif ( ival == 0 )
      fprintf ( 1, '  Line is inside the box.\n' );
    elseif ( ival == 1 )
      fprintf ( 1, '  %8f  %8f\n', qa(1:dim_num) );
    elseif ( ival == 2 )
      fprintf ( 1, '                        %8f  %8f\n', qb(1:dim_num) );
    elseif ( ival == 3 )
      fprintf ( 1, '  %8f  %8f    %8f  %8f\n', qa(1:dim_num), qb(1:dim_num) );
    end

  end
  
  return
end
