function box_display_test02 ( )

%*****************************************************************************80
%
%% BOX_DISPLAY_TEST02 plots max degree index sets.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BOX_DISPLAY_TEST02:\n' );
  fprintf ( 1, '  Plot max degree index sets.\n' );
  fprintf ( 1, '\n' );

  m = 12;
  n = 12;
  title_string = 'Maximum Degree <= 1';
  box_display ( m, n, @(x,y)max(x,y)<=0, @(x,y)max(x,y)<=1, title_string );
  print ( '-dpng', 'md1.png' );
  fprintf ( 1, '  Created "md1.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Maximum Degree <= 2';
  box_display ( m, n, @(x,y)max(x,y)<=1, @(x,y)max(x,y)<=2, title_string );
  print ( '-dpng', 'md2.png' );
  fprintf ( 1, '  Created "md2.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Maximum Degree <= 3';
  box_display ( m, n, @(x,y)max(x,y)<=2, @(x,y)max(x,y)<=3, title_string );
  print ( '-dpng', 'md3.png' );
  fprintf ( 1, '  Created "md3.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Maximum Degree <= 4';
  box_display ( m, n, @(x,y)max(x,y)<=3, @(x,y)max(x,y)<=4, title_string );
  print ( '-dpng', 'md4.png' );
  fprintf ( 1, '  Created "md4.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Maximum Degree <= 5';
  box_display ( m, n, @(x,y)max(x,y)<=4, @(x,y)max(x,y)<=5, title_string );
  print ( '-dpng', 'md5.png' );
  fprintf ( 1, '  Created "md5.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Maximum Degree <= 6';
  box_display ( m, n, @(x,y)max(x,y)<=5, @(x,y)max(x,y)<=6, title_string );
  print ( '-dpng', 'md6.png' );
  fprintf ( 1, '  Created "md6.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Maximum Degree <= 7';
  box_display ( m, n, @(x,y)max(x,y)<=6, @(x,y)max(x,y)<=7, title_string );
  print ( '-dpng', 'md7.png' );
  fprintf ( 1, '  Created "md7.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Maximum Degree <= 8';
  box_display ( m, n, @(x,y)max(x,y)<=7, @(x,y)max(x,y)<=8, title_string );
  print ( '-dpng', 'md8.png' );
  fprintf ( 1, '  Created "md8.png".\n' );


  m = 12;
  n = 12;
  title_string = 'Maximum Degree <= 9';
  box_display ( m, n, @(x,y)max(x,y)<=8, @(x,y)max(x,y)<=9, title_string );
  print ( '-dpng', 'md9.png' );
  fprintf ( 1, '  Created "md9.png".\n' );

  return
end
