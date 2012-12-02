function pdf = angle_pdf ( x, n )

%*****************************************************************************80
%
%% ANGLE_PDF evaluates the Angle PDF.
%
%  Discussion:
%
%    X is an angle between 0 and PI, corresponding to the angle
%    made in an N-dimensional space, between a fixed line passing
%    through the origin, and an arbitrary line that also passes
%    through the origin, which is specified by a choosing any point
%    on the N-dimensional sphere with uniform probability.
%
%  Formula:
%
%    PDF(X) = ( sin ( X ) )**(N-2) * Gamma ( N / 2 )
%             / ( sqrt ( PI ) * Gamma ( ( N - 1 ) / 2 ) )
%
%    PDF(X) = 1 / PI if N = 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Reuven Rubinstein,
%    Monte Carlo Optimization, Simulation and Sensitivity of Queueing Networks,
%    Wiley, 1986.
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, integer N, the spatial dimension.
%    N must be at least 2.
%
%    Output, real PDF, the value of the PDF.
%
  if ( n < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '\ANGLE_PDF - Fatal error!\n' );
    fprintf ( 1, '\  N must be at least 2.\n' );
    fprintf ( 1, '\  The input value of N = %d\n', n );
    error ( 'ANGLE_PDF - Fatal error!' );
  end

  if ( x < 0.0 | pi < x )
    pdf = 0.0;
  elseif ( n == 2 )
    pdf = 1.0 / pi;
  else
    pdf = ( sin ( x ) )^( n - 2 ) * gamma ( n / 2.0 ) ...
      / ( sqrt ( pi ) * gamma ( ( n - 1 ) / 2.0 ) );
  end

  return
end
