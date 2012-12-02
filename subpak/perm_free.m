function ifree = perm_free ( ipart, npart, nfree )

%*****************************************************************************80
%
%% PERM_FREE reports the unused items in a partial permutation.
%
%  Discussion:
%
%    It is assumed that the N objects being permuted are the integers
%    from 1 to N, and that IPART contains a "partial" permutation, that
%    is, the NPART entries of IPART represent the beginning of a
%    permutation of all N items.
%
%    The routine returns in IFREE the items that have not been used yet.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer IPART(NPART), the partial permutation, which should
%    contain, at most once, some of the integers between 1 and
%    NPART+NFREE.
%
%    Input, integer NPART, the number of entries in IPART.  NPART may be 0.
%
%    Input, integer NFREE, the number of integers that have not been
%    used in IPART.  This is simply N - NPART.  NFREE may be zero.
%
%    Output, integer IFREE(NFREE), the integers between 1 and NPART+NFREE
%    that were not used in IPART.
%
  n = npart + nfree;

  if ( npart < 0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_FREE - Fatal error!\n' );
    fprintf ( 1, '  NPART < 0.\n' );
    error ( 'PERM_FREE - Fatal error!' );

  elseif ( npart == 0 )

    ifree = i4vec_indicator ( n );

  elseif ( nfree < 0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_FREE - Fatal error!\n' );
    fprintf ( 1, '  NFREE < 0.\n' );
    error ( 'PERM_FREE - Fatal error!' );

  elseif ( nfree == 0 )

    return

  else

    k = 0;

    for i = 1 : n

      match = 0;

      for j = 1 : npart
        if ( ipart(j) == i )
          match = j;
          break
        end
      end

      if ( match == 0 )

        k = k + 1;

        if ( nfree < k )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'PERM_FREE - Fatal error!\n' );
          fprintf ( 1, '  The partial permutation is illegal.\n' );
          fprintf ( 1, '  It should contain, at most once, some of\n' );
          fprintf ( 1, '  the integers between 1 and %d\n', n );
          error ( 'PERM_FREE - Fatal error!' );
        end

        ifree(k) = i;

      end

    end

  end

  return
end
