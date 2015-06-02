function npart = setpart_enum ( m )

%*****************************************************************************80
%
%% SETPART_ENUM enumerates the partitions of a set of M elements.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
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
%    Input, integer M, the number of elements in the set.
%    M must be positive.  However, for the enumeration routine only,
%    it is legal to call with any value of M.
%
%    Output, integer NPART, the number of partitions of the set.
%
  if ( m < 0 )

    npart = 0;

  elseif ( m == 0 )

    npart = 1;

  else

    offset = 1;
    b(0+offset) = 1;
    for j = 1 : m
      b(j+offset) = 0;
      for i = 0 : j - 1
        b(j+offset) = b(j+offset) + i4_choose ( j - 1, i ) * b(i+offset);
      end
    end

    npart = b(m+offset);

  end

  return
end
