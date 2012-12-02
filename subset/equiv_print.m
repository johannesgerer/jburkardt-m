function equiv_print ( n, iarray, title )

%*****************************************************************************80
%
%% EQUIV_PRINT prints a partition of a set.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, number of elements in set to be partitioned.
%
%    Input, integer IARRAY(N), defines the partition or set of equivalence
%    classes.  Element I belongs to subset IARRAY(I).
%
%    Input, character ( len = * ) TITLE, a title to be printed first.
%    TITLE may be blank.
%
  if ( s_len_trim ( title ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '   Set  Size\n' );

  s_min = min ( iarray(1:n) );
  s_max = max ( iarray(1:n) );

  for s = s_min : s_max

    k = 0;

    for j = 1 : n

      if ( iarray(j) == s )
        k = k + 1;
        karray(k) = j;
      end

    end

    if ( 0 < k )
      fprintf ( 1, '  %4d  %4d :: ', s, k );
      for j = 1 : k
        fprintf ( 1, '%4d', karray(j) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
