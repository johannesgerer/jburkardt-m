function value = r8_exponential_01_pdf ( rval )

%*****************************************************************************80
%
%% R8_EXPONENTIAL_01_PDF: PDF of a standard exponential distribution.
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
%    Input, real RVAL, the point where the PDF is evaluated.
%
%    Output, real VALUE, the value of the PDF.
%
  if ( rval < 0.0 )
    value = 0.0;
  else
    value = exp ( - rval );
  end

  return
end