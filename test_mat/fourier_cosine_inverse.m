function a = fourier_cosine_inverse ( n )

%*****************************************************************************80
%
%% FOURIER_COSINE_INVERSE returns the inverse of the FOURIER_COSINE matrix.
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
  a = fourier_cosine ( n );

  a = a';

  return
end
