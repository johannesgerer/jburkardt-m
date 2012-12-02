function t = bal_seq_unrank ( rank, n )

%*****************************************************************************80
%
%% BAL_SEQ_UNRANK unranks a balanced sequence.
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
%    Input, integer RANK, the rank of the balanced sequence.
%
%    Input, integer N, the number of 0's (and 1's) in the sequence.
%    N must be positive.
%
%    Output, integer T(2*N), a balanced sequence.
%

%
%  Check.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BAL_SEQ_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  Input N is illegal.\n' );
    error ( 'BAL_SEQ_UNRANK - Fatal error!' );
  end

  nseq = bal_seq_enum ( n );

  if ( rank < 0 || nseq < rank )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BAL_SEQ_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  The input rank is illegal.\n' );
    error ( 'BAL_SEQ_UNRANK - Fatal error!' );
  end

  y = 0;
  low = 0;

  for x = 1 : 2 * n

    m = mountain ( n, x, y + 1 );

    if ( rank <= low + m - 1 )
      y = y + 1;
      t(x) = 0;
    else
      low = low + m;
      y = y - 1;
      t(x) = 1;
    end

  end

  return
end
