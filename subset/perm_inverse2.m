function p_inv = perm_inverse2 ( n, p )

%*****************************************************************************80
%
%% PERM_INVERSE2 inverts a permutation "in place".
%
%  Discussion:
%
%    The routine needs no extra vector storage in order to compute the
%    inverse of a permutation.
%
%    This feature might be useful if the permutation is large.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 June 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the number of objects in the permutation.
%
%    Input, integer P(N), the permutation.
%
%    Output, integer P_INV(N), the inverse permutation.
%
  ierror = perm_check ( n, p );

  if ( ierror )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_INVERSE2 - Fatal error!\n' );
    fprintf ( 1, '  The input array does not represent\n' );
    fprintf ( 1, '  a proper permutation.  In particular, the\n' );
    fprintf ( 1, '  array is missing the value %d\n', ierror );
    error ( 'PERM_INVERSE2 - Fatal error!' );
  end

  p_inv(1:n) = p(1:n);

  for ii = 1 : n

    m = n + 1 - ii;
    i = p_inv(m);

    if ( i < 0 )

      p_inv(m) = -i;

    elseif ( i ~= m )

      k = m;

      while ( 1 )

        j = p_inv(i);
        p_inv(i) = -k;

        if ( j == m )
          p_inv(m) = i;
          break
        end

        k = i;
        i = j;

      end

    end

  end

  return
end
