function value = i4vec_pairwise_prime ( n, a )

%*****************************************************************************80
%
%% I4VEC_PAIRWISE_PRIME checks whether a vector of integers is pairwise prime.
%
%  Discussion:
%
%    Two positive integers I and J are pairwise prime if they have no common
%    factor greater than 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of values to check.
%
%    Input, integer A(N), the vector of integers.
%
%    Output, logical VALUE, is TRUE if the vector of integers
%    is pairwise prime.
%
  value = 0;

  for i = 1 : n
    for j = i+1 : n
      if ( i4_gcd ( a(i), a(j) ) ~= 1 )
        value = 0;
        return
      end
    end
  end

  value = 1;

  return
end
