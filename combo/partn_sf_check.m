function ierror = partn_sf_check ( n, nmax, npart, a )

%*****************************************************************************80
%
%% PARTN_SF_CHECK checks an SF partition of an integer with largest entry NMAX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2011
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
%    Input, integer NMAX, the value of the largest entry.
%    1 <= NMAX <= N.
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
%    -2, NMAX is illegal.
%    -3, NPART is illegal.
%    -3, the entries do not add up to N.
%    I, the I-th entry of A is illegal.
%
  ierror = 0;

  if ( n < 1 )
    ierror = -1;
    return
  end

  if ( nmax < 1 || n < nmax )
    ierror = -2;
    return
  end

  if ( npart < 1 || n < npart )
    ierror = -3;
    return
  end
%
%  Entry 1 must be NMAX.
%
  if ( a(1) ~= nmax )
    ierror = 1;
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
  asum = 0;
  for i = 1 : npart
    asum = asum + a(i);
    if ( n < asum )
      ierror = i;
      return
    end
  end

  if ( asum ~= n )
    ierror = -3;
  end

  return
end
