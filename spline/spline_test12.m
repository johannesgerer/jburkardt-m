function spline_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests BPAB_APPROX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author
%
%    John Burkardt
%
  maxdata = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  BP_APPROX evaluates the Bernstein polynomial\n' );
  fprintf ( 1, '    approximant to a function F(X).\n' );

  a = 1.0E+00;
  b = 3.0E+00;

  for ndata = 0 : 3 : 9

    for i = 0 : ndata

      if ( ndata == 0 )
        xdata(i+1) = 0.5E+00 * ( a + b );
      else
        xdata(i+1) = ( ( ndata - i ) * a   ...
                   + (         i ) * b ) ...
                   / ( ndata );
      end

      ydata(i+1) = sin ( xdata(i+1) );

    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '    XDATA, YDATA\n' );
    fprintf ( 1, '\n' );
    for i = 1 : ndata + 1
      fprintf ( 1, '%14f  %14f\n', xdata(i), ydata(i) );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Bernstein approximant of degree N = %d\n', ndata );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    X      F(X)     BERN(X)    ERROR\n' );
    fprintf ( 1, '\n' );

    nsample = 2 * ndata + 1;

    for i = 1 : nsample

      if ( nsample == 1 )
        xval = 0.5E+00 * ( a + b );
      else
        xval = ( ( nsample - i     ) * a   ...
               + (           i - 1 ) * b ) ...
               / ( nsample     - 1 );
      end

      yval = bpab_approx ( ndata, a, b, ydata, xval );

      fprintf ( 1, '%14f  %14f  %14f  %14f\n', xval, sin(xval), ...
        yval, yval - sin(xval) );

    end

  end

  return
end
