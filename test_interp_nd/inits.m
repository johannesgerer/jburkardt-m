function value = inits ( dos, nos, eta )

%*****************************************************************************80
%
%% INITS initializes a Chebyshev series.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Roger Broucke,
%    Algorithm 446:
%    Ten Subroutines for the Manipulation of Chebyshev Series,
%    Communications of the ACM,
%    Volume 16, Number 4, April 1973, pages 254-256.
%
%  Parameters:
%
%    Input, real DOS(NOS), the Chebyshev coefficients.
%
%    Input, integer NOS, the number of coefficients.
%
%    Input, real ETA, the desired accuracy.
%
%    Output, integer VALUE, the number of terms of the series needed
%    to ensure the requested accuracy.
%
  if ( nos < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'INITS - Fatal error!\n' );
    fprintf ( 1, '  Number of coefficients < 1.\n' );
    error ( 'INITS - Fatal error!' )
  end

  err = 0.0;

  for i = nos : -1 : 1
    err = err + abs ( dos(i) );
    if ( eta < err )
      value = i;
      return
    end
  end

  value = nos;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'INITS - Warning!\n' );
  fprintf ( 1, '  ETA may be too small.\n' );

  return
end
