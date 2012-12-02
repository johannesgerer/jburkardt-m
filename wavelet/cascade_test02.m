function cascade_test02 ( )

%*****************************************************************************80
%
%% CASCADE_TEST02 computes a scaling function at 5 resolutions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 August 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CASCADE_TEST02:\n' );
  fprintf ( 1, '  Compute and plot the DAUB4 scaling function\n' );
  fprintf ( 1, '  using repeated cascades.\n' );
%
%  Compute a scaling function.
%
  c = [  0.4829629131445341E+00; ...
         0.8365163037378079E+00; ...
         0.2241438680420133E+00; ...
        -0.1294095225512603E+00 ];

  c = sqrt ( 2.0 ) * c;

  p_max = 10;

  figure ( 2 )
  clf
  hold on
  grid on

  w0 = c;

  for p = 0 : p_max

    plot ( linspace ( 0.0, 3.0, length ( w0 ) ), w0, 'r', 'LineWidth', 2 );
    xlabel ( '<---X--->' );
    ylabel ( '<---Y--->' );
    title ( sprintf ( 'Scaling function after %d cascades', p ) );
    fprintf ( 1, 'Press return\n' )
    pause

    if ( p < p_max )
      plot ( linspace ( 0.0, 3.0, length ( w0 ) ), w0, 'w', 'LineWidth', 2 );
      plot ( linspace ( 0.0, 3.0, length ( w0 ) ), w0, 'b', 'LineWidth', 1 );
      w0 = cascade ( 1, w0, c );
    end

  end

  hold off

  filename = 'cascade_test02.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A copy of this image is saved as "%s"\n', filename );

  return
end
