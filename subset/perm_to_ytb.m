function [ lambda, a ] = perm_to_ytb ( n, p )

%*****************************************************************************80
%
%% PERM_TO_YTB converts a permutation to a Young tableau.
%
%  Discussion:
%
%    The mapping is not invertible.  In most cases, several permutations
%    correspond to the same tableau.
%
%  Example:
%
%    N = 7
%    P = 7 2 4 1 5 3 6
%
%    YTB =
%      1 2 3 6
%      4 5
%      7
%
%    LAMBDA = 4 2 1 0 0 0 0
%
%    A = 1 1 1 2 2 1 3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the integer to be partitioned.
%
%    Input, integer P(N), a permutation, in standard index form.
%
%    Output, integer LAMBDA(N).  LAMBDA(I) is the length of the I-th row.
%
%    Output, integer A(N).  A(I) is the row containing I.
%

%
%  Initialize.
%
  lambda(1:n) = 0;
  a(1:n) = 0;
%
%  Insert each item of the permutation.
%
  for put_index = 1 : n

    put_value = p(put_index);
    put_row = 1;

    while ( 1 )

      another = 0;

      for compare = put_value+1 : n

        if ( a(compare) == put_row )
          another = 1;
          a(put_value) = put_row;
          a(compare) = 0;
          put_value = compare;
          put_row = put_row + 1;
          break
        end

      end

      if ( ~another )
        break
      end

    end

    a(put_value) = put_row;
    lambda(put_row) = lambda(put_row) + 1;

  end

  return
end
