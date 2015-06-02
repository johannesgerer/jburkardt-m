function value = r8_uniform_01_pdf ( rval )

%*****************************************************************************80
%
%% R8_UNIFORM_01_PDF evaluates the PDF of a standard uniform distribution.
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
%    John Burkardt
%
%  Parameters:
%
%    Input, real RVAL, the point where the PDF is evaluated.
%
%    Output, real VALUE, the value of the PDF at RVAL.
%
  if ( rval < 0.0 )
    value = 0.0;
  elseif ( rval <= 1.0 )
    value = 1.0;
  else
    value = 0.0;
  end

  return
end