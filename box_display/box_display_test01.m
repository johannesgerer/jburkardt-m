function box_display_test01 ( )

%*****************************************************************************80
%
%% BOX_DISPLAY_TEST01 plots total degree index sets.
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
  fprintf ( 1, 'BOX_DISPLAY_TEST01:\n' );
  fprintf ( 1, '  Plot total degree index sets.\n' );
  fprintf ( 1, '\n' );

  m = 12;
  n = 12;
  title_string = 'Total Degree <= 1';
  box_display ( m, n, @(x,y)x+y<=0, @(x,y)x+y<=1, title_string );
  print ( '-dpng', 'td1.png' );
  fprintf ( 1, '  Created "td1.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Total Degree <= 2';
  box_display ( m, n, @(x,y)x+y<=1, @(x,y)x+y<=2, title_string );
  print ( '-dpng', 'td2.png' );
  fprintf ( 1, '  Created "td2.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Total Degree <= 3';
  box_display ( m, n, @(x,y)x+y<=2, @(x,y)x+y<=3, title_string );
  print ( '-dpng', 'td3.png' );
  fprintf ( 1, '  Created "td3.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Total Degree <= 4';
  box_display ( m, n, @(x,y)x+y<=3, @(x,y)x+y<=4, title_string );
  print ( '-dpng', 'td4.png' );
  fprintf ( 1, '  Created "td4.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Total Degree <= 5';
  box_display ( m, n, @(x,y)x+y<=4, @(x,y)x+y<=5, title_string );
  print ( '-dpng', 'td5.png' );
  fprintf ( 1, '  Created "td5.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Total Degree <= 6';
  box_display ( m, n, @(x,y)x+y<=5, @(x,y)x+y<=6, title_string );
  print ( '-dpng', 'td6.png' );
  fprintf ( 1, '  Created "td6.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Total Degree <= 7';
  box_display ( m, n, @(x,y)x+y<=6, @(x,y)x+y<=7, title_string );
  print ( '-dpng', 'td7.png' );
  fprintf ( 1, '  Created "td7.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Total Degree <= 8';
  box_display ( m, n, @(x,y)x+y<=7, @(x,y)x+y<=8, title_string );
  print ( '-dpng', 'td8.png' );
  fprintf ( 1, '  Created "td8.png".\n' );

  m = 12;
  n = 12;
  title_string = 'Total Degree <= 9';
  box_display ( m, n, @(x,y)x+y<=8, @(x,y)x+y<=9, title_string );
  print ( '-dpng', 'td9.png' );
  fprintf ( 1, '  Created "td9.png".\n' );

  return
end
