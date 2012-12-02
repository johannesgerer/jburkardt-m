function ierror = pruefer_check ( n, p )

%*****************************************************************************80
%
%% PRUEFER_CHECK checks a Pruefer code.
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
%    Input, integer N, the number of nodes in the tree.
%    N must be at least 3.
%
%    Input, integer P(N-2), the Pruefer code for the tree.
%
%    Output, integer IERROR, error flag.
%    0, no error.
%    -1, N is less than 3.
%    J, the element P(J) is illegal.
%
  ierror = 0;

  if ( n < 3 )
    ierror = -1;
    return
  end

  for i = 1 : n - 2
    if ( p(i) < 1 || n < p(i) )
      ierror = i;
      return
    end
  end

  return
end
