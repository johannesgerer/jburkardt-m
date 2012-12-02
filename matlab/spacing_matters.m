function spacing_matters ( )

%*****************************************************************************80
%
%  SPACING_MATTERS demonstrates a pernicious problem in defining vectors.
%
%  Discussion:
%
%    I don't like cramped coding styles that make it seem as though blank space
%    is wasted space.  So I prefer to expand function calls so that the name
%    of the function, the parentheses, and the arguments are all separated by
%    blank space.  
%
%    I was doing this to some code that someone had given me when the code
%    suddenly stopped working.  The error message from MATLAB's code analyzer
%    was characteristically stern, cryptic and of no help whatsoever:
%
%      "Expression or statement is incorrect--possibly unbalanced (, {, or [."
%
%    It took me an hour to figure out what was happening, and I thought I
%    had a defective copy of MATLAB when I realized that I could make the
%    error come or go by adding or removing a blank space!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 April 2011
%
%  Author:
%
%    John Burkardt
%


%
%  Question:
%
%    Which of the matrices A, B, C, D, E, and F is formed incorrectly, 
%    according to MATLAB?
%

%
%  The following statement is illegal, according to MATLAB.
%
  a = [ ones ( 10, 1 ); zeros ( 10, 1 ) ];
%
%  The following, seemingly equivalent statement, is legal.
%
  b = [ ones(10,1); zeros(10,1) ];
%
%  This statement is legal.
%
  c = [ ones( 10, 1 ); zeros( 10, 1 ) ];
%
%  This statement is NOT legal!
%
  d = [ ones (10,1); zeros (10,1) ];
%
%  These statements, which can be regarded as equivalent to the definition
%  of A after "tokenizing" certain strings, are legal!
%
  e1 = ones ( 10, 1 );
  e2 = zeros ( 10, 1 );
  e = [ e1; e2 ];
%
%  And of course, these are legal.
%
  f1 = ones(10,1);
  f2 = zeros(10,1);
  f = [ f1; f2 ];
%
%  What is the problem?
%  MATLAB sees the words [ ones ( 10, 1 )... as an attempt to define
%  a vector out of a variable calles "ones", followed by an object ( 10, 1 )
%  that it can't interpret.  That's because MATLAB allows you to enter the
%  entries of a vector without separating commas.
%
%  Thus, we are allowed to say:
%
%    a = [ 1 2 3 ]
%
%  but this illusory advantage comes at the disastrous cost that things
%  that can SOMETIMES be separated by spaces CANNOT be separated by spaces
%  when occuring in a literal vector.  Strangely enough, MATLAB has no
%  problem correctly handling
%
%    g = [ 1 + 2  4 * 5 ]
%
  return
end
