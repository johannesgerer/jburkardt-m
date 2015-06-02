function value = r8_normal_01_pdf ( rval )

%*****************************************************************************80
%
%% R8_NORMAL_01_PDF evaluates the PDF of a standard normal distribution.
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
%    Output, real VALUE, the value of the PDF at RVAL.
%
  value = exp ( - 0.5 * rval ^ 2 ) / sqrt ( 2.0 * pi );

  return
end
