function a = i4mat_perm2 ( m, n, a, p, q )

%*****************************************************************************80
%
%% I4MAT_PERM2 permutes the rows and columns of a rectangular integer matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
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
%    Input, integer M, the number of rows in the matrix.
%
%    Input, integer N, the number of columns in the matrix.
%
%    Input, integer A(M,N), the matrix to be permuted.
%
%    Input, integer P(M), the row permutation.  P(I) is the new number of row I.
%
%    Input, integer Q(N), the column permutation.  Q(I) is the new number
%    of column I.  Note that this routine allows you to pass a single array
%    as both P and Q.
%
%    Output, integer A(M,N), the permuted matrix.
%
  [ p, is, nc ] = perm_cycle ( m, 1, p );

  if ( 0 < q(1) )
    [ q, is, nc ] = perm_cycle ( n, 1, q );
  end

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

              [ a(i1,j1), it ] = i4_swap ( a(i1,j1), it );

              if ( j1 ~= j2 )
                continue
              end

              k = k - 1;

              if ( i1 == i )
                break
              end

            end

            j2 = abs ( q(j2) );

            if ( k == 0 )
              break;
            end

          end
        end
      end
    end
  end

  return
end
