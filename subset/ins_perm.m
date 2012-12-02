function p = ins_perm ( n, ins )

%*****************************************************************************80
%
%% INS_PERM computes a permutation from its inversion sequence.
%
%  Discussion:
%
%    For a given permutation P acting on objects 1 through N, the
%    inversion sequence INS is defined as:
%
%      INS(1) = 0
%      INS(I) = number of values J < I for which P(I) < P(J).
%
%  Example:
%
%    Input:
%
%      ( 0, 0, 2, 1, 3 )
%
%    Output:
%
%      ( 3, 5, 1, 4, 2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dennis Stanton and Dennis White,
%    Constructive Combinatorics,
%    Springer Verlag, New York, 1986.
%
%  Parameters:
%
%    Input, integer N, the number of objects being permuted.
%
%    Input, integer INS(N), the inversion sequence of a permutation.
%    It must be the case that 0 <= INS(I) < I for I = 1 to N.
%
%    Output, integer P(N), the permutation.
%
  p = i4vec_indicator ( n );

  for i = n : -1 : 2

    itemp = p(i-ins(i));

    for j = i-ins(i) : i-1
      p(j) = p(j+1);
    end

    p(i) = itemp;

  end

  return
end
