function cascade_test03 ( )

%*****************************************************************************80
%
%% CASCADE_TEST03 computes a wavelet using multiple cascades.
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
  fprintf ( 1, 'CASCADE_TEST03\n' );
  fprintf ( 1, '  Compute and plot the DAUB4 wavelet\n' );
  fprintf ( 1, '  using repeated cascades.\n' );
%
%  Set the coefficients.
%
  c = [  0.4829629131445341E+00; ...
         0.8365163037378079E+00; ...
         0.2241438680420133E+00; ...
        -0.1294095225512603E+00 ];

  c = sqrt ( 2.0 ) * c;
%
%  Set the initial data.
%
  d = r8vec_conjugate ( c );
  
  p_max = 10;

  figure ( 3 )
  clf
  hold on
  grid on

  w0 = d;

  for p = 0 : p_max

    plot ( linspace ( 0.0, 3.0, length ( w0 ) ), w0, 'r', 'LineWidth', 2 );
    xlabel ( '<---X--->' );
    ylabel ( '<---Y--->' );
    title ( sprintf ( 'Wavelet after %d cascades', p ) );
    fprintf ( 1, 'Press return\n' )
    pause

    if ( p < p_max )
      plot ( linspace ( 0.0, 3.0, length ( w0 ) ), w0, 'w', 'LineWidth', 2 );
      plot ( linspace ( 0.0, 3.0, length ( w0 ) ), w0, 'b', 'LineWidth', 1 );
      w0 = cascade ( 1, w0, c );
    end

  end

  hold off

  filename = 'cascade_test03.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A copy of this image is saved as "%s"\n', filename );

  return
end
