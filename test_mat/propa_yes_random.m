function [ a, seed ] = propa_yes_random ( prob, n, seed )

%*****************************************************************************80
%
%% PROPA_YES_RANDOM returns a random matrix with property A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real PROB, the probability that a link between 
%    two eligible nodes will be made.
%
%    Input, integer N, the order of A.
%
%    Input, integer SEED, a seed for the random 
%    number generator.
%
%    Output, real A(N,N), the matrix.
%
%    Output, integer SEED, a seed for the random 
%    number generator.
%
  a(1:n,1:n) = 0.0;
%
%  Assign each index randomly to one of two sets.
%  SET(I) is 0 if I is in set 0, and 1 if it is in set 1.
%
  [ set, seed ] = sub_random ( n, seed );

  for i = 1 : n
    for j = 1 : n
      if ( set(i) ~= set(j) )
        [ chance, seed ] = r8_uniform_01 ( seed );
        if ( chance <= prob )
          a(i,j) = 1.0;
        end
      end
    end
  end

  return
end
