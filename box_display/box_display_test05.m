function box_display_test05 ( )

%*****************************************************************************80
%
%% BOX_DISPLAY_TEST05 compares several methods that reach degree 8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BOX_DISPLAY_TEST05:\n' );
  fprintf ( 1, '  Plot index sets for various methods that reach degree 8.\n' );
  fprintf ( 1, '\n' );

  m = 10;
  n = 10;
  title_string = '';
%
%  Total degree <= 8.
%
  box_display ( m, n, @(x,y)x+y<=-1, @(x,y)x+y<=8, title_string );
  filename = 'degree8_total.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  Maximum degree <= 8.
%
  box_display ( m, n, @(x,y)x+y<=-1, @(x,y)max(x,y)<=8, title_string );
  filename = 'degree8_max.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  Hyperbolic cross.
%
  box_display ( m, n, @(x,y)x+y<=-1, @(x,y)(x+1)*(y+1)<=9, title_string );
  filename = 'degree8_hyper.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  Clenshaw-Curtis sparse grid.
%
  box_display ( m, n, @(x,y)x+y<=-1, @cc_3, title_string );
  filename = 'degree8_cc.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  Smolyak: Log2(x) + Log2(y) <= Log2(L)
%
  box_display ( m, n, @(x,y)x+y<=-1, @(x,y)log2(max(x,1))+log2(max(y,1))<=log2(8.1), title_string );
  filename = 'degree8_smolyak.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );

  return
end
