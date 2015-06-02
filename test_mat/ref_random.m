function a = ref_random ( m, n, prob, key )

%*****************************************************************************80
%
%% REF_RANDOM returns a random row echelon matrix.
%
%  Definition:
%
%    1) the first nonzero entry in any row is 1.
%
%    2) the first nonzero entry in row I occurs in a later column
%       than the first nonzero entry of every previous row.
%
%    3) rows that are entirely zero occur after all rows with
%       nonzero entries.
%
%  Example:
%
%    M = 6, N = 5, PROB = 0.8
%
%     1.0  0.3  0.2  0.0  0.5
%     0.0  0.0  1.0  0.7  0.9
%     0.0  0.0  0.0  1.0  0.3
%     0.0  0.0  0.0  0.0  1.0
%     0.0  0.0  0.0  0.0  0.0
%     0.0  0.0  0.0  0.0  0.0
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of the matrix.
%
%    Input, real PROB, the probability that the 1 in the next 
%    row will be placed as early as possibly.
%    Setting PROB = 1 forces the 1 to occur immediately, setting
%    PROB = 0 forces the entire matrix to be zero.  A more reasonable
%    value might be PROB = 0.8 or 0.9.
%
%    Input, integer KEY, a positive value that selects the data..
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  jprev = 0;

  seed = key;

  for i = 1 : m

    jnew = 0;

    for j = 1 : n

      if ( j <= jprev )
        a(i,j) = 0.0;
      elseif ( jnew == 0 )
        [ temp, seed ] = r8_uniform_01 ( seed );
        if ( temp <= prob )
          jnew = j;
          a(i,j) = 1.0;
        else
          a(i,j) = 0.0;
        end
      else
        [ a(i,j), seed ] = r8_uniform_01 ( seed );
      end

    end

    if ( jnew == 0 )
      jnew = n + 1;
    end

    jprev = jnew;

  end

  return
end
