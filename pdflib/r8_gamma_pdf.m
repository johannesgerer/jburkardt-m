function value = r8_gamma_pdf ( beta, alpha, rval )

%*****************************************************************************80
%
%% R8_GAMMA_PDF evaluates the PDF of a gamma distribution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2013
%
%  Author:
%
%    Original FORTRAN90 version by Guannan Zhang.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, real BETA, the rate parameter.
%    0.0 < BETA.
%
%    Input, real ALPHA, the shape parameter.
%    0.0 < ALPHA.
%
%    Input, real RVAL, the point where the PDF is evaluated.
%
%    Output, real VALUE, the value of the PDF at RVAL.
%
  if ( alpha <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_GAMMA_PDF - Fatal error!\n' );
    fprintf ( 1, '  Parameter ALPHA is not positive.\n' );
    error ( 'R8_GAMMA_PDF - Fatal error!' );
  end

  if ( beta <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_GAMMA_PDF - Fatal error!\n' );
    fprintf ( 1, '  Parameter BETA is not positive.\n' );
    error ( 'R8_GAMMA_PDF - Fatal error!' );
  end

  if ( rval <= 0.0 )

    value = 0.0;

  else

    temp = alpha * log ( beta ) + ( alpha - 1.0 ) * log ( rval ) ...
      - beta * rval - r8_gamma_log ( alpha );

    value = exp ( temp );

  end

  return   
end