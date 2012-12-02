function [ ncycle, t, index ] = perm_to_cycle ( n, p )

%*****************************************************************************80
%
%% PERM_TO_CYCLE converts a permutation from array to cycle form.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 January 2011
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
%    Input, integer N, the number of values being permuted.
%    N must be positive.
%
%    Input, integer P(N), describes the permutation using a
%    single array.  For each index I, I -> P(I).
%
%    Output, integer NCYCLE, the number of cycles.
%    1 <= NCYCLE <= N.
%
%    Output, integer T(N), INDEX(N), describes the permutation
%    as a collection of NCYCLE cycles.  The first cycle is
%    T(1) -> T(2) -> ... -> T(INDEX(1)) -> T(1).
%

%
%  Check.
%
  missing = perm_check ( n, p );

  if ( missing ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_TO_CYCLE - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  Missing element = ', missing );
    error ( 'PERM_TO_CYCLE - Fatal error!' );
  end
%
%  Initialize.
%
  ncycle = 0;
  index(1:n) = 0;
  t(1:n) = 0;
  nset = 0;
%
%  Find the next unused entry.      
%
  for i = 1 : n

    if ( 0 < p(i) )

      ncycle = ncycle + 1;
      index(ncycle) = 1;

      nset = nset + 1;
      t(nset) = p(i);
      p(i) = - p(i);

      while ( 1 )

        j = t(nset);

        if ( p(j) < 0 )
          break
        end

        index(ncycle) = index(ncycle) + 1;

        nset = nset + 1;
        t(nset) = p(j);
        p(j) = - p(j);

      end

    end

  end

  return
end
