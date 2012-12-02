function [ npart, a, mult, more ] = i4_partition_next2 ( n, npart, a, mult, ...
  more )

%*****************************************************************************80
%
%% I4_PARTITION_NEXT2 computes the partitions of the integer N one at a time.
%
%  Discussion:
%
%    Unlike compositions, order is not important in a partition.  Thus
%    the sequences 3+2+1 and 1+2+3 represent distinct compositions, but
%    not distinct partitions.  Also 0 is never returned as one of the
%    elements of the partition.
%
%    Initialize the program by calling with MORE = FALSE.  On an initialization
%    call, the input values of A, MULT and NPART are not needed.  Thereafter,
%    they should be set to the output values of A, MULT and NPART
%    from the previous call.
%
%  Example:
%
%    Sample partitions of 6 include:
%
%      6 = 4+1+1 = 3+2+1 = 2+2+2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the integer whose partitions are desired.
%
%    Input, integer NPART, the output value of NPART on the previous call.
%
%    Input, integer A(N), the output value of A on the previous call.
%
%    Input, integer MULT(N), the output value of MULT on the previous call.
%
%    Input, logical MORE, is FALSE on the first call, which causes
%    initialization.  Thereafter, it should be TRUE.
%
%    Output, integer NPART, the number of distinct, nonzero parts in the
%    output partition.
%
%    Output, integer A(N).  A(1:NPART) the distinct parts
%    of the partition.
%
%    Output, integer MULT(1:NPART), the multiplicity of the parts.
%
%    Output, logical MORE is TRUE if there are more partitions available.
%
  if ( ~more )
    npart = 1;
    a(npart) = n;
    mult(npart) = 1;
    more = ( mult(npart) ~= n );
    return
  end

  isum = 1;

  if ( a(npart) <= 1 )
    isum = mult(npart) + 1;
    npart = npart - 1;
  end

  iff = a(npart) - 1;

  if ( mult(npart) ~= 1 )
    mult(npart) = mult(npart) - 1;
    npart = npart + 1;
  end

  a(npart) = iff;
  mult(npart) = 1 + floor ( isum / iff );
  is = mod ( isum, iff );

  if ( 0 < is )
    npart = npart + 1;
    a(npart) = is;
    mult(npart) = 1;
  end
%
%  There are more partitions, as long as we haven't just computed
%  the last one, which is N copies of 1.
%
  more = ( mult(npart) ~= n );

  return
end
