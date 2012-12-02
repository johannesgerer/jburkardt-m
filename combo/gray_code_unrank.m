function t = gray_code_unrank ( rank, n )

%*****************************************************************************80
%
%% GRAY_CODE_UNRANK computes the Gray code element of given rank.
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
%    Input, integer RANK, the rank of the element.
%    0 <= RANK <= 2^N.
%
%    Input, integer N, the number of digits in each element.
%    N must be positive.
%
%    Output, integer T(N), the element of the Gray code which has
%    the given rank.
%

%
%  Check.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRAY_CODE_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  Input N is illegal.\n' );
    error ( 'GRAY_CODE_RANK - Fatal error!' );
  end

  ngray = gray_code_enum ( n );

  if ( rank < 0 || ngray < rank )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRAY_CODE_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  The input rank is illegal.\n' );
    error ( 'GRAY_CODE_RANK - Fatal error!' );
  end

  rank_copy = rank;
  t(1:n) = 0;
  bprime = 0;

  for i = n-1 : -1 : 0

    b = floor ( rank_copy / 2^i );

    if ( b ~= bprime )
      t(n-i) = 1;
    end

    bprime = b;
    rank_copy = rank_copy - b * 2^i;

  end

  return
end
