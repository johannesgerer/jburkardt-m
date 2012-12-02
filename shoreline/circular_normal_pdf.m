function pdf = circular_normal_pdf ( x, a, b )

%*****************************************************************************80
%
%% CIRCULAR_NORMAL_PDF evaluates the Circular Normal PDF.
%
%  Discussion:
%
%    PDF(X) = EXP ( - 0.5 * ( ( (X(1)-A(1))^2 + (X(2)-A(2))^2 ) / B^2 )
%      / ( 2 * PI * B^2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(2,:), the argument of the PDF.
%
%    Input, real A(2), a parameter of the PDF, the mean value.
%
%    Input, real B, a parameter of the PDF, the standard deviation.
%
%    Output, real PDF(:), the value of the PDF.
%
  d = ( ( x(1,:) - a(1) ).^2 + ( x(2,:) - a(2) ).^2 ) / b^2;

  pdf = exp ( - 0.5 * d ) / ( 2.0D+00 * b^2 * pi );

  return
end
