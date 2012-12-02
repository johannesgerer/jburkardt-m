function a = i4mat_perm ( n, a, p )

%*****************************************************************************80
%
%% I4MAT_PERM permutes the rows and columns of a square I4MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 April 2009
%
%  Author:
%
%    John Burkardt
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
%    Input, integer N, the order of the matrix.
%
%    Input, integer A(N,N), the matrix to be permuted.
%
%    Input, integer P(N), the permutation.  P(I) is the new number of
%    row and column I.
%
%    Output, integer A(N,N), the permuted matrix.
%
  base = 1;
  ierror = perm_check ( n, p, base );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_PERM - Fatal error!\n' );
    fprintf ( 1, '  The input array P does not represent\n' );
    fprintf ( 1, '  a proper permutation.  In particular, the\n' );
    fprintf ( 1, '  array is missing the value %d\n', ierror );
    error ( 'I4MAT_PERM - Fatal error!' );
  end

  p = perm_cycle ( n, p, is, nc, 1 );

  for i = 1 : n

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

        if ( p(j) <= 0 )

          j2 = j;
          k = lc;

          while ( 1 )

            j1 = j2;
            it = a(i1,j1);

            while ( 1 )

              i1 = abs ( p(i1) );
              j1 = abs ( p(j1) );

              temp = it;
              it = a(i1,j1);
              a(i1,j1) = it;

              if ( j1 ~= j2 )
                continue
              end

              k = k - 1;

              if ( i1 == i )
                break
              end

            end

            j2 = abs ( p(j2) );

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
  p(1:n) = abs ( p(1:n) );

  return
end
