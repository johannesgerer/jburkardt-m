function approx_display ( )

%*****************************************************************************80
%
%% APPROX_DISPLAY displays a sequence of Bernstein approximants to SIN(X).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 July 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'APPROX_DISPLAY\n' );
  fprintf ( 1, '  BPAB_APPROX evaluates the Bernstein polynomial\n' );
  fprintf ( 1, '  approximant to a function F(X).\n' );
  fprintf ( 1, '  This program displays the sequence of approximants\n' );
  fprintf ( 1, '  to y=sin(x) over the interval [1,3]\n' );

  a = 1.0;
  b = 3.0;

  for degree = 0 : 20
%
%  Generate data values.
%
    xdata = zeros ( degree + 1, 1 );
    ydata = zeros ( degree + 1, 1 );

    for i = 0 : degree

      if ( degree == 0 )
        xdata(i+1) = 0.5 * ( a + b );
      else
        xdata(i+1) = ( ( degree - i ) * a   ...
                     + (          i ) * b ) ...
                     / ( degree     );
      end

      ydata(i+1) = sin ( xdata(i+1) );

    end
%
%  Compare the true function and the approximant.
%
    nval = 501;

    xval = linspace ( a, b, nval );

    yval = bpab_approx ( degree, a, b, ydata, nval, xval );

    clf
    plot ( xval, yval, 'b-' );
    hold on
    plot ( xval, sin ( xval ), 'r-' );
    plot ( xdata, ydata, 'r.', 'Markersize', 30 );
    grid
    xlabel ( '<---X--->' );
    ylabel ( '<---Y--->' );
    title ( sprintf ( 'Bernstein Approximant Degree %d', degree ) );
    hold off

    fprintf ( 1, 'Bernstein approximant of degree %d\n', degree );

    pause

  end

  return
end
