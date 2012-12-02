function rank = gray_code_rank ( n, t )

%*****************************************************************************80
%
%% GRAY_CODE_RANK computes the rank of a Gray code element.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer N, the number of digits in each element.
%    N must be positive.
%
%    Input, integer T(N), an element of the Gray code.
%    Each entry T(I) is either 0 or 1.
%
%    Output, integer RANK, the rank of the element.
%

%
%  Check.
%
  ierror = gray_code_check ( n, t );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRAY_CODE_RANK - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'GRAY_CODE_RANK - Fatal error!' );
  end

  rank = 0;
  b = 0;

  for i = n - 1 : -1 : 0

    if ( t(n-i) ~= 0 )
      b = 1 - b;
    end

    if ( b == 1 )
      rank = rank + 2^i;
    end

  end

  return
end
