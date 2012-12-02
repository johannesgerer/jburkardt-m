function [ nsub, s, index ] = rgf_to_setpart ( m, f )

%*****************************************************************************80
%
%% RGF_TO_SETPART converts a restricted growth function to a set partition.
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
%    from 1 to M.  M must be positive.
%
%    Input, integer F(M), the restricted growth function.
%
%    Output, integer NSUB, the number of nonempty subsets into
%    which the set is partitioned.
%
%    Output, integer S(M), describes the partition of a set of
%    M objects into NSUB nonempty subsets.  If element I of the
%    superset belongs to subset J, then S(I) = J.
%
%    Output, integer INDEX(M), lists the location in S of the last
%    element of each subset.  Thus, the elements of subset 1
%    are S(1) through S(INDEX(1)), the elements of subset 2
%    are S(INDEX(1)+1) through S(INDEX(2)) and so on.
%

%
%  Check.
%
  ierror = rgf_check ( m, f );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RGF_TO_SETPART - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal!\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'RGF_TO_SETPART - Fatal error!' );
  end
%
%  Determine the number of subsets.
%
  nsub = max ( f(1:m) );
%
%  Initialize.
%
  s(1:m) = 0;
  index(1:nsub) = 0;
%
%  For each subset I, collect the indices of F which have value I.
%  These are the elements of the I-th subset.
%
  k = 0;
  for i = 1 : nsub
    for j = 1 : m
      if ( f(j) == i )
        k = k + 1;
        s(k) = j;
      end
    end
    index(i) = k;
  end

  return
end
