function g2 = image_diffuse ( g, c, steps )

%*****************************************************************************80
%
%% IMAGE_DIFFUSE applies diffusion to smooth an image.
%
%  Discussion:
%
%    Most pixels in an image have 8 neighbors.  We can use a sort of diffusion
%    operation to blend a pixel's value with the average of its neighbors.
%    If the original image was entirely black and white, for instance, then
%    this operation would introduce shades of gray.
%
%    The amount of blending is controlled by C.
%
%    The number of blending steps is controlled by STEPS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, uint8 G(M,N), the gray scale image.
%
%    Input, real C, the diffusion constant.  Normally 0 < C < 1.
%    C = 0 means the image doesn't change.  C = 1 means each pixel
%    value is completely replace by an immediate neighbor average.
%
%    Input, integer STEPS, the number of steps of diffusion to take.
%
%    Output, uint8 G(M,N), the diffused gray scale image.
%
  g = double ( g );
%
%  We're outputing a UINT8 file, so rescale the input data appropriately.
%
  gmax = max ( max ( g ) );
  if ( gmax < 255 )
    g = 255 * ( g / gmax );
  end

  [ m, n ] = size ( g );

  g2 = zeros ( m, n );
  g3 = g;

  for k = 1 : steps

    g2 = g3;
%
%  8 neighbors for Interior.
%
    g3(2:m-1,2:n-1) = ...
      ( g2(1:m-2,1:n-2) ...
      + g2(1:m-2,2:n-1) ...
      + g2(1:m-2,3:n  ) ...
      + g2(2:m-1,1:n-2) ...
      + g2(2:m-1,3:n  ) ...
      + g2(3:m,  1:n-2) ...
      + g2(3:m,  2:n-1) ...
      + g2(3:m,  3:n  ) ) / 8;
%
%  5 neighbors for edges.
%
    g3(2:m-1,1) = ...
      ( g2(1:m-2,1) ...
      + g2(3:m,1) ...
      + g2(1:m-2,2) ...
      + g2(2:m-1,2) ...
      + g2(3:m,2) ) / 5;

    g3(2:m-1,n) = ...
      ( g2(1:m-2,n) ...
      + g2(3:m,n) ...
      + g2(1:m-2,n-1) ...
      + g2(2:m-1,n-1) ...
      + g2(3:m,n-1) ) / 5;

    g3(1,2:n-1) = ...
      ( g2(1,1:n-2) ...
      + g2(1,3:n) ...
      + g2(2,1:n-2) ...
      + g2(2,2:n-1) ...
      + g2(2,3:n) ) / 5;

    g3(m,2:n-1) = ...
      ( g2(m,1:n-2) ...
      + g2(m,3:n) ...
      + g2(m-1,1:n-2) ...
      + g2(m-1,2:n-1) ...
      + g2(m-1,3:n) ) / 5;
%
%   3 neighbors for corners.
%
    g3(1,1) = ...
      ( g2(1,2) ...
      + g2(2,1) ...
      + g2(2,2) ) / 3;

    g3(m,1) = ...
      ( g2(m,2) ...
      + g2(m-1,1) ...
      + g2(m-1,2) ) / 3;

    g3(1,n) = ...
      ( g2(1,n-1) ...
      + g2(2,n) ...
      + g2(2,n-1)   ) / 3;

    g3(m,n) = ...
      ( g2(m,n-1) ...
      + g2(m-1,n) ...
      + g2(m-1,n-1) ) / 3;
%
%  Blend.
%
    g3(1:m,1:n) = c * g3(1:m,1:n) + ( 1 - c ) * g2(1:m,1:n);

  end
%
%  Recast as unsigned 8 bit integers.
%
  g2 = uint8 ( g3 );

  return
end
