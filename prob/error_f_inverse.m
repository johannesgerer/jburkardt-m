function x = error_f_inverse ( y )

%*****************************************************************************80
%
%% ERROR_F_INVERSE inverts the error function ERF.
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
%    Output, real X, the value such that ERROR_F(X) = Y.
%
  z = ( y + 1.0 ) / 2.0;

  x = normal_01_cdf_inv ( z );

  x = x / sqrt ( 2.0 );

  return
end
