function circle_segment_test17 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST17 demonstrates GQCIRCSEGM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2013
%
%  Author:
%
%    Feifei Xu
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST17\n' );
  fprintf ( 1, '  Demonstrate GQCIRCSEGM.\n' );

  close all;
  tmp = sqrt(2)/2;

  theta = -pi/4*3:pi/200:pi/4*3;

  for n = 9

    [x,y,w] = gqcircsegm ( n, pi/4*3, 1 );

    figure;   
    line([-tmp,-tmp],[-tmp,tmp]);    
    hold on;
    plot(cos(theta),sin(theta));
    axis equal;
    plot(x,y,'ko');

    filename = 'test17.png';
    print ( '-dpng', filename );
    fprintf ( 1, '  Created graphics image "%s".\n', filename );

  end

  return
end
