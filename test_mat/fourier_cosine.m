function a = fourier_cosine ( n )

%*****************************************************************************80
%
%% FOURIER_COSINE returns the discrete Fourier Cosine Transform matrix.
%
%  Example:
%
%    N = 5
%
%    0.447214      0.447214      0.447214      0.447214      0.447214
%    0.601501      0.371748      0.000000     -0.371748     -0.601501
%    0.511667     -0.195440     -0.632456     -0.195439      0.511667
%    0.371748     -0.601501      0.000000      0.601501     -0.371748
%    0.195439     -0.511667      0.632456     -0.511668      0.195439
%
%  Properties:
%
%    A * A' = I.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
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
  a(1,1:n) = 1.0 / sqrt ( n );

  for i = 2 : n

    for j = 1 : n
      
      angle = ( i - 1 ) * ( 2 * j - 1 ) * pi / ( 2 * n );
      a(i,j) = sqrt ( 2.0 ) * cos ( angle ) / sqrt ( n );

    end
  end

  return
end
