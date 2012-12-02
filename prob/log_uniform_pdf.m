function pdf = log_uniform_pdf ( x, a, b )

%*****************************************************************************80
%
%% LOG_UNIFORM_PDF evaluates the Log Uniform PDF.
%
%  Discussion:
%
%    PDF(A,B;X) = 1 / ( X * ( log ( B ) - log ( A ) ) ) for A <= X <= B
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, real A, B, the parameters of the PDF.
%    1.0 < A < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < a )
    pdf = 0.0;
  elseif ( x <= b )
    pdf = 1.0 / ( x * ( log ( b ) - log ( a ) ) );
  else
    pdf = 0.0;
  end

  return
end
