function mean = nakagami_mean ( a, b, c )

%*****************************************************************************80
%
%% NAKAGAMI_MEAN returns the mean of the Nakagami PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < B
%    0.0 < C
%
%    Output, real MEAN, the mean of the PDF.
%
  mean = a + b * gamma ( c + 0.5 ) / ( sqrt ( c ) * gamma ( c ) );

  return
end
