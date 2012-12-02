function pdf = log_normal_pdf ( x, a, b )

%*****************************************************************************80
%
%% LOG_NORMAL_PDF evaluates the Lognormal PDF.
%
%  Discussion:
%
%    PDF(X)(A,B)
%      = EXP ( - 0.5D+00 * ( ( LOG ( X ) - A ) / B )**2 )
%        / ( B * X * SQRT ( 2 * PI ) )
%
%    The Lognormal PDF is also known as the Cobb-Douglas PDF,
%    and as the Antilog_normal PDF.
%
%    The Lognormal PDF describes a variable X whose logarithm
%    is normally distributed.
%
%    The special case A = 0, B = 1 is known as Gilbrat's PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    0.0 < X
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= 0.0 )
    pdf = 0.0;
  else
    pdf = exp ( -0.5 * ( ( log ( x ) - a ) / b )^2 ) ...
      / ( b * x * sqrt ( 2.0 * pi ) );
  end

  return
end
