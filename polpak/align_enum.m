function value = align_enum ( m, n )

%*****************************************************************************80
%
%% ALIGN_ENUM counts the alignments of two sequences of M and N elements.
%
%  Discussion:
%
%    We assume that we have sequences A and B of M and N characters each.
%    An alignment of the two sequences is a rule matching corresponding
%    elements of one sequence to another.  Some elements of either sequence
%    can be matched to a null element.  If A(I1) and A(I2) are matched
%    to B(J1) and B(J2), and I1 < I2, then it must be the case that J1 < J2.
%
%    The 5 alignments of a sequence of 1 to a sequence of 2 are:
%
%          _1_   _2_   __3__   __4__   __5__
%
%      A:  1 -   - 1   - 1 -   - - 1   1 - -
%      B:  1 2   1 2   1 - 2   1 2 -   - 1 2
%
%    The formula is:
%
%      F(0,0) = 1
%      F(1,0) = 1
%      F(0,1) = 1
%      F(M,N) = F(M-1,N) + F(M-1,N-1) + F(M,N-1)
%
%    To compute F(M,N), it is not necessary to keep an M+1 by N+1
%    array in memory.  A vector of length N will do.
%
%    F(N,N) is approximately ( 1 + sqrt(2) )**(2*N+1) / sqrt ( N )
%
%  Example:
%
%    The initial portion of the table is:
%
%
%  M/N   0    1    2    3    4       5       6       7       8       9      10
%
%   0    1    1    1    1    1       1       1       1       1       1       1
%   1    1    3    5    7    9      11      13      15      17      19      21
%   2    1    5   13   25   41      61      85     113     145     181     221
%   3    1    7   25   63  129     231     377     575     833    1159    1561
%   4    1    9   41  129  321     681    1289    2241    3649    5641    8361
%   5    1   11   61  231  681    1683    3653    7183   13073   22363   36365
%   6    1   13   85  377 1289    3653    8989   19825   40081   75517  134245
%   7    1   15  113  575 2241    7183   19825   48639  108545  224143  433905
%   8    1   17  145  833 3649   13073   40081  108545  265729  598417 1256465
%   9    1   19  181 1159 5641   22363   75517  224143  598417 1462563 3317445
%  10    1   21  221 1561 8361   36365  134245  433905 1256465 3317445 8097453
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
%    John Burkardt
%
%  Reference:
%
%    Michael Waterman,
%    Introduction to Computational Biology,
%    Chapman and Hall, 1995, pages 186-190.
%
%  Parameters:
%
%    Input, integer M, N, the number of elements of the two sequences.
%
%    Output, integer VALUE, the number of possible alignments of the
%    sequences.
%
  if ( m < 0 )
    value = 0;
    return
  elseif ( n < 0 )
    value = 0;
    return
  elseif ( m == 0 )
    value = 1;
    return
  elseif ( n == 0 )
    value = 1;
    return
  end

  fi(1:n+1) = 1;

  for i = 1 : m

    fim1jm1 = 1;

    for j = 1 : n

      fim1j = fi(j+1);

      fi(j+1) = fi(j+1) + fi(j) + fim1jm1;

      fim1jm1 = fim1j;

    end
  end

  value = fi(n+1);

  return
end
