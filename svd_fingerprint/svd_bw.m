function b = svd_bw ( m, n, r, u, s, v )

%*****************************************************************************80
%
%% SVD_BW creates a low rank SVD approximation of a black and white image.
%
%  Discussion:
%
%    Presumably, the input data U, S, V came by starting with a uint8 
%    array A representing a black and white image, which was converted 
%    to numeric type, and the factored with the SVD command.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the original data.
%
%    Input, integer R, the rank of the approximation.
%    1 <= R <= min ( M, N ).
%
%    Input, real U(M,M), S(M,N), V(N,N), the output from the SVD command.
%
%    Output, uint8 B(M,N), the rank R approximation to the image.
%
  if ( r < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SVD_BW - Fatal error!\n' );
    fprintf ( 1, '  Rank R = %d, but must be at least 1.\n', r );
    error ( 'SVD_BW - Fatal error!' )
  end

  r = min ( r, min ( m, n ) );
%
%  Compute the rank R approximation.
%
  b(1:m,1:n) = u(1:m,1:r) * s(1:r,1:r) * v(1:n,1:r)';
%
%  Convert all data values to 0 (black) or 255 (white).
%
  b_min = min ( min ( b ) );
  b_max = max ( max ( b ) );

  if ( b_min == b_max ) 
    b = 255;
  else
    b = 255 * round ( ( b - b_min ) / ( b_max - b_min ) );
  end
%
%  Convert from double to UINT8.
%
  b = uint8 ( b );

  return
end
