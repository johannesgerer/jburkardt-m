function ierror = bal_seq_check ( n, t )

%*****************************************************************************80
%
%% BAL_SEQ_CHECK checks a balanced sequence.
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
%    Output, integer IERROR, error flag.
%    0, no error.
%    -1, N is not positive.
%    I, the I-th entry of T is illegal.
%    2*N+1, there are not the same number of 1's as 0's.
%
  ierror = 0;

  if ( n < 1 )
    ierror = -1;
    return
  end

  one_count = 0;
  zero_count = 0;

  for i = 1 : 2 * n

    if ( t(i) == 0 )
      zero_count = zero_count + 1;
    elseif ( t(i) == 1 )
      one_count = one_count + 1;
    else
      ierror = i;
      return
    end

    if ( zero_count < one_count )
      ierror = 1;
      return
    end

  end

  if ( one_count ~= zero_count )
    ierror = 2 * n + 1;
  end

  return
end
