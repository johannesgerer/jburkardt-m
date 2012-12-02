function p = cycle_to_perm ( n, ncycle, t, index )

%*****************************************************************************80
%
%% CYCLE_TO_PERM converts a permutation from cycle to array form.
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
%    Input, integer N, the number of items permuted.
%    N must be positive.
%
%    Input, integer NCYCLE, the number of cycles.
%    1 <= NCYCLE <= N.
%
%    Input, integer T(N), INDEX(NCYCLE), describes the permutation
%    as a collection of NCYCLE cycles.  The first cycle is
%    T(1) -> T(2) -> ... -> T(INDEX(1)) -> T(1).
%
%    Output, integer P(N), describes the permutation using a
%    single array.  For each index I, I -> P(I).
%

%
%  Check.
%
  ierror = cycle_check ( n, ncycle, t, index );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CYCLE_TO_PERM - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'CYCLE_TO_PERM - Fatal error!' );
  end

  jhi = 0;

  for i = 1 : ncycle

    jlo = jhi + 1;
    jhi = jhi + index(i);

    for j = jlo : jhi

      if ( j < jhi )
        p(t(j)) = t(j+1);
      else
        p(t(j)) = t(jlo);
      end

    end

  end

  return
end
