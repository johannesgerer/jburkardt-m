function dna = dna_random ( )

%*****************************************************************************80
%
%% DNA_RANDOM creates a random set of DNA.
%
%  Discussion:
%
%   The DNA is subdivided into 32 separate "chromosomes", each of which
%   represents on rectangle.
%
%   For each rectangle, we have 7 "genes", which represent the (x,y) of 
%   corner 1, (x,y) of corner 2, and the R, G, and B values for the rectangle.
%
%   Each gene, in turn is represented by 8 bits, because each gene is
%   an integer between 0 and 255.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2013
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
%    Output, integer DNA(56,32), the 8 bits of the 7 "genes" of the
%    32 "chromosomes" of the DNA.
%
  dna = randi ( [ 0, 1 ], 56, 32 );

  return
end