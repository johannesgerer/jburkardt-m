function circle_segment_test16 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST16 demonstrates GQCIRCSECT.
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
  fprintf ( 1, '  Demonstrate GQCIRCSECT.\n' );

  close all;
  tmp = sqrt(2)/2;
%
%  Acute angle
%
  theta = -pi/4 : pi/200 : pi/4;

  for n = 9

    [x,y,w] = gqcircsect ( n, pi/4, 1 );

    figure;  
    line([tmp,0,tmp],[-tmp,0,tmp]);    
    hold on;
    plot(cos(theta),sin(theta));
    axis equal; 
    plot(x,y,'k*');

    filename = 'test16_acute.png';
    print ( '-dpng', filename );
    fprintf ( 1, '  Created graphics image "%s".\n', filename );

  end
%
%  Obtuse angle
%
  theta = -pi/4*3 : pi/200 : pi/4*3;

  for n = 9

    [x,y,w] = gqcircsect ( n, pi/4*3, 1 );

    figure;   
    line([-tmp,0,-tmp],[-tmp,0,tmp]);    
    hold on;
    plot(cos(theta),sin(theta));
    axis equal;
    plot(x,y,'ko');

    filename = 'test16_obtuse.png';
    print ( '-dpng', filename );
    fprintf ( 1, '  Created graphics image "%s".\n', filename );

  end

  return
end
