function value = r8_gamma_01_pdf ( alpha, rval )

%*****************************************************************************80
%
%% R8_GAMMA_01_PDF evaluates the PDF of a standard gamma distribution.
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
%    John Burkardt.
%
%  Parameters:
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
    fprintf ( 1, 'R8_GAMMA_01_PDF - Fatal error!\n' );
    fprintf ( 1, '  Parameter ALPHA is not positive.\n' );
    error ( 'R8_GAMMA_01_PDF - Fatal error!' );
  end if

  if ( rval <= 0.0 )

    value = 0.0;

  else

    temp = ( alpha - 1.0 ) * log ( rval ) - rval - r8_gamma_log ( alpha );

    value = exp ( temp );

  end

  return   
end