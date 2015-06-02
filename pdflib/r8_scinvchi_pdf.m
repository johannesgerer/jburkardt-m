function value = r8_scinvchi_pdf ( df, s, rval )

%*****************************************************************************80
%
%% R8_SCINVCHI_PDF: PDF for a scaled inverse chi-squared distribution.
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
%    Input, real DF, the degrees of freedom.
%    0.0 < DF.
%
%    Input, real S, the scale factor.
%    0.0 < S.
%
%    Input, real RVAL, the point where the PDF is evaluated.
%
%    Output, real VALUE, the value of the PDF at RVAL.
%    inverse-chi-square distribution.
%
  if ( df <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_SCINVCHI_PDF - Fatal error!\n' );
    fprintf ( 1, '  Degrees of freedom must be positive.\n' );
    error ( 'R8_SCINVCHI_PDF - Fatal error!' );
  end

  if ( s <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_SCINVCHI_PDF - Fatal error!\n' );
    fprintf ( 1, '  Scale parameter must be positive.\n' );
    error ( 'R8_SCINVCHI_PDF - Fatal error!' );
  end

  if ( rval <= 0.0 )

    value = 0.0;

  else

    temp2 = df * 0.5;
    temp1 = temp2 * log ( temp2 ) + temp2 * log ( s ) ...
      - ( temp2 * s / rval ) ...     
      - ( temp2 + 1.0 ) * log ( rval ) - r8_gamma_log ( temp2 );

    value = exp ( temp1 );

  end

  return
end