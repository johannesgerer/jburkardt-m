function dna = dna_mutate ( m, n, dna )

%*****************************************************************************80
%
%% DNA_MUTATE mutates a strand of DNA.
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
%    Input, integer M, N, the dimensions of the DNA, which are normally
%    56 and 32.  However, to simplify testing, we allow these to be variables.
%
%    Input, integer DNA(56,32), the 8 bits of the 7 "genes" of the
%    32 "chromosomes" of the DNA.
%
%    Output, integer DNA(56,32), the mutated version of the input DNA.
%    One "bit" has been changed.
%

%
%  Choose a random chromosome between 1 and N.
%
  j = randi ( [ 1, n ], 1, 1 );
%
%  Choose a random gene bit between 1 and M.
%
  i = randi ( [ 1, m ], 1, 1 );
%
%  Flip the value.
%
  dna(i,j) = 1 - dna(i,j); 

  return
end

