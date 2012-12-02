function f = rgf_unrank ( rank, m )

%*****************************************************************************80
%
%% RGF_UNRANK returns the restricted growth function of a given rank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2011
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
%    Input, integer RANK, the rank of the restricted growth
%    function.
%
%    Input, integer M, the domain of the RGF is the integers
%    from 1 to M.  M must be positive.
%
%    Output, integer F(M), the restricted growth function.
%

%
%  Check.
%
  if ( m < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RGF_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  Input M is illegal.\n' );
    error ( 'RGF_UNRANK - Fatal error!' );
  end

  nrgf = rgf_enum ( m );

  if ( rank < 0 || nrgf < rank )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RGF_UNRANK - Fatal error!\n' );
    fprintf ( 1, '  The input rank is illegal.\n' );
    error ( 'RGF_UNRANK - Fatal error!' );
  end
%
%  Get the generalized restricted growth function table.
%
  offset = 1;
  d = rgf_g_table ( m );

  j = 1;
  f(1) = 1;

  for i = 2 : m

    if ( j * d(m-i+offset,j+offset) <= rank )
      f(i) = j + 1;
      rank = rank - j * d(m-i+offset,j+offset);
      j = j + 1;
    else
      f(i) = 1 + floor ( rank / d(m-i+offset,j+offset) );
      rank = mod ( rank, d(m-i+offset,j+offset) );
    end

  end

  return
end
