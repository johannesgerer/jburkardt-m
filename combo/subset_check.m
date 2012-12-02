function subset_check ( n, t )

%*****************************************************************************80
%
%% SUBSET_CHECK checks a subset.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 August 2011
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
%    Input, integer N, the number of elements in the master set.
%    N must be positive.
%
%    Input, integer T(N), the subset.  If T(I) = 0, item I is
%    not in the subset; if T(I) = 1, item I is in the subset.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SUBSET_COLEX_RANK - Fatal error!\n' );
    fprintf ( 1, '  N = %d < 1.\n', n );
    error ( 'SUBSET_COLEX_RANK - Fatal error!' );
  end

  for i = 1 : n

    if ( t(i) ~= 0 && t(i) ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SUBSET_COLEX_RANK - Fatal error!\n' );
      fprintf ( 1, '  T(%d) = %d, but must be 0 or 1.\n', i, t(i) );
      error ( 'SUBSET_COLEX_RANK - Fatal error!' );
    end

  end

  return
end
