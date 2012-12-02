function [ f, rank ] = rgf_successor ( m, f, rank )

%*****************************************************************************80
%
%% RGF_SUCCESSOR generates the next restricted growth function.
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
%    Input/output, integer F(M), the restricted growth function.
%
%    Input/output, integer RANK, the rank.
%    If RANK = -1 on input, then the routine understands that this is
%    the first call, and that the user wishes the routine to supply
%    the first element in the ordering, which has RANK = 0.
%    In general, the input value of RANK is increased by 1 for output,
%    unless the very last element of the ordering was input, in which
%    case the output value of RANK is 0.
%

%
%  Return the first element.
%
  if ( rank == -1 )
    f(1:m) = 1;
    rank = 0;
    return
  end
%
%  Check.
%
  ierror = rgf_check ( m, f );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RGF_SUCCESSOR - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal!\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'RGF_SUCCESSOR - Fatal error!\n' );
  end
%
%  Find the first position from the right which can be incremented.
%
  for i = m : -1 : 2

    fmax = 1;
    for j = 2 : i - 1
      fmax = max ( fmax, f(j) );
    end
%
%  Increment the function at this position, and set later entries to 1.
%
    if ( f(i) ~= fmax + 1 )
      f(i) = f(i) + 1;
      f(i+1:m) = 1;
      rank = rank + 1;
      return
    end

  end
%
%  The final element was input.
%  Return the first element.
%
  f(1:m) = 1;
  rank = 0;

  return
end
