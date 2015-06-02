function value = r8_invchi_pdf ( df, rval )

%*****************************************************************************80
%
%% R8_INVCHI_PDF evaluates the PDF of an inverse chi-squared distribution.
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
%    Input, real RVAL, the point where the PDF is evaluated.
%
%    Output, real VALUE, the value of the PDF at RVAL.
%
  if ( df <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_INVCHI_PDF - Fatal error!'
    fprintf ( 1, '  Degrees of freedom must be positive.'
    error ( 'R8_INVCHI_PDF - Fatal error!' );
  end

  if ( rval <= 0.0 )

    value = 0.0;

  else

    temp2 = df * 0.5;
    temp1 = - temp2 * log ( 2.0 ) - ( temp2 + 1.0 ) * log ( rval ) ...
      - 0.5 / rval - r8_gamma_log ( temp2 );

    value = exp ( temp1 );

  end

  return
end