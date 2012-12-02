function asm_num = asm_enum ( n )

%*****************************************************************************80
%
%% ASM_ENUM returns the number of alternating sign matrices of a given order.
%
%  Discussion:
%
%    N     ASM_NUM
%
%    0       1
%    1       1
%    2       2
%    3       7
%    4      42
%    5     429
%    6    7436
%    7  218348
%
%    A direct formula is
%
%      ASM_NUM ( N ) = product ( 0 <= I <= N-1 ) ( 3 * I + 1 )! / ( N + I )!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrices.
%
%    Output, integer ASM_NUM, the number of alternating sign matrices of
%    order N.
%
  asm_num = 0;

  nn = n + 1;

  if ( n+1 <= 0 )
    return
  end
%
%  Row 1
%
  a(1) = 1;

  if ( n+1 == 1 )
    asm_num = a(1);
    return
  end
%
%  Row 2
%
  a(1) = 1;

  if ( n+1 == 2 )
    asm_num = a(1);
    return
  end

  b(1) = 2;
  c(1) = 2;
  a(2) = 1;
%
%  Row 3 and on.
%
  for nn = 3 : n

    b(nn-1) = nn;
    for i = nn-2 : -1 : 2
      b(i) = b(i) + b(i-1);
    end
    b(1) = 2;

    c(nn-1) = 2;
    for i = nn-2 : -1 : 2
      c(i) = c(i) + c(i-1);
    end
    c(1) = nn;

    a(1) = sum ( a(1:nn-1) );
    for i = 2 : nn
      a(i) = a(i-1) * c(i-1) / b(i-1);
    end

  end

  asm_num = sum ( a(1:n) );

  return
end
