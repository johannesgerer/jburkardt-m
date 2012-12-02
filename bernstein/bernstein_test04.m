function bernstein_test04 ( )

%*****************************************************************************80
%
%% BERNSTEIN_TEST04 tests BPAB_APPROX.
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
  fprintf ( 1, 'BERNSTEIN_TEST04\n' );
  fprintf ( 1, '  BPAB_APPROX evaluates the Bernstein polynomial\n' );
  fprintf ( 1, '  approximant to a function F(X).\n' );

  a = 1.0;
  b = 3.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      Max Error\n' );
  fprintf ( 1, '\n' );

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

    error_max = max ( abs ( yval(1:nval) - sin ( xval(1:nval) ) ) );

    fprintf ( 1, '  %4d  %14.6g\n', degree, error_max );

  end

  return
end
