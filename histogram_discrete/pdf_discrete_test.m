function pdf_discrete_test ( )

%*****************************************************************************80
%
%% PDF_DISCRETE_TEST tests PDF_DISCRETE_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PDF_DISCRETE_TEST\n' );
  fprintf ( 1, '  PDF_DISCRETE_VALUE evaluates the PDF associated with a\n' );
  fprintf ( 1, '  discrete histogram.\n' );
%
%  Set up the discrete histogram from sample data.
%
  s_num = 6;
  s_min = 0.0;
  s_max = 10.0;
  s = [ 0.0, 2.0, 2.0, 4.0, 5.0, 8.0 ];
  fprintf ( 1, '\n' );
  fprintf ( 1, '  S_MIN = %g\n', s_min );
  fprintf ( 1, '  S_MAX = %g\n', s_max );
  r8vec_print ( s_num, s, '  Sample data:' );

  [ x_num, x, y ] = setup_discrete ( s_num, s, s_min, s_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Discrete histogram data:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : x_num
    fprintf ( 1, '  %10.6g  %10.6g\n', x(i), y(i) );
  end
%
%  Evaluate the discrete PDF.
%
  v_num = 21;
  v = linspace ( s_min, s_max, v_num );
  pdf = pdf_discrete_value ( x_num, x, y, v_num, v );
  r8vec2_print ( v_num, v, pdf, '  Discrete PDF table:' );
%
%  Plot the discrete PDF.
%
  plot ( v, pdf, 'bo-', 'Linewidth', 3 )
  grid on
  xlabel ( '<--- X --->' )
  ylabel ( '<--- PDF(X) --->' )
  title ( 'Discrete PDF function' )

  filename = 'pdf_discrete_test.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Discrete PDF plotted as "%s".\n', filename );

  return
end

