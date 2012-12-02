function nrgf = rgf_enum ( m )

%*****************************************************************************80
%
%% RGF_ENUM enumerates the restricted growth functions on M.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2011
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
%    Input, integer M, the domain of the RGF is the integers
%    from 1 to M.  M must be positive.  However, for the enumeration routine
%    only, it is legal to call with any value of M.
%
%    Output, integer NRGF, the number of restricted growth
%    functions.
%
  if ( m < 0 )

    nrgf = 0;

  elseif ( m == 0 )

    nrgf = 1;

  else

    b = zeros ( m + 1, 1 );
    offset = 1;
    b(0+offset) = 1;
    for j = 1 : m
      b(j+offset) = 0;
      for i = 0 : j - 1
        b(j+offset) = b(j+offset) + binomial ( j - 1, i ) * b(i+offset);
      end
    end

    nrgf = b(m+offset);

  end

  return
end
