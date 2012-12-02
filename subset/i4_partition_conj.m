function [ iarray2, mult2, npart2 ] = i4_partition_conj ( n, iarray1, ...
  mult1, npart1 )

%*****************************************************************************80
%
%% I4_PARTITION_CONJ computes the conjugate of a partition.
%
%  Discussion:
%
%    A partition of an integer N is a set of positive integers which
%    add up to N.  The conjugate of a partition P1 of N is another partition
%    P2 of N obtained in the following way:
%
%      The first element of P2 is the number of parts of P1 greater than
%      or equal to 1.
%
%      The K-th element of P2 is the number of parts of P1 greater than
%      or equal to K.
%
%    Clearly, P2 will have no more than N elements; it may be surprising
%    to find that P2 is guaranteed to be a partition of N.  However, if
%    we symbolize the initial partition P1 by rows of X's, then we can
%    see that P2 is simply produced by grouping by columns:
%
%        6 3 2 2 1
%      5 X X X X X
%      4 X X X X
%      2 X X
%      1 X
%      1 X
%      1 X
%
%  Example:
%
%    14 = 5 + 4 + 2 + 1 + 1 + 1
%
%    The conjugate partition is:
%
%    14 = 6 + 3 + 2 + 2 + 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters
%
%    Input, integer N, the integer to be partitioned.
%
%    Input, integer IARRAY1(NPART1).  IARRAY1 contains the parts of
%    the partition.  The value of N is represented by
%
%      sum ( 1 <= I <= NPART1 ) MULT1(I) * IARRAY1(I).
%
%    Input, integer MULT1(NPART1).  MULT1 counts the multiplicity of
%    the parts of the partition.  MULT1(I) is the multiplicity
%    of the part IARRAY1(I), for I = 1 to NPART1.
%
%    Input, integer NPART1, the number of "parts" in the partition.
%
%    Output, integer IARRAY2(N).  IARRAY contains the parts of
%    the conjugate partition in entries 1 through NPART2.
%
%    Output, integer MULT2(N).  MULT2 counts the multiplicity of
%    the parts of the conjugate partition in entries 1 through NPART2.
%
%    Output, integer NPART2, the number of "parts" in the conjugate partition.
%
  iarray2(1:n) = 0;
  mult2(1:n) = 0;
  npart2 = 0;

  itest = 0;

  while ( 1 )

    itest = itest + 1;

    itemp = 0;

    for i = 1 : npart1
      if ( itest <= iarray1(i) )
        itemp = itemp + mult1(i);
      end
    end

    if ( itemp <= 0 )
      break;
    end

    if ( 0 < npart2 )
      if ( itemp == iarray2(npart2) )
        mult2(npart2) = mult2(npart2) + 1;
      else
        npart2 = npart2 + 1;
        iarray2(npart2) = itemp;
        mult2(npart2) = 1;
      end
    else
      npart2 = npart2 + 1;
      iarray2(npart2) = itemp;
      mult2(npart2) = 1;
    end

  end

  return
end
