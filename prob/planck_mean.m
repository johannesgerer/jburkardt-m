function mean = planck_mean ( a, b )

%*****************************************************************************80
%
%% PLANCK_MEAN returns the mean of the Planck PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < A,
%    0.0 < B.
%
%    Output, real MEAN, the mean of the PDF.
%
  mean = ( b + 1.0 ) * zeta ( b + 2.0 ) / zeta ( b + 1.0 );

  return
end
