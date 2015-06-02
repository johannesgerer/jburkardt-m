function score = rgb_fitness ( m, n, k, a, b )

%*****************************************************************************80
%
%% RGB_FITNESS scores image B as a match for image A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Nick Berry,
%    A "Practical" Use for Genetic Programming,
%    http://www.datagenetics.com/blog.html
%
%  Parameters:
%
%    Input, integer M, N, K, the dimensions of the images.
%
%    Input, uint8 A(M,N,K), the original image.
%
%    Input, uint8 B(M,N,K), the approximate image.
%
%    Output, int SCORE, a score for the matching.
%
  score = sum ( sum ( sum ( abs ( double ( a ) - double ( b ) ) ) ) );

  return
end


