function a = fourier_inverse ( n )

%*****************************************************************************80
%
%% FOURIER_INVERSE returns the inverse of the FOURIER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, complex A(N,N), the matrix.
%
  a = fourier ( n )';

  return
end
