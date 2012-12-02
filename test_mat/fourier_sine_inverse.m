function a = fourier_sine_inverse ( n )

%*****************************************************************************80
%
%% FOURIER_SINE_INVERSE returns the inverse of the FOURIER_SINE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = fourier_sine ( n );

  return
end
