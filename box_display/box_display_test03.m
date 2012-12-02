function box_display_test03 ( )

%*****************************************************************************80
%
%% BOX_DISPLAY_TEST03 plots hyperbolic cross index sets.
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
  fprintf ( 1, 'BOX_DISPLAY_TEST03:\n' );
  fprintf ( 1, '  Plot hyperbolic cross index sets.\n' );
  fprintf ( 1, '\n' );

  m = 20;
  n = 20;
  title_string = '(X+1)*(Y+1) <= 4';
  box_display ( m, n, @(x,y)(x+1)*(y+1)<=1, @(x,y)(x+1)*(y+1)<=4, title_string );
  print ( '-dpng', 'hc1.png' );
  fprintf ( 1, '  Created "hc1.png".\n' );

  m = 20;
  n = 20;
  title_string = '(X+1)*(Y+1) <= 9';
  box_display ( m, n, @(x,y)(x+1)*(y+1)<=4, @(x,y)(x+1)*(y+1)<=9, title_string );
  print ( '-dpng', 'hc2.png' );
  fprintf ( 1, '  Created "hc2.png".\n' );

  m = 20;
  n = 20;
  title_string = '(X+1)*(Y+1) <= 16';
  box_display ( m, n, @(x,y)(x+1)*(y+1)<=9, @(x,y)(x+1)*(y+1)<=16, title_string );
  print ( '-dpng', 'hc3.png' );
  fprintf ( 1, '  Created "hc3.png".\n' );

  m = 20;
  n = 20;
  title_string = '(X+1)*(Y+1) <= 25';
  box_display ( m, n, @(x,y)(x+1)*(y+1)<=16, @(x,y)(x+1)*(y+1)<=25, title_string );
  print ( '-dpng', 'hc4.png' );
  fprintf ( 1, '  Created "hc4.png".\n' );

  m = 20;
  n = 20;
  title_string = '(X+1)*(Y+1) <= 36';
  box_display ( m, n, @(x,y)(x+1)*(y+1)<=25, @(x,y)(x+1)*(y+1)<=36, title_string );
  print ( '-dpng', 'hc5.png' );
  fprintf ( 1, '  Created "hc5.png".\n' );

  m = 20;
  n = 20;
  title_string = '(X+1)*(Y+1) <= 49';
  box_display ( m, n, @(x,y)(x+1)*(y+1)<=36, @(x,y)(x+1)*(y+1)<=49, title_string );
  print ( '-dpng', 'hc6.png' );
  fprintf ( 1, '  Created "hc6.png".\n' );

  m = 20;
  n = 20;
  title_string = '(X+1)*(Y+1) <= 64';
  box_display ( m, n, @(x,y)(x+1)*(y+1)<=49, @(x,y)(x+1)*(y+1)<=64, title_string );
  print ( '-dpng', 'hc7.png' );
  fprintf ( 1, '  Created "hc7.png".\n' );

  return
end
