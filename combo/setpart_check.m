function ierror = setpart_check ( m, nsub, s, index )

%*****************************************************************************80
%
%% SETPART_CHECK checks a set partition.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer M, the number of elements of the set.
%    M must be positive.
%
%    Input, integer NSUB, the number of nonempty subsets into
%    which the set is partitioned.  1 <= NSUB <= M.
%
%    Input, integer INDEX(NSUB), lists the location in S of the
%    last element of each subset.  Thus, the elements of subset 1
%    are S(1) through S(INDEX(1)), the elements of subset 2
%    are S(INDEX(1)+1) through S(INDEX(2)) and so on.
%
%    Input, integer S(M), contains the integers from 1 to M,
%    grouped into subsets as described by INDEX.
%
%    Output, integer IERROR, error flag.
%    0, no error.
%    -I, the I-th element of INDEX is illegal.
%    +I, the I-th element of S is illegal.
%
  ierror = 0;
%
%  Check INDEX.
%
  imin = 0;
  for i = 1 : nsub
    if ( index(i) <= imin || m < index(i) )
      ierror = -i;
      return
    end
    imin = index(i);
  end
%
%  Check the elements of S.
%
  for i = 1 : nsub

    if ( s(i) <= 0 || m < s(i) )
      ierror = i;
      return
    end

    for j = 1 : i - 1
      if ( s(j) == s(i) )
        ierror = i;
        return
      end
    end

  end

  return
end
