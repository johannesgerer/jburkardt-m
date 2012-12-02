function cascade_test01 ( )

%*****************************************************************************80
%
%% CASCADE_TEST01 compares 5 one step cascades and one five-step cascade.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CASCADE_TEST01:\n' );
  fprintf ( 1, '  Five one-step cascades = one five-step cascade.\n' );
%
%  Get DAUB4 coefficients.
%
  c = [  0.4829629131445341E+00; ...
         0.8365163037378079E+00; ...
         0.2241438680420133E+00; ...
        -0.1294095225512603E+00 ];

  c = sqrt ( 2.0 ) * c;
%
%  Compute five one-step cascades.
%  
  w0 = c;
  w1 = cascade ( 1, w0, c );
  w2 = cascade ( 1, w1, c );
  w3 = cascade ( 1, w2, c );
  w4 = cascade ( 1, w3, c );
  w5 = cascade ( 1, w4, c );
%
%  Compute one five-step cascade.
%
  w52 = cascade ( 5, w0, c );
%
%  Plot the result of five one-step cascades.
%
  figure ( 1 )
  clf
  hold on
  plot ( linspace ( 0.0, 3.0, length ( w5 ) ), w5, 'Color', 'k', 'LineWidth', 10 );
  grid
  xlabel ( '<---X--->' )
  ylabel ( '<---Y--->' )
  title ( 'Five one-step cascades (black).' )
%
%  Overwrite with the result of one five-step cascade.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Press RETURN:\n' );
  pause

  plot ( linspace ( 0.0, 3.0, length ( w52 ) ), w52, 'Color', 'r', 'LineWidth', 3 );
  
  title ( 'Five one-step cascades (black) versus one five-step cascade (red).' )

  hold off

  filename = 'cascade_test01.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A copy of this image is saved as "%s"\n', filename );
  fprintf ( 1, 'Press return\n' );
  pause

  return
end
