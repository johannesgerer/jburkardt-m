function a = i4mat_perm2 ( m, n, a, p, q )

%*****************************************************************************80
%
%% I4MAT_PERM2 permutes the rows and columns of a rectangular I4MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer M, number of rows in the matrix.
%
%    Input, integer N, number of columns in the matrix.
%
%    Input, integer A(M,N), the matrix to be permuted.
%
%    Input, integer P(M), the row permutation.  P(I) is the new number of row I.
%
%    Input, integer Q(N), the column permutation.  Q(I) is the new number of
%    column I.  Note that this routine allows you to pass a single array as both
%    P and Q.
%
%    Output, integer A(M,N), the permuted matrix.
%
  base = 1;
  ierror = perm_check ( m, p, base );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_PERM2 - Fatal error!\n' );
    fprintf ( 1, '  The input array P does not represent\n' );
    fprintf ( 1, '  a proper permutation.  In particular, the\n' );
    fprintf ( 1, '  array is missing the value %d\n', ierror );
    error ( 'I4MAT_PERM2 - Fatal error!' );
  end 

  p = perm_cycle ( m, p, is, nc, 1 );

  ierror = perm_check ( n, q, base );

  if ( ierror ~= 0 ) then
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_PERM2 - Fatal error!\n' );
    fprintf ( 1, '  The input array Q does not represent\n' );
    fprintf ( 1, '  a proper permutation.  In particular, the\n' );
    fprintf ( 1, '  array is missing the value %d\n', ierror );
    error ( 'I4MAT_PERM2 - Fatal error!' );
  end

  q = perm_cycle ( n, q, is, nc, 1 );

  for i = 1 : m

    i1 = -p(i);

    if ( 0 < i1 )

      lc = 0;

      while ( 1 )

        i1 = p(i1);
        lc = lc + 1;

        if ( i1 <= 0 )
          break
        end

      end

      i1 = i;

      for j = 1 : n

        if ( q(j) <= 0 )

          j2 = j;
          k = lc;

          while ( 1 )

            j1 = j2;
            it = a(i1,j1);

            while ( 1 )

              i1 = abs ( p(i1) );
              j1 = abs ( q(j1) );

              temp = it;
              it = a(i1,j1);
              a(i1,j1) = temp;

              if ( j1 ~= j2 )
                continue
              end

              k = k - 1;

              if ( i1 == i )
                continue
              end

            end

            j2 = abs ( q(j2) );

            if ( k == 0 )
              break
            end

          end

        end

      end

    end

  end
%
%  Restore the positive signs of the data.
%
  p(1:m) = abs ( p(1:m) );

  if ( q(1) <= 0 )
    q(1:n) = abs ( q(1:n) );
  end

  return
end

