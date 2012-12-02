function box_display_test04 ( )

%*****************************************************************************80
%
%% BOX_DISPLAY_TEST04 plots Smolyak Clenshaw Curtis index sets.
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
  fprintf ( 1, 'BOX_DISPLAY_TEST04:\n' );
  fprintf ( 1, '  Plot Smolyak Clenshaw Curtis monomial indices.\n' );
  fprintf ( 1, '\n' );

  m = 20;
  n = 20;
  title_string = 'Log2(X-1)+Log2(Y-1) <= 1';
  box_display ( m, n, @cc_0, @cc_1, title_string );
  print ( '-dpng', 'cc1.png' );
  fprintf ( 1, '  Created "cc1.png".\n' );

  m = 20;
  n = 20;
  title_string = 'Log2(X-1)+Log2(Y-1) <= 2';
  box_display ( m, n, @cc_1, @cc_2, title_string );
  print ( '-dpng', 'cc2.png' );
  fprintf ( 1, '  Created "cc2.png".\n' );

  m = 20;
  n = 20;
  title_string = 'Log2(X-1)+Log2(Y-1) <= 3';
  box_display ( m, n, @cc_2, @cc_3, title_string );
  print ( '-dpng', 'cc3.png' );
  fprintf ( 1, '  Created "cc3.png".\n' );

  m = 20;
  n = 20;
  title_string = 'Log2(X-1)+Log2(Y-1) <= 4';
  box_display ( m, n, @cc_3, @cc_4, title_string );
  print ( '-dpng', 'cc4.png' );
  fprintf ( 1, '  Created "cc4.png".\n' );

  m = 20;
  n = 20;
  title_string = 'Log2(X-1)+Log2(Y-1) <= 5';
  box_display ( m, n, @cc_4, @cc_5, title_string );
  print ( '-dpng', 'cc5.png' );
  fprintf ( 1, '  Created "cc5.png".\n' );

  m = 20;
  n = 20;
  title_string = 'Log2(X-1)+Log2(Y-1) <= 6';
  box_display ( m, n, @cc_5, @cc_6, title_string );
  print ( '-dpng', 'cc6.png' );
  fprintf ( 1, '  Created "cc6.png".\n' );

  m = 20;
  n = 20;
  title_string = 'Log2(X-1)+Log2(Y-1) <= 7';
  box_display ( m, n, @cc_6, @cc_7, title_string );
  print ( '-dpng', 'cc7.png' );
  fprintf ( 1, '  Created "cc7.png".\n' );

  return
end
