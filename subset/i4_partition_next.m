function [ npart, a, mult, done ] = i4_partition_next ( n, ...
  npart, a, mult, done )

%*****************************************************************************80
%
%% I4_PARTITION_NEXT generates the partitions of an integer, one at a time.
%
%  Discussion:
%
%    The number of partitions of N is:
%
%      1     1
%      2     2
%      3     3
%      4     5
%      5     7
%      6    11
%      7    15
%      8    22
%      9    30
%     10    42
%     11    56
%     12    77
%     13   101
%     14   135
%     15   176
%     16   231
%     17   297
%     18   385
%     19   490
%     20   627
%     21   792
%     22  1002
%     23  1255
%     24  1575
%     25  1958
%     26  2436
%     27  3010
%     28  3718
%     29  4565
%     30  5604
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 July 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the integer to be partitioned.
%
%    Input, integer NPART, the output value of NPART on the previous call.
%
%    Input, integer A(N), the output value of A on the previous call.
%
%    Input, integer MULT(N), the output value of MULT on the previous call.
%
%    Input, logical DONE, is TRUE on the first call, to perform initialization.
%    On an initialization call, the input values of NPART, A and MULT are not needed.
%
%    Output, integer NPART, the number of "parts" in the next partition.
%
%    Output, integer A(N), the parts of the nextpartition.  The value N is
%    represented by sum ( 1 <= I <= NPART ) MULT(I) * A(I).
%
%    Output, integer MULT(N), the multiplicities.
%
%    Output, logical DONE, is FALSE if there are more partitions, or TRUE
%    if there are no more.
%
  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_PARTITION_NEXT - Fatal error!\n' );
    fprintf ( 1, '  N must be positive.\n' );
    fprintf ( 1, '  The input value of N was %d\n', n );
    error ( 'I4_PARTITION_NEXT - Fatal error!' );
  end

  if ( done )

    a(1) = n;
    a(2:n) = 0;

    mult(1) = 1;
    mult(2:n) = 0;

    npart = 1;
    done = 0;

  else

    if ( 1 < a(npart) | 1 < npart )

      done = 0;

      if ( a(npart) == 1 )
        is = a(npart-1) + mult(npart);
        k = npart - 1;
      else
        is = a(npart);
        k = npart;
      end

      iw = a(k) - 1;
      iu = floor ( is / iw );
      iv = mod ( is, iw );
      mult(k) = mult(k) - 1;

      if ( mult(k) == 0 )
        k1 = k;
      else
        k1 = k + 1;
      end

      mult(k1) = iu;
      a(k1) = iw;

      if ( iv == 0 )
        npart = k1;
      else
        mult(k1+1) = 1;
        a(k1+1) = iv;
        npart = k1 + 1;
      end

    else
      done = 1;
    end

  end

  return
end
