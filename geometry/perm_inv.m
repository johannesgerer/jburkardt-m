function q = perm_inv ( n, p )

%*****************************************************************************80
%
%% PERM_INV inverts a permutation "in place".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects being permuted.
%
%    Input, integer P(N), the permutation, in standard index form.
%
%    Output, integer Q(N), the inverse permutation
%
  q(1:n) = p(1:n);

  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_INV - Fatal error!\n' );
    fprintf ( 1, '  Input value of N = %d\n', n );
    error ( 'PERM_INV - Fatal error!' );
  end

  ierror = perm_check ( n, q );

  if ( ierror )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_INV - Fatal error!\n' );
    fprintf ( 1, '  The input array does not represent\n' );
    fprintf ( 1, '  a proper permutation.  In particular, the\n' );
    fprintf ( 1, '  array is missing the value %d\n', ierror );
    error ( 'PERM_INV - Fatal error!' );
  end

  is = 1;

  for i = 1 : n

    i1 = q(i);

    while ( i < i1 )
      i2 = q(i1);
      q(i1) = -i2;
      i1 = i2;
    end

    is = - i4_sign ( q(i) );
    q(i) = i4_sign ( is ) * q(i);

  end

  for i = 1 : n

    i1 = -q(i);

    if ( 0 <= i1 )

      i0 = i;

      while ( 1 )

        i2 = q(i1);
        q(i1) = i0;

        if ( i2 < 0 )
          break;
        end

        i0 = i1;
        i1 = i2;

      end

    end

  end

  return
end
