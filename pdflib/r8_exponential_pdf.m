function value = r8_exponential_pdf ( beta, rval )

%*****************************************************************************80
%
%% R8_EXPONENTIAL_PDF evaluates the PDF of an exponential distribution.
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
%    This MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, real BETA, the scale value.
%    0.0 < BETA.
%
%    Input, real RVAL, the point where the PDF is evaluated.
%
%    Output, real VALUE, the value of the PDF at RVAL.
%
  if ( beta <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_EXPONENTIAL_PDF - Fatal error!\n' );
    fprintf ( 1, '  BETA parameter must be positive.\n' );
    error ( 'R8_EXPONENTIAL_PDF - Fatal error!' );
  end if

  if ( rval < 0.0 )
    value = 0.0;
  else
    value = exp ( - rval / beta ) / beta;
  end

  return
end