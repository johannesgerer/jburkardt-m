function rgb = dna_to_rgb_max ( dna )

%*****************************************************************************80
%
%% DNA_TO_RGB_MAX creates an RGB image from DNA.
%
%  Discussion:
%
%    The DNA is subdivided into 32 separate "chromosomes", each of which
%    represents on rectangle.
%
%    For each rectangle, we have 7 "genes", which represent the (x,y) of 
%    corner 1, (x,y) of corner 2, and the R, G, and B values for the rectangle.
%
%    Each gene, in turn is represented by 8 bits, because each gene is
%    an integer between 0 and 255.
%
%    This function computes the RGB image as the maximum of the R, G, and B
%    values from each block.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 August 2013
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
%    Input, integer DNA(56,32), the 8 bits of the 7 "genes" of the
%    32 "chromosomes" of the DNA.
%
%    Output, uint8 RGB(256,256,3), the RGB information.
%
  c = zeros ( 256, 256 );
  rgb = zeros ( 256, 256, 3 );

  for j = 1 : 32

    x1 = b8_to_i ( dna(1:8,j) );
    y1 = b8_to_i ( dna(9:16,j) );
    x2 = b8_to_i ( dna(17:24,j) );
    y2 = b8_to_i ( dna(25:32,j) );
    r = b8_to_i ( dna(33:40,j) );
    g = b8_to_i ( dna(41:48,j) );
    b = b8_to_i ( dna(49:56,j) );

    xlo = min ( x1, x2 ) + 1;
    xhi = max ( x1, x2 ) + 1;
    ylo = min ( y1, y2 ) + 1;
    yhi = max ( y1, y2 ) + 1;

    nx = xhi + 1 - xlo;
    ny = yhi + 1 - ylo;

    rmat = r * ones ( nx, ny, 1 );
    gmat = g * ones ( nx, ny, 1 );
    bmat = b * ones ( nx, ny, 1 );

    rgb(xlo:xhi,ylo:yhi,1) = max ( rgb(xlo:xhi,ylo:yhi,1), rmat(1:nx,1:ny,1) );
    rgb(xlo:xhi,ylo:yhi,2) = max ( rgb(xlo:xhi,ylo:yhi,2), gmat(1:nx,1:ny,1) );
    rgb(xlo:xhi,ylo:yhi,3) = max ( rgb(xlo:xhi,ylo:yhi,3), bmat(1:nx,1:ny,1) );

  end

  rgb = uint8 ( rgb );

  return
end
