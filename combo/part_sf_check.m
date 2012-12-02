function ierror = part_sf_check ( n, npart, a )

%*****************************************************************************80
%
%% PART_SF_CHECK checks a standard form partition of an integer.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
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
%    Input, integer N, the integer to be partitioned.
%    N must be positive.
%
%    Input, integer NPART, the number of parts of the partition.
%    1 <= NPART <= N.
%
%    Input, integer A(NPART), contains the partition.
%    A(1) through A(NPART) contain the nonzero integers which
%    sum to N.  The entries must be in DESCENDING order.
%
%    Output, integer IERROR, error flag.
%    0, no error.
%    -1, N is illegal.
%    -2, NPART is illegal.
%    -3, the entries do not add up to N.
%    I, the I-th entry of A is illegal.
%
  ierror = 0;

  if ( n < 1 )
    ierror = -1;
    return
  end

  if ( npart < 1 || n < npart )
    ierror = -2;
    return
  end
%
%  Every entry must lie between 1 and N.
%
  for i = 1 : npart
    if ( a(i) < 1 || n < a(i) )
      ierror = i;
      return
    end
  end
%
%  The entries must be in descending order.
%
  for i = 2 : npart
    if ( a(i-1) < a(i) )
      ierror = i;
      return
    end
  end
%
%  The entries must add up to N.
%
  if ( sum ( a(1:npart) ) ~= n )
    ierror = -3;
  end

  return
end
