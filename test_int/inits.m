function need = inits ( os, nos, eta )

%*****************************************************************************80
%
%% INITS finds the number of Chebyshev terms needed to achieve a given accuracy.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2009
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    FORTRAN90 version by John Burkardt.
%
%  Parameters:
%
%    Input, real OS(NOS), the array of coefficients.
%
%    Input, integer NOS, the number of coefficients.
%
%    Input, real ETA, the requested accuracy.
%    A typical value of ETA is ( EPSILON ( 1.0 ) ) / 10.0.
%
%    Output, integer NEED, the number of terms needed for
%    the given accuracy.
%
  if ( nos < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'INITS - Fatal error!\n' );
    fprintf ( 1, '  The number of coefficients is less than 1.\n' );
    fprintf ( 1, '  NOS = %d\n', nos );
    error ( 'INITS - Fatal error!' );
  end

  need = nos;

  err = 0.0;
  for i = nos : -1 : 1
    err = err + abs ( os(i) );
    if ( eta < err )
      need = i;
      return
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'INITS - Warning!\n' );
  fprintf ( 1, '  The requested accuracy, ETA = %e\n', eta );
  fprintf ( 1, '  is smaller than the Chebyshev coefficients\n' );
  fprintf ( 1, '  can guarantee.\n' );

  return
end
