function pdf = maxwell_pdf ( x, a )

%*****************************************************************************80
%
%% MAXWELL_PDF evaluates the Maxwell PDF.
%
%  Discussion:
%
%    PDF(X)(A) = EXP ( - 0.5D+00 * ( X / A )^2 ) * ( X / A )^2 /
%      ( SQRT ( 2 ) * A * GAMMA ( 1.5D+00 ) )
%
%    MAXWELL_PDF(X)(A) = CHI_PDF(0,A,3)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    0 < X
%
%    Input, real A, the parameter of the PDF.
%    0 < A.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= 0.0 )

    pdf = 0.0;

  else

    y = x / a;

    pdf = exp ( -0.5 * y * y ) * y * y / ( sqrt ( 2.0 ) * a * gamma ( 1.5 ) );

  end

  return
end
