function [ npart, jarray, iarray, more ] = equiv_next ( ...
  n, npart, jarray, iarray, more )

%*****************************************************************************80
%
%% EQUIV_NEXT computes the partitions of a set one at a time.
%
%  Discussion:
%
%    A partition of a set assigns each element to exactly one subset.
%
%    The number of partitions of a set of size N is the Bell number B(N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
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
%    Input, integer N, the number of elements in the set to be partitioned.
%
%    Input, integer NPART, the number of subsets in the previous partition.
%
%    Input, integer JARRAY(N), the number of elements in each subset
%    of the previous partition.
%
%    Input, integer IARRAY(N), the subset to which each element belongs
%    in the previous partition.
%
%    Input, logical MORE, is set to FALSE on the first call, and the
%    input values of NPART, JARRAY and IARRAY are not needed.  On subsequent
%    calls, MORE should be TRUE, and NPART, JARRAY, and IARRAY should have the
%    values of the output quantities NPART, JARRAY and IARRAY
%    from the previous call.
%
%    Output, integer NPART, the number of subsets in the new partition.
%
%    Output, integer JARRAY(N), the number of elements in each subset
%    of the new partition.
%
%    Output, integer IARRAY(N), the subset to which each element belongs
%    in the new partition.
%
%    Output, logical MORE, is TRUE as long as the new partition returned
%    is not the last one.  When MORE is returned FALSE, all the partitions
%    have been computed and returned.
%
  if ( ~more )

    npart = 1;
    iarray(1:n) = 1;
    jarray(1) = n;
    jarray(2:n) = 0;

  else

    m = n;

    while ( jarray(iarray(m)) == 1 )
      iarray(m) = 1;
      m = m - 1;
    end

    l = iarray(m);
    npart = npart + m - n;
    jarray(1) = jarray(1) + n - m;

    if ( l == npart )
      npart = npart + 1;
      jarray(npart) = 0;
    end

    iarray(m) = l + 1;
    jarray(l) = jarray(l) - 1;
    jarray(l+1) = jarray(l+1) + 1;

  end

  more = ( npart ~= n );

  return
end
