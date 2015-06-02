function x = r8_erf_inverse ( y )

%*****************************************************************************80
%
%% R8_ERF_INVERSE inverts the error function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real Y, the value of the error function.
%
%    Output, real X, the value such that R8_ERF(X) = Y.
%
  z = ( y + 1.0 ) / 2.0;

  x = normal_01_cdf_inverse ( z );

  x = x / sqrt ( 2.0 );

  return
end
