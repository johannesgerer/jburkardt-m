function a = r8vec_sort_shell_a ( n, a )

%*****************************************************************************80
%
%% R8VEC_SORT_SHELL_A ascending sorts an R8VEC using Shell's sort.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2001
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(N), an array to be sorted.
%
%    Output, real A(N), the sorted array.
%
  if ( n <= 1 )
    return
  end
%
%  Determine the smallest MAXPOW so that
%    N <= ( 3**MAXPOW - 1 ) / 2
%
  maxpow = 1;

  while ( 3^maxpow < 2 * n + 1 )
    maxpow = maxpow + 1;
  end

  if ( 1 < maxpow )
    maxpow = maxpow - 1;
  end
%
%  Now sort groups of size ( 3**IPOW - 1 ) / 2.
%
  for ipow = maxpow : -1 : 1

    inc = round ( ( 3^ipow - 1 ) / 2 );
%
%  Sort the values with indices equal to K mod INC.
%
    for k = 1 : inc
%
%  Insertion sort of the items with index
%  INC+K, 2*INC+K, 3*INC+K, ...
%
      for i = inc + k : inc : n

        asave = a(i);
        ifree = i;
        j = i - inc;

        while ( 1 )

          if ( j < 1 )
            break
          end

          if ( a(j) <= asave )
            break
          end

          ifree = j;
          a(j+inc) = a(j);
          j = j - inc;

        end

        a(ifree) = asave;

      end

    end

  end

  return
end
