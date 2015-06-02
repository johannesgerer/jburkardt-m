function [ dna3, dna4 ] = dna_mutate ( m, n, dna1, dna2 )

%*****************************************************************************80
%
%% DNA_HYBRIDIZE crosses two DNA strands to make two new ones.
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
%    24 January 2013
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
%    Input, integer M, N, the dimensions of the DNA, which are ordinarily
%    56 and 32.  However, for testing, we allow these values to be varied.
%
%    Input, integer DNA1(56,32), DNA2(56,32), the parent DNA.
%
%    Output, integer DNA3(56,32), DNA4(56,32), the child DNA.
%
  mn = m * n;

  string1 = reshape ( dna1, 1, mn );
  string2 = reshape ( dna2, 1, mn ); 
%
%  Choose a random position between 1 and MN;
%
  i = randi ( [ 1, mn ], 1, 1 );
%
%  Splice the DNA.
%
  string3 = [ string1(1:i), string2(i+1:mn) ];
  string4 = [ string2(1:i), string1(i+1:mn) ];
%
%  Reshape the strings as arrays.
%
  dna3 = reshape ( string3, m, n );
  dna4 = reshape ( string4, m, n );

  return
end

