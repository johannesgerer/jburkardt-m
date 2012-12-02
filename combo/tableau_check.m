function ierror = tableau_check ( n, tab )

%*****************************************************************************80
%
%% TABLEAU_CHECK checks a 2 by N tableau.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 January 2011
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
%    Input, integer N, the number of columns in the tableau.
%    N must be positive.
%
%    Input, integer TAB(2,N), a 2 by N tableau.
%
%    Output, integer IERROR, error flag.
%    0, no error.
%    -1, N was illegal.
%    (I-1)*N+J, the (I,J) entry of TAB is illegal.
%
  ierror = 0;

  if ( n < 1 )
    ierror = -1;
    return
  end
%
%  The entries must be between 0 and 2*N.
%
  for i = 1 : 2
    for j = 1 : n
      if ( tab(i,j) < 1 || 2 * n < tab(i,j) )
        ierror = ( i - 1 ) * n + j;
        return
      end
    end
  end
%
%  The entries must be increasing to the right.
%
  for i = 1 : 2
    for j = 2 : n
      if ( tab(i,j) <= tab(i,j-1) )
        ierror = ( i - 1 ) * n + j;
        return
      end
    end
  end
%
%  The entries must be increasing down.
%
  i = 2;
  for j = 1 : n
    if ( tab(i,j) <= tab(i-1,j) )
      ierror = ( i - 1 ) * n + j;
      return
    end
  end

  return
end
