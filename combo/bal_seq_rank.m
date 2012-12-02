function rank = bal_seq_rank ( n, t )

%*****************************************************************************80
%
%% BAL_SEQ_RANK ranks a balanced sequence.
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
%    N must be positive.
%
%    Input, integer T(2*N), a balanced sequence.
%
%    Output, integer RANK, the rank of the balanced sequence.
%

%
%  Check.
%
  ierror = bal_seq_check ( n, t );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BAL_SEQ_RANK - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'BAL_SEQ_RANK - Fatal error!' );
  end

  y = 0;
  rank = 0;

  for x = 1 : 2 * n - 1

    if ( t(x) == 0 )
      y = y + 1;
    else
      mxy = mountain ( n, x, y + 1 );
      rank = rank + mxy;
      y = y - 1;
    end

  end

  return
end
