function [ a, done ] = equiv_next2 ( n, a, done )

%*****************************************************************************80
%
%% EQUIV_NEXT2 computes, one at a time, the partitions of a set.
%
%  Discussion:
%
%    A partition of a set assigns each element to exactly one subset.
%
%    The number of partitions of a set of size N is the Bell number B(N).
%
%    The entries of IARRAY are the partition subset to which each
%    element of the original set belongs.  If there are NPART distinct
%    parts of the partition, then each entry of IARRAY will be a
%    number between 1 and NPART.  Every number from 1 to NPART will
%    occur somewhere in the list.  If the entries of IARRAY are
%    examined in order, then each time a new partition subset occurs,
%    it will be the next unused integer.
%
%    For instance, for N = 4, the program will describe the set
%    where each element is in a separate subset as 1, 2, 3, 4,
%    even though such a partition might also be described as
%    4, 3, 2, 1 or even 1, 5, 8, 19.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 June 2004
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements in the set.
%
%    Input, integer A(N), the previous partition, that is, the output value
%    of A on the previous call.  On the first call, with DONE = TRUE,
%    the value of A is not needed.
%
%    Input, logical DONE, should be set to TRUE for the first call, to set
%    up initialization, and should be FALSE thereafter.
%
%    Output, integer A(N), the next partition.
%
%    Output, logical DONE, is TRUE if there are more partitions to generate.
%
  if ( done )

    done = 0;
    a(1:n) = 1;

  else
%
%  Find the last element J that can be increased by 1.
%  This is the element that is not equal to its maximum possible value,
%  which is the maximum value of all preceding elements +1.
%
    jmax = a(1);
    imax = 1;

    for j = 2 : n

      if ( jmax < a(j) )
        jmax = a(j);
      else
        imax = j;
      end

    end
%
%  If no element can be increased by 1, we are done.
%
    if ( imax == 1 )
      done = 1;
      return
    end
%
%  Increase the value of the IMAX-th element by 1, set its successors to 1.
%
    done = 0;
    a(imax) = a(imax) + 1;
    a(imax+1:n) = 1;

  end

  return
end
