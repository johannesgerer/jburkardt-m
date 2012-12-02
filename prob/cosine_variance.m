function variance = cosine_variance ( a, b )

%*****************************************************************************80
%
%% COSINE_VARIANCE returns the variance of the Cosine PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = ( pi * pi / 3.0 - 2.0 ) * b * b;

  return
end
