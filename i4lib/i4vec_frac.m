function frac = i4vec_frac ( n, a, k )

%*****************************************************************************80
%
%% I4VEC_FRAC searches for the K-th smallest entry in an I4VEC.
%
%  Discussion:
%
%    Hoare's algorithm is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, integer A(N), the array to search.
%
%    Input, integer K, the fractile to be sought.  If K = 1, the minimum
%    entry is sought.  If K = N, the maximum is sought.  Other values
%    of K search for the entry which is K-th in size.  K must be at
%    least 1, and no greater than N.
%
%    Output, integer FRAC, the value of the K-th fractile of A.
%
  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_FRAC - Fatal error!\n' );
    fprintf ( 1, '  Illegal nonpositive value of N = %d\n', n );
    error ( 'I4VEC_FRAC - Fatal error!' );
  end

  if ( k <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_FRAC - Fatal error!\n' );
    fprintf ( 1, '  Illegal nonpositive value of K = %d\n', k );
    error ( 'I4VEC_FRAC - Fatal error!' );
  end

  if ( n < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_FRAC - Fatal error!\n' );
    fprintf ( 1, '  Illegal N < K, K = %d\n', k );
    error ( 'I4VEC_FRAC - Fatal error!' );
  end

  left = 1;
  iryt = n;

  while ( 1 )

    if ( iryt <= left )
      frac = a(k);
      break;
    end

    x = a(k);
    i = left;
    j = iryt;

    while ( 1 )

      if ( j < i )
        if ( j < k )
          left = i;
        end
        if ( k < i )
          iryt = j;
        end
        break;
      end
%
%  Find I so that X <= A(I)
%
      while ( a(i) < x )
        i = i + 1;
      end
%
%  Find J so that A(J) <= X
%
      while ( x < a(j) )
        j = j - 1;
      end

      if ( i <= j )

        temp = a(i);
        a(i) = a(j);
        a(j) = temp;

        i = i + 1;
        j = j - 1;

      end

    end

  end

  return
end
