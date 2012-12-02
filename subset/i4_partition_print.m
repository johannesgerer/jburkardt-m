function i4_partition_print ( n, npart, a, mult )

%*****************************************************************************80
%
%% I4_PARTITION_PRINT prints a partition of an integer.
%
%  Discussion:
%
%    A partition of an integer N is a representation of the integer as
%    the sum of nonzero integers:
%
%      N = A1 + A2 + A3 + ...
%
%    It is standard practice to gather together all the values that 
%    are equal, and replace them in the sum by a single term, multiplied
%    by its "multiplicity":
%
%      N = M1 * A1 + M2 * A2 + ... + M(NPART) * A(NPART)
%    
%    In this representation, every A is a unique positive number, and 
%    no M is zero (or negative).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the integer to be partitioned.
%
%    Input, integer NPART, the number of "parts" in the partition.
%
%    Input, integer A(NPART), the parts of the partition.  
%
%    Input, integer MULT(NPART), the multiplicies of the parts.
%
  fprintf ( 1, '  %d = ', n );

  for i = 1 : npart

    if ( 1 < i )
      fprintf ( 1, ' + ' );
    end

    fprintf ( 1, '%d * %d', mult(i), a(i) );

  end

  fprintf ( 1, '\n' );

  return
end
