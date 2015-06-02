function value = r8_beta_pdf ( alpha, beta, rval )

%*****************************************************************************80
%
%% R8_BETA_PDF evaluates the PDF of a beta distribution.
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
%    Input, real ALPHA, BETA, shape parameters.
%    0.0 < ALPHA, BETA.
%
%    Input, real RVAL, the point where the PDF is evaluated.
%
%    Output, real VALUE, the value of the PDF at RVAL.
%
  if ( alpha <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_BETA_PDF - Fatal error!\n' );
    fprintf ( 1, '  Parameter ALPHA is not positive.\n' );
    error ( 'R8_BETA_PDF - Fatal error!' );
  end

  if ( beta <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_BETA_PDF - Fatal error!\n' );
    fprintf ( 1, '  Parameter BETA is not positive.\n' );
    error ( 'R8_BETA_PDF - Fatal error!' );
  end

  if ( rval < 0.0 || 1.0 < rval )

    value = 0.0;

  else

    temp = r8_gamma_log ( alpha + beta ) - r8_gamma_log ( alpha ) ...
      - r8_gamma_log ( beta );

    value = exp ( temp ) * rval ^ ( alpha - 1.0 ) ...
      * ( 1.0 - rval ) ^ ( beta - 1.0 );

  end
 
  return
end