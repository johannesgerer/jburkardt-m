function nseq = bal_seq_enum ( n )

%*****************************************************************************80
%
%% BAL_SEQ_ENUM enumerates the balanced sequences.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2011
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
%    Input, integer N, the number of 0's (and 1's) in the sequence.
%    N must be nonnegative.
%
%    Output, integer NSEQ, the number of balanced sequences.
%
  nseq = i4_choose ( 2*n, n ) / ( n + 1 );

  return
end
