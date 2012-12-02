function dot = permutation_puzzle ( n )

%*****************************************************************************80
%
%% PERMUTATION_PUZZLE exhibits a peculiar property of permutations.
%
%  Discussion:
%
%    Let P1 and P2 be arbitrary permutations of the integers from 1 to 10.
%
%    Pair corresponding entries of the permutations to create the set of 10 
%    points (P1(1),P2(1)) through (P1(10),P2(10)).  Now subtract 5, that is, 
%    N/2, from the X and Y coordinates of each point so that their average value 
%    is zero.  Then apply a rotation of 45 degrees to each vector.
%
%    Now instead of looking at 10 vectors (X(I),Y(I)), each of length 2, consider 
%    the data as two vectors X and Y, each of length 10.  If the instructions have 
%    been followed correctly, then X are Y are perpendicular to each other in 
%    10-dimensional space. 
%
%    In fct, this seems to be true for all the permutations you try.
%    You can even set P1 and P2 equal.  
%    You can try other values of N.
%
%    It does not work for most other rotation angles.  For example, a 30 degree
%    rotation will not work.
%
%    Once you've picked P1 and P2, you can take an arbitrary vector Q,
%    set Q1 = Q(P1) and Q2 = Q(P2) and carry out the transformation on Q1 and
%    Q2 instead of on P1 and P2, and it will still work.
%
%    The question is, can you show that all these statements are true, and
%    can you explain why?
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the vector length.
%
%    Output, real DOT, the dot product of the two vectors.
%
  p1 = randperm ( n );
  p2 = randperm ( n );

  xy = [ p1; p2 ];

  xy = xy - ( n / 2 );

  angle = pi / 4;

  A = [ cos ( angle ), - sin ( angle ); ...
        sin ( angle ),   cos ( angle ) ]; 

  xy = A * xy;

  dot = xy(1,1:n) * xy(2,1:n)';

  return
end

